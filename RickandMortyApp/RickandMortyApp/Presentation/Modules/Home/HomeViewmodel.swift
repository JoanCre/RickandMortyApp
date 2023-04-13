import Foundation

final class HomeViewModel: HomeViewModelProtocol {

    // MARK: - Properties
    let router: HomeRouterProtocol
    var characterUseCase: CharacterUseCaseProtocol

    enum Status {
        case searching
        case listing
    }

    var currentSearch: String = "" {
        willSet {
            if newValue == currentSearch { return }
            hasNextPage = true
            currentStatus = currentSearch.isEmpty ? .listing : .searching
        }
    }
    var currentStatus: Status = .listing

    var characters = [Character]() {
        didSet {
            listCharactersUpdated?()
        }
    }
    var hasNextPage: Bool = true {
        didSet {
            if hasNextPage == true {
                page += 1
            }
        }
    }
    var page: Int = 1

    var listCharactersUpdated: (() -> Void)?
    var errorHasOcurred: ((Error) -> Void)?

    init(router: HomeRouterProtocol, characterUseCase: CharacterUseCaseProtocol) {
        self.router = router
        self.characterUseCase = characterUseCase
    }
}

    // MARK: - Functions
extension HomeViewModel {
    func viewDidLoad() {
        loadCharacters()
    }

    func viewDidAppear() {

    }

    func viewDidDisappear() {

    }

    func loadCharacters() {
        if !hasNextPage { return }
        Task {
            do {
                let (characters, hasNextPage) = try await characterUseCase.getList(for: page)
                self.characters.append(contentsOf: characters)
                self.hasNextPage = hasNextPage
            } catch {
                errorHasOcurred?(error)
            }
        }
    }

    func loadMoreCharacter(currentItem: Int) {
        if (characters.count - 5 < currentItem) && hasNextPage {
            loadCharacters()
        }
    }

    func search(this name: String) {
        page = 1
        characters.removeAll()
        if name.isEmpty {
            currentStatus = .listing
            loadCharacters()
            return
        }
        currentSearch = name
        if !hasNextPage { return }
        Task {
            do {
                let (characters, hasNextPage) = try await characterUseCase.search(this: name, for: page)
                self.characters.append(contentsOf: characters)
                self.hasNextPage = hasNextPage
            } catch {
                errorHasOcurred?(error)
            }
        }
    }

    func goToDetail(character: Character) {
        router.goToDetail(character: character)
    }
}
