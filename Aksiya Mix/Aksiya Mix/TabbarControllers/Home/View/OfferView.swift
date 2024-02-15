//
//  OfferView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 15/02/24.
//

import UIKit

class OfferView: UIView {
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        
        return stack
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 16, weight: .bold)
        lbl.textColor = .spacetext
        lbl.text = "MAXSUS TAKLIFLAR"
        return lbl
    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        
        return tv
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        addSubview(mainStack)
        [titleLabel, tableView].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
}
