//
//  SingleProductCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/27/24.
//

import UIKit

protocol SingleProductCellDelegate {
    func selectedSingleProdoct()
}

class SingleProductCell: UICollectionViewCell {
    
    var delegate: SingleProductCellDelegate?
    
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
    
    lazy var saleIcon: UIView = {
        let view = UIImageView()
        view.image = .saleIcon
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
        
        contentView.addSubview(saleIcon)
        
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
        saleIcon.snp.makeConstraints { make in
            make.width.height.equalTo(30)
            make.top.equalTo(imageView.snp_bottomMargin).inset(10)
            make.right.equalTo(self)
        }
    }
    
    
    
}

