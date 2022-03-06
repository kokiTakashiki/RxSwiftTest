//
//  RepoListPresenter.swift
//  CombineGithubMyList
//
//  Created by 武田孝騎 on 2022/03/04.
//

import Foundation
import Combine

@MainActor
protocol RepoListEventHandler: AnyObject {
    func viewDidLoad() async
    func didSelectRepo(_ repo: RepoListEntity) async
}

protocol RepoListInteractorOutput: AnyObject {
}

@MainActor
final class RepoListPresenter {

    // MARK: Type Aliases

    // MARK: Stored Instance Properties

    private unowned let view: RepoListUserInterface
    //private let interactor:
    private let router: RepoListRouterInput
    
    private var subscriptions = Set<AnyCancellable>()
    private let viewModel = ReposListViewModel()

    // MARK: Computed Instance Properties

    // MARK: Initializers

    init(view: RepoListUserInterface,
         //interactor: ,
         router: RepoListRouterInput
    ) {
        self.view = view
        //self.interactor = interactor
        self.router = router
    }

    // MARK: Other Private Methods

}

extension RepoListPresenter: RepoListEventHandler {
    func viewDidLoad() async {
        do {
            var repoList:[RepoListEntity] = []
            viewModel.$reposData
                .sink { repos in
                    if !repos.isEmpty {
                        repos.forEach({ repo in
                            repoList.append(RepoListEntity(title: repo.name, language: repo.language ?? ""))
                        })
                        self.view.updateRepoList(repoList)
                    }
                }
                .store(in: &subscriptions)
            
            //view.updateRepoList(repoList)
        } catch {
            // TODO: エラーハンドリング
        }
    }
    
    func didSelectRepo(_ repo: RepoListEntity) async {
//        switch repo.listID {
//        case .tateContainer:
//            router.showEditor()
//        case .tateTextView:
//            router.showTateEditor()
//        case .none:
//            print("no select view")
//        default:
//            // TODO: エラーハンドリング
//            print("no select view")
//        }
    }
}

extension RepoListPresenter: RepoListInteractorOutput {
}
