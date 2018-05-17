//
//  Post.swift
//  Demo
//
//  Created by Roy Hsu on 2018/5/17.
//  Copyright © 2018 TinyWorld. All rights reserved.
//

// MARK: - Post

struct Post {
    
    let title: String
    
    let body: String
    
    init(json: Any) throws {
        
        guard
            let jsonObject = json as? JSONObject
        else { throw JSONError.notObject }
        
        guard
            let title = jsonObject["title"] as? String
        else { throw JSONError.missingValueForKey("title") }
        
        guard
            let body = jsonObject["body"] as? String
        else { throw JSONError.missingValueForKey("body") }
        
        self.title = title
        
        self.body = body
        
    }
    
}
