import XCTest
@testable import RickandMortyApp

final class CharacterUseCaseTests: XCTestCase {
    var repository: CharacterRepositoryFake!
    var sut: CharacterUseCase!

    override func setUp() async throws {
        repository = CharacterRepositoryFake()
        sut = CharacterUseCase(repository: repository)
    }

    override func tearDown() {
        repository = nil
        sut = nil
    }

    func test_whenGetList_thenSuccessResponse() async {
        do {
            // When
            let result = try await sut.getList(for: 0)
            // Then
            XCTAssertFalse(result.0.isEmpty)
        } catch {
            XCTFail("Expected success response")
        }
    }

    func test_whenSearch_thenSuccessResponse() async {
        do {
            // When
            let result = try await sut.search(this: "Dummy", for: 0)
            // Then
            XCTAssertFalse(result.0.isEmpty)
        } catch {
            XCTFail("Expected success response")
        }
    }
}
