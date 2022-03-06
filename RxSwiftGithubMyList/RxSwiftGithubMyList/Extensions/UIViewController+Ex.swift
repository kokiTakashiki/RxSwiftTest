//
//  UIViewController+Ex.swift
//  omokake02
//
//  Created by 武田孝騎 on 2021/12/18.
//  Copyright © 2021 takasiki. All rights reserved.
//

import UIKit

extension UIViewController {
    /// storyBoardNameとwithIdentifierが同じなので気を付けること
    func instantiateStoryBoardToViewController(storyBoardNameWithIdentifier: String) -> Any {
        let storyboard = UIStoryboard(name: storyBoardNameWithIdentifier, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: storyBoardNameWithIdentifier) as Any
        return viewController
    }
}
