//
//  GitHubRequest.swift
//  GitHubSearchRepository
//
//  Created by NishiokaKohei on 2018/06/24.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import Foundation

protocol GitHubRequest {
    associatedtype Response: Decodable

    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameter: Any? { get }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case head = "HEAD"
    case delete = "DELETE"
    case patch = "PATCH"
    case trace = "TRACE"
    case options = "OPTIONS"
    case connect = "CONNECT"
}

extension GitHubRequest {
    var baseURL: URL {
        return URL(string: "htps://api.github.com")!
    }
}

