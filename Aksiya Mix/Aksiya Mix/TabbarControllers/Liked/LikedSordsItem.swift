//
//  LikedSordsItem.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 13/02/24.
//

import UIKit

protocol LikedSordsItemDelegate {
    func selected(tag: Int)
}

class LikedSordsItem: UIView {
    
    var delegate: LikedSordsItemDelegate?
    
    var title: String? {
        get {
            return nil
        }
        set {
            titleLabel.text = newValue
        }
    }
    
    var isSelect: Bool? {
        get {
            return nil
        }
        set {
            guard let newValue else { return }
            if newValue {
                lineView.backgroundColor = .selectBlue
            } else {
                lineView.backgroundColor = .clear
            }
        }
    }
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.font = .appFont(ofSize: 14, weight: .medium)
        return lbl
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 1
        view.clipsToBounds = true
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 4
        stack.distribution = .fill
        stack.alignment = .fill
        stack.axis = .vertical
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
        addgesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        addSubview(stack)
        [titleLabel, lineView].forEach { item in
            stack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        stack.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(2)
        }
        lineView.snp.makeConstraints { make in
            make.height.equalTo(2.5)
        }
    }
    
    private func addgesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(selected))
        addGestureRecognizer(gesture)
        isUserInteractionEnabled =  true
    }
    
    @objc
    func selected() {
        delegate?.selected(tag: self.tag)
    }
    
}
