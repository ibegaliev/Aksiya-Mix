//
//  TabbarController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/26/24.
//

import UIKit

class TabbarController: UITabBarController {
    
    lazy var homeViewController: UIViewController = {
        let vc = HomeViewController()
        
        return vc
    }()

    lazy var categoryViewController: UIViewController = {
        let vc = CategoryController()

        return vc
    }()

    lazy var companyViewController: UIViewController = {
        let vc = CompanyController()

        return vc
    }()

    lazy var selectViewController: UIViewController = {
        let vc = LikedController()

        return vc
    }()

    lazy var userViewController: UIViewController = {
        let vc = UserViewController()

        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabbar()
        setOthers()
    }
    
    private func setTabbar() {
        
        self.viewControllers = [
            homeViewController,
            categoryViewController,
            companyViewController,
            selectViewController,
            userViewController
        ]
        
    }
    
    private func setOthers() {
        
        homeViewController.tabBarItem.image = UIImage.tabbar_home_UnSelected
        categoryViewController.tabBarItem.image = UIImage.tabbar_Grid_Unselected
        companyViewController.tabBarItem.image = UIImage.tabbar_Company_Unselect
        selectViewController.tabBarItem.image = UIImage.tabbar_Heard_Unselect
        userViewController.tabBarItem.image = UIImage.tabbar_Person_Unselect
        
        homeViewController.tabBarItem.selectedImage = UIImage.tabbar_home_Selected
        categoryViewController.tabBarItem.selectedImage = UIImage.tabbar_Grid_Selected
        companyViewController.tabBarItem.selectedImage = UIImage.tabbar_Company_Select
        selectViewController.tabBarItem.selectedImage = UIImage.tabbar_Heard_Select
        userViewController.tabBarItem.selectedImage = UIImage.tabbar_Person_Select
        
        tabBar.backgroundColor = .white
        
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .red
        
    }
    
}
