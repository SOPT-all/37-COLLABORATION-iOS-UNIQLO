//
//  ProductSummaryCell.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이상수 on 11/20/25.
//

import UIKit

import SnapKit
import Then

final class ProductSummaryCell: UITableViewCell {

    private var items = [UIImage?]()

    private let photoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 500)

        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.isPagingEnabled = true
        return cv
    }()

    private let hangerButton = IconCircleButton(type: .hanger)
    private let indicator = PageIndicatorView()
    private let productSummaryView = ProductSummaryView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        register()
        setDelegate()
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func register() {
        photoCollectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "PhotoCell")
    }
    
    private func setDelegate() {
        photoCollectionView.dataSource = self
        photoCollectionView.delegate = self
    }

    private func setUI() {
        contentView.addSubviews(
            photoCollectionView,
            hangerButton,
            indicator,
            productSummaryView
        )
    }

    private func setLayout() {
        photoCollectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(500)
        }
        
        hangerButton.snp.makeConstraints {
            $0.bottom.equalTo(photoCollectionView).inset(10)
            $0.leading.equalTo(photoCollectionView).inset(16)
        }
        
        indicator.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(photoCollectionView).inset(10)
        }

        productSummaryView.snp.makeConstraints {
            $0.top.equalTo(photoCollectionView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }

    func configure(items: [UIImage?]) {
        self.items = items
        indicator.configure(current: 1, total: items.count)
        productSummaryView.configure(
            name: "밀라노립니트재킷",
            number: "479775",
            colors: [
                .init(hex: "#212025", name: "09 BLACK"),
                .init(hex: "#828388", name: "10 GRAY")
            ],
            price: "49,000"
        )
    }
}

extension ProductSummaryCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCell else {
            return UICollectionViewCell()
        }
        cell.configure(image: items[indexPath.row])
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.width) + 1
        indicator.configure(current: page, total: items.count)
    }
}
