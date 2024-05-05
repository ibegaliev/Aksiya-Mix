//
//  CostView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/31/24.
//

import UIKit

protocol CostViewDelegate {
    func liked()
    func disliked()
}

class CostView: UIView, FeedbackViewDelegate {
    
    var delegate: CostViewDelegate?
    
    lazy var feedbackView: FeedbackView = {
        let view = FeedbackView()
        view.delegate = self
        return view
    }()
    
    lazy var oldPrince: UILabel = {
        let lbl = UILabel()
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
        lbl.font = .appFont(ofSize: 14, weight: .semibold)
        return lbl
    }()
    
    lazy var newPrince: UILabel = {
        let lbl = UILabel()
        lbl.text = "13 499 000 сум"
        lbl.font = .appFont(ofSize: 24, weight: .bold)
        lbl.applyGradientWith(
            startColor: .garnierPink,
            endColor: .garnierOrgane
        )
        return lbl
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        return stack
    }()
    
    lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
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
        addSubview(stack)
        [mainStack, feedbackView].forEach { item in
            stack.addArrangedSubview(item)
        }
        [oldPrince, newPrince].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        stack.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
    func liked() {
        delegate?.liked()
    }
    
    func disliked() {
        delegate?.disliked()
    }

}
