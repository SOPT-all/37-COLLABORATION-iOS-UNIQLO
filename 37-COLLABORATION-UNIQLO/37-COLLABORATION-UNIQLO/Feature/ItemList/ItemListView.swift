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
    
    private let topNavigationBar = TopNavigationBar()
    
    let categoryTabBarView = CategoryTabBarView(tabType: .productView)
    
    private let resetButton = FilterButton(type: .reset)
    private let popularityButton = FilterButton(type: .popularity)
    private let categoryButton = FilterButton(type: .category)
    private let priceButton = FilterButton(type: .price)
    private let colorButton = FilterButton(type: .color)
    private let filterScrollView = UIScrollView()
    private lazy var filterStackView = UIStackView(arrangedSubviews: [resetButton, popularityButton, categoryButton, priceButton, colorButton])
    
    private let itemHeaderView = UIView()
    private let itemCountLabel = UILabel()
    private let layoutButton = UIButton()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 20
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(ItemCell.self, forCellWithReuseIdentifier: "ItemCell")
        return collectionView
    }()
    
    private let customTabBarView = CustomTabBarView()
    
    override func setStyle() {
        
        topNavigationBar.do {
            $0.backgroundColor = .white
        }
        
        filterStackView.do {
            $0.axis = .horizontal
            $0.spacing = 4
        }
        
        filterScrollView.do {
            $0.showsHorizontalScrollIndicator = false
            $0.backgroundColor = .white
        }
        
        itemCountLabel.do {
            $0.font = .pretendard(.bodyR15)
            $0.textColor = .gray600
        }
        
        layoutButton.do {
            $0.setImage(UIImage(named: "grid"), for: .normal)
        }
        
        itemHeaderView.do {
            $0.backgroundColor = .white
        }
    }
    
    override func setUI() {
        self.backgroundColor = .white
        addSubviews(topNavigationBar, categoryTabBarView, filterScrollView, itemHeaderView, collectionView, customTabBarView)
        filterScrollView.addSubview(filterStackView)
        itemHeaderView.addSubviews(itemCountLabel, layoutButton)
    }
    
    override func setLayout() {
        
        topNavigationBar.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50)
            $0.horizontalEdges.equalToSuperview()
        }
        
        categoryTabBarView.snp.makeConstraints {
            $0.top.equalTo(topNavigationBar.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
        }
        
        filterScrollView.snp.makeConstraints {
            $0.top.equalTo(categoryTabBarView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(56)
        }
        
        filterStackView.snp.makeConstraints {
            $0.horizontalEdges.equalTo(filterScrollView.contentLayoutGuide).inset(8)
            $0.top.bottom.equalTo(filterScrollView.frameLayoutGuide).inset(13)
        }
        
        itemHeaderView.snp.makeConstraints {
            $0.top.equalTo(filterScrollView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(36)
        }
        
        itemCountLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
        }
        
        layoutButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(16)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(itemHeaderView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(customTabBarView.snp.top)
        }
        
        customTabBarView.snp.makeConstraints {
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
    
    func updateItemCount(_ count: Int) {
        itemCountLabel.text = "\(count) 개 제품"
    }
}
