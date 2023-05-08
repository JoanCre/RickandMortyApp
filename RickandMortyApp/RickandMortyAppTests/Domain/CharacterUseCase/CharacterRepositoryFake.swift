import XCTest
@testable import RickandMortyApp

final class CharacterRepositoryFake: CharacterRepositoryProtocol {
    func getCharactersAndNextPage(for page: Int) async throws -> RickandMortyApp.CharacterPaginationDTO {
        return CharacterDTOMock.getListMock()
    }

    func getCharactersAndNextPageWhenSearch(this name: String, for page: Int) async throws -> RickandMortyApp.CharacterPaginationDTO {
        return CharacterDTOMock.getListMock()
    }
}
