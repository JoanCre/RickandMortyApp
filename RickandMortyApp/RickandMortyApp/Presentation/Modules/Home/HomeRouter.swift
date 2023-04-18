import UIKit

final class HomeRouter {
    weak var viewController: HomeViewController?

    init(viewController: HomeViewController?) {
        self.viewController = viewController
    }
}

extension HomeRouter: HomeRouterProtocol {
    func goToDetail(character: Character) {
        self.viewController?.present(CharacterDetailBuilder.build(character: character), animated: true)
    }
}
