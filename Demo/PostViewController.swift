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
    
    var postProvider: PostProvider?
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        postProvider?.fetchPost(id: "1") { result in
            
            DispatchQueue.main.async {
                
                switch result {
                    
                case let .success(post):
                    
                    self.titleLabel.text = post.title
                    
                    self.bodyLabel.text = post.body
                    
                case let .failure(error): self.showAlert(message: error.localizedDescription)
                    
                }
                
            }
            
        }

    }
    
    func showAlert(message: String) {
        
        let alertController = UIAlertController(
            title: "Oops! Something went wrong.",
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(
            title: "OK",
            style: .cancel,
            handler: nil
        )
        
        alertController.addAction(okAction)
        
        present(
            alertController,
            animated: true,
            completion: nil
        )
        
    }

}
