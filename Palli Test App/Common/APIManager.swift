//
//  APIManager.swift
//  APIManager
//
//  Created by YIM LLC on 06/08/21.
//

import Foundation

class APIManager {
    
    static let shared = { APIManager() }()
    
    lazy var baseURL: String = {
        return "https://www.googleapis.com/books/v1/volumes?"
    }()
}
