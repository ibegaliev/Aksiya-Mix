//
//  AddNewMarketView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 11/04/24.
//

import UIKit

struct MarketBannerDM {
    var name: String
    var description: String
    var jsonFile: String
}

class AddNewMarketView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var data = [
        MarketBannerDM(
            name: LyricsManager.getLyrics(type: .haveMarketTitle),
            description: LyricsManager.getLyrics(type: .haveMarketDescription),
            jsonFile: "CreateNewMarket"
        ),
        MarketBannerDM(
            name: LyricsManager.getLyrics(type: .createMarketTitle),
            description: LyricsManager.getLyrics(type: .createMarketDescription),
            jsonFile: "CreateNewMarket"
        ),
        MarketBannerDM(
            name: LyricsManager.getLyrics(type: .moreCustomersTitle),
            description: LyricsManager.getLyrics(type: .moreCustomersDescription),
            jsonFile: "CreateNewMarket"
        ),
        MarketBannerDM(
            name: LyricsManager.getLyrics(type: .websiteTitle),
            description: LyricsManager.getLyrics(type: .websiteDescription),
            jsonFile: "CreateNewMarket"
        )
    ]

    lazy var collectionLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        return layout
    }()
    
    lazy var collectionView: UICollectionView = { [self] in
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collection.delegate = self
        collection.dataSource = self
        collection.contentInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        collection.isPagingEnabled = true
        collection.bounces = false
        collection.showsVerticalScrollIndicator = false
        collection.backgroundColor = .backColor
        collection.register(MarketBannerCell.self, forCellWithReuseIdentifier: "MarketBannerCell")
        return collection
    }()
    
    lazy var nextButton: BlueButton = {
        let btn = BlueButton()
        btn.setTitle("Keyigisi", for: .normal)
        btn.setBorder()
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
        toDownButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        backgroundColor = .backColor
        addSubview(collectionView)
        addSubview(nextButton)
    }
    
    private func setConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        nextButton.snp.makeConstraints { make in
            make.left.right.equalTo(self).inset(16)
            make.bottom.equalTo(self).inset(50)
        }
    }
    
    private func toDownButton() {
        UIView.animate(withDuration: 0) { [self] in
            nextButton.transform = .init(translationX: 0, y: 300)
        }
    }
    
    private func toUPButton() {
        UIView.animate(withDuration: 0.5) { [self] in
            nextButton.transform = .identity
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MarketBannerCell", for: indexPath) as! MarketBannerCell
        cell.data = data[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 1900.toScreen {
            toUPButton()
        } else {
            toDownButton()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
}
