//
//  CategoryView.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이나연 on 11/18/25.
//

import UIKit

final class CategoryView: BaseView {
    
    private let topNavigationBar = TopNavigationBar()
    private(set) var categoryTab = CategoryTabBarView(tabType: .categoryView)
    
    override func setUI() {
        addSubviews(topNavigationBar, categoryTab)
    }
    
    override func setLayout() {
        topNavigationBar.snp.makeConstraints {
            $0.top.equalToSuperview().inset(40)
            $0.leading.trailing.equalToSuperview()
        }
        
        categoryTab.snp.makeConstraints {
            $0.top.equalTo(topNavigationBar.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
    }
}
