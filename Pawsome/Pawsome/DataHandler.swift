//
//  DataHandler.swift
//  Pawsome
//
//  Created by Kim Berg on 2019-11-19.
//  Copyright © 2019 ProjectGroupM. All rights reserved.
//

import Foundation
import SQLite

class DataHandler{

    var db: Connection!
    
    let medicalcareTable = Table("Medicalcare")
    let healthcareTable = Table("Healthcare")
    let activitiesTable = Table("Activies")
    let otherTable = Table("Other")
    
    let medicalcareTableName = "Medicalcare"
    let healthcareTableName = "Healthcare"
    let acitivitiesTableName = "Activities"
    let otherTableName = "Other"
    
    var activeTableName: String?
    var activeTable: Table?
    
    let dbId = Expression<Int>("id")
    let dbTitle = Expression<String>("title")
    let dbDate = Expression<String>("date")
    let dbComment = Expression<String>("comment")
    
    init(){
        
        do{
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent("NoteCategories").appendingPathExtension("sqlite3")
            let database = try Connection(fileUrl.path)
            
            self.db = database
            
        } catch {
            print(error)
        }
    }
    
    func createTable(_ tableName: Table){
        let createTable = tableName.create { (table) in
            table.column(self.dbId, primaryKey: true)
            table.column(self.dbTitle, unique: true)
            table.column(self.dbDate)
            table.column(self.dbComment)
        }
        do{
            try self.db.run(createTable)
            print("Created table!")
        }catch{
            print(error)
        }
        self.setActiveTable(tableName)
    }
    
    func insertData(inputTitle: String?, inputDate: String?, inputComment: String?){
        
        if let title = inputTitle,
            let date = inputDate,
            let comment = inputComment,
            let insertNote = self.getActiveTable()?.insert(self.dbTitle <- title, self.dbDate <- date, self.dbComment <- comment){
            /*,
            let tryNote = database?.getActiveTable()?.insert((database?.dbTitle <- inputTitle.text!)!, (database?.dbDate <- inputDate.text!)!, (database?.dbComment <- inputComment.text)!)*/
            do{
                try self.db.run(insertNote)
                print("Inserted Note!")
            }catch{
                print(error)
            }
        }
    }
    
    func loadData() -> [NotesCategories]?{
        var detailedCategoryArray: [NotesCategories] = []
        
        do{
            if let activeTable = self.getActiveTable(),
                let activeTableName = self.getActiveTableName(),
                let notes = try self.db?.prepare(activeTable){
                    for note in notes{
                        detailedCategoryArray.append(NotesCategories(id: note[dbId], title: note[dbTitle], date: note[dbDate], comment: note[dbComment], category: activeTableName))
                    }
                }
        }catch{
            print(error)
        }
        return detailedCategoryArray
    }
    
    func deleteRow(_ id: Int){
        if let note = self.getActiveTable()?.filter(self.dbId == id){
            let deleteNote = note.delete()
            do{
                try self.db.run(deleteNote)
            }catch{
                print(error)
            }
        }
    }
    
    func updateData(_ id: Int, _ newValue: String, _ type: String){
        
        let dbDataType: Expression<String>? = identifyDatatype(type)
        
        if(dbDataType == nil){
            print("ERROR")
        }
        
        else{
            if let note = self.getActiveTable()?.filter(self.dbId == id){
                    
                let updateNote = note.update([(dbDataType! <- newValue)])
                do{
                    try self.db.run(updateNote)
                }catch{
                    print(error)
                }
            }
        }
        
    }
    
    func identifyDatatype(_ type: String) -> Expression<String>?{
        
        switch(type){
            
        case "title":
            return self.dbTitle
            
        case "date":
            return self.dbDate
        
        case "comment":
            return self.dbComment
            
        default: return nil
        }
        
    }
    
    func setActiveTableName(_ tableName: String){
        
        self.activeTableName = tableName
        
    }
    
    func getActiveTableName() -> String?{
        return self.activeTableName
    }
    
    func setActiveTable(_ tableName: Table){
        self.activeTable = tableName
    }
    
    func getActiveTable() -> Table?{
        return self.activeTable
    }
    
    
    
}
