//
//  CustomerCorner.swift
//  Slider UI
//
//  Created by Rasul Mammadov on 03.02.22.
//

import SwiftUI

struct CustomerCorner: Shape {

    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    
    }
    
}

