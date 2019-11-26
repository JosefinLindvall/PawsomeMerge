//
//  DogProfile.swift
//  Pawsome
//
//  Created by Axel Axelsson on 2019-11-09.
//  Copyright © 2019 ProjectGroupM. All rights reserved.
//

import UIKit

class DogProfile{
    
    var name: String
    var birthDate: String
    var gender: String
    var breed: String
    var image: UIImage?
    
    init(name: String = "Name", date: String = "dd/mm/yyyy", gender: String = "gender", breed: String = "breed", image: String = "paw") {
        self.name = name
        self.birthDate = date
        self.gender = gender
        self.breed = breed
        self.image = UIImage(named: image)
    }
    
    
    
    
    
    
    
}
