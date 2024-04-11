//
//  MarketBannerCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 11/04/24.
//

import UIKit
import Lottie

class MarketBannerCell: UICollectionViewCell {
    
    var data: MarketBannerDM? {
        get {
            return nil
        }
        set {
            titleLabel.text = newValue?.name
            descriptionLabel.text = newValue?.description
            imageView.animation = .asset(newValue?.jsonFile ?? "")
        }
    }
    
    lazy var imageView: LottieAnimationView = {
        let ic = LottieAnimationView()
        ic.play()
        ic.loopMode = .loop
        ic.contentMode = .scaleAspectFit
        return ic
    }()

    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.font = .appFont(ofSize: 18, weight: .bold)
        return lbl
    }()
    
    lazy var descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.font = .appFont(ofSize: 14, weight: .medium)
        return lbl
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 12
        stack.alignment = .center
        stack.distribution = .fill
        stack.axis = .vertical
        return stack
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
        contentView.addSubview(mainStack)
        [imageView, titleLabel, descriptionLabel].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.centerX.equalTo(contentView).inset(100)
            make.left.right.equalTo(contentView).inset(20)
        }
        imageView.snp.makeConstraints { make in
            make.height.width.equalTo(contentView.frame.width - 40)
        }
    }
    
}
