//
//  MovieDetailVC.swift
//  demo-movies
//
//  Created by 남오승 on 2023/11/13.
//

import UIKit

class MovieDetailVC: BaseVC {
    
    private let layout: MovieDetailView = MovieDetailView()
    private let movie: MovieEntity
    
    init(movie: MovieEntity) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func setupSubviews() {
        self.view.addSubview(layout)
    }
    
    override func setupViews() {
        super.setupViews()
        layout.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    override func setupInit() {
        layout.bind(data: movie)
    }
    
    override func setupEvent() {
        layout.configure(tapClose: { [weak self] in
            self?.dismiss(animated: true)
        })
    }
}
