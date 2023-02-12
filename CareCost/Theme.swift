//
//  Theme.swift
//  CareCost
//
//  Created by Frank Gao on 2/11/23.
//

import UIKit

class Theme {
    public static let DEFAULT_FONT = "KannadaSangamMN-Bold"
    public static let DEFAULT_TEXT_COLOR = UIColor.black
    
    public static let VIEW_BACKGROUND_COLOR = UIColor(hex: "#E8998DFF")
    
    public static let BUTTON_BACKGROUND_COLOR = UIColor(hex: "#723D46FF")
    public static let BUTTON_TEXT_COLOR = UIColor(hex: "#F4F0BBFF")
    public static let BUTTON_PADDING = CGFloat(10)
    public static let BUTTON_FONT_SIZE = CGFloat(28)
    
    public static let CORNER_RADIUS = CGFloat(20)
    
    // set in WelcomeViewController
    public static var SCREEN_WIDTH: CGFloat = 0
    public static var SCREEN_HEIGHT: CGFloat = 0
    
    public static let LABEL_TEXTFIELD_PADDING: CGFloat = 10
}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
}

extension UIButton {
    
    func setBackgroundColor(color: UIColor, forState: UIControl.State) {
        
        let minimumSize: CGSize = CGSize(width: 1.0, height: 1.0)
        
        UIGraphicsBeginImageContext(minimumSize)
        
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(color.cgColor)
            context.fill(CGRect(origin: .zero, size: minimumSize))
        }
        
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.clipsToBounds = true
        self.setBackgroundImage(colorImage, for: forState)
    }
}
