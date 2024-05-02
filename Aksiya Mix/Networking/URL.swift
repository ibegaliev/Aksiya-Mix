//
//  UrlPath.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 02/03/24.
//

import Foundation

enum UrlPath: String {
    
    //auth
    case authCode = "/auth/code/"
    case authToken = "/auth/token/"
    
    //complaints
    case complaintsComment = "/complaints/comment/"
    case complaintsDiscount = "/complaints/discount/"
    case complaintsShortname = "/complaints/shortname/"
    
    //discounts
    
    //general
    case generalCategories = "/general/categories/"
    case generalDistricts = "/general/districts/"
    
    //stores
    case stores = "/stores/"
    
    //discounts
    case discounts = "/discounts/"
    
    //user
    case usersProfile = "/users/profile/"
    
}

class URLManager {
    
    static var manager = URLManager()
    
    fileprivate var url: URL = URL(
        string: "https://api.aksiyamix.uz/api/v1"
    )!
    
    func url(path: UrlPath, appendPath: String = "") -> URL {
        return URLManager.manager.url.appendingPathComponent(path.rawValue).appendingPathComponent(appendPath)
    }
        
}
