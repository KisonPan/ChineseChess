//
//  LayoutPartner.swift
//  ChineseChess
//
//  Created by 李夙璃 on 2017/10/14.
//  Copyright © 2017年 StarLab. All rights reserved.
//

import UIKit

class LayoutPartner: NSObject {

	private static let safeAreaOrigin: CGPoint = {
		if #available(iOS 11.0, *) {
			return UIApplication.shared.windows.first?.safeAreaLayoutGuide.layoutFrame.origin ?? UIScreen.main.bounds.origin
		}
		return UIScreen.main.bounds.origin
	}()
	
	private static let safeAreaSize: CGSize = {
		if #available(iOS 11.0, *) {
			return UIApplication.shared.windows.first?.safeAreaLayoutGuide.layoutFrame.size ?? UIScreen.main.bounds.size
		}
		return UIScreen.main.bounds.size
	}()
	
	private static let scale: CGFloat = LayoutPartner.safeAreaSize.width / 320.0

	public static let topToSafeArea: CGFloat = {
		return LayoutPartner.safeAreaOrigin.y
	}()
	
	public static let bottomToSafeArea: CGFloat = {
		return UIScreen.main.bounds.size.height - LayoutPartner.safeAreaOrigin.y - LayoutPartner.safeAreaSize.height
	}()
	
	public static let hasSafeArea: Bool = {
		return LayoutPartner.topToSafeArea != 0.0
	}()
	
}

// MARK: - HomeVC
extension LayoutPartner {
	public struct HomeVC {
		public var buttonSize: CGSize = CGSize(width: 130.0, height: 40.0)
		public var buttonCordins: CGFloat = 6.0
		public var buttonTitleFontSize: CGFloat = 20.0
		public var buttonSpace: CGFloat = 20.0
		
		public var titleViewSize: CGSize = CGSize.zero
		public var titleViewSpace: CGFloat = 45.0
		
		init() {
			self.buttonSize.width *= LayoutPartner.scale
			self.buttonSize.height *= LayoutPartner.scale
			self.buttonCordins *= LayoutPartner.scale
			self.buttonTitleFontSize *= LayoutPartner.scale
			self.buttonSpace *= LayoutPartner.scale
			
			self.titleViewSize.width = LayoutPartner.safeAreaSize.width * Macro.UI.goldenScale
			self.titleViewSize.height = self.titleViewSize.width * 0.25
			self.titleViewSpace *= LayoutPartner.scale
		}
	}
}

// MARK: - ChessBoard
extension LayoutPartner {
	public struct ChessBoard {
		public var basePoint: CGPoint = CGPoint.zero
		public var gridSize: CGFloat = 0.0
		public var chessSize: CGFloat = 0.0
		public var boardmargin: CGFloat = 0.0
				
		init() {
			switch LayoutPartner.safeAreaSize.height {
			case 568.0:
				self.basePoint = CGPoint(x: 19.0, y: 34.5)
				self.gridSize = 35.3
				self.chessSize = 36
				self.boardmargin = 13.0
				
			case 667.0, 734.0:
				self.basePoint = CGPoint(x: 21.5, y: 40)
				self.gridSize = 41.55
				self.chessSize = 42
				self.boardmargin = 14.5
				
			case 736.0:
				self.basePoint = CGPoint(x: 24.33, y: 45)
				self.gridSize = 45.76
				self.chessSize = 46
				self.boardmargin = 16.7
				
			default:
				break
			}
		}
	}
}

// MARK: - ChessVC
extension LayoutPartner {
	public struct ChessVC {
		public var buttonSize: CGSize = CGSize.zero
		public var buttonTitleFontSize: CGFloat = 19.0
		public var buttonCordins: CGFloat = 0.0
		
		public var sideSize: CGSize = CGSize.zero
		public var nicknameFontSize: CGFloat = 12.0
		
		init() {
			self.buttonSize.width = (LayoutPartner.safeAreaSize.width - 5 * ChessBoard().boardmargin) / (3 + Macro.UI.goldenScale)
			self.buttonSize.height = self.buttonSize.width * Macro.UI.goldenScale
			self.buttonTitleFontSize *= LayoutPartner.scale
			self.buttonCordins = self.buttonSize.height * 0.15
			
			self.sideSize.width = self.buttonSize.height
			self.sideSize.height = self.buttonSize.height
			self.nicknameFontSize *= LayoutPartner.scale
		}
	}
}
