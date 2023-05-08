import Foundation

protocol CharacterDatasourceProtocol {
    func getCharactersAndNextPage(for page: Int) async throws -> CharacterPaginationDTO?
    func getCharactersAndNextPageWhenSearching(this name: String, for page: Int) async throws -> CharacterPaginationDTO?
}
