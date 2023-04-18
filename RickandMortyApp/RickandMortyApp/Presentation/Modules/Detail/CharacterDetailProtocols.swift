import Foundation

protocol CharacterDetailBuilderProtocol: BuilderProtocol {
    static func build(character: Character) -> CharacterDetailViewController
}

protocol CharacterDetailRouterProtocol {

}

protocol CharacterDetailViewModelProtocol: ViewModelProtocol {
    func viewDidLoad()
    func viewDidAppear()
    func viewDidDisappear()

    var character: Character { get set }
}
