//
//  CategoryView.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이나연 on 11/18/25.
//

import UIKit

final class CategoryView: BaseView {
    
    let topNavigationBar = TopNavigationBar()
    private let categoryTab = CategoryTabBarView(tabType: .categoryView)
    
    private(set) var sideTableView = UITableView()
    private(set) var categoryCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func setUI() {
        addSubviews(topNavigationBar, categoryTab, sideTableView, categoryCollectionView)
    }
    
    override func setStyle() {
        sideTableView.do {
            $0.rowHeight = 39
            $0.separatorStyle = .none
        }
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
        
        sideTableView.snp.makeConstraints {
            $0.top.equalTo(categoryTab.snp.bottom)
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width * 0.25)
        }
        
        categoryCollectionView.snp.makeConstraints {
            $0.top.equalTo(categoryTab.snp.bottom)
            $0.leading.equalTo(sideTableView.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview()
        }
    }
}
