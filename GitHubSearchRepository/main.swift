//
//  main.swift
//  GitHubSearchRepository
//
//  Created by NishiokaKohei on 2018/06/24.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import Foundation

print("Enter your query here> ", separator: "+", terminator: "")

// 入力された検索クエリの取得
guard let keyword = readLine(strippingNewline: true) else {
    exit(1)
}

// APIクライアントの生成
let client = GitHubClient()
let github = GitHubAPI()

// リクエストの実行
let request = GitHubAPI.SearchRepositories(keyword: keyword)

client.send(request: request) { (result) in
    switch result {
    case let .success(response):
        for item in response.items {
            // リポジトリの所有者と名前を出力
            print(item.owner.login + "/" + item.name)
        }
        exit(0)
    case let .failure(error):
        // エラー詳細を出力
        print(error)
        exit(1)
    }
}


// タイムアウト
let timeoutInterval: TimeInterval = 60

// タイムアウトまでメインスレットを停止
Thread.sleep(forTimeInterval: timeoutInterval)

exit(1)






