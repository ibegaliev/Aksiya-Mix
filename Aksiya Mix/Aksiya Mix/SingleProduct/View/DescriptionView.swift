//
//  DescriptionView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/2/24.
//

import UIKit

class DescriptionView: UITableViewCell {
    
    lazy var stack: UIStackView = {
        let st = UIStackView()
        st.axis = .vertical
        st.spacing = 9
        st.alignment = .trailing
        st.distribution = .fill
        return st
    }()
    
    lazy var segmentControl: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["Описание", "Характеристики"])
        segment.selectedSegmentIndex = 0
        return segment
    }()
    
    lazy var label: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 12)
        lbl.text = "Apple iPhone 15 5G оснащен OLED-дисплеем Super Retina XDR, который обеспечивает четкое изображение и яркие цвета. Благодаря разрешению 1179 x 2556 пикселей смартфон идеально подходит для потоковой передачи видео, просмотра просмотра просмотра  просмотра веб-страниц и игр. ..."
        return lbl
    }()
    
    lazy var showAllView: UIButton = {
        let btn = UIButton()
        btn.setTitle("Более", for: .normal)
        btn.setTitleColor(.link, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 12)
        return btn
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        
        contentView.addSubview(stack)
        
        [segmentControl, label, showAllView].forEach { item in
            stack.addArrangedSubview(item)
        }
        
        contentView.backgroundColor = .white
        
    }
    
    private func setConstraints() {
        stack.snp.makeConstraints { make in
            make.edges.equalTo(contentView).inset(10)
        }
        segmentControl.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(0.screenWight - 32)
            make.left.right.equalTo(contentView).inset(16)
        }
        label.snp.makeConstraints { make in
            make.left.right.equalTo(contentView).inset(16)
        }
    }
    
}
