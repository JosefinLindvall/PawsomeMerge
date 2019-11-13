//
//  EditProfileViewController.swift
//  Pawsome
//
//  Created by Axel Axelsson on 2019-11-09.
//  Copyright © 2019 ProjectGroupM. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {
    
    @IBOutlet weak var NameField: UITextField!
    
    var name: String = ""
    var myDogProfile = DogProfile()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NameField.text = myDogProfile.name
    }
    

	

    @IBAction func saveProfile(_ sender: Any) {
        myDogProfile.name = NameField.text!
        self.navigationController?.popViewController(animated: true)
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
