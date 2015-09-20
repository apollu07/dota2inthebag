//
//  DotaHero.swift
//  Dota2InTheBag
//
//  Created by Lu Lu on 8/31/15.
//  Copyright (c) 2015 Lu Lu. All rights reserved.
//

import Foundation

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
    
    func clear() {
        for i in 0...9 {
            lineup[i] = nil
        }
    }
}