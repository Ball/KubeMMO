import Vapor

struct DamageReport: Content, Equatable {
    let damage: Int
    let source: String

  static func == (lhs: DamageReport, rhs: DamageReport) -> Bool {
    return lhs.damage == rhs.damage && lhs.source == rhs.source
  }
}
