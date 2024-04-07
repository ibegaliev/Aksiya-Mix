//
//  SelectableBrandCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 07/04/24.
//

import UIKit

class SelectableBrandCell: UICollectionViewCell {
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.font = .appFont(ofSize: 14, weight: .medium)
        return lbl
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
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        contentView.addSubview(titleLabel)
    }
    
    private func setConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
    
}
