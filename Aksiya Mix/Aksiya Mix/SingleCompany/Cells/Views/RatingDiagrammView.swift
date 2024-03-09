//
//  RatingDiagrammView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 09/03/24.
//

import UIKit

class RatingDiagrammView: UIView {
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 2
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
        for i in (1...5).enumerated() {
            let view = DiagrammView()
            view.title = "\(i.offset + 1)"
            view.percent = 85
            mainStack.insertArrangedSubview(view, at: 0)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
}

class DiagrammView: UIView {
    
    var title: String? {
        get {
            return nil
        }
        set {
            numberLabel.text = newValue
        }
    }
    
    var percent: Int? {
        get {
            return nil
        }
        set {
            guard let newValue else { return }
            if newValue > 100 || newValue <= 0 { return }
            DispatchQueue.global(qos: .unspecified).async { [self] in
                DispatchQueue.main.async { [self] in
                    indicatorView.snp.makeConstraints { make in
                        make.width.equalTo(Int(backView.frame.width) * newValue / 100)
                    }
                }
            }
        }
    }
    
    lazy var numberLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 14, weight: .semibold)
        lbl.textColor = .spacetext
        return lbl
    }()
    
    lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .backBlue
        view.layer.cornerRadius = 4
        return view
    }()
    
    lazy var indicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .selectBlue
        view.layer.cornerRadius = 4
        return view
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 8
        stack.axis = .horizontal
        stack.alignment = .center
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
        backView.addSubview(indicatorView)
        [numberLabel, backView].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        backView.snp.makeConstraints { make in
            make.height.equalTo(8)
        }
        
        indicatorView.snp.makeConstraints { make in
            make.top.left.bottom.equalTo(backView)
        }
        
    }
    
}
