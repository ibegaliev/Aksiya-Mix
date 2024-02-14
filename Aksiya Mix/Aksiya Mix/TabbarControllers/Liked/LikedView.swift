//
//  LikedView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 13/02/24.
//

import UIKit

protocol LikedViewDelegate {
    func selectedSaved()
    func selectedSeen()
    func selectedended()
}

class LikedView: UIView, LikedSordsViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var delegate: LikedViewDelegate?
    
    var selectedItem: Int? {
        get {
            return nil
        }
        set {
            headerView.selectedItem = newValue
        }
    }
    
    var cellWidth: CGFloat {
        get {
            UIWindow().frame.width
        }
    }
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 18, weight: .bold)
        lbl.text = LyricsManager.getLyrics(type: .departaments)
        return lbl
    }()
    
    lazy var headerView: LikedSordsView = {
        let view = LikedSordsView()
        view.delegate = self
        view.backgroundColor = .white
        return view
    }()
    
    lazy var collectionView: UICollectionView = { [self] in
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.register(LikedCollectionCell.self, forCellWithReuseIdentifier: "LikedCollectionCell")
        cv.showsHorizontalScrollIndicator = false
        cv.bounces = false
        cv.isPagingEnabled = true
        cv.contentInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        return cv
    }()
    
    lazy var layout: UICollectionViewFlowLayout = {
        let lay = UICollectionViewFlowLayout()
        lay.scrollDirection = .horizontal
        return lay
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
    
    func selectedSaved() {
        delegate?.selectedSaved()
        collectionView.selectItem(
            at: IndexPath(row: 0, section: 0),
            animated: true,
            scrollPosition: .centeredHorizontally
        )
    }
    
    func selectedSeen() {
        delegate?.selectedSeen()
        collectionView.selectItem(
            at: IndexPath(row: 1, section: 0),
            animated: true,
            scrollPosition: .centeredHorizontally
        )
    }
    
    func selectedended() {
        delegate?.selectedended()
        collectionView.selectItem(
            at: IndexPath(row: 2, section: 0),
            animated: true,
            scrollPosition: .centeredHorizontally
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LikedCollectionCell", for: indexPath) as! LikedCollectionCell
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x == 0 {
            headerView.selectedItem = 0
        } else if scrollView.contentOffset.x == 0.screenWight {
            headerView.selectedItem = 1
        } else if scrollView.contentOffset.x/2 == 0.screenWight {
            headerView.selectedItem = 2
        }
    }
    
}

class LikedCollectionCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    lazy var layout: UICollectionViewFlowLayout = {
        let lay = UICollectionViewFlowLayout()
        lay.scrollDirection = .vertical
        return lay
    }()
    
    lazy var collectionView: UICollectionView = { [self] in
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .backColor
        cv.delegate = self
        cv.dataSource = self
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        cv.contentInset = UIEdgeInsets(top: 12, left: 12, bottom: 50.toScreen, right: 12)
        cv.register(SingleProductCell.self, forCellWithReuseIdentifier: "SingleProductCell")
        return cv
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
        addSubview(collectionView)
    }
    
    private func setConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        25
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SingleProductCell", for: indexPath) as! SingleProductCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (0.screenWight-36)/2, height: 288.toScreen)
    }
    
}
