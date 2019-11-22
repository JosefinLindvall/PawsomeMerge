//
//  Service.swift
//  Pawsome
//
//  Created by Josefin Lindvall on 2019-11-13.
//  Copyright © 2019 ProjectGroupM. All rights reserved.
//

import UIKit

class Service: NSObject
{
    var name : String
    var telephoneNumber : String
    var address : String
    var linkToWebsite : String
    var email : String
    
    
    init(name : String, telephoneNumber : String, address : String, linkToWebsite : String, email : String)
    {
        self.name = name
        self.telephoneNumber = telephoneNumber
        self.address = address
        self.linkToWebsite = linkToWebsite
        self.email = email
    }
    
    func getAttributeFromString (_ stringDescribingAttribute: String) -> String?
    {
        switch stringDescribingAttribute
        {
            case "name":
                return self.name
            
            case "telephoneNumber":
                return self.telephoneNumber
            
            case "address":
                return self.address
            
            case "linkToWebsite":
                return self.linkToWebsite
            
            case "email":
                return self.email
            
            default:
                return nil
    
        
        }
        
        
    }
    

    
}
