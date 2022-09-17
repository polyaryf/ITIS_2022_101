import Darwin

protocol Character{
    var isAlive: Bool {get set}
    var hp: Int {get set}
    var mp: Int? {get set}
}


enum Clan {
    case uzumaki
    case hyuga
    case naara
}

class Hero: Character{
    
    var isAlive: Bool = true
    var hp: Int = 100
    var mp: Int?
    var name: String?
    var skill: String?
    var rate: Int = 0
    
    init(clan: Clan){
        if clan == Clan.uzumaki{
            self.name = "Наруто"
            self.skill = "расенсюрикен"
            self.mp = 80
        }else if clan == Clan.hyuga{
            self.name = "Неджи"
            self.skill = "восемь триграмм сто двадцать восемь ладоней"
            self.mp = 70
        }else {
            self.name = "Шикомару"
            self.skill = "теневой захват"
            self.mp = 70
        }
    }
    
    public func updateRate(){
        self.rate += 5
    }
}

enum EnemyType {
    case boss
    case medium
    case weak
}

class Enemy: Character{
    var isAlive: Bool = true
    var hp: Int = 50
    var mp: Int?
    var name: String?
    var skill: String?
    
    init(enemyType: EnemyType){
        if enemyType == EnemyType.boss{
            self.name = "Орочимару"
            self.hp = 100
            self.mp = 100
            self.skill = "скальпель Чакры"
        } else if enemyType == EnemyType.medium{
            self.name = "Кидомару"
            self.hp = 80
            self.mp = 70
            self.skill = "лохушка Джокера"
        }else {
            self.name = "Таюя"
            self.hp = 70
            self.mp = 50
            self.skill = "гендзюцу"
        }
    }
}


class Event{
    
    static func startGame(){
        print("\n    Враги из деревни звука похитили Саске. Ты обязательно должен помочь им и вернуть его в деревню.")
    }
    
    static func fight(hero: Hero, enemy: Enemy){
        hero.updateRate()
        print("\n    Сражение началось. \(hero.name!) vs \(enemy.name!) \n")
        
        while enemy.hp >= 0 && hero.hp >= 0 {
            sleep(1)
            let flag = Int.random(in: 0...10)
            if flag % 2 == 0 {
                print("  \(hero.name!) бьет \(enemy.name!) и использует \(hero.skill!)  \n")
                enemy.hp -= 50
                hero.mp! -= 20
            }else {
                print("  \(enemy.name!) бьет \(hero.name!) и использует \(enemy.skill!) \n ")
                hero.hp -= 40
                enemy.mp! -= 30
            }
        }
        if hero.hp > enemy.hp{
            if enemy.name != "Орочимару"{
                print("\n    Побежден \(enemy.name!). \(hero.name!) продолжает свой путь.")
                enemy.isAlive = false
            }else {
                print("\n    Побежден \(enemy.name!).")
                enemy.isAlive = false
            }
        } else {
            print("\n    \(hero.name!) погибает ")
            hero.isAlive = false
        }
        
    }
    
    static func findPotion(hero: Hero){
        hero.updateRate()
        let random = Int.random(in: 1...10)
        if random >= 5 {
            print("\n \(hero.name!) нашел снадобье и повысил свои способности")
            hero.mp! += 10
            hero.hp += 15
        }else {
            print("\n \(hero.name!) случайно выпил яд и потерял силы")
            hero.hp -= 30
            hero.mp! -= 15
        }
    }
    
    static func findFriend(hero: Hero){
        hero.updateRate()
        print("\n \(hero.name!) продолжает свой путь. Он вернет Саске в деревню...")
    }
    
    static func findShuriken(hero: Hero){
        hero.updateRate()
        hero.mp! += 20
        print("\n \(hero.name!) нашел сюрикен. Еще один сюрикен никогда не будет лишним в бою.")
    }
    
    static func theEnd(){
        print("    Ты преодолел многое. Но Саске все равно не вернется в деревню. Он сделал свой выбор...")
    }
}
//heroes
let naruto = Hero(clan: .uzumaki)
let neji = Hero(clan: .hyuga)
let shikomaru = Hero(clan: .naara)

//enemies
let orochimaru = Enemy(enemyType: .boss)
let kidomaru = Enemy(enemyType: .medium)
let tauya = Enemy(enemyType: .weak)

print("         Начало игры. Ты готов?")
sleep(1)
print("\n ................................................................................................................................")
Event.startGame()
print("\n ................................................................................................................................")
sleep(1)
print("\n Кого ты отправишь в этот непростой путь?  \n \n    1. Наруто \n \n    2. Неджи \n \n    3. Шикомару")
sleep(1)
print("\n ................................................................................................................................")

let random = Int.random(in: 1...3)
var curHero = Hero(clan: .uzumaki)
switch random{
case 1:
    print(" \n Наруто обязательно справится")
    curHero = naruto
    sleep(1)
case 2:
    print(" \n Неджи обязательно справится")
    curHero = neji
    sleep(1)
case 3:
    print(" \n Шикомару обязательно справится")
    curHero = shikomaru
    sleep(1)
default:
    print("Что- то пошло не так")
}
sleep(1)
print("\n ................................................................................................................................")
sleep(2)
while curHero.isAlive && curHero.rate < 50{
    let x = Int.random(in: 1...100)
    if x % 2 == 0{
        Event.findFriend(hero: curHero)
        sleep(1)
    } else if x % 3 == 0 {
        Event.findShuriken(hero: curHero)
        sleep(1)
    } else if x % 5 == 0 {
        Event.findPotion(hero: curHero)
        sleep(1)
    } else {
        if kidomaru.isAlive == true || tauya.isAlive == true {
            let rand = Int.random(in: 0...1)
            switch rand{
            case 1:
                Event.fight(hero: curHero, enemy: kidomaru)
            case 0:
                Event.fight(hero: curHero, enemy: tauya)
            default:
                continue
            }
        }
    }
}

while curHero.isAlive && curHero.rate <= 100{
    sleep(1)
    print("Надо добраться до места, где держат Саске.")
    let x = Int.random(in: 1...100)
    if x % 2 == 0{
        Event.findFriend(hero: curHero)
        sleep(1)
    } else if x % 3 == 0 {
        Event.findShuriken(hero: curHero)
        sleep(1)
    } else if x % 5 == 0 {
        Event.findPotion(hero: curHero)
        sleep(1)
    } else {
        Event.fight(hero: curHero, enemy: orochimaru)
    }
    
    if orochimaru.isAlive == false{
        Event.theEnd()
        break
    }
}



