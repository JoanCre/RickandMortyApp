import Foundation

enum CharacterRepositoryError: Error {
    case badURL
    case badResponse
    case decodeError
    case badRequest
    case invalidResponse
}

protocol CharacterRepositoryProtocol {
    func getList(for page: Int) async throws -> CharacterListDTO
    func search(this name: String, for page: Int) async throws -> CharacterListDTO
}

final class CharacterRepository: CharacterRepositoryProtocol {
    func getList(for page: Int) async throws -> CharacterListDTO {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/?page=\(page)") else {
            throw CharacterRepositoryError.badURL
        }
        let request = URLRequest(url: url)
        print(request)
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let response = response as? HTTPURLResponse else {
                throw CharacterRepositoryError.invalidResponse
            }
            let decoder = JSONDecoder()
            do {
                if (200..<300).contains(response.statusCode) {
                    return try decoder.decode(CharacterListDTO.self, from: data)
                } else {
                    throw CharacterRepositoryError.badResponse
                }
            } catch {
                throw CharacterRepositoryError.decodeError
            }
        } catch {
            throw CharacterRepositoryError.badRequest
        }
    }

    func search(this name: String, for page: Int) async throws -> CharacterListDTO {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/?name=\(name)&page=\(page)") else {
            throw CharacterRepositoryError.badURL
        }
        let request = URLRequest(url: url)
        print(request)
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let response = response as? HTTPURLResponse else {
                throw CharacterRepositoryError.invalidResponse
            }
            let decoder = JSONDecoder()
            do {
                if (200..<300).contains(response.statusCode) {
                    return try decoder.decode(CharacterListDTO.self, from: data)
                } else {
                    throw CharacterRepositoryError.badResponse
                }
            } catch {
                throw CharacterRepositoryError.decodeError
            }
        } catch {
            throw CharacterRepositoryError.badRequest
        }
    }
}
