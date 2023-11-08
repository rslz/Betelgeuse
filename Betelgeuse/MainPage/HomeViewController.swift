//
//  HomeViewController.swift
//  Betelgeuse
//
//  Created by mv_rslz on 2023/11/8.
//

import UIKit
//import SnapKit

class HomeViewController: BaseViewController {

    lazy var addressButton: UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.setImage(UIImage(systemName: "square.and.pencil"), for: UIControl.State.normal)
        button.setImage(UIImage(systemName: "square.and.pencil"), for: UIControl.State.selected)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "首页页";
        
        setupUI()

    }
    
    func setupUI() {

//        addressButton.addTarget(self, action: #selector(addressButtonClick(sender:)), for: .touchUpInside)
//        view.addSubview(addressButton)
//        addressButton.snp.makeConstraints {
//            $0.center.equalTo(self.view.snp.center)
//            $0.height.width.equalTo(50)
//        }

    }
    
    @objc func addressButtonClick(sender: UIButton) {
        
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
