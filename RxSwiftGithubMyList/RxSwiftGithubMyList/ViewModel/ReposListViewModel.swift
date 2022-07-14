//
//  ReposListViewModel.swift
//  GithubAPIMyList
//
//  Created by 武田孝騎 on 2022/02/16.
//

import RxSwift

final class ReposListViewModel {
    private let fetcher = GithubFetcher()
    var reposData = BehaviorSubject<[Repo]>(value: [])
    var isShowIndicator = BehaviorSubject<Bool>(value: true)
    var languagesData = BehaviorSubject<[Languages]>(value: [])

    init() {
//        self.fetcher.repos { (repos) in
//            //sleep(1)
//            self.reposData.onNext(repos)
//            self.isShowIndicator.onNext(false)
//        }
        reposData.onNext(mock().repos)
        isShowIndicator.onNext(false)
    }
    
    func selectedRepoLanguagesData(repoName: String) {
        self.fetcher.languages(repoName: repoName) { (languages) in
            //sleep(1)
            self.languagesData.onNext([languages])
            self.isShowIndicator.onNext(false)
        }
    }
}

// 比較用
//final class ReposListViewModel {
//    private let fetcher = GithubFetcher()
//    @Published var reposData: [Repo] = []
//    @Published var isShowIndicator = true
//    @Published var languagesData: [Languages] = []
//
//    init() {
//        self.fetcher.repos { (repos) in
//            //sleep(1)
//            self.reposData = repos
//            self.isShowIndicator = false
//        }
//        reposData = mock().repos
//        isShowIndicator = false
//    }
//
//    func selectedRepoLanguagesData(repoName: String) {
//        self.fetcher.languages(repoName: repoName) { (languages) in
//            //sleep(1)
//            self.languagesData = [languages]
//            self.isShowIndicator = false
//        }
//    }
//}
