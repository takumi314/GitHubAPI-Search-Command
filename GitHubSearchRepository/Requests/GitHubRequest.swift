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

    func buildURLRequest() -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var components = URLComponents(
            url: url, resolvingAgainstBaseURL: true)

        switch method {
        case .get:
            let dictionary = parameter as? [String: Any]
            let queryItems = dictionary?.map { (key, value) -> URLQueryItem in
                return URLQueryItem(
                    name: key,
                    value: String(describing: value))
            }
            components?.queryItems = queryItems
        default:
            fatalError("Unsupported method \(method)")
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.url = components?.url
        urlRequest.httpMethod = method.rawValue


        return urlRequest
    }

    func response(from data: Data,
                  urlResponse: URLResponse) throws -> Response {
        // 取得したデータをJSONに変換

        if case (200..<300)? = (urlResponse as? HTTPURLResponse)?.statusCode {
            // JSONからモデルをインスタンス化
            return try JSONDecoder().decode(Response.self, from: data)
        } else {
            // JSONからAPIエラーをインスタンス化
            throw try JSONDecoder().decode(GitHubAPIError.self, from: data)
        }

    }



}

