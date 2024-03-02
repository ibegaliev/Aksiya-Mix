//
//  NetworkService.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 01/03/24.
//

import Foundation

protocol NetworkingManager {
    func fetchData()
}

class NetworkService: NetworkingManager {
    
    
    static var shared = NetworkService()
    
//    MARK: networking
    let defualtSession = URLSession(configuration: .default)
    
    func request(
        urlPath: UrlPath,
        method: HttpMethodType,
        bodyData: Data?
    ) {
        
        var request = URLRequest(url: URLManager.manager.url(path: urlPath))
        request.httpMethod = method.rawValue
        request.httpBody = bodyData
        
        let task = defualtSession.dataTask(with: request) { Data, response, error in
            
        }
        
        task.resume()
        
    }
    
    func fetchData() {
        
    }
    
}
