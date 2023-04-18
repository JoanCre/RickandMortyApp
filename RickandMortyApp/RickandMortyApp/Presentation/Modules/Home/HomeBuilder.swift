import UIKit

final class HomeBuilder: HomeBuilderProtocol {
    static func build() -> HomeViewController {
        let viewController = HomeViewController()
        let router = HomeRouter(viewController: viewController)
        let characterRepository = CharacterRepository()
        let characterUseCase = CharacterUseCase(repository: characterRepository)
        let viewModel = HomeViewModel(router: router, characterUseCase: characterUseCase)
        viewController.viewModel = viewModel
        return viewController
    }
}
