//
//  HTTPMethodType.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이나연 on 11/22/25.
//

enum HTTPMethodType {
    case get
    case post
    case patch
    
    var key: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .patch:
            return "PATCH"
        }
    }
}

enum HeaderType {
    case auth
    case basic
    
    var value: [String: String] {
        switch self {
        case .auth:
            return [
                "Content-Type": "application/json",
                "userID": "1"
            ]
        case .basic:
             return ["Content-Type": "application/json"]
        }
    }
}
