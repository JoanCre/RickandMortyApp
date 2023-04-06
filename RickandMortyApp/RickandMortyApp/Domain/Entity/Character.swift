import UIKit

class Character {
    var name: String
    var image: String
    var status: String
    var species: String
    var origin: String
    var type: String
    var gender: String
    var location: String

    init(name: String,
         image: String,
         status: String,
         species: String,
         origin: String,
         type: String,
         gender: String,
         location: String) {
        self.name = name
        self.image = image
        self.status = status
        self.species = species
        self.origin = origin
        self.type = type
        self.gender = gender
        self.location = location
    }

    init(dto: CharacterDTO) {
        self.name = dto.name
        self.image = dto.image
        self.status = dto.status.capitalized
        self.species = dto.species.capitalized
        self.type = dto.type.capitalized
        self.gender = dto.gender.capitalized
        self.origin = dto.origin.name.capitalized
        self.location = dto.location.name.capitalized
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
