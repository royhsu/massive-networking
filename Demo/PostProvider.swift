//
//  PostProvider.swift
//  Demo
//
//  Created by Roy Hsu on 2018/5/17.
//  Copyright © 2018 TinyWorld. All rights reserved.
//

// MARK: - PostProvider

protocol PostProvider {
    
    func fetchPost(
        id: String,
        completionHandler: @escaping (Result<Post>) -> Void
    )
    
}
