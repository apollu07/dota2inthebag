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
    var heroLineup = SingletonHeroLineup.sharedInstance
    var heroDatabase = SingletonDotaHeroDatabase.sharedInstance

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
        performSegueWithIdentifier("matchLevelToLineupSegue", sender: nil)
    }

    @IBAction func highSkillSelected(sender: AnyObject) {
        matchLevel = .HighSkill
        performSegueWithIdentifier("matchLevelToLineupSegue", sender: nil)
    }
    
    @IBAction func veryHighSkillSelected(sender: AnyObject) {
        matchLevel = .VeryHighSkill
        performSegueWithIdentifier("matchLevelToLineupSegue", sender: nil)
    }
    
    @IBAction func iDontKnowSelected(sender: AnyObject) {
        matchLevel = .Unknown
        performSegueWithIdentifier("matchLevelToLineupSegue", sender: nil)
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
