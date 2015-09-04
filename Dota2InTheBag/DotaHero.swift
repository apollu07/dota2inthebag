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
    
    var database: [DotaHero] = []
    
    // Hard-coded init function to add all dota heros to the database.
    init() {
        println("Initializing dota hero database.")
        database.append(DotaHero(id: 0, name: "Earthshaker", image: "earthshaker.png", type: "str", names: ["earthshaker", "es", "shaker", "earth shaker"]))
        database.append(DotaHero(id: 1, name: "Sven", image: "sven.png", type: "str", names: ["sven", "seven"]))
        database.append(DotaHero(id: 2, name: "Tiny", image: "tiny.png", type: "str", names: ["tiny"]))
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
}