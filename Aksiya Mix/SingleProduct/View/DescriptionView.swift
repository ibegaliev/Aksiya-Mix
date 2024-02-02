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
        st.alignment = .leading
        st.distribution = .fill
        return st
    }()
    
    lazy var segmentControl: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["Option 1", "Option 2"])
        
        return segment
    }()
    
    lazy var label: UILabel = {
        let lbl = UILabel()
        
        return lbl
    }()
    
    lazy var showAllView: UIButton = {
        let btn = UIButton()
        
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
            stack.addArrangedSubview(stack)
        }
        
        contentView.backgroundColor = .red
        
    }
    
    private func setConstraints() {
        stack.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        segmentControl.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
    }
    
}
