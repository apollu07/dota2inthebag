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
    
    init(id: Int, name: String, names:Set<String>, image: String) {
        heroId = id
        officialName = name
        allNames = names
        imageURL = image
    }
    
    func debugDisplay() {
        println("ID: \(heroId), Name: \(officialName), Image: \(imageURL)")
        println("Nick names:")
        dump(allNames)
    }
}