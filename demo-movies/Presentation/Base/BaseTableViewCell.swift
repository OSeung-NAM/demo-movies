//
//  BaseTableViewCell.swift
//  demo-movies
//
//  Created by 남오승 on 2023/11/13.
//

import UIKit
//공통사용 하기위한 기본 Service
class BaseTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        setupViews()
        setupEvents()
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func setupSubviews() {}
    func setupViews() {
        selectionStyle = .none
        backgroundColor = .white
    }
    func setupEvents() {}
}
    
