//
//  MapView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/3/24.
//

import UIKit
import MapKit

class MapView: UIView {
    
    lazy var mapView: MKMapView = {
        let map = MKMapView()
        
        return map
    }()
    
    lazy var title: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 12)
        lbl.text = "(Ташкент)"
        return lbl
    }()
    
    lazy var filtrButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("фильтр", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 12)
        btn.setTitleColor(.selectBlue, for: .normal)
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
        lbl.text = "ID: 4287434 3 дня назад"
        lbl.font = .systemFont(ofSize: 10)
        lbl.textColor = .spacetext
        return lbl
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
    }
    
}
