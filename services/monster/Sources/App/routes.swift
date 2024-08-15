import Vapor

func routes(_ app: Application) throws {

    app.on( .POST, "hit") { req -> HitResult in
        let hit = try! req.content.decode(DamageReport.self)
        return await Monster.shared.hit(hit: hit)
        // return HitResult(damageReport: DamageReport(damage: 8, source: "player"), status: CreatureStatus(name: "Goblin", health: 2, description: "green and angry"))
    }

    app.get("status"){req in
        return await Monster.shared.status()
    }

    app.on(.DELETE, "kill"){req in
        await Monster.shared.kill()
        return ""
    }
}
