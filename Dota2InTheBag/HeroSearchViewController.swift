//
//  HeroSearchViewController.swift
//  Dota2InTheBag
//
//  Created by Lu Lu on 8/30/15.
//  Copyright (c) 2015 Lu Lu. All rights reserved.
//

import UIKit

class HeroSearchViewController: UIViewController, UITextFieldDelegate {
    
    var heroName: String?
    var heroDatabase: SingletonDotaHeroDatabase?
    
    @IBOutlet weak var searchInput: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        searchInput.delegate = self
        
        println("Size of hero database is: \(heroDatabase?.database.count)")
        // Do any additional setup after loading the view.
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
        if searchInput.text != nil {
          heroName = searchInput.text!
          println("Hero name is: \(heroName!) from search button")
        } else {
            println("Invalid search input!")
        }
    }
    
    // UITextField delegates.
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if searchInput.text != nil {
            heroName = searchInput.text!
            println("Hero name is: \(heroName!) from enter")
        } else {
            println("Invalid search input!")
        }
        searchInput.resignFirstResponder();
        return true;
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
