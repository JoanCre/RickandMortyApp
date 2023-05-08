import Foundation

protocol CharacterRepositoryProtocol {
    func getCharactersAndNextPage(for page: Int) async throws -> CharacterPaginationDTO
    func getCharactersAndNextPageWhenSearch(this name: String, for page: Int) async throws -> CharacterPaginationDTO
}

final class CharacterRepository: CharacterRepositoryProtocol {
    let cacheManager = CacheManager()
    let localDatasource = CharacterLocalDatasource()
    let networkDatasource = CharactersNetworkDatasource()

    func getCharactersAndNextPage(for page: Int) async throws -> CharacterPaginationDTO {
        guard let localCharactersAndNextPage = try await localDatasource.getCharactersAndNextPage(for: page) else {
            let networkCharactersAndNextPage = try await networkDatasource.getCharactersAndNextPage(for: page)
            cacheManager.set(networkCharactersAndNextPage, forKey: "\(page)")
            return networkCharactersAndNextPage!
        }
        return localCharactersAndNextPage
    }

    func getCharactersAndNextPageWhenSearch(this name: String, for page: Int) async throws -> CharacterPaginationDTO {
        guard let localCharactersAndNextPage = try await localDatasource.getCharactersAndNextPageWhenSearching(this: name, for: page) else {
            let networkCharactersAndNextPage = try await networkDatasource.getCharactersAndNextPageWhenSearching(this: name, for: page)
            cacheManager.set(networkCharactersAndNextPage, forKey: "\(name) + \(page)")
            return networkCharactersAndNextPage!
        }
        return localCharactersAndNextPage
    }
}
