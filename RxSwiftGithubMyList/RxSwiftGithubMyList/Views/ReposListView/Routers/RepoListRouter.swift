//
//  RepoListRouter.swift
//  CombineGithubMyList
//
//  Created by 武田孝騎 on 2022/03/04.
//

import Foundation
import UIKit

@MainActor
protocol RepoListRouterInput {
    func showEditor()
    func showTateEditor()
}

@MainActor
final class RepoListRouter {
    // MARK: Stored Instance Properties

    private unowned let viewController: ViewController

    // MARK: Initializers

    private init(viewController: ViewController) {
        self.viewController = viewController
    }

    // MARK: Type Methods

    static func assembleModule() -> ViewController {
        let controller = UIViewController()
        guard let view = controller.instantiateStoryBoardToViewController(storyBoardNameWithIdentifier: .RepoListView) as? ViewController else {
            fatalError("Fail to load EditorViewController from Storyboard.")
        }
        //let interactor =
        let router = RepoListRouter(viewController: view)
        let presenter = RepoListPresenter(view: view, router: router)

        view.inject(presenter: presenter)
        //interactor.presenter = presenter

        return view
    }

    // MARK: Other Private Methods
}

extension RepoListRouter: RepoListRouterInput {
    func showEditor() {
        //let vc = EditorRouter.assembleModule()
        //viewController.navigationController?.pushViewController(vc, animated: true)
    }
    func showTateEditor() {
        //let vc = TateEditorRouter.assembleModule()
        //viewController.navigationController?.pushViewController(vc, animated: true)
    }
}
