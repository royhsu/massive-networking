//
//  JSONError.swift
//  Demo
//
//  Created by Roy Hsu on 2018/5/17.
//  Copyright © 2018 TinyWorld. All rights reserved.
//

// MARK: - JSONError

enum JSONError: Error {
    
    case notObject
    
    case missingValueForKey(String)
    
}
