//
//  SearchFilterView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 07/04/24.
//

import UIKit

class SearchFilterView: UIView {
    
    lazy var layout: UICollectionViewFlowLayout = {
        let l = UICollectionViewFlowLayout()
        
        return l
    }()
    
    lazy var collectionView: UICollectionView = { [self] in
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .backColor
        collection.showsVerticalScrollIndicator = false
        collection.contentInset = .init(top: 0, left: 16, bottom: 50, right: 16)
        collection.register(SelectableCityCell.self, forCellWithReuseIdentifier: "SelectableCityCell")
        collection.register(SelectableBrandCell.self, forCellWithReuseIdentifier: "SelectableBrandCell")
        collection.register(SelectableFilterCell.self, forCellWithReuseIdentifier: "SelectableFilterCell")
        collection.register(SelectableValuteCell.self, forCellWithReuseIdentifier: "SelectableValuteCell")
        collection.register(SelectablePrinceCell.self, forCellWithReuseIdentifier: "SelectablePrinceCell")
        collection.register(SelectableCategoryCell.self, forCellWithReuseIdentifier: "SelectableCategoryCell")
        return collection
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
    
}

extension SearchFilterView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 6
        } else {
            return 25
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectableFilterCell", for: indexPath) as! SelectableFilterCell
                
                return cell
            } else if indexPath.row == 1 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectableCategoryCell", for: indexPath) as! SelectableCategoryCell
                
                return cell
            } else if indexPath.row == 2 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectableCityCell", for: indexPath) as! SelectableCityCell
                
                return cell
                
            } else if indexPath.row == 3 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectableValuteCell", for: indexPath) as! SelectableValuteCell
                
                return cell
                
            } else if indexPath.row == 4 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectablePrinceCell", for: indexPath) as! SelectablePrinceCell
                
                return cell
                
            } else if indexPath.row == 5 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectableFilterCell", for: indexPath) as! SelectableFilterCell
                cell.buttonsStack.isHidden = true
                cell.titleLabel.text = "Brendlar"
                return cell
            }
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectableBrandCell", for: indexPath) as! SelectableBrandCell
        cell.titleLabel.text = "\(indexPath.row)-macBro"
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                return CGSize(width: 0.screenWight-32, height: 70)
            } else if indexPath.row == 1 {
                return CGSize(width: 0.screenWight-32, height: 110)
            } else if indexPath.row == 2 {
                return CGSize(width: 0.screenWight-32, height: 90)
            } else if indexPath.row == 3 {
                return CGSize(width: 0.screenWight-32, height: 80)
            } else if indexPath.row == 4 {
                return CGSize(width: 0.screenWight-32, height: 100)
            } else if indexPath.row == 5 {
                return CGSize(width: 0.screenWight-32, height: 30)
            }
        }
        return CGSize(
            width: "\(indexPath.row)-macBro".widthOfString(
                usingFont: .appFont(ofSize: 14, weight: .medium)
            ) + 24,
            height: 40
        )
    }
    
}
