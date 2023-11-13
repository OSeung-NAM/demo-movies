//
//  BaseView.swift
//  demo-movies
//
//  Created by 남오승 on 2023/11/13.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupSubviews()
        self.setupViews()
        self.setupInit()
        self.setupEvents()
        self.setupConfigures()
    }
    
    //Xib사용할때 필요
    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }
    func setupSubviews() {}
    func setupViews() { self.backgroundColor = .white }
    func setupInit() {}
    func setupEvents() {}
    func setupConfigures(){}
}
