//
//  SingleCategoryViewModel.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 11/02/24.
//

import Foundation
import SwiftyJSON

class SingleCategoryViewModel {
    
    let view = SingleCategoryView()
        
    var data: CategoryModel? {
        didSet {
            getSubCategory(id: data?.id)
            view.categoryData = data
        }
    }
    
    var subData: [CategoryDM]? {
        didSet {
            view.subData = subData
        }
    }
    
    var childData: [SubCategoryDM]? {
        didSet {
            view.childData = childData
        }
    }
    
    func getSubCategory(id: Int?) {
        guard let id else { return }
        
        NetworkService.shared.mainRequestWithToken(
            urlPath: .generalCategories,
            addToURL: "\(id)/",
            method: .get,
            bodyData: nil) { [self] responseData in
                subData = Parser.shared.parse(json: responseData)
            } errorData: { errorData in
                
            }

    }
    
}

struct CategoryDM: Codable {
    let name: String?
    let pk: Int?
    let children: [SubCategoryDM]?
}

struct SubCategoryDM: Codable {
    let name: String?
    let pk: Int?
}
