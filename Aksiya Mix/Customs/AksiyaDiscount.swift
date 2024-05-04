//
//  AksiyaDiscount.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 04/05/24.
//

import UIKit

class AksiyaDiscountView: UIView {
    
    var title: Int? {
        get {
            return nil
        }
        set {
            titleLabel.text = "-\(newValue ?? 0)%"
        }
    }
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.image = .aksiyaStar
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .appFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
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
        addSubview(imageView)
        addSubview(titleLabel)
    }
    
    private func setConstraints() {
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        titleLabel.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
}
