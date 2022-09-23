import Darwin
import Foundation

protocol Character{
    var isAlive: Bool {get set}
}

enum Clan {
    case uzumaki
    case hyuga
    case haruno
    case naara
    case akimichi
    case inzuka
}

class Hero: Character {
    
    var isAlive: Bool = true
    var clan: Clan?
    var name: String?
    var skill: [String]?
    var mp: Int?
    var hp: Int = 100
    var rate: Int = 0
    
    init(clan: Clan){
        
        self.hp = 100
        self.rate = 0
    
        if clan == Clan.uzumaki{
            self.clan = Clan.uzumaki
            self.name = "Наруто"
            self.skill = ["расенсюрикен","техника соблазнения","теневой сюрикен"]
            self.mp = 70
        }else if clan == Clan.hyuga{
            self.clan = Clan.hyuga
            self.name = "Неджи"
            self.skill = ["восемь триграмм сто двадцать восемь ладоней", "восемь триграмм горный разрушитель", "мягкий кулак"]
            self.mp = 60
        }else if clan == Clan.inzuka{
            self.clan = Clan.inzuka
            self.name = "Киба"
            self.skill = ["восемь триграмм сто двадцать восемь ладоней", "восемь триграмм горный разрушитель", "мягкий кулак"]
//            изменить челам скиллы кроме наруто сакуры и неджы
            self.mp = 60
        }else if clan == Clan.akimichi{
            self.clan = Clan.akimichi
            self.name = "Чоуджи"
            self.skill = ["восемь триграмм сто двадцать восемь ладоней", "восемь триграмм горный разрушитель", "мягкий кулак"]
            self.mp = 60
        }else if clan == Clan.naara{
            self.clan = Clan.naara
            self.name = "Шикомару"
            self.skill = ["восемь триграмм сто двадцать восемь ладоней", "восемь триграмм горный разрушитель", "мягкий кулак"]
            self.mp = 60
        }else {
            self.clan = Clan.haruno
            self.name = "Сакура"
            self.skill = ["Кацую: Огромная сеть исцеления","сила ста печатей","мистическая техника ладони"]
            self.mp = 40
        }
    }
    
    public func updateRate(){
        self.rate += 1
    }
    
    public static func isAllHeroesDead(heroes: [Hero]) -> Bool{
        var flag = true
        for hero in heroes {
            if hero.isAlive == false{
                flag = false
            }
        }
        return flag
    }
    
}

enum EnemyType {
    case boss
    case mediumFirst
    case mediumSecond
    case weakFirst
    case weakSecond
}

class Enemy: Character {
    
    var enemyType: EnemyType?
    var name: String?
    var hp: Int?
    var mp: Int?
    var skill: String?
    var isAlive: Bool = true
    
    init(enemyType: EnemyType){

        if enemyType == EnemyType.boss {
            self.enemyType = EnemyType.boss
            self.name = "Орочимару"
            self.hp = 150
            self.mp = 100
            self.skill = "скальпель Чакры"
        }else if enemyType == EnemyType.mediumFirst {
            self.name = "Дзиробо"
            self.enemyType = EnemyType.mediumFirst
            self.hp = 125
            self.mp = 70
            self.skill = "удущающий захват"
        } else if enemyType == EnemyType.mediumSecond {
            self.enemyType = EnemyType.mediumSecond
            self.name = "Кидомару"
            self.hp = 125
            self.mp = 70
            self.skill = "лохушка Джокера"
        } else if enemyType == EnemyType.weakFirst {
            self.enemyType = EnemyType.weakFirst
            self.name = "Сакон"
            self.hp = 100
            self.mp = 50
            self.skill = "удар братом-близнецом Уконом"
        }else {
            self.enemyType = EnemyType.weakSecond
            self.name = "Таюя"
            self.hp = 100
            self.mp = 50
            self.skill = "гендзюцу"
        }
    }
    
    public static func isAllEnemiesDead(enemies: [Enemy]) -> Bool{
        var flag = true
        for enemy in enemies {
            if enemy.isAlive == true{
                flag = false
            }
        }
        return flag
    }
}

class Event{
    
    public var heroes: [Hero] = [Hero(clan: Clan.haruno), Hero(clan: Clan.hyuga), Hero(clan: Clan.uzumaki), Hero(clan: Clan.naara), Hero(clan: Clan.akimichi), Hero(clan: Clan.inzuka)]

    public var enemies: [Enemy] = [Enemy(enemyType: EnemyType.weakFirst), Enemy(enemyType: EnemyType.weakSecond),
                                           Enemy(enemyType: EnemyType.mediumFirst), Enemy(enemyType: EnemyType.mediumSecond)]
    
    
    static func startGame(){
        print("\n         Четверка из деревни звука похитили Саске. Ты обязательно должен помочь им и вернуть его в деревню.")
    }
    
    static func chooseHero(heroes: [Hero]) -> Hero{
        var hero = heroes[Int.random(in: 0...5)]
        while hero.isAlive == false{
            hero = heroes[Int.random(in: 0...5)]
        }
        return hero
    }
    
    static func chooseEnemy(enemies: [Enemy]) -> Enemy{
        var enemy = enemies[Int.random(in: 0...3)]
        while enemy.isAlive == false{
            enemy = enemies[Int.random(in: 0...3)]
        }
        return enemy
    }
    
    static func fight(heroes: inout [Hero], enemies: inout [Enemy]){
        
        let hero = chooseHero(heroes: heroes)
        let indexOfHero = heroes.firstIndex{$0 === hero}
        let enemy = chooseEnemy(enemies: enemies)
        let indexOfEnemy = enemies.firstIndex{$0 === enemy}
        
        hero.updateRate()
        
        
        print("    Сражение началось. \(hero.name!) vs \(enemy.name!) \n")
        
        while enemy.mp! >= 0 && hero.mp! >= 0{
            sleep(1)
            if hero.mp! > enemy.mp! {
                print("  \(hero.name!) бьет \(enemy.name!) и использует \(hero.skill![Int.random(in: 0...2)])  \n")
                enemy.hp! -= 25
                hero.mp! -= 10
            } else{
                print("  \(enemy.name!) бьет \(hero.name!) и использует \(enemy.skill!) \n ")
                hero.hp -= 25
                enemy.mp! -= 15
            }
        }
        if hero.hp < enemy.hp! {
            print("умер \(hero.name!) ")
            hero.isAlive = false
            heroes.remove(at: indexOfHero!)
        } else{
            print("умер \(enemy.name!)")
            enemy.isAlive = false
            enemies.remove(at: indexOfEnemy!)
        }
    }
    
//    private static func chooseCharacter(characters: [Character]) -> Character {
//        for character in characters {
//            if character.isAlive == true{
//                return character
//            }else{
//                theEnd()
//            }
//        }
//        return Hero(clan: Clan.uzumaki)
//    }
    
    static func findPotion(hero: Hero){
        hero.updateRate()
        let random = Int.random(in: 1...10)
        if random >= 5 {
            print("\n \(hero.name!) нашел снадобье")
            hero.mp! += 10
            hero.hp += 15
        }else {
            print("\n \(hero.name!) случайно выпил яд")
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
        print("         Твоя команда преодолела многое. Но Саске все равно не вернется в деревню. Он сделал свой выбор...")
    }
    
    static func sakuraНeals(hero: Hero){
        hero.updateRate()
        hero.hp += 50
        hero.mp! += 30
        print("/n Сакура излечила раны. Все таки она не бесполезная.")
    }
}

print("         Начало игры. Ты готов?")
sleep(1)
print("\n ................................................................................................................................")
Event.startGame()
sleep(1)
print("\n ................................................................................................................................")
sleep(1)
print("\n         Тебе будет помогать целая команда! \n   \n    Наруто, Сакура, Неджи, Киба, Шикомару, Чоуджи" )
sleep(1)
print("\n ................................................................................................................................")

sleep(1)

while Hero.isAllHeroesAlive(heroes: Event().heroes) {
    sleep(1)
    let random = Int.random(in: 1...10000)
    if random % 2 == 0{
        Event.findFriend(hero: Event.chooseHero(heroes: Event().heroes))
        Event.findPotion(hero: Event.chooseHero(heroes: Event().heroes))
    }else if random % 3 == 0{
        Event.fight(heroes: &Event().heroes, enemies: &Event().enemies)
        print(Event().heroes)
    } else {
        
    }
}








