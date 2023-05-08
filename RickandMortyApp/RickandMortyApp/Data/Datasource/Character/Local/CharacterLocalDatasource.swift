import Foundation

final class CharacterLocalDatasource: CharacterDatasourceProtocol {
    let caccheManager = CacheManager()

    func getCharactersAndNextPage(for page: Int) async throws -> CharacterPaginationDTO? {
        return caccheManager.get(CharacterPaginationDTO.self, forKey: "\(page)")
    }

    func getCharactersAndNextPageWhenSearching(this name: String, for page: Int) async throws -> CharacterPaginationDTO? {
        return caccheManager.get(CharacterPaginationDTO.self, forKey: "\(name) + \(page)")
    }
}
