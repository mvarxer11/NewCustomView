//
//  ViewController.swift
//  CustomView
//
//  Created by mvarxer on 17/2/25.
//  Copyright © 2017年 mvarxer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var baseView: UIView!
    var ttt:TestView! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //纯代码创建TTTView
        ttt = TestView(frame: CGRect(x: 0, y: 10, width: baseView.bounds.width , height: baseView.bounds.height*0.4))
        baseView.addSubview(ttt)
    }
}

@IBDesignable
class TestView:UIView {
    
    
    
    
    override func draw(_ rect: CGRect) {
        print("draw--------------------------")
        print(self.frame)
    }
    
    override func layoutSubviews() {
        print("layoutSubviews--------------")
        print(self.frame)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .yellow
        print("init(frame:---------------")
        print(self.frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = .blue
        print("init?(coder---------------")
        print(self.frame)
    }
    
    
    
}


