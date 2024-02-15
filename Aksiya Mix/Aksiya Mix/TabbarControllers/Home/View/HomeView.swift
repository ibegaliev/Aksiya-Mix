//
//  HomeView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/26/24.
//

import UIKit

protocol HomeViewDelegate {
    func tapped()
}

enum HomeViewType {
    case home, search, results
}

class HomeView: UIView {
    
    var delegate: HomeViewDelegate?
    
    var viewType: HomeViewType? {
        get {
            return nil
        }
        set {
            guard let newValue else { return }
            switch newValue {
                case .home:
                    UIView.animate(withDuration: 0.25) { [self] in
                        collectionView.isHidden = false
                        offerView.isHidden = true
                        searchItemsView.isHidden = true
                    }
                case .search:
                    UIView.animate(withDuration: 0.25) { [self] in
                        collectionView.isHidden = true
                        offerView.isHidden = false
                        searchItemsView.isHidden = true
                    }
                case .results:
                    UIView.animate(withDuration: 0.25) { [self] in
                        collectionView.isHidden = true
                        offerView.isHidden = true
                        searchItemsView.isHidden = false
                    }
            }
        }
    }
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()
    
    lazy var layout: UICollectionViewFlowLayout = {
        let lay = UICollectionViewFlowLayout()
        lay.scrollDirection = .vertical
        lay.minimumLineSpacing = 10
        return lay
    }()
    
    lazy var collectionView: UICollectionView = { [self] in
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .backColor
        cv.delegate = self
        cv.dataSource = self
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        cv.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50.toScreen, right: 0)
        cv.register(BannerCell.self, forCellWithReuseIdentifier: "BannerCell")
        cv.register(TypesCell.self, forCellWithReuseIdentifier: "TypesCell")
        cv.register(ItemsCell.self, forCellWithReuseIdentifier: "ItemsCell")
        cv.register(BottomTypeCell.self, forCellWithReuseIdentifier: "BottomTypeCell")
        cv.register(SingleProductCell.self, forCellWithReuseIdentifier: "SingleProductCell")
        return cv
    }()
    
    lazy var offerView: OfferView = {
        let view = OfferView()
        view.isHidden = true
        return view
    }()
    
    lazy var searchItemsView: UIView = {
        let view = UIView()
        view.isHidden = true
        view.backgroundColor = .cyan
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        addSubview(mainStack)
        [searchItemsView, offerView, collectionView].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
}

extension HomeView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 5
        } else {
            return 20
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! BannerCell
                
                return cell
            } else if indexPath.row == 1 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TypesCell", for: indexPath) as! TypesCell
                
                return cell
            } else if indexPath.row == 2 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemsCell", for: indexPath) as! ItemsCell
                
                return cell
            } else if indexPath.row == 3 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemsCell", for: indexPath) as! ItemsCell
                
                return cell
            } else if indexPath.row == 4 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BottomTypeCell", for: indexPath) as! BottomTypeCell
                
                return cell
            } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SingleProductCell", for: indexPath) as! SingleProductCell
                
                return cell
            }
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SingleProductCell", for: indexPath) as! SingleProductCell
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                return CGSize(width: 0.screenWight, height: 0.screenWight/2.5)
            } else if indexPath.row == 1 {
                return CGSize(width: 0.screenWight, height: 168.toScreen)
            } else if indexPath.row == 2 {
                return CGSize(width: 0.screenWight, height: 331.toScreen)
            } else if indexPath.row == 3 {
                return CGSize(width: 0.screenWight, height: 331.toScreen)
            } else if indexPath.row == 4 {
                return CGSize(width: 0.screenWight, height: 48.toScreen)
            } else {
                return CGSize(width: (0.screenWight-36)/2, height: 288.toScreen)
            }
        } else {
            return CGSize(width: (0.screenWight-36)/2, height: 288.toScreen)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if section == 0 {
            CGFloat(8)
        } else {
            CGFloat(12)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            UIEdgeInsets(top: 0, left: 0, bottom: 12, right: 0)
        } else {
            UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            delegate?.tapped()
        }
    }
    
}
