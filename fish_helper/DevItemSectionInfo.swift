//
//  DevItemSectionInfo.swift
//  fish_helper
//
//  Created by 王少兰 on 16/5/13.
//  Copyright © 2016年 洪远洋. All rights reserved.
//

import Foundation

// 定义了分节表头的一系列属性、方法
class DevItemSectionInfo: NSObject {
    var open: Bool!
    var play: Group!
    var headerView: DevSectionHeaderView!
    
    var rowHeights = NSMutableArray()
    
    func countOfRowHeights() -> Int {
        return self.rowHeights.count
    }
    
    func objectInRowHeightsAtIndex(idx: Int) -> AnyObject {
        return self.rowHeights[idx]
    }
    
    func insertObject(anObject: AnyObject, inRowHeightsAtIndex: Int) {
        self.rowHeights.insertObject(anObject, atIndex: inRowHeightsAtIndex)
    }
    
    func insertRowHeights(rowHeightArray: NSArray, atIndexes: NSIndexSet) {
        self.rowHeights.insertObjects(rowHeightArray as [AnyObject], atIndexes: atIndexes)
    }
    
    func removeObjectFromRowHeightsAtIndex(idx: Int) {
        self.rowHeights.removeObjectAtIndex(idx)
    }
    
    func removeRowHeightsAtIndexes(indexes: NSIndexSet) {
        self.rowHeights.removeObjectsAtIndexes(indexes)
    }
    
    func replaceObjectInRowHeightsAtIndex(idx: Int, withObject: AnyObject) {
        self.rowHeights[idx] = withObject
    }
    
    func replaceRowHeightsAtIndexes(indexes: NSIndexSet, withRowHeight: NSArray) {
        self.rowHeights.replaceObjectsAtIndexes(indexes, withObjects: withRowHeight as [AnyObject])
    }
}