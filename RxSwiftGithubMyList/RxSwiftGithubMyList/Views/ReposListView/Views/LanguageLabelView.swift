//
//  LanguageLabelView.swift
//  CombineGithubMyList
//
//  Created by 武田孝騎 on 2022/03/05.
//

import UIKit

@IBDesignable
final class LanguageLabelView: UIView {

    // MARK: Stored Instance Properties
    // MARK: Computed Instance Properties
    var colorType:String = "C"
    var labelText:String = "C"
    
    // MARK: IBOutlets
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    

    // MARK: Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)

        configureView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        configureView()
    }
    
    // 初期化後に呼びされる。
    public func afterInit() {
        iconImage.tintColor = selectColor(type: colorType)
        label.text = labelText
    }

    // MARK: IBActions
    // MARK: Other Internal Methods
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()

        configureView()
    }

    // MARK: Other Private Methods
    private func configureView() {
        loadNib()

        // TODO: 他にUIの装飾処理があれば実行する
    }

    private func loadNib() {
//        guard let LanguageLabelView = R.nib.LanguageLabelView(owner: self) else {
//            fatalError("Fail to load LanguageLabelView from Nib.")
//        }
        let nib = UINib(nibName: .LanguageLabelView, bundle: Bundle(for: type(of: self)))
        guard let languageLabelView = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("Fail to load LanguageLabelView from Nib.")
        }
        
        languageLabelView.frame = self.bounds
        addSubview(languageLabelView)
    }
}

// MARK: Private
extension LanguageLabelView {
    private func selectColor(type: String) -> UIColor {
        switch type {
        case "C":
            return .githubC
        case "Swift":
            return .githubSwift
        case "ShaderLab":
            return .githubShaderLab
        case "JavaScript":
            return .githubJavaScript
        case "C#":
            return .githubCSharp
        case "HTML":
            return .githubHTML
        default:
            return .clear
        }
    }
}
