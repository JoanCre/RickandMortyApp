import UIKit

final class CharacterDetailBuilder: CharacterDetailBuilderProtocol {
    func build(character: Character) -> CharacterDetailViewController {
        let viewController = CharacterDetailViewController()
        let router = CharacterDetailRouter(viewController: viewController)
        let viewModel = CharacterDetailViewModel(router: router, character: character)
        viewController.viewModel = viewModel
        return viewController
    }
}
