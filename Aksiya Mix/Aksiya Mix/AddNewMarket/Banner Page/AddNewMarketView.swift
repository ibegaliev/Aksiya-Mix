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
    var isAnimate: Bool = true
}

protocol AddNewMarketViewDelegate {
    func tappedNextButton()
}

class AddNewMarketView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var delegate: AddNewMarketViewDelegate?
    
    var data = [
        MarketBannerDM(
            name: LyricsManager.getLyrics(type: .haveMarketTitle),
            description: LyricsManager.getLyrics(type: .haveMarketDescription),
            jsonFile: "haveMarket"
        ),
        MarketBannerDM(
            name: LyricsManager.getLyrics(type: .createMarketTitle),
            description: LyricsManager.getLyrics(type: .createMarketDescription),
            jsonFile: "createMarket"
        ),
        MarketBannerDM(
            name: LyricsManager.getLyrics(type: .moreCustomersTitle),
            description: LyricsManager.getLyrics(type: .moreCustomersDescription),
            jsonFile: "PersonaAnimation"
        ),
        MarketBannerDM(
            name: LyricsManager.getLyrics(type: .websiteTitle),
            description: LyricsManager.getLyrics(type: .websiteDescription),
            jsonFile: "WebAnimation"
        )
    ]

    lazy var collectionLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    lazy var collectionView: UICollectionView = { [self] in
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collection.delegate = self
        collection.dataSource = self
        collection.contentInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        collection.isPagingEnabled = true
        collection.bounces = false
        collection.showsHorizontalScrollIndicator = false
        collection.backgroundColor = .backColor
        collection.register(MarketBannerCell.self, forCellWithReuseIdentifier: "MarketBannerCell")
        return collection
    }()
    
    lazy var pageControl: UIPageControl = {
        let controll = UIPageControl()
        controll.numberOfPages = data.count
        controll.currentPageIndicatorTintColor = .selectBlue
        controll.pageIndicatorTintColor = .white
        return controll
    }()
    
    lazy var nextButton: BlueButton = {
        let btn = BlueButton()
        btn.setTitle("Keyigisi", for: .normal)
        btn.setBorder()
        btn.addTarget(self, action: #selector(tappedNextButton), for: .touchUpInside)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
        toDownButton(withDuration: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        backgroundColor = .backColor
        addSubview(collectionView)
        addSubview(nextButton)
        addSubview(pageControl)
    }
    
    private func setConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        nextButton.snp.makeConstraints { make in
            make.left.right.equalTo(self).inset(16)
            make.bottom.equalTo(self).inset(50)
        }
        pageControl.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.bottom.equalTo(self).inset(120.toScreen)
        }
    }
    
    private func toDownButton(withDuration: Double = 1) {
        UIView.animate(withDuration: withDuration) { [self] in
            nextButton.transform = .init(translationX: 0.screenWight+100, y: 0)
        }
    }
    
    private func toUPButton() {
        UIView.animate(withDuration: 0.5) { [self] in
            nextButton.transform = .identity
        }
    }
    
    @objc
    private func tappedNextButton() {
        delegate?.tappedNextButton()
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
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == 3 {
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        let currentPage = Int((scrollView.contentOffset.x + width / 2) / width)
        pageControl.currentPage = currentPage
    }
    
}
