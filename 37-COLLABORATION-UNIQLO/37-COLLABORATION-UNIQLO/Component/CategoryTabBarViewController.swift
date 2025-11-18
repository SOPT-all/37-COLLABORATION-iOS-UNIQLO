//
//  CategoryTabBarViewController.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 정윤아 on 11/18/25.
//
import UIKit
import SnapKit

final class CategoryTabBarViewController: UIViewController {
    
    private let tabs = CategoryTab.allCases
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(
            CategoryTabCell.self,
            forCellWithReuseIdentifier: CategoryTabCell.identifier
        )
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        selectInitialTab()
    }
    
    private func setUI() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
    }
    
    private func setLayout() {
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(46)
        }
        
    }
}

private extension CategoryTabBarViewController {
    func selectInitialTab() {
        DispatchQueue.main.async {
            let indexPath = IndexPath(item: 2, section: 0)
            self.collectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
        }
    }
}

extension CategoryTabBarViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return tabs.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryTabCell.identifier,for: indexPath) as? CategoryTabCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: tabs[indexPath.item])
        return cell
    }
}

extension CategoryTabBarViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let tab = tabs[indexPath.item]
        let text = tab.categoryName as NSString
        let font = UIFont.reddit(.captionM12)
        
        let textSize = text.size(withAttributes: [.font: font])
        let width = textSize.width + 40
        return CGSize(width: width, height: 46)
    }
}



