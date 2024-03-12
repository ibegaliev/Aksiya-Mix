//
//  BannerCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/27/24.
//

import UIKit

class BannerCell: UICollectionViewCell {
    
    lazy var bannerView: BannerView = {
        let bannerView = BannerView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: contentView.frame.width,
                height: contentView.frame.height - 12
            )
        )
        bannerView.isZoom = true
        bannerView.imgCornerRadius = 8
        bannerView.itemWidth = 0.screenWight - 32
        bannerView.itemSpace = -36
        bannerView.imageDatas = [
            "https://aksiyamix.uz/assets/banner/banner.jpg",
            "https://aksiyamix.uz/assets/banner/top.jpg"
        ]
        return bannerView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        contentView.addSubview(bannerView)
    }
    
    private func setConstraints() {
        bannerView.snp.makeConstraints { make in
            make.top.bottom.equalTo(self).inset(6)
            make.left.right.equalTo(self)
        }
    }
        
}
