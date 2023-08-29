//
//  ViewController.swift
//  Betelgeuse
//
//  Created by mv_rslz on 2023/8/8.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }

    func setupUI() {
        self.title = "首页"
        self.view.backgroundColor = UIColor.systemBackground
        view.addSubview(titleLable)
    }

    lazy var titleLable: UILabel = {
        let label = UILabel.init(frame: CGRect.init(x: 0, y: 100, width: 100, height: 50))
        label.textColor = UIColor.label
        label.font = UIFont.systemFont(ofSize: 25)
        label.text = "首页";
        return label
    }()
}

