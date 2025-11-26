//
//  DetailPageView.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이상수 on 11/22/25.
//

import UIKit

import SnapKit
import Then

final class DetailPageView: BaseView {

    let tableView =  UITableView(frame: .zero, style: .plain)

    private(set) var navigationBar = TopNavigationBar()
    private let shareButton = IconCircleButton(type: .share)
    private let upButton = IconCircleButton(type: .up)
    private let bottomBar = DetailBottomBar()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setStyle() {
        backgroundColor = .white

        tableView.do {
            $0.backgroundColor = .gray100
            $0.separatorStyle = .none
            $0.sectionHeaderTopPadding = 0
            $0.contentInsetAdjustmentBehavior = .never
            $0.showsVerticalScrollIndicator = false
        }
    }

    override func setUI() {
        addSubviews(
            tableView,
            navigationBar,
            shareButton,
            upButton,
            bottomBar
        )
    }

    override func setLayout() {
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
        }

        tableView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(bottomBar.snp.top)
        }
 
        bottomBar.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
        }
        
        shareButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.bottom.equalTo(bottomBar.snp.top).offset(-10)
        }
        upButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(bottomBar.snp.top).offset(-10)
        }
    }

    private func footerView() -> UIView {
        let footer = UIView()
        footer.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 108)
        footer.backgroundColor = .white
        return footer
    }

}
