//
//  SwipeItem.swift
//  Test_Animation_01
//
//  Created by Jeremy Juel on 7/2/15.
//  Copyright (c) 2015 Jeremy Juel. All rights reserved.
//

import UIKit

class SwipeItem: NSObject {
    
    var text: String
    
    enum LikeState {
        case None, Liked, Disliked
    }
    
    var state = LikeState.None
    
    init(text:String, state: Int) {
        self.text = text
    }
    
    func changeState() {        // How do you send info to this from outside of the class? Other classes won't have the same enum available
        
    }
    
}
