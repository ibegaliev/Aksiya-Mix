//
//  CompanyDescriptionCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 08/03/24.
//

import UIKit

class CompanyDescriptionCell: UITableViewCell {
    
    var title: String? {
        get {
            return nil
        }
        set {
            guard let text = newValue else { return }
            titleLabel.text = "\(text) haqida"
        }
    }
    
    var descriptionText: String? {
        get {
            return nil
        }
        set {
            descriptionLabel.text = newValue
        }
    }
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 20, weight: .bold)
        return lbl
    }()

    lazy var descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 6
        lbl.font = .appFont(ofSize: 12, weight: .regular)
        return lbl
    }()
    
    lazy var showAllDescriptionButton: UIButton = {
        let btn = UIButton()
//        btn.setTitle("Batafsil", for: .normal)
        btn.addTarget(self, action: #selector(tappedShowAll), for: .touchUpInside)
        btn.titleLabel?.font = .appFont(ofSize: 12, weight: .medium)
        btn.setTitleColor(.selectBlue, for: .normal)
        return btn
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()
    
    lazy var titlesStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 6
        return stack
    }()
    
    lazy var buttonStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .trailing
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setConstraints()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        contentView.backgroundColor = .white
        contentView.addSubview(mainStack)
        [titlesStack, buttonStack].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        [titleLabel, descriptionLabel].forEach { item in
            titlesStack.addArrangedSubview(item)
        }
        [UIView(), showAllDescriptionButton].forEach { item in
            buttonStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(12)
            make.left.right.equalTo(contentView).inset(16)
        }
    }
    
    @objc
    func tappedShowAll() {
        
    }
    
}
