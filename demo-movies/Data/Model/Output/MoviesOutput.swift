//
//  MoviesOutput.swift
//  demo-movies
//
//  Created by 남오승 on 2023/11/13.
//

import Foundation

struct MoviesOutput: Decodable {
    let movie_count: Int
    let limit: Int
    let page_number: Int
    let movies: [MovieOutput]
}
