//
//  BannerCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/27/24.
//

import UIKit
import SwiftUI

class BannerCell: UICollectionViewCell {
    
    lazy var hostingController = UIHostingController(rootView: BannerView())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        setUI()
//        setConstraints()
        contentView.backgroundColor = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        addSubview(hostingController.view)
    }
    
    private func setConstraints() {
        
        hostingController.view.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        hostingController.didMove(toParent: UIViewController())
        contentView.isUserInteractionEnabled = false
        
    }
    
}
