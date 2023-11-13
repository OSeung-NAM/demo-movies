//
//  GetMoviesUsecase.swift
//  demo-movies
//
//  Created by 남오승 on 2023/11/13.
//

import Foundation

protocol IFGetMoviesUsecase {
    func execute(params: MoviesInput, completion: @escaping ((MoviesPageEntity, [MovieEntity])?, ErrorEntity?) -> Void)
}

class GetMoviesUsecase: IFGetMoviesUsecase {
    private let repository: IFMovieRepository
    
    init(repository: IFMovieRepository) {
        self.repository = repository
    }
    
    func execute(params: MoviesInput, completion: @escaping ((MoviesPageEntity, [MovieEntity])?, ErrorEntity?) -> Void) {
        repository.getMovies(params: params, completion: { completion($0, $1)} )
    }
}
