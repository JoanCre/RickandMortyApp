import Foundation
@testable import RickandMortyApp

final class HomeRouterFake: HomeRouterProtocol {
    private(set) var goToDetailCalled: Bool = false

    func goToDetail(character: RickandMortyApp.Character) {
        self.goToDetailCalled = true
    }
}
