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
        

        
        let tmpImage = UIImage(systemName: "arrow.backward")
        UINavigationBar.appearance().backIndicatorImage = tmpImage
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = tmpImage
        UINavigationBar.appearance().isTranslucent = false
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -1000,vertical: 0), for: .default)
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
