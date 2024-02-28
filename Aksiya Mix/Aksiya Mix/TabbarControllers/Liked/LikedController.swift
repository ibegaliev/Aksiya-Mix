//
//  LikedController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 13/02/24.
//

import UIKit
import SnapKit
import Tabman
import Pageboy

class LikedController: TabmanViewController, PageboyViewControllerDataSource, TMBarDataSource {
    
    let viewModel = LikedViewModel()
    private var viewControllers = [UIViewController(), UIViewController(), UIViewController()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backColor
        dataSource = self
        let bar = TMBar.ButtonBar()
        
        bar.layout.transitionStyle = .snap
        bar.backgroundColor = .clear
        bar.indicator.overscrollBehavior = .bounce
        bar.indicator.weight = .custom(value: 4)
        
        addBar(bar, dataSource: self, at: .top)
        bar.snp.makeConstraints { make in
            make.top.equalTo(view).inset(50)
            make.left.right.equalTo(view).inset(12)
            make.height.equalTo(30)
        }
        
    }
    
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(
        for pageboyViewController: PageboyViewController,
        at index: PageboyViewController.PageIndex
    ) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        var title = String()
        switch index {
            case 0:
                title = LyricsManager.getLyrics(type: .likedTitle)
            case 1:
                title = LyricsManager.getLyrics(type: .likedTitle)
            case 2:
                title = LyricsManager.getLyrics(type: .resentlySeen)
            default:
                break
        }
        return TMBarItem(title: title)
    }
    
}
    
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setController()
//    }
//    
//    private func setController() {
//        
//        viewModel.view.delegate = self
//        viewModel.view.selectedItem = 0
//        
//        view.addSubview(viewModel.view)
//        viewModel.view.snp.makeConstraints { make in
//            make.edges.equalTo(view)
//        }
//        
//    }
//    
//    func selectedSaved() {
//        viewModel.view.selectedItem = 0
//    }
//    
//    func selectedSeen() {
//        viewModel.view.selectedItem = 1
//    }
//    
//    func selectedended() {
//        viewModel.view.selectedItem = 2
//    }
//
//    
//}
