//
//  MapView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/3/24.
//

import UIKit
import GoogleMaps

class MapView: UIView {
    
    lazy var mapView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()

    lazy var title: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 14, weight: .semibold)
        lbl.text = "Joylashuv"
        return lbl
    }()
    
    lazy var filtrButton: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(.selectBlue, for: .normal)
        btn.setTitle("Barcha filiallar", for: .normal)
        btn.titleLabel?.font = .appFont(ofSize: 12, weight: .medium)
        return btn
    }()
    
    lazy var topStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 12
        stack.distribution = .equalSpacing
        return stack
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    lazy var idLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "ID: 4287434"
        lbl.font = .appFont(ofSize: 10, weight: .semibold)
        lbl.textColor = .spacetext
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        
        addSubview(mainStack)
        
        [topStack, mapView, idLabel].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        
        [title, filtrButton].forEach { item in
            topStack.addArrangedSubview(item)
        }
        
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        mapView.snp.makeConstraints { make in
            make.height.equalTo(172)
        }
        filtrButton.snp.makeConstraints { make in
            make.height.equalTo(32)
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
