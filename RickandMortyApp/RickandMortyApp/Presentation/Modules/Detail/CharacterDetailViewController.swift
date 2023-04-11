import UIKit

final class CharacterDetailViewController: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var chatacterImage: UIImageView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var specieLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!

    // MARK: - Properties
    var viewModel: CharacterDetailViewModelProtocol!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Functions
    func setupUI() {
        characterNameLabel.text = viewModel.character.name
        statusView.backgroundColor = viewModel.character.isAlive
        specieLabel.text = viewModel.character.type == "" ? viewModel.character.species : "\(viewModel.character.type),\(viewModel.character.species)"
        genderLabel.text = viewModel.character.gender
        locationLabel.text = viewModel.character.location
        originLabel.text = viewModel.character.origin
        guard let urlImage = URL(string: viewModel.character.image) else { return }
        chatacterImage.setImage(withURL: urlImage, placeholder: nil)
    }
}