//
//  DetailViewController.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이상수 on 11/19/25.
//

import UIKit

import SnapKit

final class DetailViewController: UIViewController {
    private(set) var productID: Int
    
    private let service: ProductStyleHintService = DefaultStyleHintService()
    private var styleHintURLs: [String] = []

    private let header = DetailHeaderView()
    private let detailPageView = DetailPageView()
    private var moving = false

    private let productDetailService = DefaultProductDetailService()
    private var detailResponse: ProductDetailResponse?

    private let productInfoService = DefaultProductInfoService()
    private var infoResponse: ProductInfoResponse?
    
    init(productID: Int) {
        self.productID = productID
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = detailPageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getProductDetails()
        getProductInfo()
        register()
        setDelegate()
        setTabSelectionHandler()
        getStyleHints()
    }
    
    private func getProductDetails() {
        Task { @MainActor in
            do {
                let result = try await productDetailService.getProductDetails(productID: productID)
                detailResponse = result
                detailPageView.tableView.reloadData()
            } catch {
                print("error in getProductDetails")
            }
        }
    }
    
    private func getProductInfo() {
        Task { @MainActor in
            do {
                let result = try await productInfoService.getProductInfo(productID: productID)
                infoResponse = result
                detailPageView.tableView.reloadData()
            } catch {
                print("error in getProductInfo")
            }
        }
    }
    
    private func getStyleHints() {
        Task { [weak self] in
            guard let self else {
                return
            }
            
            do {
                let urls = try await service.getStyleHints(productId: productID)
                
                await MainActor.run {
                    self.styleHintURLs = urls
                    self.detailPageView.tableView.reloadRows(
                        at: [IndexPath(row: 4, section: 1)],
                        with: .none
                    )
                }
            } catch {
                print("error int getStyleHints: \(error)")
            }
        }
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
            self?.moving = true
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
            cell.configure(with: infoResponse)
            return cell
        }
        
        switch indexPath.row {
        case 0:
            let cell: DetailInfoCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(with: detailResponse)
            return cell

        case 2:
            let cell: SizeInfoCell = tableView.dequeueReusableCell(for: indexPath)
            return cell

        case 4:
            let cell: StyleHintCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(urls: styleHintURLs)
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
        if moving { return }
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
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        moving = false
    }
}
