import Foundation

protocol HomeBuilderProtocol: BuilderProtocol {
    func build() -> HomeViewController
}

protocol HomeRouterProtocol {

}

protocol HomeViewModelProtocol: ViewModelProtocol {
    func viewDidLoad()
    func viewDidAppear()
    func viewDidDisappear()

    func loadMoreCharacter(currentItem: Int)
    var characters: [Character] { get set }
    var hasNextPage: Bool { get set }
    var listCharactersUpdated: (() -> Void)? { get set }
    var errorHasOcurred: ((Error) -> Void)? { get set }
}
