import XCTest
@testable import RickandMortyApp

final class CharacterRepositoryFake: CharacterRepositoryProtocol {
    func getList(for page: Int) async throws -> RickandMortyApp.CharacterListDTO {
        return CharacterDTOMock.getListMock()
    }

    func search(this name: String, for page: Int) async throws -> RickandMortyApp.CharacterListDTO {
        return CharacterDTOMock.getListMock()
    }
}
