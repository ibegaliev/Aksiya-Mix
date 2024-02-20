//
//  UserCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 20/02/24.
//

import UIKit

class UserCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        contentView.backgroundColor = .systemTeal
    }
    
    private func setConstraints() {
        
    }
    
}
