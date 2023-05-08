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
    @IBOutlet weak var detailView: UIView!

    // MARK: - Properties
    var viewModel: CharacterDetailViewModelProtocol!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Functions
   private func setupUI() {
        characterNameLabel.text = viewModel.character.name
        statusView.backgroundColor = viewModel.character.isAlive
        specieLabel.text = viewModel.character.type == "" ? viewModel.character.species : "\(viewModel.character.type),\(viewModel.character.species)"
        genderLabel.text = viewModel.character.gender
        locationLabel.text = viewModel.character.location
        originLabel.text = viewModel.character.origin

        detailView.layer.shadowOffset = CGSize(width: 0, height: -5)
        detailView.layer.shadowOpacity = 0.33
        detailView.layer.shadowColor = UIColor.black.cgColor
        detailView.layer.masksToBounds = false

        guard let urlImage = URL(string: viewModel.character.image) else { return }
        chatacterImage.load(url: urlImage)
    }
}
