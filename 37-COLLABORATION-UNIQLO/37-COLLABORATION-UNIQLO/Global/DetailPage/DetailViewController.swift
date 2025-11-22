//
//  DetailViewController.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이상수 on 11/19/25.
//

import UIKit

import SnapKit

final class DetailViewController: UIViewController {
    private let header = DetailHeaderView()
    private let detailPageView = DetailPageView()

    override func loadView() {
        self.view = detailPageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        setDelegate()
        setTabSelectionHandler()
    }
    
    private func register() {
        detailPageView.tableView.register(
            ProductSummaryCell.self,
            DetailInfoCell.self,
            SizeInfoCell.self,
            StyleHintCell.self,
            ReviewCell.self,
            DivideBarCell.self
        )
    }
    
    private func setDelegate() {
        detailPageView.tableView.dataSource = self
        detailPageView.tableView.delegate = self
    }
    
    private func setTabSelectionHandler() {
        header.onTabSelected = { [weak self] index in
            let indexPath = IndexPath(row: index * 2, section: 1)
            self?.detailPageView.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        detailPageView.tableView.tableFooterView = footer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func footer() -> UIView {
        return UIView().then {
            $0.frame = CGRect(
                x: 0,
                y: 0,
                width: detailPageView.tableView.frame.width,
                height: 108
            )
            $0.backgroundColor = .white
        }
    }
}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? 1 : 7
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0 {
            let cell: ProductSummaryCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(items: [.outer1, .outer2, .outer3, .outer4])
            return cell
        }
        
        switch indexPath.row {
        case 0:
            let cell: DetailInfoCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(with: nil)
            return cell

        case 2:
            let cell: SizeInfoCell = tableView.dequeueReusableCell(for: indexPath)
            return cell

        case 4:
            let cell: StyleHintCell = tableView.dequeueReusableCell(for: indexPath)
            return cell

        case 6:
            let cell: ReviewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(items: ReviewModel.MockData)
            return cell

        default:
            let cell: DivideBarCell = tableView.dequeueReusableCell(for: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        detailPageView.tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView,
                   viewForHeaderInSection section: Int) -> UIView? {
        return (section == 1) ? header : nil
    }

    func tableView(_ tableView: UITableView,
                   heightForHeaderInSection section: Int) -> CGFloat {
        return (section == 1) ? 46 : .zero
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let headerHeight: CGFloat = 46
        let y = detailPageView.tableView.contentOffset.y + headerHeight + 0.5
        
        for row in 0..<4 {
            let indexPath = IndexPath(row: row * 2, section: 1)
            let rect = detailPageView.tableView.rectForRow(at: indexPath)
            
            if rect.minY <= y && y < rect.maxY {
                header.setSelectedIndex(idx: row)
                break
            }
        }
    }
}
