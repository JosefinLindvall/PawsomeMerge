//
//  DogBreedsViewController.swift
//  Pawsome
//
//  Created by Axel Axelsson on 2019-11-23.
//  Copyright © 2019 ProjectGroupM. All rights reserved.
//


import UIKit


class DogBreedsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    

    @IBOutlet weak var BreedField: UITextField!
    
 
    var listOfDogs : ListOfBreeds?
    var dogList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDogList()
        
        
        let breedPicker = UIPickerView()        
        BreedField.inputView = breedPicker
        breedPicker.tag = 1
        breedPicker.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
    }
    
    /*
    func fetchData(completion: @escaping(ListOfBreeds?, Error?) -> ()){
        
        guard let url = URL(string: base_url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("failed to fetch data with error:", error)
                completion(nil, error)
                return
            }
            
            guard let data = data else { return }
            //let dataString = String(data: data, encoding: .utf8)
            
            
            do {
                let dogList = try JSONDecoder().decode(ListOfBreeds.self, from: data)
                print(dogList)
                print("doglist")
                completion(dogList, nil)
            } catch let error {
                print("Failed to create json with error:", error.localizedDescription)
                completion(nil, error)
            }
            
        }.resume()
        
    }
    */
    
     // MARK: UIPickerView Delegation
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
  
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
                
        return dogList.count
        
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dogList[row]
    }

    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        BreedField.text = dogList[row]
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    
    
    func fetchDogList() {
    
        
        APIClient.shared.fetchData{ (listOfDogs, error) in
            if let error = error {
                print("failed to fetch \(error)")
                return
            }
            guard let listOfDogs = listOfDogs else { return }
            print("DEBUG: ListOfDogs -> \(listOfDogs)")
            self.listOfDogs = listOfDogs
            
                            
            for (key, value) in listOfDogs.message {
                
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
/*
func findDic(dict: [String: String]){
    for (key, value) in dict{
        if value exist
            
    print("\(key) : \(value)")
  }
}
*/
