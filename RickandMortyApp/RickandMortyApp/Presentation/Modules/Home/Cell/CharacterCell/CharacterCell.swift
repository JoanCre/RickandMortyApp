import UIKit

class CharacterCell: UITableViewCell {

    static let identifier = "CharacterCell"

    // MARK: - IBOutlets
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var lifeStatusView: UIView!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var statusAndSpecieLabel: UILabel!

    // MARK: - Life cycle
    var character: Character! {
        didSet {
            setupUI()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK: - Functions
    private func setupUI() {
        characterNameLabel.text = character.name
        lifeStatusView.backgroundColor = character.isAlive
        statusAndSpecieLabel.text = "\(character.status) - \(character.species)"
        originLabel.text = character.origin
        guard let urlImage = URL(string: character.image) else { return }
        characterImage.load(url: urlImage)
    }
}
