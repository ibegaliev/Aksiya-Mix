//
//  LikedSordsView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 13/02/24.
//

import UIKit

class LikedSordsView: UIView {
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 18, weight: .bold)
        lbl.text = LyricsManager.getLyrics(type: .departaments)
        return lbl
    }()
    
    lazy var savedView: LikedSordsItem = {
        let view = LikedSordsItem()
        view.title = "Saralanganlar"
        return view
    }()

    lazy var seenView: LikedSordsItem = {
        let view = LikedSordsItem()
        view.title = "Yaqinda ko'rilganlar"
        return view
    }()

    lazy var endedView: LikedSordsItem = {
        let view = LikedSordsItem()
        view.title = "Tugagan e'lonlar"
        return view
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillProportionally
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
        [savedView, seenView, endedView].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.bottom.equalTo(self)
            make.left.right.equalTo(self).inset(8)
        }
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(mainStack.snp_bottomMargin).inset(20)
            make.left.right.equalTo(self).inset(16)
        }
    }
    
}


class LikedSordsItem: UIView {
    
    var title: String? {
        get {
            return nil
        }
        set {
            titleLabel.text = newValue
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
            make.height.equalTo(2)
        }
    }
    
}
