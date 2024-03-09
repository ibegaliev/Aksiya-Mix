//
//  CompanyRatingCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 08/03/24.
//

import UIKit

class CompanyRatingCell: UITableViewCell {
    
    lazy var ratingTitlesView: RatingTitlesView = {
        let view = RatingTitlesView()
        
        return view
    }()
    
    lazy var ratingCountView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    lazy var ratingDiagrammView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        
        return stack
    }()

    lazy var ratingStack: UIStackView = {
        let stack = UIStackView()
        
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        contentView.addSubview(mainStack)
        [ratingTitlesView, ratingStack].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        [ratingCountView, ratingDiagrammView].forEach { item in
            ratingStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(8)
            make.left.right.equalTo(contentView).inset(16)
        }
    }
    
}

class RatingTitlesView: UIView {
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Baho va sharhlar"
        lbl.font = .appFont(ofSize: 14, weight: .bold)
        return lbl
    }()
    
    lazy var addRatingButton: UIButton = {
        let btn = UIButton()
        btn.titleLabel?.font = .appFont(ofSize: 12, weight: .semibold)
        btn.setTitleColor(.selectBlue, for: .normal)
        btn.setTitle("Baholash", for: .normal)
        return btn
    }()

    lazy var descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.font = .appFont(ofSize: 12)
        lbl.text = "Reyting va sharhlar sizniki kabi quilma egalari tomonidan joylangan va tastiqlangan!"
        return lbl
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        return stack
    }()
    
    lazy var headerStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.distribution = .equalSpacing
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
        [headerStack, descriptionLabel].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        [titleLabel, addRatingButton].forEach { item in
            headerStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
}
