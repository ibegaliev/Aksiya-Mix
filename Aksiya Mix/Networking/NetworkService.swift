//
//  NetworkService.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 01/03/24.
//

import Foundation
import SwiftyJSON

class NetworkService: NSObject {
    
    
    static var shared = NetworkService()
    
    //    MARK: defualt Session
    var defualtSession: URLSession?
    
    //    MARK: backgroundSession
    var backgroundSession: URLSession?
    
    //    MARK: configuration
    var configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.background(withIdentifier: "my_askiya_com")
        config.sessionSendsLaunchEvents = true
        config.isDiscretionary = true
        config.allowsCellularAccess = true
        config.shouldUseExtendedBackgroundIdleMode = true
        config.waitsForConnectivity = true
        return config
    }()
    
}

//MARK: requests
extension NetworkService {
        
//    MARK: request
    func mainRequest(urlPath: UrlPath, method: HttpMethodType, bodyData: Data?, completion: @escaping ()->(), errorData: @escaping ( _ errorData: Data?)->()) {
        
        defualtSession = URLSession(configuration: .default, delegate: self, delegateQueue: .main)
                
        var request = URLRequest(url: URLManager.manager.url(path: urlPath))
        request.httpMethod = method.rawValue
        request.httpBody = bodyData
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Content-Type": "application/json",
            "X-CSRFToken": "SgPH3KiDbKutK0cJAF0lj3uKmYSKeOv4e7Bfh9ytsWU4EHzaNSKmXddX7Iy7EkD2"
        ]
        
        let task = defualtSession?.dataTask(with: request) { data, response, error in
            print(JSON(data))
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 201 {
                    completion()
                } else {
                    errorData(data)
                }
            }
            
        }
        
        DispatchQueue.global(qos: .unspecified).async {
            task?.resume()
        }
        
    }
    
}

extension NetworkService: URLSessionDelegate {
    
}
