//
//  MarketBannerCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 11/04/24.
//

import UIKit
import Lottie

class MarketBannerCell: UIView {
    
    var data: MarketBannerDM? {
        get {
            return nil
        }
        set {
            titleLabel.text = newValue?.name
            descriptionLabel.text = newValue?.description
            imageView.animation = .named(newValue?.jsonFile ?? "")
            imageView.loopMode = .loop
            imageView.play()
        }
    }
    
    lazy var imageView: LottieAnimationView = {
        let ic = LottieAnimationView()
        ic.contentMode = .scaleAspectFit
        return ic
    }()

    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.font = .appFont(ofSize: 20, weight: .bold)
        return lbl
    }()
    
    lazy var descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.font = .appFont(ofSize: 16, weight: .medium)
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
        addSubview(mainStack)
        [imageView, titleLabel, descriptionLabel].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.centerX.equalTo(self).inset(100)
            make.left.right.equalTo(self).inset(20)
        }
        imageView.snp.makeConstraints { make in
            make.height.width.equalTo(self.frame.width - 40)
        }
    }
    
}
