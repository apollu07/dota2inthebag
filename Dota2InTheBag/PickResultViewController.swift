//
//  PickResultViewController.swift
//  Dota2InTheBag
//
//  Created by Lu Lu on 9/7/15.
//  Copyright (c) 2015 Lu Lu. All rights reserved.
//

import UIKit

class PickResultViewController: UIViewController {
    var matchLevel: MatchLevelViewController.MatchLevel?
    var heroDatabase = SingletonDotaHeroDatabase.sharedInstance
    var heroLineup = SingletonHeroLineup.sharedInstance
    var suggestedHeroes = [Int]()
    
    @IBOutlet weak var firstChoiceLabel: UILabel!
    @IBOutlet weak var firstChoiceImage: UIImageView!
    @IBOutlet weak var secondChoiceLabel: UILabel!
    @IBOutlet weak var secondChoiceImage: UIImageView!
    @IBOutlet weak var thirdChoiceLabel: UILabel!
    @IBOutlet weak var fourthChoiceLabel: UILabel!
    @IBOutlet weak var fifthChoiceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("match level is \(matchLevel?.rawValue)")
        // Do any additional setup after loading the view.
        // Set pick result page lables and images.
        firstChoiceLabel.text = heroDatabase.getHeroNameByID(heroId: suggestedHeroes[0])
        firstChoiceImage.image = UIImage(named: heroDatabase.getHeroImageByID(heroId: suggestedHeroes[0]))
        secondChoiceLabel.text = heroDatabase.getHeroNameByID(heroId: suggestedHeroes[1])
        secondChoiceImage.image = UIImage(named: heroDatabase.getHeroImageByID(heroId: suggestedHeroes[1]))
        thirdChoiceLabel.text = heroDatabase.getHeroNameByID(heroId: suggestedHeroes[2])
        fourthChoiceLabel.text = heroDatabase.getHeroNameByID(heroId: suggestedHeroes[3])
        fifthChoiceLabel.text = heroDatabase.getHeroNameByID(heroId: suggestedHeroes[4])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonTouched(sender: AnyObject) {
        performSegueWithIdentifier("returnedFromPickResultSegue", sender: nil)
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
