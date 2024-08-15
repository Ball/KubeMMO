import Fluent
import Vapor


func routes(_ app: Application) throws {

    app.on( .POST, "hit") { req -> HitResult in
        let hit = try! req.content.decode(DamageReport.self)
        return Goblin.shared.hit(hit: hit)
        // return HitResult(damageReport: DamageReport(damage: 8, source: "player"), status: CreatureStatus(name: "Goblin", health: 2, description: "green and angry"))
    }

    app.get("status"){req in
        return Goblin.shared.status()
    }

    app.on(.DELETE, "kill"){req in
        Goblin.shared.kill()
        return ""
    }

}
