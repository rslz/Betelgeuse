//
//  BaseNavigationController.swift
//  Betelgeuse
//
//  Created by mv_rslz on 2023/11/8.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        Be_setNavColor(UIColor.label, UIColor.systemBackground, false) // 白底黑字
        
    }
    
    /// 重写push方法的目的 : 拦截所有push进来的子控制器
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if (self.children.count > 0 ) {
            let backItem = UIBarButtonItem.Jh_backItem(imageName: "arrow.backward", target: self, action: #selector(ClickBackBtn))
            viewController.navigationItem.leftBarButtonItem = backItem
            // 隐藏底部的工具条
            viewController.hidesBottomBarWhenPushed = true
        }
        // 所有设置搞定后, 再push控制器
        super.pushViewController(viewController, animated: animated)
    }
    @objc func ClickBackBtn() {
        self.popViewController(animated: true)
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


// MARK: - 设置导航条背景颜色和标题颜色， iOS15是否透明
func Be_setNavColor(_ titleColor:UIColor,_ navBgColor:UIColor,_ isTransparent:Bool) {
    // 设置标题字体颜色
    var titleTextAttributes = Dictionary<NSAttributedString.Key,Any>()
    titleTextAttributes[NSAttributedString.Key.font] = UIFont.systemFont(ofSize: 18)
    titleTextAttributes[NSAttributedString.Key.foregroundColor] = titleColor
    UINavigationBar.appearance().titleTextAttributes = titleTextAttributes
    
    // 设置导航栏背景色
    UINavigationBar.appearance().barTintColor = navBgColor
    
    // iOS15适配
    if #available(iOS 15.0, *) {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = navBgColor
        appearance.titleTextAttributes = titleTextAttributes
        if (isTransparent) {
            // 设置透明
            appearance.backgroundColor = UIColor.clear; //透明背景色
            appearance.backgroundEffect = nil; // 不使用毛玻璃效果
            appearance.shadowColor = nil; // 隐藏底部分隔线
        }
        // standardAppearance：常规状态, 标准外观，iOS15之后不设置的时候，导航栏背景透明
        UINavigationBar.appearance().standardAppearance = appearance
        // scrollEdgeAppearance：被scrollview向下拉的状态, 滚动时外观，不设置的时候，使用标准外观
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}

// MARK: - 设置半透明毛玻璃导航条（白底黑字）
func Jh_setHalfTransparentNav() {
    // 设置标题字体颜色
    var titleTextAttributes = Dictionary<NSAttributedString.Key,Any>()
    titleTextAttributes[NSAttributedString.Key.font] = UIFont.systemFont(ofSize: 18)
    titleTextAttributes[NSAttributedString.Key.foregroundColor] = UIColor.black
    UINavigationBar.appearance().titleTextAttributes = titleTextAttributes
    if #available(iOS 15.0, *) {
        let appearance = UINavigationBarAppearance()
        
        appearance.configureWithDefaultBackground(); //使用默认背景和阴影值配置条形外观对象。
        //        appearance.configureWithTransparentBackground(); //配置具有透明背景且无阴影的条形外观对象。
        //        appearance.configureWithOpaqueBackground(); //使用一组适合当前主题的不透明颜色配置栏外观对象。
        
        appearance.titleTextAttributes = titleTextAttributes;
        // standardAppearance：常规状态, 标准外观，iOS15之后不设置的时候，导航栏背景透明
        UINavigationBar.appearance().standardAppearance = appearance
        // scrollEdgeAppearance：被scrollview向下拉的状态, 滚动时外观，不设置的时候，使用标准外观
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
