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
        
        ttt = TestView()
        ttt.translatesAutoresizingMaskIntoConstraints = false //没有这句能运行，但结果是不显示约束视图
//        self.view.addSubview(ttt) 加到根视图会报错 The view hierarchy is not prepared for the constraint:
        baseView.addSubview(ttt)
        
        
//        When added to a view, the constraint's items must be descendants of that view (or the view itself). This will crash if the constraint needs to be resolved before the view hierarchy is assembled. Break on 
        //当约束添加到视图时，约束项必须是该视图的子视图（或自身）。如果在视图层次机构组装之前添加约束将导致崩溃。
        
        // 翻译成人话：
        //1、约束前要先添加到父类确定层级关系。
        //1、可以自己约束自己（比如定义宽高值）
        //2、或由父类约束,
        //3、不能由子视图约束到父视图。
        
        //高度约束
//        let height:NSLayoutConstraint = NSLayoutConstraint(item: ttt, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: baseView, attribute: NSLayoutAttribute.height, multiplier: 0.4, constant: 0)
//        baseView.addConstraint(height)////父控件添加约束
        
        let height:NSLayoutConstraint = NSLayoutConstraint(item: ttt, attribute: NSLayoutAttribute.height, relatedBy:NSLayoutRelation.equal, toItem:nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier:0.0, constant:100)
        ttt.addConstraint(height)//自己添加约束(不能约束到父视图，只能约束自身)

        
        //左边约束
        let left:NSLayoutConstraint = NSLayoutConstraint(item: ttt, attribute: NSLayoutAttribute.left, relatedBy:NSLayoutRelation.equal, toItem:baseView, attribute:NSLayoutAttribute.left, multiplier:1.0, constant: 0)
        
        baseView.addConstraint(left)//父控件添加约束
        
        //右边约束
        let right:NSLayoutConstraint = NSLayoutConstraint(item: ttt, attribute: NSLayoutAttribute.right, relatedBy:NSLayoutRelation.equal, toItem:baseView, attribute:NSLayoutAttribute.right, multiplier:1.0, constant: 0)
        
        baseView.addConstraint(right)//父控件添加约束
        
        //下边约束
        let top:NSLayoutConstraint = NSLayoutConstraint(item: ttt, attribute: NSLayoutAttribute.top, relatedBy:NSLayoutRelation.equal, toItem:baseView, attribute:NSLayoutAttribute.top, multiplier:1.0, constant: 10)
        
        baseView.addConstraint(top)//父控件添加约束
        



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


