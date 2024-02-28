//
//  BannerItemCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 28/02/24.
//

import UIKit

class BannerItemCell: UICollectionViewCell {
    
    var data: BannerData? {
        get {
            return nil
        }
        set {
            guard let newValue else { return }
            imageView.image = newValue.image
//            if newValue.isShow {
//                UIView.animate(withDuration: 0.1) { [self] in
//                    imageView.transform = .identity
//                }
//            } else {
//                UIView.animate(withDuration: 0.1) { [self] in
//                    imageView.transform = CGAffineTransform(
//                        scaleX: 0.8,
//                        y: 1
//                    )
//                }
//            }
        }
    }
        
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 8
        image.clipsToBounds = true
        return image
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
        contentView.backgroundColor = .backColor
        contentView.addSubview(imageView)
    }
    
    private func setConstraints() {
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }

    
}
