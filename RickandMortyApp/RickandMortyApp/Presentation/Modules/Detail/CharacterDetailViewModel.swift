import Foundation

final class CharacterDetailViewModel: CharacterDetailViewModelProtocol {

    // MARK: - Properties
    let router: CharacterDetailRouterProtocol
    var character: Character
    var characterUpdated: (() -> Void)?

    init(router: CharacterDetailRouterProtocol, character: Character) {
        self.router = router
        self.character = character
    }
}

    // MARK: - Functions
extension CharacterDetailViewModel {
    func viewDidLoad() {
    }

    func viewDidAppear() {
    }

    func viewDidDisappear() {
    }
}
