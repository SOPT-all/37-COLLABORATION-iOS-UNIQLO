//
//  SizeInfoCell.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이상수 on 11/21/25.
//

import UIKit

import SnapKit
import Then

final class SizeInfoCell: UITableViewCell {
    
    private let titleLabel = UILabel()
    private let stack = UIStackView()
    private let views: [UIView]

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.views = Composer().compose()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setStyle()
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setStyle() {
        titleLabel.do {
            $0.font = .pretendard(.titleR20)
            $0.textColor = .black
            $0.text = "사이즈 안내"
        }

        stack.do {
            $0.spacing = 10
            $0.axis = .vertical
        }
    }

    private func setUI() {
        addSubview(titleLabel)
        addSubview(stack)

        for (index, view) in views.enumerated() {
            stack.addArrangedSubview(view)
            
            if index < views.count - 1 {
                stack.addArrangedSubview(UnderLineView())
            }
        }
    }

    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30)
            $0.leading.equalToSuperview().inset(16)
        }
        
        stack.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(30)
        }
    }

}

extension SizeInfoCell {

    struct Composer {}

}

extension SizeInfoCell.Composer {
    
    func compose() -> [UIView] {
        [
            size(),
            guide(),
            assistant(),
            styling()
        ]
    }
    
    private func size() -> BaseSizeView {
        let model = BaseSizeView.Model(
            icon: .size1,
            title: "사이즈 차트",
            subTitle: "제품을 구매하기 전, 이전에 구매했던 제품의 사이즈와 비교해 보세요."
        )
        return BaseSizeView(model: model)
    }
    
    private func guide() -> BaseSizeView {
        let model = BaseSizeView.Model(
            icon: .size2,
            title: "신장별 착용 가이드",
            subTitle: "신장에 따른 제품의 전체 길이를 확인해 보세요."
        )
        return BaseSizeView(model: model)
    }
    
    private func assistant() -> BaseSizeView {
        let model = BaseSizeView.Model(
            icon: .size3,
            title: "마이 사이즈 어시스트",
            subTitle: "치수를 간단히 입력하거나 카메라 캡처를 통해 권장 사이즈를 확인해 보세요."
        )
        return BaseSizeView(model: model)
    }
    
    private func styling() -> BaseSizeView {
        let model = BaseSizeView.Model(
            icon: .size4,
            title: "신장별 스타일링",
            subTitle: "나와 비슷한 체형의 고객이 착용한 사이즈를 확인해 보세요."
        )
        return BaseSizeView(model: model)
    }
    
}
