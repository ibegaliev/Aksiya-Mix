//
//  BottomTypeCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/27/24.
//

import UIKit

struct HomeBottomDM {
    var name: String
    var isSelected: Bool
}

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
    
    var bottomCollectionData: [HomeBottomDM] = [
        .init(name: "Hammasi", isSelected: true),
        .init(name: "Siz uchun", isSelected: false),
        .init(name: "Tanlanganlar", isSelected: false),
        .init(name: "Yaqinda ko'rilganlar", isSelected: false)
    ]
    
    lazy var collectionView: UICollectionView = { [self] in
        let cv = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        cv.delegate = self
        cv.dataSource = self
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        cv.contentInset = .init(top: 4, left: 10, bottom: 8, right: 10)
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
        bottomCollectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BottomItemsCell", for: indexPath) as! BottomItemsCell
        cell.data = bottomCollectionData[indexPath.row]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(
            width: 16 + bottomCollectionData[indexPath.row].name.widthOfString(usingFont: .appFont(ofSize: 14, weight: .semibold)),
            height: collectionView.frame.height - 12
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        for dt in bottomCollectionData.enumerated() {
            bottomCollectionData[dt.offset].isSelected = false
        }
        bottomCollectionData[indexPath.row].isSelected = true
        collectionView.reloadData()
    }
    
}

class BottomItemsCell: UICollectionViewCell {
    
    var data: HomeBottomDM? {
        get {
            return nil
        }
        set {
            lebal.text = newValue?.name
            if newValue?.isSelected ?? false {
                contentView.backgroundColor = .backColor
            } else {
                contentView.backgroundColor = .white
            }
        }
    }
    
    var lebal: UILabel = {
        let lbl = UILabel()
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
    }
    
    private func setConstraints() {
        lebal.snp.makeConstraints { make in
            make.top.bottom.equalTo(self).inset(2)
            make.left.right.equalTo(self).inset(6)
        }
    }
    
}
