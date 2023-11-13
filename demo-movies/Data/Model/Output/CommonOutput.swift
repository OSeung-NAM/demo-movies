//
//  CommonOutput.swift
//  demo-movies
//
//  Created by 남오승 on 2023/11/13.
//

import Foundation

struct CommonOutput<T: Decodable>: Decodable {
    let status: String
    let status_message: String?
    let data: T?
}
