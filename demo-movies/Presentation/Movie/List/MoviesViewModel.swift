//
//  MoviesViewModel.swift
//  demo-movies
//
//  Created by 남오승 on 2023/11/13.
//

import Foundation

protocol IFMoviesViewModel {
    func getMovies(params: MoviesInput, completion: @escaping ([MovieEntity]?, ErrorEntity?) -> Void)
}

class MoviesViewModel: IFMoviesViewModel {
    
    private var pageInfo: MoviesPageEntity?
    private let getMoviesUsecase: IFGetMoviesUsecase
    
    init(getMoviesUsecase: IFGetMoviesUsecase) {
        self.getMoviesUsecase = getMoviesUsecase
    }
    
    func getMovies(params: MoviesInput, completion: @escaping ([MovieEntity]?, ErrorEntity?) -> Void) {
        getMoviesUsecase.execute(params: params, completion: { [weak self] (result, error) in
            if let result = result, error == nil {
                self?.pageInfo = result.0
                completion(result.1, nil)
            }else {
                completion(nil, error)
            }
        })
    }
}
