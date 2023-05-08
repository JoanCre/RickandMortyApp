import Foundation

enum NetworkError: Error {
    case invalidURL
    case requestFailed
    case invalidData
    case decodingFailed
}

protocol NetworkManagerProtocol {
    func fetchData<T: Decodable>(from url: URL, responseType: T.Type) async throws -> T
}

class NetworkManager: NetworkManagerProtocol {
    func fetchData<T: Decodable>(from url: URL, responseType: T.Type) async throws -> T {
        guard url.scheme == "https" else {
            throw NetworkError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              (200..<300).contains(httpResponse.statusCode) else {
            throw NetworkError.requestFailed
        }

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        do {
            let decodedResponse = try decoder.decode(T.self, from: data)
            return decodedResponse
        } catch {
            throw NetworkError.decodingFailed
        }
    }
}
