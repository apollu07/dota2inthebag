//
//  HeroSearchViewController.swift
//  Dota2InTheBag
//
//  Created by Lu Lu on 8/30/15.
//  Copyright (c) 2015 Lu Lu. All rights reserved.
//

import UIKit

class HeroSearchViewController: UIViewController, UITextFieldDelegate {
    
    var heroDatabase = SingletonDotaHeroDatabase.sharedInstance
    var heroLineup = SingletonHeroLineup.sharedInstance
    var touchedHeroButtonID: Int?
    var heroToAdd: DotaHero?
    var heroType: String?
    
    @IBOutlet weak var searchInput: UITextField!
    @IBOutlet weak var searchResultLabel: UILabel!
    @IBOutlet weak var searchResultImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        searchInput.delegate = self
        // Render hero name and image with the current position's hero if it exists.
        // TODO(lulu): consider if touchedHeroButtonID will ever be invalid
        if let currHero = heroLineup.heroAt(position: touchedHeroButtonID!) {
            searchResultLabel.text = currHero.officialName
            searchResultImage.image = UIImage(named: currHero.imageURL)
            heroToAdd = currHero
        } else {
            searchResultLabel.text = ""
            searchResultImage.image = UIImage(named: "unknown_hero.png")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        searchInput.endEditing(true)
    }
    
    // Actions
    @IBAction func clearButtonTouched(sender: AnyObject) {
        searchInput.text = nil
    }
    @IBAction func searchButtonTouched(sender: AnyObject) {
        searchInput.resignFirstResponder();
        let heroFound = heroDatabase.searchForHero(searchInput.text)
        displayHero(heroFound)
        if heroFound != nil {
            heroToAdd = heroFound
        }
    }
    @IBAction func addHeroButtonTouched(sender: AnyObject) {
        heroLineup.setHeroAt(position: touchedHeroButtonID!, to: heroToAdd)
        performSegueWithIdentifier("addHeroFromSearchSegue", sender: self)
    }
    @IBAction func strengthButtonTouched(sender: AnyObject) {
        heroType = "str"
        performSegueWithIdentifier("searchToTypeSegue", sender: nil)
    }
    @IBAction func agilityButtonTouched(sender: AnyObject) {
        heroType = "agi"
        performSegueWithIdentifier("searchToTypeSegue", sender: nil)
    }
    @IBAction func intelligenceButtonTouched(sender: AnyObject) {
        heroType = "int"
        performSegueWithIdentifier("searchToTypeSegue", sender: nil)
    }
    
    // UITextField delegates.
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        searchInput.resignFirstResponder();
        // TODO(lulu): refactor the code below into a function.
        let heroFound = heroDatabase.searchForHero(searchInput.text)
        displayHero(heroFound)
        if heroFound != nil {
            heroToAdd = heroFound
        }
        return true;
    }
    
    // Display hero's official name and image given a hero ID.
    func displayHero(hero: DotaHero?) {
        if let currHero = hero {
            searchResultLabel.text = currHero.officialName
            searchResultImage.image = UIImage(named: currHero.imageURL)
        } else {
            searchResultLabel.text = "Invalid hero name. Please try again."
            searchResultImage.image = UIImage(named: "unknown_hero.png")
        }
    }
    
    // MARK: - Navigation
    // Return from hero table view page.
    @IBAction func returnedFromHeroTableToHeroSearch(segue: UIStoryboardSegue) {
        println("returned from Hero table view page.")
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "searchToTypeSegue" {
            let destination = segue.destinationViewController as! HeroTableViewController
            destination.heroType = heroType
        }
    }
}
