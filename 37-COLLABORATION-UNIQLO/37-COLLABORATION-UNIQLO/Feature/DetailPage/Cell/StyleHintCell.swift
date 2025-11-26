//
//  StyleHintCell.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이상수 on 11/21/25.
//

import UIKit

import SnapKit
import Then

final class StyleHintCell: UITableViewCell {
    
    private var items: [String] = []

    private let titleLabel = UILabel()
    private let moreButton = UIButton(type: .system)

    private lazy var collectionView: UICollectionView = {
        let layout = collectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(
            StyleHintItemCell.self,
            forCellWithReuseIdentifier: StyleHintItemCell.identifier
        )
        return collectionView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setStyle()
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(urls: [String]) {
        self.items = urls
        collectionView.reloadData()
    }

    private func setStyle() {
        titleLabel.do {
            $0.font = .pretendard(.titleR20)
            $0.textColor = .black
            $0.text = "StyleHint"
        }
        
        moreButton.do {
            $0.titleLabel?.font = .pretendard(.bodyR13)
            $0.layer.borderColor = UIColor.gray200.cgColor
            $0.layer.borderWidth = 1
            $0.setTitle("스타일링 더 보기", for: .normal)
            $0.setTitleColor(.black, for: .normal)
        }
    }

    private func setUI() {
        contentView.addSubviews(
            titleLabel,
            collectionView,
            moreButton
        )
    }

    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(16)
        }

        collectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(240)
        }

        moreButton.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(37)
            $0.bottom.equalToSuperview().inset(20)
        }
    }

    private func collectionViewLayout() -> UICollectionViewLayout {
        return UICollectionViewFlowLayout().then {
            $0.scrollDirection = .horizontal
            $0.minimumLineSpacing = 0
            $0.minimumInteritemSpacing = 0
            $0.sectionInset = .init(top: 0, left: 0, bottom: 0, right: 0)
            $0.itemSize = .init(width: 148, height: 240)
        }
    }
}

extension StyleHintCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StyleHintItemCell", for: indexPath) as? StyleHintItemCell else {
            return UICollectionViewCell()
        }
        
        let urlString = items[indexPath.row]
        cell.configure(urlString: urlString)
        return cell
    }
}
