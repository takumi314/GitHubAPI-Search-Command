//
//  GitHubAPIError.swift
//  GitHubSearchRepository
//
//  Created by NishiokaKohei on 2018/06/24.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import Foundation

struct GitHubAPIError: Codable, Error {
    let message: String
    let field: FieldError

    struct FieldError: Codable {
        let resource: String
        let field: String
        let code: String
    }
}
