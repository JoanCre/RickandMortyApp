import UIKit

class Character {
    var name: String
    var image: String
    var status: String
    var species: String
    var origin: String

    init(name: String, image: String, status: String, species: String, origin: String) {
        self.name = name
        self.image = image
        self.status = status
        self.species = species
        self.origin = origin
    }

    init(dto: CharacterDTO) {
        self.name = dto.name
        self.image = dto.image
        self.status = dto.status.capitalized
        self.species = dto.species.capitalized
        self.origin = dto.origin.name.capitalized
    }
}

extension Character {
    var isAlive: UIColor {
        switch status.lowercased() {
        case "alive":
            return UIColor.green
        case "dead":
            return UIColor.red
        default:
            return UIColor.gray
        }
    }
}
