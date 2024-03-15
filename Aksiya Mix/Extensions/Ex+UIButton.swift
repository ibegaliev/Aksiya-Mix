//
//  Ex+UIButton.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 15/03/24.
//

import UIKit

extension UIButton {

    func setWight() {
        snp.makeConstraints { make in
            make.width.equalTo(
                (titleLabel?.text?.widthOfString(
                    usingFont: titleLabel!.font
                ) ?? 0) + 24
            )
        }
    }
    
}

