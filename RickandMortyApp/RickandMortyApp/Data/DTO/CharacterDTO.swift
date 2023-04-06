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
    var status: String
    var species: String
    var type: String
    var gender: String
    var location: CharacterPlaceDTO
    var origin: CharacterPlaceDTO
}

struct CharacterPlaceDTO: Codable {
    var name: String
    var url: String
}
