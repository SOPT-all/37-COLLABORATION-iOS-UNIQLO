//
//  ItemListViewController.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 정윤아 on 11/21/25.
//
import UIKit

import SnapKit
import Then

final class ItemListViewController: BaseViewController {
    
    private let itemListView = ItemListView()
    
    private let service: ProductListService = DefaultProductListService()
    
    private var items: [Item] = []
    
    override func loadView() {
        view = itemListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        loadMockData()
        setDelegate()
        getProductList()
    }
    
    override func setDelegate() {
        itemListView.collectionView.dataSource = self
        itemListView.collectionView.delegate = self
    }
    
    private func loadMockData() {
        self.items = mockItems
        itemListView.updateItemCount(items.count)
        itemListView.collectionView.reloadData()
    }
    
    private func getProductList() {
        Task {
            do {
                let products = try await service.getProductList()
                
                await MainActor.run {
                    self.items = products
                    self.itemListView.updateItemCount(self.items.count)
                    self.itemListView.collectionView.reloadData()
                }
                
            } catch {
                print("상품 목록 불러오기 실패: \(error)")
            }
        }
    }
}

extension ItemListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCell.identifier, for: indexPath) as? ItemCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: items[indexPath.item])
        return cell
    }
}

extension ItemListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width / 2) - 2
        return CGSize(width: width, height: 407)
    }
}

extension ItemListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItem = items[indexPath.item]
        
        let detailViewController = DetailViewController(productID: selectedItem.productId)
        
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
