//
//  BaseSizeView.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이상수 on 11/22/25.
//

import UIKit

import SnapKit
import Then

final class BaseSizeView: BaseView {
    
    private let iconView = UIImageView()
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let detailButton = UIButton()
    
    init(viewModel: ViewModel) {
        super.init(frame: .zero)
        configure(viewModel: viewModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setStyle() {
        titleLabel.do {
            $0.font = .pretendard(.captionSb11)
            $0.textColor = .black
        }
        
        subTitleLabel.do {
            $0.font = .pretendard(.captionL11)
            $0.textColor = .black
            $0.numberOfLines = 0
        }

        detailButton.do {
            $0.setImage(.move, for: .normal)
        }
    }

    override func setUI() {
        addSubviews(
            iconView,
            titleLabel,
            subTitleLabel,
            detailButton
        )
    }
    
    override func setLayout() {
        iconView.snp.makeConstraints {
            $0.verticalEdges.leading.equalToSuperview()
            $0.width.equalTo(66)
            $0.height.equalTo(64)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(5)
            $0.leading.equalTo(iconView.snp.trailing).offset(10)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(2)
            $0.leading.equalTo(iconView.snp.trailing).offset(10)
            $0.trailing.equalTo(detailButton.snp.leading).offset(-42)
        }
        
        detailButton.snp.makeConstraints {
            $0.size.equalTo(22)
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }

    func configure(viewModel: ViewModel) {
        iconView.image = viewModel.icon
        titleLabel.text = viewModel.title
        subTitleLabel.text = viewModel.subTitle
        subTitleLabel.setTextWithLineHeight(
            viewModel.subTitle,
            lineHeight: subTitleLabel.font.pointSize,
            indent: false
        )
    }

}

extension BaseSizeView {
    
    struct ViewModel {
        let icon: UIImage
        let title: String
        let subTitle: String
    }
    
}
