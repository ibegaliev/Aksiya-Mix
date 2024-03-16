//
//  StoreCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/2/24.
//

import UIKit
import GoogleMaps

class StoreCell: UITableViewCell {
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()
    
    lazy var storeView: StoreHeaderView = {
        let view = StoreHeaderView()
        
        return view
    }()
    
    lazy var sectionsView: CompanyInfo = {
        let view = CompanyInfo()
        
        return view
    }()
    
    lazy var mapView: MapView = {
        let view = MapView()
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setConstraints()
    }
        
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {

        selectionStyle = .none
        backgroundColor = .backColor
        
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        contentView.backgroundColor = .white
        contentView.addSubview(mainStack)
        
        [storeView, sectionsView, mapView].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(12)
            make.left.right.equalTo(contentView).inset(16)
        }
    }
        
}
