//
//  MoviesView.swift
//  demo-movies
//
//  Created by 남오승 on 2023/11/13.
//

import UIKit

class MoviesView: BaseView {

    private lazy var moviesTV: UITableView = {
        let tableView: UITableView = UITableView()
        tableView.separatorStyle = .none
        tableView.keyboardDismissMode = .onDrag
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.backgroundColor = .clear
        tableView.register(MoviesTableViewCell.self, forCellReuseIdentifier: "MoviesTableViewCell")
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.delegate = self
        tableView.dataSource = self
        self.addSubview(tableView)
        return tableView
    }()
    
    private var movies: [MovieEntity] = []
    
    override func setupViews() {
        moviesTV.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalToSuperview()
        }
    }
    
    func bind(movies: [MovieEntity]) {
        self.movies = movies
        DispatchQueue.main.async { [weak self] in
            self?.moviesTV.reloadData()
        }
    }
    
    private var tapMovie: ((MovieEntity) -> Void)?
    func configure(tapMovie: ((MovieEntity) -> Void)?) {
        self.tapMovie = tapMovie
    }
}

extension MoviesView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tapMovie?(movies[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: MoviesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MoviesTableViewCell") as? MoviesTableViewCell else { return UITableViewCell.init() }
        cell.bind(data: movies[indexPath.row])
        return cell
    }
}


