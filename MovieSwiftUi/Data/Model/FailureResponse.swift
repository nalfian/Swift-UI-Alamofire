//
//  FailureResponse.swift
//  MovieSwiftUi
//
//  Created by Unknown on 05/02/20.
//  Copyright © 2020 AsiaQuest Indonesia. All rights reserved.
//

import Foundation

struct FailureResponse: Codable {
    let statusCode: Int
    let statusMessage: String
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case statusMessage = "status_message"
    }
}

extension FailureResponse: LocalizedError {
    var errorDescription: String? {
        return statusMessage
    }
}
