//
//  ItemListView.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 정윤아 on 11/21/25.
//
import UIKit
import SnapKit
import Then

final class ItemListView: BaseView {
    
    private let categoryTabBarView = CategoryTabBarView()
    private let resetButton = FilterButton(type: .reset)
    private let popularityButton = FilterButton(type: .popularity)
    private let categoryButton = FilterButton(type: .category)
    private let priceButton = FilterButton(type: .price)
    private let colorButton = FilterButton(type: .color)
    private let topNavigationBar = TopNavigationBar()
    private let customTabBarView = CustomTabBarView()
    
    override func setStyle() {
    }
    
    override func setUI() {
    }
    
    override func setLayout() {
    }
}
