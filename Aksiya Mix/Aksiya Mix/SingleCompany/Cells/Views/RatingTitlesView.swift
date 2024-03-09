//
//  RatingTitlesView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 09/03/24.
//

import UIKit

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
        stack.spacing = 2
        return stack
    }()
    
    lazy var headerStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 8
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
