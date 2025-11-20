//
//  CategoryViewController.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이나연 on 11/18/25.
//

import UIKit

final class CategoryViewController: BaseViewController {
    
    private let rootView = CategoryView()
    private let itemData = CategoryItemModel.mockData
    private let outerData = OuterItemModel.mockData
    
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
    }
    
    private func register() {
        rootView.sideTableView.register(SideTableViewCell.self, forCellReuseIdentifier: SideTableViewCell.identifier)
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
