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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        println("Match level is: \(matchLevel!.rawValue)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
