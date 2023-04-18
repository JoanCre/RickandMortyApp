import Foundation

protocol HomeBuilderProtocol: BuilderProtocol {
    static func build() -> HomeViewController
}

protocol HomeRouterProtocol {
    func goToDetail(character: Character)
}

protocol HomeViewModelProtocol: ViewModelProtocol {
    func viewDidLoad()
    func viewDidAppear()
    func viewDidDisappear()

    func goToDetail(character: Character)
    func loadMoreCharacter(currentItem: Int)
    func search(this name: String)
    var characters: [Character] { get set }
    var hasNextPage: Bool { get set }
    var listCharactersUpdated: (() -> Void)? { get set }
    var errorHasOcurred: ((Error) -> Void)? { get set }
}
