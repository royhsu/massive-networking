//
//  Result.swift
//  Demo
//
//  Created by Roy Hsu on 2018/5/17.
//  Copyright © 2018 TinyWorld. All rights reserved.
//

// MARK: - Result

enum Result<T> {
    
    case success(value: T)
    
    case failure(error: Error)
    
}
