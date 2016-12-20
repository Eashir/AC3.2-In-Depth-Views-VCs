//
//  LazyView.swift
//  ProgrammaticErrthang
//
//  Created by Eashir Arafat on 12/20/16.
//  Copyright © 2016 Evan. All rights reserved.
//

import UIKit

class LazyView: UIView {
    
    //Custom views always need frame and coder
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("\n\n\n ********** Init'd with frame ************")
        
        self.backgroundColor = self.randomColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func randomColor() -> UIColor {
        let r = CGFloat(arc4random_uniform(254))
        let g = CGFloat(arc4random_uniform(254))
        let b = CGFloat(arc4random_uniform(254))
        
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1.0)
        
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
