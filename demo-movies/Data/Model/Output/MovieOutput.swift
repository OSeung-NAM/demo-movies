//
//  MovieOutput.swift
//  demo-movies
//
//  Created by 남오승 on 2023/11/13.
//

import Foundation

struct MovieOutput: Decodable {
    let id: Int
    let title: String
    let url: String
    let large_cover_image: String
}
