//
//  FeedbackButton.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/1/24.
//

import UIKit

class FeedbackButton: UIView {
    
    var image: UIImage? {
        get {
            return nil
        }
        set {
            icon.image = newValue
        }
    }
    
    var title: String? {
        get {
            return nil
        }
        set {
            textLabel.text = newValue
        }
    }
    
    lazy var icon: UIImageView = {
        let image = UIImageView()
        
        return image
    }()
    
    lazy var textLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .boldSystemFont(ofSize: 12)
        return lbl
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 6
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
        
        [icon, textLabel].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(self).inset(7)
            make.left.right.equalTo(self).inset(12)
        }
        icon.snp.makeConstraints { make in
            make.width.height.equalTo(18)
        }
    }
    
}

