//
//  MarketBannerCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 11/04/24.
//

import UIKit
import Lottie

class MarketBannerCell: UICollectionViewCell {
    
    lazy var imageView: LottieAnimationView = {
        let ic = LottieAnimationView(name: "CreateNewMarket")
        ic.play()
        ic.loopMode = .loop
        ic.contentMode = .scaleAspectFit
        return ic
    }()

    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "SOME"
        return lbl
    }()
    
    lazy var descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "SOME"
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
            make.center.equalTo(contentView)
            make.left.right.equalTo(contentView).inset(20)
        }
        imageView.snp.makeConstraints { make in
            make.height.width.equalTo(contentView.frame.width - 40)
        }
    }
    
}
