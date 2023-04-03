import Foundation

class Character {
    var name: String
    var image: String

    init(name: String, image: String) {
        self.name = name
        self.image = image
    }

    init(dto: CharacterDTO) {
        self.name = dto.name
        self.image = dto.image
    }
}
