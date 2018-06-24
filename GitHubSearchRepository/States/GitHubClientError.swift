//
//  GitHubClientError.swift
//  GitHubSearchRepository
//
//  Created by NishiokaKohei on 2018/06/24.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import Foundation

enum GitHubClientError: Error {
    case connectingError(Error)     // 通信失敗
    case responseParseError(Error)  // レスポンスの解釈に失敗
    case apiError(GitHubAPIError)   // APIからエラーレスポンスを受け取った
}
