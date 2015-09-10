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
    
    class Section {
        var heroesInSection: [DotaHero]?
        var sectionName: String?
        
        init (name: String, heroes: [DotaHero]) {
            heroesInSection = heroes
            sectionName = name
        }
    }
    var sections = [Section]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        tap = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        // Init sections.
        sections.append(Section(name: "Strength", heroes: heroDatabase.strHeroes))
        sections.append(Section(name: "Agility", heroes: heroDatabase.agiHeroes))
        sections.append(Section(name: "Intelligence", heroes: heroDatabase.intHeroes))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Table related functions.
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections. Only show section view in search inactive mode.
        if searchActive {
            return 1
        }
        return sections.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        if searchActive {
            return filteredHeroes.count
        }
        // Add a return cell in last table section.
        if (section == sections.count - 1) {
            return sections[section].heroesInSection!.count + 1
        }
        return sections[section].heroesInSection!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("HeroTableCell", forIndexPath: indexPath) as! HeroTableViewCell
        
        // Configure the cell...
        let row = indexPath.row
        let section = indexPath.section
        var heroes: [DotaHero]!
        if searchActive == true {
            heroes = filteredHeroes
        } else {
            heroes = sections[section].heroesInSection
        }
        if !searchActive && section == sections.count - 1 && row == sections[section].heroesInSection!.count {
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
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int)
        -> String? {
            if searchActive {
                return ""
            }
            return sections[section].sectionName
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var heroes: [DotaHero]!
        let section = indexPath.section
        if searchActive == true {
            heroes = filteredHeroes
        } else {
            heroes = sections[section].heroesInSection
        }
        let row = indexPath.row
        if !searchActive && section == sections.count - 1 && row == sections[section].heroesInSection!.count {
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
