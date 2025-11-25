//
//  ItemCell.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 정윤아 on 11/20/25.
//

import UIKit

import SnapKit
import Then
import Kingfisher

final class ItemCell: UICollectionViewCell {
    
    // MARK: - UI
    
    private let itemImage = UIImageView()
    private let colorChipView = UIView()
    private let colorChipStackView = UIStackView()
    private let genderSizeLabel = UILabel()
    private let itemNameLabel = UILabel()
    private let originalPriceLabel = UILabel()
    private let salePriceLabel = UILabel()
    private var priceStackView = UIStackView()
    private let tagLabel = UILabel()
    private let starImageView = UIImageView(image: UIImage(named: "star_filled"))
    private let ratingLabel = UILabel()
    private let reviewCountLabel = UILabel()
    private var ratingStackView = UIStackView()
    private let likeButton = UIButton()
    private var infoStackView = UIStackView()
    private let bottomWhiteView = UIView()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        contentView.backgroundColor = .white
        
        contentView.addSubview(itemImage)
        contentView.addSubview(bottomWhiteView)
        
        priceStackView.addArrangedSubviews(originalPriceLabel, salePriceLabel)
        ratingStackView.addArrangedSubviews(starImageView, ratingLabel, reviewCountLabel)
        infoStackView.addArrangedSubviews(colorChipStackView, genderSizeLabel, itemNameLabel, priceStackView, tagLabel, ratingStackView)
        
        bottomWhiteView.addSubview(infoStackView)
        bottomWhiteView.addSubview(likeButton)
    }
    
    private func setStyle() {
        itemImage.do {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
        
        colorChipStackView.do {
            $0.axis = .horizontal
            $0.spacing = 6
            $0.alignment = .center
            $0.distribution = .fill
        }
        
        genderSizeLabel.do {
            $0.font = .pretendard(.captionL12)
            $0.textColor = .gray300
        }
        
        itemNameLabel.do {
            $0.font = .pretendard(.captionL12)
            $0.textColor = .gray900
        }
        
        originalPriceLabel.do {
            $0.font = .pretendard(.titleL16)
            $0.textColor = .gray900
        }
        
        salePriceLabel.do {
            $0.font = .pretendard(.titleM18)
            $0.textColor = .redBrand
        }
        
        priceStackView.do {
            $0.axis = .horizontal
            $0.spacing = 6
            $0.alignment = .firstBaseline
            $0.distribution = .fill
        }
        
        tagLabel.do {
            $0.font = .pretendard(.captionL11)
            $0.textColor = .gray600
        }
        
        ratingLabel.do {
            $0.font = .pretendard(.captionL11)
            $0.textColor = .black
        }
        
        reviewCountLabel.do {
            $0.font = .pretendard(.captionR9)
            $0.textColor = .gray600
        }
        
        ratingStackView.do {
            $0.axis = .horizontal
            $0.spacing = 2
            $0.alignment = .center
            $0.distribution = .fill
        }
        
        likeButton.do {
            $0.setImage(UIImage(named: "heart_filled"), for: .selected)
            $0.setImage(UIImage(named: "heart_default"), for: .normal)
            $0.addTarget(self, action: #selector(didTapLikeButton), for: .touchUpInside)
        }
        
        infoStackView.do {
            $0.axis = .vertical
            $0.alignment = .leading
        }
        
        bottomWhiteView.do {
            $0.backgroundColor = .white
        }
    }
    
    private func setLayout() {
        itemImage.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(252)
        }
        
        bottomWhiteView.snp.makeConstraints {
            $0.top.equalTo(itemImage.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        starImageView.snp.makeConstraints {
                $0.height.width.equalTo(20)
            }
        
        infoStackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(10)
            $0.top.equalToSuperview().inset(14)
        }
        
        ratingLabel.snp.makeConstraints {
            $0.width.equalTo(17)
        }
        
        likeButton.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(10)
        }
        
        infoStackView.setCustomSpacing(10, after: colorChipStackView)
        infoStackView.setCustomSpacing(4, after: genderSizeLabel)
        infoStackView.setCustomSpacing(4, after: itemNameLabel)
        infoStackView.setCustomSpacing(0, after: priceStackView)
        infoStackView.setCustomSpacing(4, after: tagLabel)
        
        ratingStackView.setCustomSpacing(4, after: starImageView)
        ratingStackView.setCustomSpacing(3, after: ratingLabel)
    }
    
    @objc
    private func didTapLikeButton() {
        likeButton.isSelected.toggle()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        colorChipStackView.arrangedSubviews.forEach {
            colorChipStackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
        
        likeButton.isSelected = false
    }
    
    func configure(with item: Item) {
        if let url = URL(string: item.imageUrl) {
            itemImage.kf.setImage(with: url)
        } else {
            itemImage.image = UIImage(named: item.imageUrl)
        }
        
        if item.colors.isEmpty {
            colorChipStackView.isHidden = true
        } else {
            colorChipStackView.isHidden = false
            item.colors.forEach { hex in
                if let color = UIColor(hexString: hex) {
                    let chip = ColorChipView(color: color)
                    colorChipStackView.addArrangedSubview(chip)
                }
            }
        }
        
        genderSizeLabel.text = "\(item.gender), \(item.size)"
        
        itemNameLabel.text = item.itemName
        
        configurePrice(original: item.originalPrice, sale: item.salePrice)
        
        if let tag = item.tagText, !tag.trimmingCharacters(in: .whitespaces).isEmpty {
            tagLabel.isHidden = false
            tagLabel.text = item.tagText
        } else {
            tagLabel.isHidden = true
        }
        
        ratingLabel.text = String(format: "%.1f", item.rating)
        reviewCountLabel.text = "(\(item.reviewCount))"
    }
    
    private func configurePrice(original: Int, sale: Int?) {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        let originalString = formatter.string(from: NSNumber(value: original)) ?? "\(original)"
        
        if let sale = sale, sale < original {
            
            let originalAttr = NSAttributedString(
                string: "\(originalString)원",
                attributes: [
                    .strikethroughStyle: NSUnderlineStyle.single.rawValue,
                    .foregroundColor: UIColor.gray400
                ]
            )
            originalPriceLabel.attributedText = originalAttr
            originalPriceLabel.isHidden = false
            
            let saleString = formatter.string(from: NSNumber(value: sale)) ?? "\(sale)"
            salePriceLabel.text = "\(saleString)원"
            salePriceLabel.textColor = .redBrand
            salePriceLabel.isHidden = false
            
        } else {
            originalPriceLabel.attributedText = nil
            originalPriceLabel.text = "\(originalString)원"
            originalPriceLabel.textColor = .gray900
            originalPriceLabel.isHidden = false
            
            salePriceLabel.isHidden = true
        }
    }
}
