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
    
    init(name : String, telephoneNumber : String, address : String, linkToWebsite : String)
    {
        self.name = name
        self.telephoneNumber = telephoneNumber
        self.address = address
        self.linkToWebsite = linkToWebsite
    }
}
