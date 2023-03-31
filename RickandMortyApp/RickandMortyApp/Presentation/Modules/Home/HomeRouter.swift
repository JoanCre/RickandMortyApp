import UIKit

final class HomeRouter {
    weak var viewController: HomeViewController?

    init(viewController: HomeViewController?) {
        self.viewController = viewController
    }
}

extension HomeRouter: HomeRouterProtocol {
}
