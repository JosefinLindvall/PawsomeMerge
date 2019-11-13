//
//  ProfileViewController.swift
//  Pawsome
//
//  Created by Axel Axelsson on 2019-11-06.
//  Copyright © 2019 ProjectGroupM. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var NameLabel: UILabel!
    
    var myDogProfile = DogProfile()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NameLabel.text = myDogProfile.name
        
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? EditProfileViewController {
              
                
                    destination.myDogProfile = myDogProfile
                    
                //skicka hela objectet
            }
            
        
    }
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
