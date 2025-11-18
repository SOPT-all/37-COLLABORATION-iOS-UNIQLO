//
//  CategoryTab.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 정윤아 on 11/18/25.
//
import UIKit
import SnapKit

enum CategoryTab: String, CaseIterable {
    case lightPadding
    case parkaFleece
    case jacket
    case coat
    case padding
    
    var categoryName: String {
        switch self {
        case .lightPadding: return "경량 패딩(PUFFTECH)"
        case .parkaFleece: return "파카&블루종&후리스"
        case .jacket: return "재킷&블레이저"
        case .coat: return "코트"
        case .padding: return "다운&패딩"
        }
    }
}

final class CategoryTabCell: UICollectionViewCell {
    static let identifier: String = "CategoryTabCell"
    
    // MARK: - UI
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .reddit(.captionM12)
        label.textColor = .gray400
        label.textAlignment = .center
        return label
    }()
    
    private let underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.isHidden = true
        return view
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    private func setupUI() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(underlineView)
    }
    
    private func setupLayout() {
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.horizontalEdges.equalToSuperview()
        }
        
        underlineView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    // MARK: - Configure
    
    func configure(with tab: CategoryTab) {
        nameLabel.text = tab.categoryName
    }
    
    override var isSelected: Bool {
            didSet {
                nameLabel.textColor = isSelected ? .black : .gray400
                underlineView.isHidden = !isSelected
            }
        }
}
