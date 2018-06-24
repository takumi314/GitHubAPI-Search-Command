//
//  GitHubAPI.swift
//  GitHubSearchRepository
//
//  Created by NishiokaKohei on 2018/06/24.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import Foundation

final class GitHubAPI {

    struct SearchRepositories: GitHubRequest {
        let keyword: String

        // GitHubRequestが要求する連想型: Repositoty
        typealias Response = SearchResponse<Repository>

        var method: HTTPMethod {
            return .get
        }

        var path: String {
            return "/search/repositories"
        }


        var parameter: Any? {
            return ["q": keyword]
        }
    }

}

extension GitHubAPI {

    struct SearchUsers: GitHubRequest {
        let keyword: String

        // 連想型: User
        typealias Response = SearchResponse<User>

        var method: HTTPMethod {
            return .get
        }

        var path: String {
            return "/search/users"
        }

        var parameter: Any? {
            return ["q": keyword]
        }
    }

}
