//
//  NotesViewController.swift
//  Pawsome
//
//  Created by Kim Berg on 2019-11-06.
//  Copyright © 2019 ProjectGroupM. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if(segue.identifier == "medicalCareSegue"){
            if let nextVC = segue.destination as? NotesOfDetailedCategoryTableViewController{
                
                nextVC.title = "testingMedicalCareSegue"
                nextVC.date = "7/11 - 2019"
            }
        }
        else if(segue.identifier == "healthCareSegue"){
            
        }
        else if(segue.identifier == "activitiesSegue"){
            
        }
        else if(segue.identifier == "otherSegue"){
            
        }
        
        
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
