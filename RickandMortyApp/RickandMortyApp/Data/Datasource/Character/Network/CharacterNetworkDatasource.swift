import Foundation

final class CharactersNetworkDatasource: CharacterDatasourceProtocol {
    let networkManager = NetworkManager()

    func getCharactersAndNextPage(for page: Int) async throws -> CharacterPaginationDTO? {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/?page=\(page)") else {
            throw NetworkError.invalidURL
        }
        return try await networkManager.fetchData(from: url, responseType: CharacterPaginationDTO.self)
    }

    func getCharactersAndNextPageWhenSearching(this name: String, for page: Int) async throws -> CharacterPaginationDTO? {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/?name=\(name)&page=\(page)") else {
            throw NetworkError.invalidURL
        }
        return try await networkManager.fetchData(from: url, responseType: CharacterPaginationDTO.self)
    }
}
