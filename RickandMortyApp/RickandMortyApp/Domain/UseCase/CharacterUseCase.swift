import Foundation

final class CharacterUseCase {
    let repository: CharacterRepositoryProtocol

    init(repository: CharacterRepositoryProtocol) {
        self.repository = repository
    }
}

protocol CharacterUseCaseProtocol {
    func getCharactersAndNextPageWhenSearching(for page: Int) async throws -> ([Character], Bool)
    func getCharactersAndNextPageWhenSearching(this name: String, for page: Int) async throws -> ([Character], Bool)
}

extension CharacterUseCase: CharacterUseCaseProtocol {
    func getCharactersAndNextPageWhenSearching(for page: Int) async throws -> ([Character], Bool) {
        let charactersAndNextPage = try await repository.getCharactersAndNextPage(for: page)
        let hasNextPage = charactersAndNextPage.info.next != nil
        return (convertToEntity(these: charactersAndNextPage.results), hasNextPage)
    }

    func getCharactersAndNextPageWhenSearching(this name: String, for page: Int) async throws -> ([Character], Bool) {
        let charactersAndNextPageWhenSearching = try await repository.getCharactersAndNextPageWhenSearch(this: name, for: page)
        let hasNextPage = charactersAndNextPageWhenSearching.info.next != nil
        return (convertToEntity(these: charactersAndNextPageWhenSearching.results), hasNextPage)
    }

    func convertToEntity(these dtos: [CharacterDTO]) -> [Character] {
        var characters = [Character]()
        dtos.forEach { characterDTO in
            characters.append(Character(dto: characterDTO))
        }
        return characters
    }
}
