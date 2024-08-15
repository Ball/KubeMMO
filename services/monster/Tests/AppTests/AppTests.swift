@testable import App
import XCTVapor

final class AppTests: XCTestCase {
  var app: Application!

  override func setUp() async throws {
    self.app = try await Application.make(.testing)
    try await configure(app)
  }

  override func tearDown() async throws {
    try await app.asyncShutdown()
    self.app = nil
  }

  func testHitGoblin() throws {
    let hit = DamageReport(damage: 8, source: "Player")
    try self.app.test(.POST, "/hit", beforeRequest: { req in
      try req.content.encode(hit)
    }, afterResponse: { res in
      XCTAssertEqual(res.status,.ok)
      let hit = try res.content.decode(HitResult.self)
      XCTAssertEqual( hit.damageReport.damage, 8)
      XCTAssertEqual(hit.status.health, 2)
    })
  }


  func testInformAboutGoblin() async throws {

    await Monster.shared.restoreHealth()

    try await self.app.test(.GET, "/status", afterResponse: { res async in
      XCTAssertEqual(res.status,.ok)
      let info = try! res.content.decode(CreatureStatus.self)
      XCTAssertEqual( "Monster", info.name)
      XCTAssertEqual( 10, info.health)
    })
  }

  func testKillGoblin() async throws {
    try await self.app.test(.DELETE, "/kill", afterResponse: { res async in
      XCTAssertEqual(res.status,.ok)
    })

    try await self.app.test(.GET, "/status", afterResponse: { res async in
      XCTAssertEqual(res.status,.ok)
      let info = try! res.content.decode(CreatureStatus.self)
      XCTAssertEqual( "Monster", info.name)
      XCTAssertEqual( 0, info.health)
    })
  }

  // TODO : Joins default room
  // TODO : if player is in room, hit it durring heartbeat
  // TODO : if health < 0, kulled by orchestrator
}
