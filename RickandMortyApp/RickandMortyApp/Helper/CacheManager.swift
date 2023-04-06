import UIKit
import AlamofireImage

class CacheManager {
    static let shared = CacheManager()
    let imageCache = NSCache<NSString, UIImage>()
    private init() {}
    func saveImage(_ image: UIImage, forKey key: String) {
        imageCache.setObject(image, forKey: key as NSString)
    }
    func getImage(forKey key: String) -> UIImage? {
        return imageCache.object(forKey: key as NSString)
    }
}

extension UIImageView {
    func setImage(withURL url: URL,
                  placeholder: UIImage?,
                  progress: ((Double) -> Void)? = nil) {
        self.image = placeholder
        let imageCacheKey = url.path

        // Try to load the image from the cache
        if let cachedImage = CacheManager.shared.getImage(forKey: imageCacheKey) {
            self.image = cachedImage
        } else {
            // If the image is not in the cache, load it from the network
            self.af.setImage(withURL: url, placeholderImage: placeholder, progress: { progressPercentage in
                progress?(progressPercentage.fractionCompleted)
            }, progressQueue: .global(qos: .userInteractive)) { response in
                if let image = response.value {
                    // Save the image to the cache
                    CacheManager.shared.saveImage(image, forKey: imageCacheKey)
                }
            }
        }
    }
}
