//
//  UrlPath.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 02/03/24.
//

import Foundation

enum UrlPath: String {
    case authCode = "/auth/code/"
    case authToken = "/auth/token/"
}

class URLManager {
    
    static var manager = URLManager()
    
    fileprivate var url: URL = URL(
        string: "api.aksiyamix.uz/api/v1"
    )!
    
    func url(path: UrlPath) -> URL {
        return URLManager.manager.url.appendingPathComponent(path.rawValue)
    }
    
}
