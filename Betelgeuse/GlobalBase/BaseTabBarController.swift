//
//  BaseTabBarController.swift
//  Betelgeuse
//
//  Created by mv_rslz on 2023/11/8.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.isTranslucent = false;
        tabBar.backgroundColor = UIColor.systemBackground
        
        let tabBarItem = UITabBarItem.appearance()
        
        // 普通状态下的文字属性
        var normalAttrs = Dictionary<NSAttributedString.Key,Any>()
        normalAttrs[NSAttributedString.Key.font] = UIFont.boldSystemFont(ofSize: 13)
        normalAttrs[NSAttributedString.Key.foregroundColor] = UIColor.label
        // 选中状态下的文字属性
        var selectedAttrs = Dictionary<NSAttributedString.Key,Any>()
        selectedAttrs[NSAttributedString.Key.font] = UIFont.boldSystemFont(ofSize: 13)
        selectedAttrs[NSAttributedString.Key.foregroundColor] = UIColor.systemBlue
        
        tabBarItem.setTitleTextAttributes(normalAttrs, for: .normal)
        tabBarItem.setTitleTextAttributes(selectedAttrs, for: .selected)

        // Home
        let homeVC = HomeViewController()
        addChildViewController(homeVC, title: "我的", image: UIImage(named: "tabbar_home"), selectedImage: UIImage(named: "tabbar_home_sel"))
        
        // Like
        let likeVC = LikeViewController()
        addChildViewController(likeVC, title: "喜欢", image: UIImage(named: "tabbar_like"), selectedImage: UIImage(named: "tabbar_like_sel"))
        
        // Cart
        let cartVC = CartViewController()
        addChildViewController(cartVC, title: "Cart", image: UIImage(named: "tabbar_cart"), selectedImage: UIImage(named: "tabbar_cart_sel"))
        
        // Mine
        let mineVC = MineViewController()
        addChildViewController(mineVC, title: "我的", image: UIImage(named: "tabbar_mine"), selectedImage: UIImage(named: "tabbar_mine_sel"))
        
    }
    
    func addChildViewController(_ childController: UIViewController, title:String?, image:UIImage?, selectedImage:UIImage?) {
        childController.tabBarItem = UITabBarItem(title: title, image: image?.withRenderingMode(.alwaysOriginal), selectedImage: selectedImage?.withRenderingMode(.alwaysOriginal))
        let navController = BaseNavigationController(rootViewController: childController)
        addChild(navController)
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
