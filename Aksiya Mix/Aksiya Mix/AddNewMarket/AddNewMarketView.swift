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
            name: "Do'koningiz bormi?",
            description: "Veb-sayt xarajatlari va harakatlaringizdan xalos boling, biz sizga osongina onlayn bolishingizga yordam beramiz",
            jsonFile: "CreateNewMarket"
        ),
        MarketBannerDM(
            name: "Do'kon sahifasini yarating",
            description: "Do'koningiz uchun sahifa yarating va chegirmali mahsulotlaringizni bir necha bosqichda mutlaqo bepul namoyish eting",
            jsonFile: "CreateNewMarket"
        ),
        MarketBannerDM(
            name: "Ko'proq mijozlarga erishing",
            description: "Do'koningiz o'sishi va mashhurligini oshirishi uchun mijozlarga sizni osonroq topishiga yordam beramiz",
            jsonFile: "CreateNewMarket"
        ),
        MarketBannerDM(
            name: "Agar veb-saytingiz bo'lsa ham!",
            description: "Chegirmali mahsulot yoki xizmatlarizni topgan mijozlar sizning do'koningizga tashrif buyurib chegrimali mahsulot va xizmatlarizdan foydalanish ko'payadi.",
            jsonFile: "CreateNewMarket"
        )
    ]
    
    lazy var navigationView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        return view
    }()

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
        collection.bouncesZoom = false
        collection.bounces = false
        collection.alwaysBounceVertical = false
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
        addSubview(navigationView)
        addSubview(nextButton)
    }
    
    private func setConstraints() {
        navigationView.snp.makeConstraints { make in
            make.top.left.right.equalTo(self)
            make.height.equalTo(100)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(navigationView.snp_bottomMargin).inset(-8)
            make.left.right.bottom.equalTo(self)
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
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == 3 {
            toUPButton()
        } else {
            toDownButton()
        }
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if scrollView.contentOffset.y > collectionView.frame.height*4-100 {
//            toUPButton()
//        } else {
//            toDownButton()
//        }
//    }
    
//    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        if scrollView.contentOffset.y > 2000 {
//            collectionView.scrollToItem(
//                at: IndexPath(row: 3, section: 0),
//                at: .centeredHorizontally,
//                animated: true
//            )
//        }
//    }
    
}
