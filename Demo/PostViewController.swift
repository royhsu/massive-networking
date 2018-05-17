//
//  PostViewController.swift
//  Demo
//
//  Created by Roy Hsu on 2018/5/17.
//  Copyright © 2018 TinyWorld. All rights reserved.
//

// MARK: - PostViewController

import UIKit

class PostViewController: UIViewController {

    @IBOutlet
    weak var titleLabel: UILabel!
   
    @IBOutlet
    weak var bodyLabel: UILabel!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                
                DispatchQueue.main.async {
                
                    self.showAlert(message: error.localizedDescription)
                    
                }
                
                return
                
            }
            
            guard
                let data = data
            else {
                
                DispatchQueue.main.async {
                
                    self.showAlert(message: "No data.")
                    
                }
                
                return
                
            }
            
            do {
                
                let json = try JSONSerialization.jsonObject(with: data)
                
                guard
                    let jsonObject = json as? [String: Any]
                else {
                    
                    DispatchQueue.main.async {
                    
                        self.showAlert(message: "Not json object.")
                    
                    }
                    
                    return
                    
                }
                
                guard
                    let title = jsonObject["title"] as? String
                else {
                    
                    DispatchQueue.main.async {
                    
                        self.showAlert(message: "Missing value for key title.")
                    
                    }
                    
                    return
                        
                }
                
                guard
                    let body = jsonObject["body"] as? String
                else {
                    
                    DispatchQueue.main.async {
                    
                        self.showAlert(message: "Missing value for key body.")
                        
                    }
                    
                    return
                        
                }
                
                DispatchQueue.main.async {
                    
                    self.titleLabel.text = title
                    
                    self.bodyLabel.text = body
                    
                }
                
            }
            catch { self.showAlert(message: error.localizedDescription) }
            
        }
        
        task.resume()

    }
    
    func showAlert(message: String) {
        
        let alertController = UIAlertController(
            title: "Oops! Something went wrong.",
            message: message,
            preferredStyle: .alert
        )
        
        alertController.addAction(
            UIAlertAction(
                title: "OK",
                style: .cancel,
                handler: nil
            )
        )
        
        present(
            alertController,
            animated: true,
            completion: nil
        )
        
    }

}
