//
//  ProfileEditCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 03/04/24.
//

import UIKit

class ProfileEditCell: UITableViewCell {
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 14, weight: .medium)
        return lbl
    }()
    
    lazy var itemView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setConstraints()
    }
    
    private func setUI() {
        
    }
    
    private func setConstraints() {
        
    }
    
}
