//
//  FoldAnimateView.swift
//  SwiftUI.Hacking
//
//  Created by ghost on 2023/6/14.
//  Copyright © 2023 Yuan. All rights reserved.
//

import UIKit
import Foundation

class FoldAnimationView: UIView {
    //MARK: 公共 -------------------
    // 字体大小
    var font: UIFont = UIFont.boldSystemFont(ofSize: 50) {
        didSet {
            currentLabel.font   = font
            nextLabel.font      = font
            animationLabel.font = font
        }
    }
    // 字体颜色
    var textColor: UIColor = .black {
        didSet {
            currentLabel.textColor   = textColor
            nextLabel.textColor      = textColor
            animationLabel.textColor = textColor
        }
    }
    
    var backColor: UIColor = .lightGray {
        didSet {
            currentLabel.backgroundColor   = backColor
            nextLabel.backgroundColor      = backColor
            animationLabel.backgroundColor = backColor
        }
    }
    
    // 提供一个开始动画的方法
    func fold(current: String, next: String) {
        currentLabel.text         = current
        animationLabel.text       = current
        nextLabel.text            = next
        nextLabel.layer.transform = setupStartRotate()
        nextLabel.isHidden        = true
        animateProgress           = 0.0
        startAnimation()
    }
    
    //MARK: 私有 -------------------
    // 当前显示的
    private var currentLabel   : UILabel!
    // 下一个显示的
    private var nextLabel      : UILabel!
    // 动画的
    private var animationLabel : UILabel!
    // 刷新
    private var link           : CADisplayLink!
    // 默认起始翻转的角度
    private let kStartRotate             = 0.01
    // 每次刷新动画的进度(以60帧为例，动画执行时间0.5s，即每次刷新动画执行2/60进度)
    private let kAnimateValue  : CGFloat = 2/60.0
    // 动画执行进度
    private var animateProgress          = 0.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        currentLabel = setupLabel()
        addSubview(currentLabel)
        
        nextLabel = setupLabel()
        nextLabel.isHidden = true
        nextLabel.layer.transform = setupStartRotate()
        addSubview(nextLabel)
        
        animationLabel = setupLabel()
        addSubview(animationLabel)
        
        link = CADisplayLink(target: self, selector: #selector(displayUpdate))
        // 设置每秒执行帧数: 1s执行60次
        link.preferredFramesPerSecond = 60
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        currentLabel.frame   = self.bounds
        nextLabel.frame      = self.bounds
        animationLabel.frame = self.bounds
    }
    
    deinit {
        link.invalidate()
    }
}

extension FoldAnimationView {
    
    // 设置label
    func setupLabel() -> UILabel {
        let label = UILabel()
        label.font = font
        label.textColor = textColor
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.backgroundColor = backColor
        return label
    }
    
    // 设置默认的X轴起始角度翻转，为了能够只显示上半部分，下半部分被隐藏（zPosition不改动的情况下）
    func setupStartRotate() -> CATransform3D {
        var transform = CATransform3DIdentity
        transform.m34 = CGFLOAT_MIN
        transform     = CATransform3DRotate(transform, .pi*kStartRotate, -1, 0, 0)
        return transform
    }
    
    // 开始动画
    func startAnimation() {
        link.add(to: .main, forMode: .common)
    }
    
    // 停止动画
    func stopAnimation() {
        link.remove(from: .main, forMode: .common)
    }
    
    // 刷新
    @objc func displayUpdate() {
        /// 进度增加
        animateProgress += kAnimateValue
        // print("progress: \(animateProgress)")
        if animateProgress >= 1 { // 结束
            stopAnimation()
            return
        }
        var t = CATransform3DIdentity
        t.m34 = CGFLOAT_MIN
        // X轴进行翻转: -1 与 1代表的分别是X轴负正方向的旋转
        t = CATransform3DRotate(t, .pi*animateProgress, -1, 0, 0)
        // 翻转进度至0.5的时，即和屏幕垂直时，翻转y和z轴,切换文字
        if animateProgress >= 0.5 {
            t = CATransform3DRotate(t, .pi, 0, 0, 1);
            t = CATransform3DRotate(t, .pi, 0, 1, 0);
            animationLabel.text = nextLabel.text
        } else {
            animationLabel.text = currentLabel.text
        }
        animationLabel.layer.transform = t
        // 翻转到起始角度隐藏，显示next
        nextLabel.isHidden = animateProgress <= kStartRotate
    }
}

