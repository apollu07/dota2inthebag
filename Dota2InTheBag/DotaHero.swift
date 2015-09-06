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
        println("ID: \(heroId), Name: \(officialName), Type: \(heroType), Image: \(imageURL)")
        println("Nick names:")
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
        println("Initializing dota hero database.")
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
        for i in 0...9 {
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