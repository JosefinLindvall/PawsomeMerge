//
//  notesCategores.swift
//  Pawsome
//
//  Created by Kim Berg on 2019-11-13.
//  Copyright © 2019 ProjectGroupM. All rights reserved.
//

import Foundation

class NotesCategories{
    
    var healthcare: [String] = []
    var medicalcare: [String] = []
    var activities: [String] = []
    var other: [String] = []
    
    
    var title: String
    var date: String
    
    init(title: String, date: String, category: String){
        
        /*switch(category){
            case "medicalcare":
                callMedicalcare(title: , date: )
                break
            
            case "healthcare":
                callHealthcare(title: , date: )
                break
            
            case "activities":
                    callActvities(title: , date: )
            
            case "other":
                callOther(title: , date: )
                break
            
            default: break
         */
        
        self.title = title
        self.date = date
        }
        
        func callMedicalcare(title: String, date: String){
            self.title = title
            self.date = date
        }
        
        func callHealthcare(title: String, date: String){
            self.title = title
            self.date = date
        }
        
        func callActvities(title: String, date: String){
            self.title = title
            self.date = date
        }
        
        func callOther(title: String, date: String){
            self.title = title
            self.date = date
        }
        
}
    
    
    
