//
//  SearchModel.swift
//  RxTestSample
//
//  Created by hklee on 2020/08/14.
//  Copyright © 2020 hklee. All rights reserved.
//

import Foundation

// MARK: - SearchModel
struct SearchModel {
    let totalCount: Int?
    let incompleteResults: Bool?
    let items: [SearchItem]?
}

// MARK: - Item
struct SearchItem {
    let id: Int?
    let nodeID, name, fullName: String?
    let owner: Owner?
    let itemPrivate: Bool?
    let htmlURL: String?
    let itemDescription: String?
    let fork: Bool?
    let url: String?
    let createdAt, updatedAt, pushedAt: Date?
    let homepage: String?
    let size, stargazersCount, watchersCount: Int?
    let language: String?
    let forksCount, openIssuesCount: Int?
    let masterBranch, defaultBranch: String?
    let score: Int?
}

// MARK: - Owner
struct Owner {
    let login: String?
    let id: Int?
    let nodeID: String?
    let avatarURL: String?
    let gravatarID: String?
    let url, receivedEventsURL: String?
    let type: String?
}
