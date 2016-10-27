//
//  FZHCollectionViewLayout.swift
//  06-UICollectionView
//
//  Created by 冯志浩 on 16/10/27.
//  Copyright © 2016年 FZH. All rights reserved.
//

import UIKit

class FZHCollectionViewLayout: UICollectionViewLayout {
    let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    //section
    var numberOfSections = 0
    //section cell
    var numberOfCellsInSections = 0
    //column
    var columnCount = 0
    //cell padding
    var padding = 0
    //cell min height
    var cellMinHeight = 0
    //cell max height
    var cellMaxHeight = 0
    //cell width
    var cellWidth = 0
    //cell x
    var cellXArray: NSMutableArray = []
    //存储每个cell的随机高度，避免每次加载的随机高度都不同
    var cellHeightArray: NSMutableArray = []
    //记录每列Cell的最新Cell的Y坐标
    var cellYArray: NSMutableArray = []
    
    /**
     * 该方法是预加载layout, 只会被执行一次
     */
    override func prepare() {
        super.prepare()
        
        initData()
        initCellWidth()
        initCellHeight()
    }
    /**
     * 该方法返回CollectionView的ContentSize的大小
     */
    override var collectionViewContentSize: CGSize {
        let height = maxCellYArray(array: cellYArray)
        return CGSize(width: SCREEN_WIDTH, height: height)
    }
    
    /**
     * 该方法为每个Cell绑定一个Layout属性~
     */
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        initCellYArray()
    
        var array: [UICollectionViewLayoutAttributes] = [UICollectionViewLayoutAttributes]()
        for index in 0..<numberOfCellsInSections {
            let indexPath = IndexPath.init(item: index, section: 0)
            let attributes = layoutAttributesForItem(at: indexPath)
            array.append(attributes!)
        }
        return array
    }
    
    /**
     * 该方法为每个Cell绑定一个Layout属性~
     */
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = UICollectionViewLayoutAttributes.init(forCellWith: indexPath)
        var frame:CGRect = .zero
        let cellHeight = cellHeightArray[indexPath.row] as! CGFloat
        let minYIndex = minCellYArray(array: cellYArray)
        let tempX: CGFloat = cellXArray[Int(minYIndex)] as! CGFloat
        let tempY: CGFloat = cellYArray[Int(minYIndex)] as! CGFloat
        frame = CGRect(x: tempX, y: tempY, width: CGFloat(cellWidth), height: cellHeight)
        //更新相应的Y坐标
        cellYArray[Int(minYIndex)] = tempY + cellHeight + CGFloat(padding)
        //计算每个Cell的位置
        attributes.frame = frame
        return attributes
    }
    
     //初始化相关数据
    func initData() -> Void {
        numberOfSections = (collectionView?.numberOfSections)!
        numberOfCellsInSections = (collectionView?.numberOfItems(inSection: 0))!
        columnCount = 3
        padding = 2
        cellMinHeight = 100
        cellMaxHeight = 200
    }
    /**
     * 根据Cell的列数求出Cell的宽度
     */
    func initCellWidth() -> Void {
        //计算每个Cell的宽度
        cellWidth = (Int(SCREEN_WIDTH) - (columnCount - 1) * padding) / columnCount
        //为每个Cell计算X坐标
        cellXArray = NSMutableArray.init(capacity: columnCount)
        for index in 0..<columnCount {
            let tempX = index * (cellWidth + padding)
            cellXArray.add(tempX)
        }
    }
    
    /**
     * 初始化每列Cell的Y轴坐标
     */
    func initCellYArray() -> Void {
        cellYArray = NSMutableArray.init(capacity: columnCount)
        for index in 0..<columnCount {
            cellYArray[index] = 0
        }
    }
    
    /**
     * 随机生成Cell的高度
     */
    func initCellHeight() -> Void {
        cellHeightArray = NSMutableArray.init(capacity: numberOfCellsInSections)
        for _ in 0..<numberOfCellsInSections {
            let cellHeight = Int(arc4random() % 100) + cellMinHeight
            cellHeightArray.add(cellHeight)
        }
    }
    
    /**
     * 求CellY数组中的最大值并返回
     */

    func maxCellYArray(array: NSMutableArray) -> CGFloat {
        if array.count == 0 {
            return 0
        }
        var max = array[0] as! CGFloat
        for index in 0..<array.count {
            let temp = array[index] as! CGFloat
            if max < temp {
                max = temp
            }
        }
        return max
    }
    
    /**
     * 求CellY数组中的最小值的索引
     */
    func minCellYArray(array: NSMutableArray) -> CGFloat {
        if array.count == 0 {
            return 0
        }
        
        var minIndex: CGFloat = 0
        var min = array[0] as! CGFloat
        for index in 0..<array.count {
            let temp = array[index] as! CGFloat
            if min > temp {
                min = temp
                minIndex = CGFloat(index)
            }
            
        }
        return minIndex
    }
   
}
