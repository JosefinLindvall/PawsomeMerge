//
//  NotesViewController.swift
//  Pawsome
//
//  Created by Kim Berg on 2019-11-06.
//  Copyright © 2019 ProjectGroupM. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {

    var medicalcareArray: [NotesCategories] = []
    var healthcareArray: [NotesCategories] = []
    var activitiesArray: [NotesCategories] = []
    var otherArray: [NotesCategories] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        medicalcareArray.append(NotesCategories(title: "He got cancer", date: "5/7-2013", category: "medicalcare"))
        medicalcareArray.append(NotesCategories(title: "He's geting better", date: "3/4-2015", category: "medicalcare"))
        medicalcareArray.append(NotesCategories(title: "He might make it through", date: "13/11-2017", category: "medicalcare"))
        medicalcareArray.append(NotesCategories(title: "He's healthy!", date: "13/11-2019", category: "medicalcare"))
        
        healthcareArray.append(NotesCategories(title: "Healthcaare wooo", date: "5/7-2013", category: "medicalcare"))
        healthcareArray.append(NotesCategories(title: "healthcaare", date: "3/4-2015", category: "medicalcare"))
        healthcareArray.append(NotesCategories(title: "healthcare", date: "13/11-2017", category: "medicalcare"))
        healthcareArray.append(NotesCategories(title: "healthcaare", date: "13/11-2019", category: "medicalcare"))
        
        activitiesArray.append(NotesCategories(title: "Actvities placeholder 1", date: "5/7-2013", category: "medicalcare"))
        activitiesArray.append(NotesCategories(title: "Actvities placeholder 2", date: "3/4-2015", category: "medicalcare"))
        activitiesArray.append(NotesCategories(title: "Actvities placeholder 3", date: "13/11-2017", category: "medicalcare"))
        activitiesArray.append(NotesCategories(title: "Actvities placeholder 4", date: "13/11-2019", category: "medicalcare"))
        
        otherArray.append(NotesCategories(title: "Other placeholder 1", date: "5/7-2013", category: "medicalcare"))
        otherArray.append(NotesCategories(title: "Other placeholder 2", date: "3/4-2015", category: "medicalcare"))
        otherArray.append(NotesCategories(title: "Other placeholder 3", date: "13/11-2017", category: "medicalcare"))
        otherArray.append(NotesCategories(title: "Other placeholder 4 ", date: "13/11-2019", category: "medicalcare"))
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickedHealthcare(_ sender: UIButton) {
        
        performSegue(withIdentifier: "segueToNotesOfDetailedView", sender: sender)
        
    }
    
    @IBAction func clickedActivities(_ sender: UIButton) {
        
        performSegue(withIdentifier: "segueToNotesOfDetailedView", sender: sender)

    }
    
    @IBAction func clickedOther(_ sender: UIButton) {
        
        performSegue(withIdentifier: "segueToNotesOfDetailedView", sender: sender)

    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "segueToNotesOfDetailedView"){
            if let nextVC = segue.destination as? NotesOfDetailedCategoryTableViewController, let button = sender as? UIButton{
                
                let buttonPressed = button.titleLabel?.text
                
                switch(buttonPressed){
                    
                    case "Medicalcare":
                        nextVC.detailedCategoryArray = medicalcareArray
                        break
                    case "Healthcare":
                        nextVC.detailedCategoryArray = healthcareArray
                        break
                        
                    case "Activities":
                        nextVC.detailedCategoryArray = activitiesArray
                        break
                    
                    case "Other":
                        nextVC.detailedCategoryArray = otherArray
                        break
                    
                    default: break
                }
            }
        }       
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}

