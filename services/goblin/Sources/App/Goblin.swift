
@globalActor actor Goblin {

  static let shared = Goblin()

  private var health = 10
  private var name: String
  private let flavorText: String

  init(){
    name = "Goblin"
    flavorText = "A small, green, humanoid creature with a long, sharp, spiked tail."
  }

  func restoreHealth(){
    health = 10
  }

  func kill(){
    health = 0
  }

  func hit(hit: DamageReport) -> HitResult{
    health -= hit.damage
    return HitResult(damageReport: hit, status: status())
  }

  func status() -> CreatureStatus {
    return CreatureStatus(name: name, health: health, description: flavorText)
  }
}
