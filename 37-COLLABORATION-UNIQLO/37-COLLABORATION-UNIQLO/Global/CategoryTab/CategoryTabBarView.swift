//
//  CategoryTabBarView.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 정윤아 on 11/18/25.
//

import UIKit

import SnapKit

protocol CategorryTabBarViewDelegate: AnyObject {
    func categoryTabBarView(_ view: CategoryTabBarView, didSelectTabAt index: Int, title: String)
}

enum CategoryTab: String, CaseIterable {
    case categoryView
    case productView
    
    var categoryName: [String] {
        switch self {
        case .categoryView:
            return ["WOMEN", "MEN", "KIDS", "BABY"]
        case .productView:
            return ["경량 패딩(PUFFTECH)", "파카&블루종&후리스", "재킷&블레이저", "코트", "다운&패딩"]
        }
    }
    
    var startIndex: Int {
        switch self {
        case .categoryView:
            return 0
        case .productView:
            return 2
        }
    }
}

final class CategoryTabBarView: BaseView {
    
    weak var delegate: CategorryTabBarViewDelegate?
    
    private let categoryTabType: CategoryTab
    private lazy var tabs = categoryTabType.categoryName
    private lazy var selectedIndex: Int = categoryTabType.startIndex

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        
        return collectionView
    }()
    
    init(tabType: CategoryTab) {
        self.categoryTabType = tabType
        super.init(frame: .zero)
        setUI()
        setLayout()
        setDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setUI() {
        addSubview(collectionView)
    }
    
    override func setLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(46)
        }
    }

    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CategoryTabCell.self, forCellWithReuseIdentifier: CategoryTabCell.identifier)
    }
}

extension CategoryTabBarView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return tabs.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryTabCell.identifier, for: indexPath) as? CategoryTabCell else {
            return UICollectionViewCell()
        }
        
        let tabText = tabs[indexPath.row]
        cell.configure(with: tabText, isSelected: indexPath.item == selectedIndex)
        return cell
    }
}

extension CategoryTabBarView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.item
        collectionView.reloadData()
        collectionView.layoutIfNeeded()
        
        let title = tabs[indexPath.item]
        delegate?.categoryTabBarView(self, didSelectTabAt: selectedIndex, title: title)
    }
}

extension CategoryTabBarView: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let tab = tabs[indexPath.item]
        let text = tab as NSString
        let font = UIFont.reddit(.captionM12)
        
        let textSize = text.size(withAttributes: [.font: font])
        let collectionViewWidth = self.frame.width
        let cellWidth = categoryTabType == .categoryView ? collectionViewWidth / CGFloat(tabs.count) : textSize.width + 40
        return CGSize(width: cellWidth, height: 46)
    }
}
