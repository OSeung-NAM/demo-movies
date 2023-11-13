//
//  MoviesResponseMapper.swift
//  demo-movies
//
//  Created by 남오승 on 2023/11/13.
//

import Foundation

class MoviesResponseMapper {
    private let movies: MoviesOutput
    
    init(movies: MoviesOutput) {
        self.movies = movies
    }
    
    func toDomain() -> (MoviesPageEntity, [MovieEntity]) {
        return (mappingMoviesPage(), mappingMovies())
    }
    
    private func mappingMoviesPage() -> MoviesPageEntity {
        return MoviesPageEntity(movie_count: movies.movie_count, limit: movies.limit, page_number: movies.page_number)
    }
    
    private func mappingMovies() -> [MovieEntity] {
        return movies.movies.map(mappingMovie(movie:))
    }
    
    private func mappingMovie(movie: MovieOutput) -> MovieEntity {
        return MovieEntity(id: movie.id, url: movie.url, title: movie.title, movieImgUrl: movie.large_cover_image)
    }
}
