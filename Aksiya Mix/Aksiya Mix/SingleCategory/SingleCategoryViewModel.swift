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
            if LanguageManager().getLanguage() == "uz" {
                view.titleLabel.text = data?.name_uz
            } else {
                view.titleLabel.text = data?.name_ru
            }
        }
    }
    
    var subData: [CategoryDM]? {
        didSet {
            view.subData = subData
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
                print(JSON(errorData))
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
