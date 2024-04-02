//
//  JSONManager.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 02/04/24.
//

import Foundation

class JSONManager {
    
    private init() {}
    
    static let shared = JSONManager()
    
    func loadAndDecodeJSON<T: Decodable>(fromFileNamed fileName: String, into modelType: T.Type) -> T? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(T.self, from: data)
                return decodedData
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        return nil
    }
    
}
