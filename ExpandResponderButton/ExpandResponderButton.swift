//
//  ExpandResponderButton.swift
//  ParaMe
//
//  Created by lbe on 2019/7/26.
//  Copyright © 2019 meet tech. All rights reserved.
//

import UIKit

class ExpandResponderButton: UIButton {

    fileprivate var expandWidth:CGFloat = 44
    fileprivate var expandHeight:CGFloat = 44
    
    func expandResponderSize(_ size:CGSize) {
        self.expandWidth = size.width
        self.expandHeight = size.height
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        var bounds = self.bounds
        
        let widthDelta = self.expandWidth > bounds.size.width ? self.expandWidth - bounds.size.width : 0
        let heightDelta = self.expandHeight > bounds.size.height ? self.expandHeight - bounds.size.height : 0
        
        bounds = bounds.insetBy(dx: -widthDelta*0.5, dy: -heightDelta*0.5)
        return bounds.contains(point)
    }
    
    override var isEnabled: Bool {
        didSet {
            if self.isEnabled {
                self.alpha = 1
            } else {
                self.alpha = 0.4
            }
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            if self.isHighlighted {
                self.alpha = 0.4
            } else {
                self.alpha = 1
            }
        }
    }

}

class ToolOpaqueButton: ExpandResponderButton {
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                self.alpha = 0.3
            } else {
                self.alpha = 1
            }
        }
    }
}
