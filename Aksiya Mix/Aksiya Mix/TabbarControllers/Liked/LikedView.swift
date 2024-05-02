//
//  LikedView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 13/02/24.
//

import UIKit

class LikedView: UIView {
    
    lazy var navigationView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 18, weight: .bold)
        lbl.text = LyricsManager.getLyrics(type: .likedTitle)
        return lbl
    }()
    
    lazy var leftButton: UIButton = {
        let btn = UIButton()
        btn.setImage(.layoutGrid, for: .normal)
        return btn
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
        backgroundColor = .backColor
        
        addSubview(navigationView)
        addSubview(titleLabel)
        addSubview(leftButton)
    }
    
    private func setConstraints() {
        navigationView.snp.makeConstraints { make in
            make.top.left.right.equalTo(self)
            make.height.equalTo(100)
        }
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(navigationView).inset(20)
            make.left.right.equalTo(navigationView).inset(16)
        }
        leftButton.snp.makeConstraints { make in
            make.bottom.equalTo(navigationView).inset(20)
            make.right.equalTo(navigationView).inset(16)
            make.width.height.equalTo(24)
        }
    }
    
}
