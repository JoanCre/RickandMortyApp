import Foundation

protocol CacheManagerProtocol {
    func set<T: Encodable>(_ value: T?, forKey key: String)
    func get<T: Decodable>(_ type: T.Type, forKey key: String) -> T?
    func removeAll()
}

class CacheManager: CacheManagerProtocol {
    private let userDefaults: UserDefaults

    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }

    func set<T: Encodable>(_ value: T?, forKey key: String) {
        guard let value = value else {
            userDefaults.removeObject(forKey: key)
            return
        }

        do {
            let data = try JSONEncoder().encode(value)
            userDefaults.set(data, forKey: key)
        } catch {
            print("Error encoding object: \(error.localizedDescription)")
        }
    }

    func get<T: Decodable>(_ type: T.Type, forKey key: String) -> T? {
        guard let data = userDefaults.data(forKey: key) else { return nil }

        do {
            let value = try JSONDecoder().decode(type, from: data)
            return value
        } catch {
            print("Error decoding object: \(error.localizedDescription)")
            return nil
        }
    }

    func removeAll() {
        if let appDomain = Bundle.main.bundleIdentifier {
            userDefaults.removePersistentDomain(forName: appDomain)
        }
    }
}
