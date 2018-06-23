//
//  SearchResponse.swift
//  GitHubSearchRepository
//
//  Created by NishiokaKohei on 2018/06/24.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import Foundation

///
/// Item: 検索結果の要素型を表す型引数
///
struct SearchResponse<Item: Codable>: Codable {
    let totalCount: Int
    let items: [Item]
}
