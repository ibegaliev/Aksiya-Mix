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
    
    lazy var ratingCountView: RatingCountView = {
        let view = RatingCountView()
        
        return view
    }()
    
    lazy var ratingDiagrammView: RatingDiagrammView = {
        let view = RatingDiagrammView()
        
        return view
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()

    lazy var ratingStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 18
        stack.alignment = .center
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
        contentView.backgroundColor = .white
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
