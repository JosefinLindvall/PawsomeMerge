//
//  APIClient.swift
//  Pawsome
//
//  Created by Axel Axelsson on 2019-11-26.
//  Copyright © 2019 ProjectGroupM. All rights reserved.
//

import Foundation

struct APIClient {
    
    static let shared = APIClient()
    
    let base_url = "https://dog.ceo/api/breeds/list/all"
    
    func fetchData(completion: @escaping(ListOfBreeds?, Error?) -> ()){
        
        guard let url = URL(string: base_url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            //handle error
            if let error = error {
                print("failed to fetch data with error:", error)
                completion(nil, error)
                return
            }
            
            //parse data
            guard let data = data else { return }
            
            //decode data
            do {
                let listOfBreeds = try JSONDecoder().decode(ListOfBreeds.self, from: data)
                completion(listOfBreeds, nil)
            } catch let error {
                print("Failed to create json with error:", error.localizedDescription)
                completion(nil, error)
            }
            
        }.resume()
        
    }
    
    
    
    
    
}
