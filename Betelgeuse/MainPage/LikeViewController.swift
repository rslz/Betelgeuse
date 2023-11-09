//
//  LikeViewController.swift
//  Betelgeuse
//
//  Created by mv_rslz on 2023/11/8.
//

import UIKit
import SnapKit

class LikeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()

    }
    
    func setupUI() {

        let stackView = UIStackView()
        view.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.left.top.right.equalTo(self.view)
            $0.height.equalTo(250)
        }
        
        // 设置stackView属性
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .fillEqually

        // 添加子视图
        let subview1 = UIView()
        subview1.backgroundColor = .red
        let subview2 = UIView()
        subview2.backgroundColor = .green
        let subview3 = UIView()
        subview3.backgroundColor = .blue

        stackView.addArrangedSubview(subview1)
        stackView.addArrangedSubview(subview2)
        stackView.addArrangedSubview(subview3)

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
