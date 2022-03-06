//
//  RepoListViewCell.swift
//  CombineGithubMyList
//
//  Created by 武田孝騎 on 2022/03/05.
//

import UIKit

@MainActor
final class RepoListViewCell: UITableViewCell {
    // MARK: Stored Instance Properties
//    @IBInspectable private var masksToBounds: Bool = false {
//        willSet {
//            layer.masksToBounds = newValue
//        }
//    }
    
    // MARK: IBOutlets
    @IBOutlet weak var languageLabel: LanguageLabelView!
    @IBOutlet weak var titleLabel: UILabel! {
        willSet {
            newValue.text = nil
        }
    }
    // MARK: View Life-Cycle Methods
    // MARK: Other Internal Methods
    func setup(name: String, language: String) {
        titleLabel.text = name
        languageLabel.colorType = language
        languageLabel.labelText = language
        languageLabel.afterInit()
    }
}
