import Foundation

struct InfoDTO: Codable {
    var count: Int
    var pages: Int
    var next: String?
}

struct CharacterListDTO: Codable {
    var info: InfoDTO
    var results: [CharacterDTO]
}

struct CharacterDTO: Codable {
    var image: String
    var name: String
}
