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
    @IBOutlet weak var DateField: UITextField!
    
    private var datePicker: UIDatePicker?
    
    
    //var name: String = ""
    var myDogProfile = DogProfile()
    //var date: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapGesture)
        
        
        
        
        DateField.inputView = datePicker
        
        // Do any additional setup after loading the view.
    }
    
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
        
    }
    
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        DateField.text = dateFormatter.string(from: datePicker.date)
        //view.endEditing(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NameField.text = myDogProfile.name
        DateField.text = myDogProfile.birthDate
    }
    

	

    @IBAction func saveProfile(_ sender: Any) {
        myDogProfile.name = NameField.text!
        myDogProfile.birthDate = DateField.text!
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
