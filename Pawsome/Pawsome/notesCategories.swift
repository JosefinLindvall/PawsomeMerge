//
//  notesCategores.swift
//  Pawsome
//
//  Created by Kim Berg on 2019-11-13.
//  Copyright © 2019 ProjectGroupM. All rights reserved.
//

import Foundation

class NotesCategories{
    
    var title: String
    var date: String
    var comment: String
    var id: Int
    
    init(id: Int, title: String, date: String, comment:String, category: String){
        
        self.title = title
        self.date = date
        self.comment = comment
        self.id = id
        }        
}
    
    
    
