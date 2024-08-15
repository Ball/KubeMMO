import Fluent
import Vapor


func routes(_ app: Application) throws {

    app.on( .POST, "hit") { req -> HitResult in
        let hit = try! req.content.decode(DamageReport.self)
        return await Goblin.shared.hit(hit: hit)
    }

    app.get("status"){req in
        return await Goblin.shared.status()
    }

    app.on(.DELETE, "kill"){req in
        await Goblin.shared.kill()
        return ""
    }

}
