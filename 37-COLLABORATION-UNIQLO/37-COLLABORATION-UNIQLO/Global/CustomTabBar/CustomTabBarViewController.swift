//
//  CustomTabBarViewController.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이나연 on 11/18/25.
//

import UIKit

final class CustomTabBarViewController: BaseViewController {
    
    private let contentView = UIView()
    private let tabBar = CustomTabBarView()
    
    private var selectedIndex = 1 {
        didSet {
            tabBar.updateUI(selectedIndex: selectedIndex)
            updateViewController()
        }
    }
    
    private let viewControllers: [UIViewController] = [
        EmptyViewController(),
        CategoryViewController(),
        EmptyViewController(),
        EmptyViewController()
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setLayout()
        
        tabBar.onTabSelected = { [weak self] index in
            self?.selectedIndex = index
        }
        
        tabBar.updateUI(selectedIndex: selectedIndex)
        updateViewController()
    }
    
    private func setUI() {
        self.view.addSubviews(contentView, tabBar)
        contentView.backgroundColor = .blue
    }
    
    private func setLayout() {
        contentView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(tabBar.snp.top)
        }
        
        tabBar.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        print(tabBar.frame)
    }
}

extension CustomTabBarViewController {
    private func updateViewController() {
        children.forEach {
            $0.view.removeFromSuperview()
            $0.removeFromParent()
        }
        
        let viewController = viewControllers[selectedIndex]
        addChild(viewController)
        contentView.addSubview(viewController.view)
        
        viewController.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        viewController.didMove(toParent: self)
    }
}
