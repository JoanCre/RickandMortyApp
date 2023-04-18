import UIKit

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
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            // Save image in cache
                            CacheManager.shared.saveImage(image, forKey: imageCacheKey)
                            self?.image = image
                        }
                    }
                }
            }
        }
    }
}
