//
//  IFMovieRepository.swift
//  demo-movies
//
//  Created by 남오승 on 2023/11/13.
//

import Foundation

protocol IFMovieRepository {
    func getMovies(params: MoviesInput, completion: @escaping ((MoviesPageEntity, [MovieEntity])?, ErrorEntity?) -> Void)
}
