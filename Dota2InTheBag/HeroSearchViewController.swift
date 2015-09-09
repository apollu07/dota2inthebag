//
//  HeroSearchViewController.swift
//  Dota2InTheBag
//
//  Created by Lu Lu on 8/30/15.
//  Copyright (c) 2015 Lu Lu. All rights reserved.
//

import UIKit

class HeroSearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    var heroDatabase = SingletonDotaHeroDatabase.sharedInstance
    var heroLineup = SingletonHeroLineup.sharedInstance
    var touchedHeroButtonID: Int?
    var filteredHeroes = [DotaHero]()
    var searchActive : Bool = false
    var tap: UITapGestureRecognizer!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        tap = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Table related functions.
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        if searchActive == true {
            return filteredHeroes.count
        }
        return heroDatabase.database.count + 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("HeroTableCell", forIndexPath: indexPath) as! HeroTableViewCell
        
        // Configure the cell...
        let row = indexPath.row
        var heroes: [DotaHero]!
        if searchActive == true {
            heroes = filteredHeroes
        } else {
            heroes = heroDatabase.database
        }
        if !searchActive && row == heroDatabase.database.count {
            // Return button
            cell.heroImage.image = UIImage(named: "back.png")
            cell.heroNameLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption2)
            cell.heroNameLabel.text = "return to lineup"
        } else {
            cell.heroImage.image = UIImage(named: heroes[row].imageURL)
            cell.heroNameLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption2)
            cell.heroNameLabel.text = heroes[row].officialName
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var heroes: [DotaHero]!
        if searchActive == true {
            heroes = filteredHeroes
        } else {
            heroes = heroDatabase.database
        }
        let row = indexPath.row
        if !searchActive && row == heroDatabase.database.count {
            self.performSegueWithIdentifier("returnedSegue", sender: self)
        } else {
            heroLineup.setHeroAt(position: touchedHeroButtonID!, to: heroes[indexPath.row])
            self.performSegueWithIdentifier("returnedWithNewHeroFromSearchSegue", sender: self)
            
        }
    }

    
    // Functions for search bar.
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchActive = true;
        view.addGestureRecognizer(tap)
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
            view.removeGestureRecognizer(tap)
        } else {
            view.addGestureRecognizer(tap)
        }
        filteredHeroes.removeAll(keepCapacity: false)
        for hero in heroDatabase.database {
            for name in hero.allNames {
                if name.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch) != nil {
                    filteredHeroes.append(hero)
                    break
                }
            }
        }
        self.tableView.reloadData()
    }
    
    func dismissKeyboard() {
        searchBar.resignFirstResponder()
        view.removeGestureRecognizer(tap)
        if filteredHeroes.count == 0 {
            self.searchActive = false
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Navigation
    // Return from hero table view page.
    @IBAction func returnedFromHeroTableToHeroSearch(segue: UIStoryboardSegue) {
        println("returned from Hero table view page.")
    }
}
