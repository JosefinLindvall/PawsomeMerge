//
//  EditProfileViewController.swift
//  Pawsome
//
//  Created by Axel Axelsson on 2019-11-09.
//  Copyright © 2019 ProjectGroupM. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    @IBOutlet weak var NameField: UITextField!    
    @IBOutlet weak var DateField: UITextField!
    @IBOutlet weak var GenderField: UITextField!
    @IBOutlet weak var BreedField: UITextField!
    @IBOutlet weak var InvalidInputLabel: UILabel!
    
    
    private var datePicker: UIDatePicker?
    
    let genderData = [String](arrayLiteral: "Male", "Female")
    
       
    var myDogProfile = DogProfile()
    var listOfBreeds : ListOfBreeds?
    var dogList = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDogList()
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        
        DateField.inputView = datePicker
        
        
        let genderPicker = UIPickerView()
        GenderField.inputView = genderPicker
        genderPicker.tag = 1
        genderPicker.delegate = self
        
        let breedPicker = UIPickerView()
        BreedField.inputView = breedPicker
        breedPicker.tag = 2
        breedPicker.delegate = self
        // Do any additional setup after loading the view.
    }
    

    
    
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)        
    }
    
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        DateField.text = dateFormatter.string(from: datePicker.date)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NameField.text = myDogProfile.name
        DateField.text = myDogProfile.birthDate
        GenderField.text = myDogProfile.gender
        BreedField.text = myDogProfile.breed
    }
    

	

    @IBAction func saveProfile(_ sender: Any) {
        
        if NameField.text == "" {
            InvalidInputLabel.text = "Must enter name"
        }
        else {
            myDogProfile.name = NameField.text!
            myDogProfile.birthDate = DateField.text!
            myDogProfile.gender = GenderField.text!
            myDogProfile.breed = BreedField.text!
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
    func fetchDogList() {
    
        
        APIClient.shared.fetchData{ (listOfBreeds, error) in
            if let error = error {
                print("failed to fetch \(error)")
                return
            }
            guard let listOfBreeds = listOfBreeds else { print("hmmm"); return }
            print("DEBUG: ListOfDogs -> \(listOfBreeds)")
            self.listOfBreeds = listOfBreeds
            
                            
            for (key, value) in listOfBreeds.message {
                
                if value.count > 0 {
                    for specificDog in value {
                        self.dogList.append(specificDog + " " + key)
                    }
                }
                else {
                    self.dogList.append(key)
                }
                
            }
            print(self.dogList)
        }
    }

    
     // MARK: UIPickerView Delegation
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return genderData.count
        }
        else {
            return dogList.count
        }
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return genderData[row]
        }
        else {
            return dogList[row]
        }
    }

    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            GenderField.text = genderData[row]
        }
        else {
            BreedField.text = dogList[row]
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
