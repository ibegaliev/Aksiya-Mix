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

protocol AddNewMarketViewDelegate {
    func tappedNextButton()
}

import UIKit

class AddNewMarketView: UIView {
    
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
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        
        return view
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
        toDownButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        backgroundColor = .backColor
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        addSubview(nextButton)
        
        for (index, marketData) in data.enumerated() {
            let marketBannerView = MarketBannerCell(frame: .zero)
            marketBannerView.data = marketData
            contentView.addSubview(marketBannerView)
            marketBannerView.frame = CGRect(x: CGFloat(index) * bounds.width, y: 0, width: bounds.width, height: bounds.height)
        }
        
        contentView.frame = CGRect(x: 0, y: 0, width: bounds.width * CGFloat(data.count), height: bounds.height)
    }
    
    private func setConstraints() {
        scrollView.snp.makeConstraints { make in
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
    
    @objc
    private func tappedNextButton() {
        delegate?.tappedNextButton()
    }
}

extension AddNewMarketView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 1900.toScreen {
            toUPButton()
        } else {
            toDownButton()
        }
    }
}
