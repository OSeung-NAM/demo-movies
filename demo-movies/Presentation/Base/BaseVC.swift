//
//  BaseVC.swift
//  demo-movies
//
//  Created by 남오승 on 2023/11/13.
//

import UIKit

class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupViews()
        setupEvent()
        setupConfigures()
        setupInit()
    }
    func setupSubviews() {}
    func setupViews() { view.backgroundColor = .white }
    func setupEvent() {}
    func setupConfigures() {}
    func setupInit() {}
}
