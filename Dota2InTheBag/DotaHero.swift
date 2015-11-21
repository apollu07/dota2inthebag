//
//  DotaHero.swift
//  Dota2InTheBag
//
//  Created by Lu Lu on 8/31/15.
//  Copyright (c) 2015 Lu Lu. All rights reserved.
//

import Foundation
import Parse

class DotaHero {
    var heroId: Int = -1
    var officialName: String = "Unknown"
    var allNames: Set<String> = Set<String>()
    var imageURL: String = ""
    var heroType: String = ""
    
    init(id: Int, name: String, image: String, type: String, names:Set<String>) {
        heroId = id
        officialName = name
        allNames = names
        imageURL = image
        heroType = type
    }
    
    func debugDisplay() {
        print("ID: \(heroId), Name: \(officialName), Type: \(heroType), Image: \(imageURL)")
        print("Nick names:")
        dump(allNames)
    }
}

class SingletonDotaHeroDatabase {
    static let sharedInstance = SingletonDotaHeroDatabase()
    
    var database = [DotaHero]()
    var strHeroes = [DotaHero]()
    var agiHeroes = [DotaHero]()
    var intHeroes = [DotaHero]()
    
    // Hard-coded init function to add all dota heros to the database.
    init() {
        print("Initializing dota hero database.")
        database.append(DotaHero(id: 1, name: "Antimage", image: "antimage.png", type: "agi", names: ["antimage", "anti-mage", "anti mage", "am"]))
        database.append(DotaHero(id: 2, name: "Axe", image: "axe.png", type: "str", names: ["axe", "ax"]))
        database.append(DotaHero(id: 3, name: "Bane", image: "bane.png", type: "int", names: ["bane"]))
        database.append(DotaHero(id: 4, name: "Bloodseeker", image: "bloodseeker.png", type: "agi", names: ["bloodseeker", "bs", "blood seeker", "blood"]))
        database.append(DotaHero(id: 5, name: "Crystal Maiden", image: "crystal_maiden.png", type: "int", names: ["crystal maiden", "cm", "maiden", "crystal"]))
        database.append(DotaHero(id: 6, name: "Drow Ranger", image: "drow_ranger.png", type: "agi", names: ["drow ranger", "drow", "dr"]))
        database.append(DotaHero(id: 7, name: "Earthshaker", image: "earthshaker.png", type: "str", names: ["earthshaker", "earth shaker", "shaker", "es"]))
        database.append(DotaHero(id: 8, name: "Juggernaut", image: "juggernaut.png", type: "agi", names: ["juggernaut", "jugg"]))
        database.append(DotaHero(id: 9, name: "Mirana", image: "mirana.png", type: "agi", names: ["mirana", "tiger"]))
        database.append(DotaHero(id: 10, name: "Morphling", image: "morphling.png", type: "agi", names: ["morphline", "morph"]))
        database.append(DotaHero(id: 11, name: "Nevermore", image: "nevermore.png", type: "agi", names: ["nevermore", "sf", "shadow fiend", "never more", "shadowfiend"]))
        database.append(DotaHero(id: 12, name: "Phantom Lancer", image: "phantom_lancer.png", type: "agi", names: ["phantom lancer", "pl", "phantomlancer"]))
        database.append(DotaHero(id: 13, name: "Puck", image: "puck.png", type: "int", names: ["puck"]))
        database.append(DotaHero(id: 14, name: "Pudge", image: "pudge.png", type: "str", names: ["pudge"]))
        database.append(DotaHero(id: 15, name: "Razor", image: "razor.png", type: "agi", names: ["razor"]))
        database.append(DotaHero(id: 16, name: "Sand King", image: "sand_king.png", type: "str", names: ["sand king", "sand", "sk"]))
        database.append(DotaHero(id: 17, name: "Storm Spirit", image: "storm_spirit.png", type: "int", names: ["storm spirit", "storm", "ss"]))
        database.append(DotaHero(id: 18, name: "Sven", image: "sven.png", type: "str", names: ["sven"]))
        database.append(DotaHero(id: 19, name: "Tiny", image: "tiny.png", type: "str", names: ["tiny"]))
        database.append(DotaHero(id: 20, name: "Vengeful Spirit", image: "vengefulspirit.png", type: "agi", names: ["vengeful spirit", "vengefulspirit", "vs", "venge"]))
        database.append(DotaHero(id: 21, name: "Windranger", image: "windrunner.png", type: "int", names: ["windranger", "wr", "wind", "windrunner", "wind ranger", "wind runner"]))
        database.append(DotaHero(id: 22, name: "Zeus", image: "zuus.png", type: "int", names: ["zeus"]))
        database.append(DotaHero(id: 23, name: "Kunkka", image: "kunkka.png", type: "str", names: ["kunkka"]))
        database.append(DotaHero(id: 24, name: "unknown", image: "", type: "", names: ["unkonwn"]))
        database.append(DotaHero(id: 25, name: "Lina", image: "lina.png", type: "int", names: ["lina"]))
        database.append(DotaHero(id: 26, name: "Lion", image: "lion.png", type: "int", names: ["lion"]))
        database.append(DotaHero(id: 27, name: "Shadow Shaman", image: "shadow_shaman.png", type: "int", names: ["shadow shaman", "shadowshaman", "shaman", "ss"]))
        database.append(DotaHero(id: 28, name: "Slardar", image: "slardar.png", type: "str", names: ["slardar"]))
        database.append(DotaHero(id: 29, name: "Tidehunter", image: "tidehunter.png", type: "str", names: ["tidehunter", "tide", "th", "tide hunter"]))
        database.append(DotaHero(id: 30, name: "Witch Doctor", image: "witch_doctor.png", type: "int", names: ["witch doctor", "wd"]))
        database.append(DotaHero(id: 31, name: "Lich", image: "lich.png", type: "int", names: ["lich"]))
        database.append(DotaHero(id: 32, name: "Riki", image: "riki.png", type: "agi", names: ["riki", "sa"]))
        database.append(DotaHero(id: 33, name: "Enigma", image: "enigma.png", type: "int", names: ["enigma"]))
        database.append(DotaHero(id: 34, name: "Tinker", image: "tinker.png", type: "int", names: ["tinker", "tk"]))
        database.append(DotaHero(id: 35, name: "Sniper", image: "sniper.png", type: "agi", names: ["sniper"]))
        database.append(DotaHero(id: 36, name: "Necrophos", image: "necrolyte.png", type: "int", names: ["necrolyte", "necrophos", "necro"]))
        database.append(DotaHero(id: 37, name: "Warlock", image: "warlock.png", type: "int", names: ["warlock", "wl", "war lock"]))
        database.append(DotaHero(id: 38, name: "Beastmaster", image: "beastmaster.png", type: "str", names: ["beastmaster", "bm", "beast", "beast master"]))
        database.append(DotaHero(id: 39, name: "Queen of Pain", image: "queenofpain.png", type: "int", names: ["queen of pain", "qop", "queen", "queenofpain"]))
        database.append(DotaHero(id: 40, name: "Venomancer", image: "venomancer.png", type: "agi", names: ["venomancer", "veno"]))
        database.append(DotaHero(id: 41, name: "Faceless Void", image: "faceless_void.png", type: "agi", names: ["faceless void", "void", "fv"]))
        database.append(DotaHero(id: 42, name: "Wraith King", image: "skeleton_king.png", type: "str", names: ["wraith king", "wk", "skeleton king", "snk"]))
        database.append(DotaHero(id: 43, name: "Death Prophet", image: "death_prophet.png", type: "int", names: ["death prophet", "dp"]))
        database.append(DotaHero(id: 44, name: "Phantom Assassin", image: "phantom_assassin.png", type: "agi", names: ["phantom assassin", "pa"]))
        database.append(DotaHero(id: 45, name: "Pugna", image: "pugna.png", type: "int", names: ["pugna"]))
        database.append(DotaHero(id: 46, name: "Templar Assassin", image: "templar_assassin.png", type: "agi", names: ["templar assassin", "ta"]))
        database.append(DotaHero(id: 47, name: "Viper", image: "viper.png", type: "agi", names: ["viper"]))
        database.append(DotaHero(id: 48, name: "Luna", image: "luna.png", type: "agi", names: ["luna"]))
        database.append(DotaHero(id: 49, name: "Dragon Knight", image: "dragon_knight.png", type: "str", names: ["dragon knight", "dn"]))
        database.append(DotaHero(id: 50, name: "Dazzle", image: "dazzle.png", type: "int", names: ["dazzle"]))
        database.append(DotaHero(id: 51, name: "Clockwerk", image: "rattletrap.png", type: "str", names: ["clockwerk"]))
        database.append(DotaHero(id: 52, name: "Leshrac", image: "leshrac.png", type: "int", names: ["leshrac"]))
        database.append(DotaHero(id: 53, name: "Nature's Prophet", image: "furion.png", type: "int", names: ["nature's prophet", "np", "furion"]))
        database.append(DotaHero(id: 54, name: "Lifestealer", image: "life_stealer.png", type: "str", names: ["lifestealer", "naix"]))
        database.append(DotaHero(id: 55, name: "Dark Seer", image: "dark_seer.png", type: "int", names: ["dark seer", "ds"]))
        database.append(DotaHero(id: 56, name: "Clinkz", image: "clinkz.png", type: "agi", names: ["clinkz"]))
        database.append(DotaHero(id: 57, name: "Omniknight", image: "omniknight.png", type: "str", names: ["omniknight"]))
        database.append(DotaHero(id: 58, name: "Enchantress", image: "enchantress.png", type: "int", names: ["enchatress"]))
        database.append(DotaHero(id: 59, name: "Huskar", image: "huskar.png", type: "str", names: ["huskar"]))
        database.append(DotaHero(id: 60, name: "Night Stalker", image: "night_stalker.png", type: "str", names: ["night stalker"]))
        database.append(DotaHero(id: 61, name: "Broodmother", image: "broodmother.png", type: "agi", names: ["broodmother", "bm", "spider"]))
        database.append(DotaHero(id: 62, name: "Bounty Hunter", image: "bounty_hunter.png", type: "agi", names: ["bounty hunter", "bh"]))
        database.append(DotaHero(id: 63, name: "Weaver", image: "weaver.png", type: "agi", names: ["weaver"]))
        database.append(DotaHero(id: 64, name: "Jakiro", image: "jakiro.png", type: "int", names: ["jakiro", "twin head dragon"]))
        database.append(DotaHero(id: 65, name: "Batrider", image: "batrider.png", type: "str", names: ["batrider"]))
        database.append(DotaHero(id: 66, name: "Chen", image: "chen.png", type: "int", names: ["chen"]))
        database.append(DotaHero(id: 67, name: "Spectre", image: "spectre.png", type: "agi", names: ["spectre"]))
        database.append(DotaHero(id: 68, name: "Ancient Apparition", image: "ancient_apparition.png", type: "int", names: ["ancient apparition", "aa"]))
        database.append(DotaHero(id: 69, name: "Doom", image: "doom_bringer.png", type: "str", names: ["doom"]))
        database.append(DotaHero(id: 70, name: "Ursa", image: "ursa.png", type: "agi", names: ["ursa"]))
        database.append(DotaHero(id: 71, name: "Spirit Breaker", image: "spirit_breaker.png", type: "str", names: ["spirit breaker", "sb"]))
        database.append(DotaHero(id: 72, name: "Gyrocopter", image: "gyrocopter.png", type: "agi", names: ["gyrocopter"]))
        database.append(DotaHero(id: 73, name: "Alchemist", image: "alchemist.png", type: "str", names: ["alchemist"]))
        database.append(DotaHero(id: 74, name: "Invoker", image: "invoker.png", type: "int", names: ["invoker", "karl"]))
        database.append(DotaHero(id: 75, name: "Silencer", image: "silencer.png", type: "int", names: ["silencer"]))
        database.append(DotaHero(id: 76, name: "Outworld Destroyer", image: "obsidian_destroyer.png", type: "int", names: ["outworld destroyer","obsidian destroyer", "od"]))
        database.append(DotaHero(id: 77, name: "Lycan", image: "lycan.png", type: "str", names: ["lycan", "wolf"]))
        database.append(DotaHero(id: 78, name: "Brewmaster", image: "brewmaster.png", type: "str", names: ["brewmaster", "bm"]))
        database.append(DotaHero(id: 79, name: "Shadow Demon", image: "shadow_demon.png", type: "int", names: ["shadow demon", "sd"]))
        database.append(DotaHero(id: 80, name: "Lone Druid", image: "lone_druid.png", type: "agi", names: ["lone druid", "bear"]))
        database.append(DotaHero(id: 81, name: "Chaos Knight", image: "chaos_knight.png", type: "str", names: ["chaos knight", "ck"]))
        database.append(DotaHero(id: 82, name: "Meepo", image: "meepo.png", type: "agi", names: ["meepo"]))
        database.append(DotaHero(id: 83, name: "Treant Protector", image: "treant.png", type: "str", names: ["treant protector"]))
        database.append(DotaHero(id: 84, name: "Orge Magi", image: "ogre_magi.png", type: "int", names: ["orge magi"]))
        database.append(DotaHero(id: 85, name: "Undying", image: "undying.png", type: "str", names: ["undying"]))
        database.append(DotaHero(id: 86, name: "Rubick", image: "rubick.png", type: "int", names: ["rubick"]))
        database.append(DotaHero(id: 87, name: "Disruptor", image: "disruptor.png", type: "int", names: ["disruptor"]))
        database.append(DotaHero(id: 88, name: "Nyx Assassin", image: "nyx_assassin.png", type: "agi", names: ["nyx assassin", "na"]))
        database.append(DotaHero(id: 89, name: "Naga Siren", image: "naga_siren.png", type: "agi", names: ["naga siren"]))
        database.append(DotaHero(id: 90, name: "Keeper of the Light", image: "keeper_of_the_light.png", type: "int", names: ["keeper of the light", "kotl"]))
        database.append(DotaHero(id: 91, name: "IO", image: "wisp.png", type: "str", names: ["io", "wisp"]))
        database.append(DotaHero(id: 92, name: "Visage", image: "visage.png", type: "int", names: ["visage"]))
        database.append(DotaHero(id: 93, name: "Slark", image: "slark.png", type: "agi", names: ["slark"]))
        database.append(DotaHero(id: 94, name: "Medusa", image: "medusa.png", type: "agi", names: ["medusa"]))
        database.append(DotaHero(id: 95, name: "Troll Warlord", image: "troll_warlord.png", type: "agi", names: ["troll warlord"]))
        database.append(DotaHero(id: 96, name: "Centaur Warrunner", image: "centaur.png", type: "str", names: ["centaur warrunner"]))
        database.append(DotaHero(id: 97, name: "Magnus", image: "magnataur.png", type: "str", names: ["magnus", "magnataur"]))
        database.append(DotaHero(id: 98, name: "Timbersaw", image: "shredder.png", type: "str", names: ["timbersaw", "shredder"]))
        database.append(DotaHero(id: 99, name: "Bristleback", image: "bristleback.png", type: "str", names: ["bristleback", "bb"]))
        database.append(DotaHero(id: 100, name: "Tusk", image: "tusk.png", type: "str", names: ["tusk"]))
        database.append(DotaHero(id: 101, name: "Skywrath Mage", image: "skywrath_mage.png", type: "int", names: ["skywrath mage"]))
        database.append(DotaHero(id: 102, name: "Abaddon", image: "abaddon.png", type: "str", names: ["abaddon"]))
        database.append(DotaHero(id: 103, name: "Elder Titan", image: "elder_titan.png", type: "str", names: ["elder titan"]))
        database.append(DotaHero(id: 104, name: "Legion Commander", image: "legion_commander.png", type: "str", names: ["legion commander", "lc"]))
        database.append(DotaHero(id: 105, name: "Techies", image: "techies.png", type: "int", names: ["techies"]))
        database.append(DotaHero(id: 106, name: "Ember Spirit", image: "ember_spirit.png", type: "agi", names: ["ember spirit"]))
        database.append(DotaHero(id: 107, name: "Earth Spirit", image: "earth_spirit.png", type: "str", names: ["earth spirit", "es"]))
        database.append(DotaHero(id: 108, name: "unknown", image: "", type: "", names: ["unknown"]))
        database.append(DotaHero(id: 109, name: "Terrorblade", image: "terrorblade.png", type: "agi", names: ["terrorblade", "tb"]))
        database.append(DotaHero(id: 110, name: "Phoenix", image: "phoenix.png", type: "str", names: ["phoenix"]))
        database.append(DotaHero(id: 111, name: "Oracle", image: "oracle.png", type: "int", names: ["oracle"]))
        database.append(DotaHero(id: 112, name: "Winter Wyvern", image: "winter_wyvern.png", type: "int", names: ["winter wyvern", "ww"]))

        // Note: no 108
        
        // Init heroes of different types.
        for hero in database {
            switch hero.heroType {
            case "str":
                strHeroes.append(hero)
            case "agi":
                agiHeroes.append(hero)
            case "int":
                intHeroes.append(hero)
            default:
                ()
            }
        }
    }
    
    // Search and return dota hero based on the input name.
    func searchForHero(name: String) -> DotaHero? {
        for currHero in database {
            for currName in currHero.allNames {
                if nameMatches(on: currName, and: name) {
                    return currHero
                }
            }
        }
        return nil
    }
    
    // Get heroes of a specific type.
    func getHeroesOfType(type: String) -> [DotaHero] {
        switch type {
        case "str":
            return strHeroes
        case "agi":
            return agiHeroes
        case "int":
            return intHeroes
        default:
            return [DotaHero]()
        }
    }
    
    // Decide if two hero name string matches.
    func nameMatches(on name1: String, and name2: String) -> Bool {
        // Normalization
        let name1_l = name1.lowercaseString
        let name2_l = name2.lowercaseString
        let name1_ls = name1_l.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        let name2_ls = name2_l.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        return name1_ls == name2_ls
    }
}

class SingletonHeroLineup {
    static let sharedInstance = SingletonHeroLineup()
    
    var lineup: [DotaHero?] = []
    
    // Init function to set up 10 heros (nil)
    init() {
        for _ in 0...9 {
            lineup.append(nil)
        }
    }
    
    func heroAt(position pos: Int) -> DotaHero? {
        return lineup[pos]
    }
    
    func setHeroAt(position pos: Int, to hero: DotaHero?) {
        lineup[pos] = hero
    }
    
    func hasHero(hero: DotaHero) -> Bool {
        for i in 0...9 {
            if lineup[i] != nil && lineup[i]!.heroId == hero.heroId {
                return true
            }
        }
        return false
    }
    
    func clear() {
        for i in 0...9 {
            lineup[i] = nil
        }
    }
}

class SingletonHeroWinRates {
    static let sharedInstance = SingletonHeroWinRates()
    
    // Dictionaries with hero id as the key, an array of win rates as the value.
    // array[i] represents the win rate when ith hero is the ally/enemy of current hero.
    var allyWinRates = [Int: [Float]]()
    var enemyWinRates = [Int: [Float]]()
    
    init () {
        for i in 0...112 {
            allyWinRates[i] = [Float]()
            enemyWinRates[i] = [Float]()
        }
    }
    
    // Load and parse the win rate objects and store win rates information in the dictionaries.
    func loadHeroWinRates(objects winRateObjects: [PFObject]) {
        for obj in winRateObjects {
            let heroId = obj["hero_id"] as! Int
            let enemyString = obj["enemy_win_rates"]
            let allyString = obj["ally_win_rates"]
            let enemyArray = enemyString.componentsSeparatedByString(",")
            let allyArray = allyString.componentsSeparatedByString(",")
            for enemy in enemyArray {
                let enemyWinRate = Float(enemy.componentsSeparatedByString(":")[1])
                if enemyWinRates[heroId] != nil {
                    enemyWinRates[heroId]!.append(enemyWinRate!)
                } else {
                    print("Something is wrong parsing hero win rate!")
                }
            }
            for ally in allyArray {
                let allyWinRate = Float(ally.componentsSeparatedByString(":")[1])
                if allyWinRates[heroId] != nil {
                    allyWinRates[heroId]!.append(allyWinRate!)
                } else {
                    print("Something is wrong parsing hero win rate!")
                }
            }
        }
    }
}