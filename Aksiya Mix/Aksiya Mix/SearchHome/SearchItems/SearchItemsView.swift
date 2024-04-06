//
//  SearchItemsView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 18/03/24.
//

import UIKit

protocol SearchItemsDelegate {
    func backButtonTapped()
    func filterTapped()
}

class SearchItemsView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, TopSelectableDelegate {
    
    var delegate: SearchItemsDelegate?
    
    lazy var topNavigation: SearchTextField = {
        let view = SearchTextField()
        view.isButton = false
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.tf.placeholder = "Chegirmalarni qidiring!"
        return view
    }()
    
    lazy var backButton: UIButton = {
        let btn = UIButton()
        btn.setImage(.chevronLeft, for: .normal)
        btn.imageView?.contentMode = .scaleToFill
        btn.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return btn
    }()
    
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
        cv.contentInset = UIEdgeInsets(top: 4, left: 12, bottom: 50.toScreen, right: 12)
        cv.register(SingleProductCell.self, forCellWithReuseIdentifier: "SingleProductCell")
        cv.register(TopSelectableView.self, forCellWithReuseIdentifier: "TopSelectableView")
        cv.register(ShowResultView.self, forCellWithReuseIdentifier: "ShowResultView")
        return cv
    }()
    
    lazy var navigationStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 4
        stack.axis = .horizontal
        return stack
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 4
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
        backgroundColor = .backColor
        addSubview(mainStack)
        
        [navigationStack, collectionView].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        
        [backButton, topNavigation].forEach { item in
            navigationStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.equalTo(self).inset(48.toScreen)
            make.left.right.bottom.equalTo(self)
        }
        navigationStack.snp.makeConstraints { make in
            make.width.equalTo(0.screenWight - 24)
        }
        collectionView.snp.makeConstraints { make in
            make.width.equalTo(0.screenWight)
        }
        backButton.snp.makeConstraints { make in
            make.width.equalTo(24)
        }
    }
    
    func filterTapped() {
        delegate?.filterTapped()
    }
    
    @objc
    func backButtonTapped() {
        delegate?.backButtonTapped()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        25
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopSelectableView", for: indexPath) as! TopSelectableView
            cell.delegate = self
            return cell
        } else if indexPath.row == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShowResultView", for: indexPath) as! ShowResultView
            
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SingleProductCell", for: indexPath) as! SingleProductCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: 0.screenWight, height: 14)
        } else if indexPath.row == 1 {
            return CGSize(width: 0.screenWight - 32, height: 40)
        }
        return CGSize(width: (0.screenWight-36)/2, height: 250.toScreen)
    }
    
}

