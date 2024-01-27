//
//  TypesCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/27/24.
//

import UIKit

class TypesCell: UICollectionViewCell {
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        
        return lbl
    }()
    
    lazy var rightButton: UIButton = {
        let btn = UIButton()
        
        return btn
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let cv = UICollectionView()
        
        return cv
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
        contentView.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
 
    private func setUI() {
        contentView.addSubview(mainStack)
    }
    
    private func setConstraints() {
        
    }
    
}
