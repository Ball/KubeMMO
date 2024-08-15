import Vapor
struct CreatureStatus : Content, Equatable {
    let name: String
    let health: Int
    let description: String

    static func == (lhs: CreatureStatus, rhs: CreatureStatus) -> Bool {
        return lhs.name == rhs.name &&
                lhs.health == rhs.health &&
                lhs.description == rhs.description
    }
}
