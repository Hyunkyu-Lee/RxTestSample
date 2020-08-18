//
//  SearchModel.swift
//  RxTestSample
//
//  Created by hklee on 2020/08/14.
//  Copyright © 2020 hklee. All rights reserved.
//

import Foundation

// MARK: - SearchModel
struct SearchModel: Codable {
    let totalCount: Int?
    let incompleteResults: Bool?
    let items: [SearchItem]?
}

// MARK: - Item
struct SearchItem: Codable {
    let id: Int?
    let node_id, name, full_name: String?
    let owner: Owner?
    let itemPrivate: Bool?
    let html_url: String?
    let description: String?
    let fork: Bool?
    let url: String?
    let created_at, updated_at, pushed_at: Date?
    let homepage: String?
    let size, stargazers_count, watchers_count: Int?
    let language: String?
    let forksCount, open_issues_count: Int?
    let master_branch, default_branch: String?
    let score: Int?
}

// MARK: - Owner
struct Owner: Codable {
    let login: String?
    let id: Int?
    let node_id: String?
    let avatar_url: String?
    let gravatar_id: String?
    let url, received_events_url: String?
    let type: String?
}
