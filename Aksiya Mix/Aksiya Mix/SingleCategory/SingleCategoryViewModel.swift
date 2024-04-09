//
//  SingleCategoryViewModel.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 11/02/24.
//

import Foundation

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
    
    func getSubCategory(id: Int?) {
        guard let id else { return }
        var bodyData: [String: String] = [:]
        
        NetworkService.shared.mainRequestWithToken(
            urlPath: .generalCategories,
            method: .get,
            bodyData: nil) { responseData in
                
            } errorData: { errorData in
                
            }

    }
    
}
