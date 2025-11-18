//
//  CustomTabBarView.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이나연 on 11/17/25.
//

import UIKit

final class CustomTabBarView: BaseView {
    
    var onTabSelected: ((Int) -> (Void))?
    
    private let stackView = UIStackView()
    
    private var tabBarItems: [TabBarItemStyle] = [.home, .category, .wishlist, .mypage]
    private var tabContainers: [TabBarItemView] = []

    override func setUI() {
        addSubviews(stackView)
    }
    
    override func setStyle() {
        backgroundColor = .white
        
        stackView.do {
            $0.axis = .horizontal
            $0.distribution = .fillEqually
            $0.alignment = .center
        }
        
        tabBarItems.enumerated().forEach { index, item in
            let tabItem = makeTabBarItem(image: item.normalImage, title: item.title)
            let container = tabItem.container
            container.tag = index
            container.isUserInteractionEnabled = true      

            let tap = UITapGestureRecognizer(target: self, action: #selector(tabDidTap(_:)))
            container.addGestureRecognizer(tap)
            
            tabContainers.append(tabItem)
            stackView.addArrangedSubview(container)
        }
    }
    
    override func setLayout() {
        self.snp.makeConstraints {
            $0.height.equalTo(84)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(38)
        }
    }

    override func layoutSubviews() {
        print(self.frame)
    }
    
    private func makeTabBarItem(image: UIImage, title: String) -> TabBarItemView {
        let image = UIImageView(image: image)
        let titleLabel = UILabel()
        
        image.contentMode = .scaleAspectFit
        image.snp.makeConstraints {
            $0.width.height.equalTo(14)
        }
        
        titleLabel.do {
            $0.text = title
            $0.font = .pretendard(.captionR9)
            $0.textColor = .gray400
            $0.textAlignment = .center
        }
        
        let stackView = UIStackView()
        stackView.addArrangedSubviews(image, titleLabel)
        
        let container = UIView()
        container.addSubview(stackView)
        
        stackView.do {
            $0.axis = .vertical
            $0.spacing = 7
        }
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        return TabBarItemView(container: container, imageView: image, titleLabel: titleLabel)
    }
}

extension CustomTabBarView {
    @objc
    private func tabDidTap(_ sender: UITapGestureRecognizer) {
        guard let index = sender.view?.tag else { return }
        onTabSelected?(index)
    }
    
    func updateUI(selectedIndex: Int) {
        tabBarItems.enumerated().forEach { index, item in
            let tabItem = tabContainers[index]
            
            let isSelected = (index == selectedIndex)
            tabItem.imageView.image = isSelected ? item.selectedImage : item.normalImage
            tabItem.titleLabel.textColor = isSelected ? .black : .gray400
        }
    }
}
