//
//  CategoryViewController.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이나연 on 11/18/25.
//

import UIKit

final class CategoryViewController: BaseViewController {
    
    private let rootView = CategoryView()
    private let itemData = CategoryItemModel.model
    private let outerData = OuterItemModel.model
    
    private var itemSelectedIndex: Int = 1
    private var outerSelectedIndex: Int = 0
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setDelegate()
        register()
    }
    
    override func setDelegate() {
        rootView.sideTableView.delegate = self
        rootView.sideTableView.dataSource = self
        rootView.categoryCollectionView.delegate = self
        rootView.categoryCollectionView.dataSource = self
    }
    
    private func register() {
        rootView.sideTableView.register(SideTableViewCell.self, forCellReuseIdentifier: SideTableViewCell.identifier)
        rootView.categoryCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        rootView.categoryCollectionView.register(
            CategoryHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: CategoryHeaderView.identifier
        )
    }
}

extension CategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemSelectedIndex = indexPath.item
        tableView.reloadData()
        tableView.layoutIfNeeded()
    }
}

extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SideTableViewCell.identifier) as? SideTableViewCell else {
            return UITableViewCell()
        }
        cell.bind(with: itemData[indexPath.row].item, isSelected: indexPath.row == itemSelectedIndex)
        return cell
    }
}

extension CategoryViewController: UICollectionViewDelegate { }

extension CategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        outerData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.bind(with: outerData[indexPath.item])
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: CategoryHeaderView.identifier,
            for: indexPath
        ) as? CategoryHeaderView else {
            return UICollectionReusableView()
        }
        
        header.bind(with: "아우터")
        return header
    }
}

extension CategoryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {
            CGSize(width: 63, height: 73)
        }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 24
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 17.5
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {

        return CGSize(width: collectionView.bounds.width, height: 39)
    }
}
