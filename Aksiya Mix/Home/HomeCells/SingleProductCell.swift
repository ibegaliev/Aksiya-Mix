//
//  SingleProductCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/27/24.
//

import UIKit

class SingleProductCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.image = .imageDelete
        return image
    }()
    
    lazy var headerView: UIView = {
        let view = HeaderView()
        
        return view
    }()
    
    lazy var bottomTitles: UIView = {
        let view = BottomTitlesView()
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        contentView.addSubview(imageView)
        contentView.addSubview(bottomTitles)
        imageView.addSubview(headerView)
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 4
    }
    
    private func setConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.leading.right.equalTo(self)
            make.height.equalTo(contentView.frame.width)
        }
        bottomTitles.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(self)
            make.top.equalTo(imageView.snp_bottomMargin).inset(-8)
        }
        headerView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp_topMargin)
            make.left.right.equalTo(imageView)
            make.height.equalTo(24)
        }
    }
    
}

