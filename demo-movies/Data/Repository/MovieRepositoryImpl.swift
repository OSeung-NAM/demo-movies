//
//  MovieRepositoryImpl.swift
//  demo-movies
//
//  Created by 남오승 on 2023/11/13.
//

import Foundation
import Alamofire

class MovieRepositoryImpl: IFMovieRepository {
    func getMovies(params: MoviesInput, completion: @escaping ((MoviesPageEntity, [MovieEntity])?, ErrorEntity?) -> Void) {
        AF.request("https://yts.mx/api/v2/list_movies.json", method: .get, parameters: params, encoder: URLEncodedFormParameterEncoder.default)
                .responseDecodable(of: CommonOutput<MoviesOutput>.self, completionHandler: { response in
                    switch response.result {
                    case .success(let response):
                        if let data: MoviesOutput = response.data {
                            completion(MoviesResponseMapper(movies: data).toDomain(), nil)
                        }else{
                            completion(nil, ErrorEntity(message: response.status_message))
                        }
                    case .failure(let error):
                        completion(nil, ErrorEntity(message: error.errorDescription))
                    }
                })
    }
}
