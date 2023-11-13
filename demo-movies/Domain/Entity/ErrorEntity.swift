//
//  ErrorEntity.swift
//  demo-movies
//
//  Created by 남오승 on 2023/11/13.
//

import Foundation

class ErrorEntity {
    
    private let message: String
    
    init(message: String?) {
        self.message = message ?? "알 수 없는 오류"
    }
    
    func getErrorMessage() -> String {
        return message
    }
}
