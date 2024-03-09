//
//  BottomTypeCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/27/24.
//

import UIKit

class BottomTypeCell: UICollectionViewCell {
    
    lazy var backView: BottomTypeView = {
        let view = BottomTypeView()
        
        return view
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
        contentView.addSubview(backView)
    }
    
    private func setConstraints() {
        backView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
}

class BottomTypeTableCell: UITableViewCell {
    
    lazy var backView: BottomTypeView = {
        let view = BottomTypeView()
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        contentView.addSubview(backView)
    }
    
    private func setConstraints() {
        backView.snp.makeConstraints { make in
            make.edges.equalTo(self)
            make.height.equalTo(60)
        }
    }
    
}

class BottomTypeView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView: UICollectionView = { [self] in
        let cv = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        cv.delegate = self
        cv.dataSource = self
        cv.contentInset = .init(top: 8, left: 16, bottom: 8, right: 16)
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        cv.register(BottomItemsCell.self, forCellWithReuseIdentifier: "BottomItemsCell")
        return cv
    }()
    
    lazy var collectionViewLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
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
        layer.cornerRadius = 8
        clipsToBounds = true
        backgroundColor = .white
        addSubview(collectionView)
    }
    
    private func setConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BottomItemsCell", for: indexPath) as! BottomItemsCell
        if indexPath.row == 0 {
            cell.contentView.backgroundColor = .backColor
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 90, height: collectionView.frame.height - 12)
    }
    
}

class BottomItemsCell: UICollectionViewCell {
    
    var lebal: UILabel = {
        let lbl = UILabel()
        lbl.text = "Ommabop"
        lbl.textAlignment = .center
        lbl.font = .appFont(ofSize: 14, weight: .semibold)
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI () {
        contentView.addSubview(lebal)
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        contentView.backgroundColor = .white
    }
    
    private func setConstraints() {
        lebal.snp.makeConstraints { make in
            make.top.bottom.equalTo(self).inset(2)
            make.left.right.equalTo(self).inset(6)
        }
    }
    
}
