//
//  AddressMarketCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 29/04/24.
//

import UIKit

class AddressMarketCell: UITableViewCell {
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        
        return lbl
    }()
        
    lazy var addressLabel: UITextField = {
        let field = UITextField()
        
        return field
    }()
    
    lazy var selectableView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        
        return stack
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
        contentView.addSubview(mainStack)
        [titleLabel, addressLabel, selectableView].forEach { item in
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
