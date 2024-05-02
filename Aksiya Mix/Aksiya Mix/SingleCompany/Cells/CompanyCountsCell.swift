//
//  CompanyCountsCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 07/03/24.
//

import UIKit

class CompanyCountsCell: UITableViewCell {
    
    var fallowersCount: String? {
        get {
            return nil
        }
        set {
            fallowers.topTitle.text = newValue
            fallowers.descriptionLabel.text = "Obunachilar"
        }
    }
    
    var likedCount: String? {
        get {
            return nil
        }
        set {
            liked.topTitle.text = newValue
            liked.descriptionLabel.text = "Sevimlilar"
        }
    }
    
    var commentCount: String? {
        get {
            return nil
        }
        set {
            comment.topTitle.text = newValue
            comment.descriptionLabel.text = "Sharhlar"
        }
    }
    
    lazy var fallowers: CompanyCountItem = {
        let item = CompanyCountItem()
        
        return item
    }()
    
    lazy var liked: CompanyCountItem = {
        let item = CompanyCountItem()
        
        return item
    }()
    
    lazy var comment: CompanyCountItem = {
        let item = CompanyCountItem()
        
        return item
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 4
        stack.alignment = .fill
        stack.distribution = .fillEqually
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
        [fallowers, liked, comment].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView)
            make.left.right.equalTo(contentView).inset(12)
        }
    }
    
}

class CompanyCountItem: UIView {
    
    lazy var topTitle: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 18, weight: .bold)
        return lbl
    }()
    
    lazy var descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 12, weight: .regular)
        lbl.textColor = .spacetext
        return lbl
    }()
    
    lazy var stack: UIStackView = {
        let st = UIStackView()
        st.axis = .vertical
        st.alignment = .center
        st.distribution = .fill
        return st
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
        addSubview(stack)
        [topTitle, descriptionLabel].forEach { item in
            stack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        stack.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(4)
        }
    }
    
}
