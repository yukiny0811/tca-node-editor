//
//  CGSize+.swift
//  TCATest
//
//  Created by クワシマ・ユウキ on 2022/09/05.
//

import Foundation

extension CGSize {
    func toCGPoint() -> CGPoint {
        return CGPoint(x: self.width, y: self.height)
    }
}
