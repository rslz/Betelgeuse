//
//  LikeViewController.swift
//  Betelgeuse
//
//  Created by mv_rslz on 2023/11/8.
//

import UIKit
import SnapKit

class LikeViewController: BaseViewController {

    let stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()

    }
    
    func setupUI() {

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
    
    func addButtonPressed() {
        let subview4 = UIView()
        subview4.backgroundColor = .yellow
        stackView.addArrangedSubview(subview4)
    }

    func deleteButtonPressed() {
      let lastSubview = stackView.arrangedSubviews.last
      if let lastSubview = lastSubview {
        stackView.removeArrangedSubview(lastSubview)
      }
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
