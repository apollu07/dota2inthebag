//
//  MatchLevelViewController.swift
//  Dota2InTheBag
//
//  Created by Lu Lu on 8/26/15.
//  Copyright (c) 2015 Lu Lu. All rights reserved.
//

import UIKit

class MatchLevelViewController: UIViewController {
    
    enum MatchLevel: Int {
        case Unknown = 0, NormalSkill, HighSkill, VeryHighSkill
    }
    
    var matchLevel: MatchLevel?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func normalSkillSelected(sender: AnyObject) {
        matchLevel = .NormalSkill
    }

    @IBAction func highSkillSelected(sender: AnyObject) {
        matchLevel = .HighSkill
    }
    
    @IBAction func veryHighSkillSelected(sender: AnyObject) {
        matchLevel = .VeryHighSkill
    }
    
    @IBAction func iDontKnowSelected(sender: AnyObject) {
        matchLevel = .Unknown
    }
    
    @IBAction func returned(segue: UIStoryboardSegue) {
        println("returned from Lineup page.")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as! LineupViewController
        if let curMatchLevel = matchLevel {
            destination.matchLevel = curMatchLevel
        } else {
            destination.matchLevel = .Unknown
        }
    }
}
