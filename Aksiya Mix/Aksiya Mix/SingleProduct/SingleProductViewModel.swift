//
//  SingleProductViewModel.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/31/24.
//

import Foundation
import SwiftyJSON

class SingleProductViewModel {
    
    var view = SingleProductView()
    
    var id: Int? {
        didSet {
            getProductData(id: id)
        }
    }
    
    var data: SingleProductDM? {
        didSet {
            view.data = data
        }
    }
    
    func getProductData(id: Int?) {
        guard let id else { return }
        
        NetworkService.shared.mainRequestWithToken(
            urlPath: .discounts,
            addToURL: "\(id)",
            method: .get,
            bodyData: nil) { [self] responseData in
                print(JSON(responseData ?? ""))
                data = SingleProductDM(json: JSON(responseData ?? ""))
//                data = Parser.shared.parse(json: responseData)
            } errorData: { errorData in
                print(JSON(errorData ?? "error"))
            }

        
    }
    
}
