//
//  PostManager.swift
//  Demo
//
//  Created by Roy Hsu on 2018/5/17.
//  Copyright © 2018 TinyWorld. All rights reserved.
//

// MARK: - PostManager

import Foundation

class PostManager: PostProvider {
    
    enum FetchPostError: Error {
        
        case noData
        
    }
    
    func fetchPost(
        id: String,
        completionHandler: @escaping (Result<Post>) -> Void
    ) {
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(id)")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                
                completionHandler(
                    .failure(error: error)
                )
                
                return
                
            }
            
            guard
                let data = data
            else {
                
                let error: FetchPostError = .noData
                
                completionHandler(
                    .failure(error: error)
                )
                
                return
                    
            }
            
            do {
                
                let json = try JSONSerialization.jsonObject(with: data)
                
                let post = try Post(json: json)
                
                completionHandler(
                    .success(value: post)
                )
                
            }
            catch {
                
                completionHandler(
                    .failure(error: error)
                )
                
            }
            
        }
        
        task.resume()
        
    }
    
}
