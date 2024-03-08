//
//  CompanyLocationsCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 07/03/24.
//

import UIKit

class CompanyLocationsCell: UITableViewCell {
 
    lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .backColor
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 8
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.axis = .vertical
        return stack
    }()
    
    lazy var timeView: CompanyLocationItemView = {
        let view = CompanyLocationItemView()
        view.title = "Ish vaqti:"
        view.descrip = "Dush-Jum, 9:00-18:00"
        return view
    }()
    
    lazy var locationView: CompanyLocationItemView = {
        let view = CompanyLocationItemView()
        view.title = "Joylashuv"
        view.descrip = "Toshkent, Yunusobod"
        view.descriptionLabel.textColor = .link
        return view
    }()

    lazy var phoneNumberView: CompanyLocationItemView = {
        let view = CompanyLocationItemView()
        view.title = "Telefon raqam:"
        view.descrip = "+998 90 043 77 47"
        return view
    }()

    lazy var registrationDataView: CompanyLocationItemView = {
        let view = CompanyLocationItemView()
        view.title = "Ro'yxatga olingan sana:"
        view.descrip = "Yanvar 2024"
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        contentView.backgroundColor = .white
        contentView.addSubview(backView)
        
        backView.addSubview(mainStack)
        [timeView, locationView, phoneNumberView, registrationDataView].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        backView.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(4)
            make.left.right.equalTo(contentView).inset(16)
        }
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(backView).inset(8)
        }
    }
    
}

class CompanyLocationItemView: UIView {
    
    var title: String? {
        get {
            return nil
        }
        set {
            titleLabel.text = newValue
        }
    }

    var descrip: String? {
        get {
            return nil
        }
        set {
            descriptionLabel.text = newValue
        }
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .appFont(ofSize: 12, weight: .semibold)
        label.textColor = .spacetext
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .appFont(ofSize: 12, weight: .medium)
        label.numberOfLines = 2
        return label
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 2
        stack.alignment = .fill
        stack.distribution = .fill
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
        [titleLabel, descriptionLabel].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
}
