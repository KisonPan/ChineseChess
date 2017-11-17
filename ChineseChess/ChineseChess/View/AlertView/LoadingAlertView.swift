//
//  LoadingAlertView.swift
//  ChineseChess
//
//  Created by 李夙璃 on 2017/10/16.
//  Copyright © 2017年 StarLab. All rights reserved.
//

import UIKit

protocol LoadingAlertViewDelegate {
	func loadingAlertViewDidDisappear(view: LoadingAlertView)
}

class LoadingAlertView: UIView {

	private static let shared: LoadingAlertView = LoadingAlertView(frame: CGRect.zero)
	
	private weak var loading: UIImageView? = nil
	private weak var titleLabel: UILabel? = nil
	private weak var closeView: UIView? = nil
	
	private var delegate: LoadingAlertViewDelegate? = nil
	
	// Layout
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = UIColor.black
		
		if let close = ResourcesProvider.shared.image(named: "close") {
			let imageView = UIImageView(image: close)
			imageView.contentMode = .topLeft
			imageView.addTapTarget(self, action: #selector(self.closeAlertView))
			imageView.frame = CGRect(x: 15, y: 15, width: 40, height: 40)
			
			self.closeView = imageView
			self.addSubview(imageView)
		}
		
		guard let loading = ResourcesProvider.shared.image(named: "loading") else { return }
		
		let layout = LayoutPartner.HomeVC()
		
		let imageView = UIImageView(image: loading)
		self.loading = imageView
		self.addSubview(imageView)
		imageView.snp.makeConstraints {
			$0.centerX.equalTo(self)
			$0.centerY.equalTo(self.snp.centerY).offset(-layout.buttonSpace)
			$0.width.equalTo(self.snp.width).multipliedBy(1 - Macro.UI.goldenScale)
			$0.height.equalTo(self.snp.width).multipliedBy(1 - Macro.UI.goldenScale)
		}
	
		let label = UILabel()
		self.titleLabel = label
		label.textColor = UIColor.white
		label.font = UIFont.kaitiFont(ofSize: layout.buttonTitleFontSize)
		label.text = ""
		self.addSubview(label)
		label.snp.makeConstraints {
			$0.centerX.equalTo(self)
			$0.top.equalTo(imageView.snp.bottom).offset(layout.buttonSpace)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private var animation: CABasicAnimation {
		let rotate = CABasicAnimation(keyPath: "transform")
		rotate.fromValue = NSValue(caTransform3D: CATransform3DIdentity)
		rotate.toValue = NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat.pi / 2.0, 0.0, 0.0, 1.0))
		rotate.repeatCount = HUGE
		rotate.isCumulative = true
		rotate.duration = 0.25
		return rotate
	}
	
	@objc private func closeAlertView() {
		self.hide() {
			self.delegate?.loadingAlertViewDidDisappear(view: self)
		}
	}
	
}

// MARK: - Function
extension LoadingAlertView {
	
	public func show(in superview: UIView? = UIApplication.shared.windows.first, message: String? = nil, isCloseButtonHidden: Bool = true, delegate: LoadingAlertViewDelegate? = nil, completion: (() -> Void)? = nil) {
		guard let superview = superview else { return }
		
		self.removeFromSuperview()
		
		self.closeView?.isHidden = isCloseButtonHidden
		self.delegate = delegate
		self.loading?.layer.removeAllAnimations()
		self.loading?.layer.add(self.animation, forKey: "rotate")
		self.titleLabel?.text = message
		
		self.backgroundColor = self.backgroundColor?.withAlphaComponent(0.0)
		
		superview.addSubview(self)
		self.snp.makeConstraints {
			$0.top.equalTo(superview.layout.top)
			$0.left.equalTo(superview.layout.left)
			$0.bottom.equalTo(superview.layout.bottom)
			$0.right.equalTo(superview.layout.right)
		}
		
		UIView.animate(withDuration: Macro.Time.transitionLastTime, animations: {
			self.backgroundColor = self.backgroundColor?.withAlphaComponent(0.5)
		}) { _ in
			completion?()
		}
	}
	
	public func hide(animation: Bool = true, completion: (() -> Void)? = nil) {
		guard animation else {
			self.removeFromSuperview()
			self.loading?.layer.removeAllAnimations()
			completion?()
			return
		}
		
		self.backgroundColor = self.backgroundColor?.withAlphaComponent(0.5)
		UIView.animate(withDuration: Macro.Time.transitionLastTime / 2.0, animations: {
			self.backgroundColor = self.backgroundColor?.withAlphaComponent(0.0)
		}) { _ in
			self.removeFromSuperview()
			self.loading?.layer.removeAllAnimations()
			completion?()
		}
	}
	
}

// MARK: - Static
extension LoadingAlertView {
	
	public class func show(in superview: UIView? = UIApplication.shared.windows.first, message: String? = nil, isCloseButtonHidden: Bool = true, completion: (() -> Void)? = nil) {
		LoadingAlertView.shared.show(in: superview, message: message, isCloseButtonHidden: isCloseButtonHidden, completion: completion)
	}
	
	public class func hide(animation: Bool = true, completion: (() -> Void)? = nil) {
		LoadingAlertView.shared.hide(animation: animation, completion: completion)
	}
	
}
