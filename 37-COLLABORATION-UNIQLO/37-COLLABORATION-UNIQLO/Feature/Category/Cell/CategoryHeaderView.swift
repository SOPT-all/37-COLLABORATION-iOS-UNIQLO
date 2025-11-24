//
//  CategoryTabHeaderView.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이나연 on 11/21/25.
//

import UIKit

final class CategoryHeaderView: UICollectionReusableView {
    
    static let identifier: String = "CategoryHeaderView"
    
    private let titleLabel = UILabel()
    private let moreLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        addSubviews(titleLabel, moreLabel)
    }
    
    private func setStyle() {
        titleLabel.do {
            $0.font = .pretendard(.bodySb15)
            $0.textColor = .black
            $0.text = "아우터"
        }
        
        moreLabel.do {
            $0.font = .pretendard(.captionR12)
            $0.text = "더보기"
            $0.textColor = .black
        }
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(9)
            $0.centerY.equalToSuperview()
        }
        
        moreLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().inset(9)
            $0.centerY.equalToSuperview()
        }
    }
}

extension CategoryHeaderView {
    func bind(with title: String) {
        self.titleLabel.text = title
    }
}
