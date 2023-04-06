final class HomeViewModel: HomeViewModelProtocol {

    // MARK: - Properties
    let router: HomeRouterProtocol
    var characterUseCase: CharacterUseCaseProtocol

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

    init(router: HomeRouterProtocol, characterUseCase: CharacterUseCase) {
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
}
