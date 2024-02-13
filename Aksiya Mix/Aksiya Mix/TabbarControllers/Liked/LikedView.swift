//
//  LikedView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 13/02/24.
//

import UIKit
import Tabman


class LikedView: UIView {
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 18, weight: .bold)
        lbl.text = LyricsManager.getLyrics(type: .departaments)
        return lbl
    }()
    
    lazy var headerView: LikedSordsView = {
        let view = LikedSordsView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var collectionView: UIView = {
        let cv = UIView()
        cv.backgroundColor = .systemTeal
        return cv
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
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
        [headerView, collectionView].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        headerView.snp.makeConstraints { make in
            make.height.equalTo(120)
        }
    }
    
}
