import Vapor

struct HitResult : Content, Equatable {
    let damageReport: DamageReport
    let status: CreatureStatus

    static func == (lhs: HitResult, rhs: HitResult) -> Bool {
        return lhs.damageReport == rhs.damageReport && lhs.status == rhs.status
    }
}
