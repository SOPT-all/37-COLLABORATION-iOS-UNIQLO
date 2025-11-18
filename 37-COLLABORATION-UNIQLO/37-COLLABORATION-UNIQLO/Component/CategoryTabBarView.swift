//
//  CategoryTabBarView.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 정윤아 on 11/18/25.
//
import UIKit
import SnapKit

final class CategoryTabBarView: UIView {
    
    private let tabs = CategoryTab.allCases
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CategoryTabCell.self,forCellWithReuseIdentifier: CategoryTabCell.identifier
        )
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        selectInitialTab()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        addSubview(collectionView)
    }
    
    private func setLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(46)
        }
    }
    
    private func selectInitialTab() {
        DispatchQueue.main.async {
            let indexPath = IndexPath(item: 2, section: 0)
            self.collectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
        }
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
        
        cell.configure(with: tabs[indexPath.item])
        return cell
    }
}

extension CategoryTabBarView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let tab = tabs[indexPath.item]
        let text = tab.categoryName as NSString
        let font = UIFont.reddit(.captionM12)
        
        let textSize = text.size(withAttributes: [.font: font])
        let width = textSize.width + 40
        return CGSize(width: width, height: 46)
    }
}



