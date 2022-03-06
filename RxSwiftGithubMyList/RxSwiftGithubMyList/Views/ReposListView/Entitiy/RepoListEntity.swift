//
//  RepoListEntity.swift
//  CombineGithubMyList
//
//  Created by 武田孝騎 on 2022/03/05.
//

import Foundation

struct RepoListEntity: Equatable {
    var title: String
    var language: String
}

extension RepoListEntity: Sendable {}
