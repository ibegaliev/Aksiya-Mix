//
//  StoreCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/2/24.
//

import UIKit
import GoogleMaps

class StoreCell: UITableViewCell {
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4
        return stack
    }()
    
    lazy var storeView: StoreHeaderView = {
        let view = StoreHeaderView()
        
        return view
    }()
    
    lazy var sectionsView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemTeal
        return view
    }()
    
    lazy var mapView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setMap()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {

        selectionStyle = .none
        backgroundColor = .backColor
        
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        contentView.backgroundColor = .white
        contentView.addSubview(mainStack)
        
        [storeView, sectionsView, mapView].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(12)
            make.left.right.equalTo(contentView).inset(16)
        }
        mapView.snp.makeConstraints { make in
            make.height.equalTo(222.toScreen)
        }
        sectionsView.snp.makeConstraints { make in
            make.height.equalTo(48.toScreen)
        }
    }
    
    private func setMap() {
        DispatchQueue.global(qos: .utility).async { [self] in
            let options = GMSMapViewOptions()
            options.camera = GMSCameraPosition.camera(
                withLatitude: 41.311081,
                longitude: 69.240562,
                zoom: 10.0
            )
            DispatchQueue.main.async { [self] in
                options.frame = bounds
                let map = GMSMapView(options: options)
                map.isExclusiveTouch = false
                mapView.addSubview(map)
                map.snp.makeConstraints { make in
                    make.edges.equalTo(mapView)
                }
            }
        }
    }
    
}

class StoreHeaderView: UIView {
    
    lazy var mainImage: UIImageView = {
        let img = UIImageView()
        img.image = .broooIcon
        img.layer.cornerRadius = 24
        return img
    }()
    
    lazy var mainButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Подписаться", for: .normal)
        btn.titleLabel?.font = .appFont(ofSize: 12, weight: .medium)
        btn.backgroundColor = .selectBlue
        btn.layer.cornerRadius = 8
        return btn
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "MacBro"
        lbl.font = .appFont(ofSize: 16, weight: .bold)
        return lbl
    }()
    
    lazy var fallowerLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "17.5 тыс. подписчиков"
        lbl.font = .systemFont(ofSize: 12)
        lbl.textColor = .spacetext
        return lbl
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .fill
        stack.alignment = .center
        return stack
    }()
    
    lazy var titlesStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
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
        addSubview(mainStack)
        
        [mainImage, titlesStack, mainButton].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        
        [titleLabel, fallowerLabel].forEach { item in
            titlesStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        mainImage.snp.makeConstraints { make in
            make.width.height.equalTo(48)
        }
        mainButton.snp.makeConstraints { make in
            make.width.equalTo(
                (mainButton.titleLabel?.text?.widthOfString(usingFont:
                        .appFont(
                            ofSize: 12,
                            weight: .semibold
                        )
                ) ?? 50.toScreen) + 24
            )
            make.height.equalTo(36.toScreen)
        }
    }
    
}
