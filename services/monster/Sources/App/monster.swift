@globalActor actor Monster {
  static let shared = Monster()

  private var health = 10
  private var name: String
  private var flavorText: String

  init(){
    self.name = "Monster"
    self.flavorText = "I'm a monster"
  }

  func restoreHealth(){
    health = 10
  }

  func kill(){
    health = 0
  }

  func hit(hit: DamageReport) -> HitResult {
    health = health - hit.damage
    return HitResult(damageReport: hit, status: status())
  }

  func status() -> CreatureStatus {
    return CreatureStatus(name: name, health: health, description: flavorText)
  }
}
