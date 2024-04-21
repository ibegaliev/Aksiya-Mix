//
//  Parser.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 02/03/24.
//

import Foundation
import SwiftyJSON

class Parser {
    
    static let shared = Parser()
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    
    func parse<T>(json: Data?) -> T? where T: Codable {
        guard let json = json else { return T.self as? T}
        do {
            let model = try decoder.decode(T.self, from: json)
            return model
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func data(data: [String: Any]?) -> Data? {
        guard let dictionary = data else {
            print("Error: Input dictionary is nil")
            return nil
        }
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: [])
            return jsonData
        } catch {
            print("Error converting dictionary to data: \(error)")
            return nil
        }    }
    
}

