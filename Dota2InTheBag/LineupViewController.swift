//
//  LineupViewController.swift
//  Dota2InTheBag
//
//  Created by Lu Lu on 8/27/15.
//  Copyright (c) 2015 Lu Lu. All rights reserved.
//

import UIKit

class LineupViewController: UIViewController {
    
    var matchLevel: MatchLevelViewController.MatchLevel?
    var heroDatabase: SingletonDotaHeroDatabase?
        
    // Which hero button in the screen is touched.
    // If no hero is selected for that position, we go to the hero selection screen.
    // Otherwise we enable the user to edit/remove it.
    // Allies  Enemies
    // 0       5
    // 1       6
    // 2       7
    // 3       8
    // 4       9
    var touchedHeroButtonID: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        heroDatabase = SingletonDotaHeroDatabase.sharedInstance
        
        // Do any additional setup after loading the view.
        println("Match level is: \(matchLevel!.rawValue)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Detect hero button touch event.
    @IBAction func heroButton0Touched(sender: AnyObject) {
        touchedHeroButtonID = 0
        performSegueWithIdentifier("lineupToHeroSearchSegue", sender: nil)
    }
    @IBAction func heroButton1Touched(sender: AnyObject) {
        touchedHeroButtonID = 1
        performSegueWithIdentifier("lineupToHeroSearchSegue", sender: nil)
    }
    @IBAction func heroButton2Touched(sender: AnyObject) {
        touchedHeroButtonID = 2
        performSegueWithIdentifier("lineupToHeroSearchSegue", sender: nil)
    }
    @IBAction func heroButton3Touched(sender: AnyObject) {
        touchedHeroButtonID = 3
        performSegueWithIdentifier("lineupToHeroSearchSegue", sender: nil)
    }
    @IBAction func heroButton4Touched(sender: AnyObject) {
        touchedHeroButtonID = 4
        performSegueWithIdentifier("lineupToHeroSearchSegue", sender: nil)
    }
    @IBAction func heroButton5Touched(sender: AnyObject) {
        touchedHeroButtonID = 5
        performSegueWithIdentifier("lineupToHeroSearchSegue", sender: nil)
    }
    @IBAction func heroButton6Touched(sender: AnyObject) {
        touchedHeroButtonID = 6
        performSegueWithIdentifier("lineupToHeroSearchSegue", sender: nil)
    }
    @IBAction func heroButton7Touched(sender: AnyObject) {
        touchedHeroButtonID = 7
        performSegueWithIdentifier("lineupToHeroSearchSegue", sender: nil)
    }
    @IBAction func heroButton8Touched(sender: AnyObject) {
        touchedHeroButtonID = 8
        performSegueWithIdentifier("lineupToHeroSearchSegue", sender: nil)
    }
    @IBAction func heroButton9Touched(sender: AnyObject) {
        touchedHeroButtonID = 9
        performSegueWithIdentifier("lineupToHeroSearchSegue", sender: nil)
    }
    
    // Return from hero search page.
    @IBAction func returned(segue: UIStoryboardSegue) {
        println("returned from Hero search page.")
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "lineupToHeroSearchSegue" {
          let destination = segue.destinationViewController as! HeroSearchViewController
          destination.heroDatabase = heroDatabase
        }
    }

}
