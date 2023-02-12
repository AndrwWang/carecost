//
//  CCBarButtonItem.swift
//  CareCost
//
//  Created by Frank Gao on 2/12/23.
//

import Foundation
import UIKit

class CCBarButtonItem: UIBarButtonItem {
    init(selector: Selector, target: UIViewController) {
        super.init()
        
        let backButton = UIButton()
        backButton.setImage(UIImage(named: "back.png"), for: .normal)
        
        backButton.setBackgroundColor(color: Theme.BUTTON_BACKGROUND_COLOR!, forState: .normal)
        backButton.layer.cornerRadius = Theme.CORNER_RADIUS / 2
        
        backButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        backButton.widthAnchor.constraint(equalToConstant: Theme.SCREEN_WIDTH / 7).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: Theme.SCREEN_WIDTH / 12).isActive = true
        backButton.addTarget(target, action: selector, for: .touchUpInside)
        customView = backButton
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
