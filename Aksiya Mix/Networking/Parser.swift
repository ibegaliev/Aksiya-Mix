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
    
    func parse<T>(json: Data?) -> T? where T: Codable {
        guard let json = json else { return T.self as? T}
        print(JSON(json))
        do {
            let model = try decoder.decode(T.self, from: json)
            return model
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
}
