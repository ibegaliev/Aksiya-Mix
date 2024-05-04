//
//  SaleTopView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 13/03/24.
//

import UIKit

class SaleTopView: UIView {
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.image = .hotSale
        image.tintColor = .white
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 10, weight: .regular)
        lbl.textColor = .white
        return lbl
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 4
        stack.alignment = .center
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        applyGradient(
            colors: [.garnierPink, .garnierOrgane],
            startPoint: CGPoint(
                x: 0,
                y: 0
            ),
            endPoint: CGPoint(
                x: 0.8,
                y: 0.5
            )
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        addSubview(mainStack)
        [imageView, titleLabel].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.equalTo(self).inset(4)
            make.left.right.equalTo(self).inset(8)
            make.bottom.equalTo(self).inset(25)
        }
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(16)
        }
    }
    
}
