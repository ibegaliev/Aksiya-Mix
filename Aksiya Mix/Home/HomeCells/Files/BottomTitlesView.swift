//
//  BottomTitlesView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/30/24.
//

import UIKit

class BottomTitlesView: UIView {
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 4
        stack.axis = .vertical
        stack.alignment = .leading
        return stack
    }()
    
    lazy var topView: UIView = {
        let view = TitleTopView()

        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .white
        lbl.text = "Смартфон Apple iPhone 13 pro 256ГБ"
        lbl.numberOfLines = 2
        lbl.font = .boldSystemFont(ofSize: 12)
        return lbl
    }()
    
    lazy var costView: UIView = {
        let view = TitleBottomView()
        
        return view
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
        
        [topView, titleLabel, costView].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(8)
        }
    }
    
}

class TitleTopView: UIView {
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 4
        stack.alignment = .center
        return stack
    }()
    
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.image = .eye_Icon
        return view
    }()
    
    lazy var countLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "1.5 тыс"
        lbl.font = .systemFont(ofSize: 10)
        lbl.textColor = .spacetext
        return lbl
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .spaceLine
        return view
    }()
    
    lazy var cityLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 10)
        lbl.text = "Ташкент"
        lbl.textColor = .spacetext
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setIU()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setIU() {
        addSubview(mainStack)
        
        [imageView, countLabel, lineView, cityLabel].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(self)
            make.height.equalTo(25)
        }
        lineView.snp.makeConstraints { make in
            make.width.equalTo(1)
            make.height.equalTo(8)
        }
        imageView.snp.makeConstraints { make in
            make.width.equalTo(10)
            make.height.equalTo(9)
        }
    }
    
}

class TitleBottomView: UIView {
    
    lazy var oldCost: UILabel = {
        var lbl = UILabel()
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(
            string: "18 5000 000 сум"
        )
        attributeString.addAttribute(
            NSAttributedString.Key.strikethroughStyle,
            value: 1.5,
            range: NSRange(
                location: 0,
                length: attributeString.length
            )
        )
        lbl.attributedText = attributeString
        lbl.textColor = .spacetext
        lbl.font = .systemFont(ofSize: 10)
        return lbl
    }()

    lazy var newCost: UILabel = {
        var lbl = UILabel()
        lbl.text = "17 000 000 сум"
        lbl.font = .boldSystemFont(ofSize: 12)
        return lbl
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
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
        
        [oldCost, newCost].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
}
