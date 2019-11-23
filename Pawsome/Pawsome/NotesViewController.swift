//
//  NotesViewController.swift
//  Pawsome
//
//  Created by Kim Berg on 2019-11-06.
//  Copyright © 2019 ProjectGroupM. All rights reserved.
//

import UIKit
import SQLite

class NotesViewController: UIViewController {
    
    var database = DataHandler()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Navigation
    
    
    
    @IBAction func clickedMedicalcare(_ sender: UIButton) {
        self.database.setActiveTableName(self.database.medicalcareTableName)
        self.database.createTable(database.medicalcareTable)
    }
    
    @IBAction func clickedHealthcare(_ sender: UIButton) {
        self.database.setActiveTableName(self.database.healthcareTableName)
        self.database.createTable(database.healthcareTable)
        performSegue(withIdentifier: "segueToNotesOfDetailedView", sender: sender)
    }
    
    @IBAction func clickedActivities(_ sender: UIButton) {
        self.database.setActiveTableName(self.database.acitivitiesTableName)
        self.database.createTable(database.activitiesTable)
        performSegue(withIdentifier: "segueToNotesOfDetailedView", sender: sender)
    }
    
    @IBAction func clickedOther(_ sender: UIButton) {
        self.database.setActiveTableName(self.database.otherTableName)
        self.database.createTable(database.otherTable)
        performSegue(withIdentifier: "segueToNotesOfDetailedView", sender: sender)

    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "segueToNotesOfDetailedView"){
            if let nextVC = segue.destination as? NotesOfDetailedCategoryTableViewController,
                let button = sender as? UIButton,
                let buttonPressed = button.titleLabel?.text{
                
                switch(buttonPressed){
                    
                    case "Medicalcare":
                        nextVC.navbarCategoryTitle = buttonPressed
                        nextVC.database = database
                        break
                    case "Healthcare":
                        nextVC.navbarCategoryTitle = buttonPressed
                        nextVC.database = database
                        break
                        
                    case "Activities":
                        nextVC.navbarCategoryTitle = buttonPressed
                        nextVC.database = database
                        break
                    
                    case "Other":
                        nextVC.navbarCategoryTitle = buttonPressed
                        nextVC.database = database
                        break
                    
                    default: break
                }
            }
        }
    }
}

