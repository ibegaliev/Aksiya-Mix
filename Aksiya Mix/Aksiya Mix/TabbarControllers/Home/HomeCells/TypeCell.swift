//
//  TypeCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/30/24.
//

import UIKit

class TypeCell: UICollectionViewCell {
    
    lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 4
        stack.axis = .vertical
        return stack
    }()
    
    lazy var mainImage: RoundableImageView = {
        let view = RoundableImageView()
        
        return view
    }()
    
    lazy var title: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 12, weight: .semibold)
        lbl.textAlignment = .center
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
        addSubview(stack)
        
        [mainImage, title].forEach { item in
            stack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        stack.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        mainImage.snp.makeConstraints { make in
            make.height.equalTo(frame.width)
        }
        mainImage.layer.cornerRadius = frame.width/2
    }
    
}
