//
//  MoviesVC.swift
//  demo-movies
//
//  Created by 남오승 on 2023/11/13.
//

import UIKit
import SnapKit

class MoviesVC: BaseVC {
    
    private let layout: MoviesView = MoviesView()
    //Swinject 통해 DI처리 가능
    private let viewModel: IFMoviesViewModel = MoviesViewModel(getMoviesUsecase: GetMoviesUsecase(repository: MovieRepositoryImpl()))

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
        viewModel.getMovies(params: MoviesInput(limit: 20, page: 1), completion: { [weak self] movies, error in
            if let movies = movies, error == nil {
                self?.layout.bind(movies: movies)
            }else if let error = error, movies == nil {
                //에러 핸들링 로직처리
            }
        })
    }
    
    override func setupEvent() {
        layout.configure(tapMovie: { [weak self] movie in
            self?.moveToMovieDetail(movie: movie)
        })
    }
    
    private func moveToMovieDetail(movie: MovieEntity) {
        let vc: MovieDetailVC = MovieDetailVC(movie: movie)
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}

