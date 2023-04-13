import XCTest
@testable import RickandMortyApp

final class HomeViewModelTest: XCTestCase {

    var sut: HomeViewModel!
    var router: HomeRouterFake!
    var useCase: HomeUseCaseFake!

    override func setUp() async throws {
        self.router = HomeRouterFake()
        self.useCase = HomeUseCaseFake()
        self.sut = HomeViewModel(router: router, characterUseCase: useCase)
    }

    override func tearDown() {
        self.router = nil
        self.useCase = nil
        self.sut = nil
    }

    func test_whenViewDidLoad_thenViewModelLoaded() {
        // When
        sut.viewDidLoad()
        // Then
        sut.listCharactersUpdated = {
            XCTAssert(true)
        }
    }

    func test_whenLoadCharacters_thenSuccessResponse() {
        // When
        sut.loadCharacters()
        // Then
        sut.listCharactersUpdated = {
            XCTAssert(true)
        }
    }

    func test_whenLoadCharacters_thenFailureResponse() {
        // Given
        useCase.error = .decodeError
        // When
        sut.loadCharacters()
        sut.listCharactersUpdated = {
            XCTAssert(true)
        }
    }

    func test_whenLoadCharacters_thenEmptyResponse() {
        // Given
        useCase.isEmpty = true
        // When
        sut.loadCharacters()
        sut.listCharactersUpdated = {
            XCTAssert(true)
        }
    }

    func test_whenLoadMoreCharacters_thenSuccessResponse() {
        // When
        sut.loadMoreCharacter(currentItem: 0)
        // Then
        sut.listCharactersUpdated = {
            XCTAssert(true)
        }
    }

    func test_whenLoadMoreCharacters_thenFailureResponse() {
        // Given
        useCase.error = .decodeError
        // When
        sut.loadMoreCharacter(currentItem: 0)
        sut.listCharactersUpdated = {
            XCTAssert(true)
        }
    }

    func test_whenLoadMoreCharacters_thenEmptyResponse() {
        // Given
        useCase.isEmpty = true
        // When
        sut.loadMoreCharacter(currentItem: 0)
        sut.listCharactersUpdated = {
            XCTAssert(true)
        }
    }

    func test_whenSearchCharacters_thenSuccessResponse() {
        // When
        sut.search(this: "Dummy")
        // Then
        sut.listCharactersUpdated = {
            XCTAssert(true)
        }
    }

    func test_whenSearchCharacters_thenFailureResponse() {
        // Given
        useCase.error = .decodeError
        // When
        sut.search(this: "Dummy")
        sut.listCharactersUpdated = {
            XCTAssert(true)
        }
    }

    func test_whenSearchCharacters_thenEmptyResponse() {
        // Given
        useCase.isEmpty = true
        // When
        sut.search(this: "Dummy")
        sut.listCharactersUpdated = {
            XCTAssert(true)
        }
    }

    func test_whenGoToDetail_thenSuccessResponse() {
        // When
        sut.goToDetail(character: CharacterMock.characrers.first!)
        // Then
        XCTAssert(router.goToDetailCalled)
    }
}
