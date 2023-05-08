import Foundation
@testable import RickandMortyApp

final class HomeUseCaseFake: CharacterUseCaseProtocol {

    var error: NetworkError?
    var isEmpty: Bool = false

    func getCharactersAndNextPageWhenSearching(for page: Int) async throws -> ([RickandMortyApp.Character], Bool) {
        if let error = self.error {
            throw error
        }

        return isEmpty ? ([], false) : (CharacterMock.characrers, true)
    }

    func getCharactersAndNextPageWhenSearching(this name: String, for page: Int) async throws -> ([RickandMortyApp.Character], Bool) {
        if let error = self.error {
            throw error
        }

        return isEmpty ? ([], false) : (CharacterMock.characrers, true)
    }
}
