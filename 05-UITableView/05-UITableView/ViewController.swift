//
//  ViewController.swift
//  05-UITableView
//
//  Created by 冯志浩 on 16/10/25.
//  Copyright © 2016年 FZH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let tableView = UITableView()
    let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    var dataSource = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()
        setupTableView()
        setupFooterView()
    }
    
    func setupData() {
        for num in 0...5 {
            let person = Person(name: "name\(num)", isSelected: false)
            dataSource.append(person)
        }
    }
    
    func setupTableView() {
        tableView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        tableView.delegate = self
        tableView.dataSource = self
        //隐藏没有数据的空白cell
        tableView.tableFooterView = UIView.init()
        self.view.addSubview(tableView)
    }
    
    func setupFooterView() {
        let footerView = UIView()
        footerView.backgroundColor = UIColor.blue
        footerView.frame = CGRect(x: 0, y: SCREEN_HEIGHT - 100, width: SCREEN_WIDTH, height: 100)
        
        let editBtn = UIButton()
        editBtn.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
        editBtn.tag = 1000
        editBtn.setTitle("编辑", for: .normal)
        editBtn.addTarget(self, action: #selector(btnDidTouch(btn:)), for: .touchUpInside)
        footerView.addSubview(editBtn)
        
        let selectAllBtn = UIButton()
        selectAllBtn.frame = CGRect(x: 80, y: 0, width: 50, height: 30)
        selectAllBtn.tag = 1001
        selectAllBtn.setTitle("全选", for: .normal)
        selectAllBtn.addTarget(self, action: #selector(btnDidTouch(btn:)), for: .touchUpInside)
        footerView.addSubview(selectAllBtn)
        
        let deleteBtn = UIButton()
        deleteBtn.frame = CGRect(x: 150, y: 0, width: 50, height: 30)
        deleteBtn.tag = 1002
        deleteBtn.setTitle("删除", for: .normal)
        deleteBtn.addTarget(self, action: #selector(btnDidTouch(btn:)), for: .touchUpInside)
        footerView.addSubview(deleteBtn)
        
        let cancelBtn = UIButton()
        cancelBtn.frame = CGRect(x: 230, y: 0, width: 50, height: 30)
        cancelBtn.tag = 1003
        cancelBtn.setTitle("取消", for: .normal)
        cancelBtn.addTarget(self, action: #selector(btnDidTouch(btn:)), for: .touchUpInside)
        footerView.addSubview(cancelBtn)
        view.addSubview(footerView)
    }
    //
    @objc func btnDidTouch(btn: UIButton) {
        if btn.tag == 1000 {
            tableView.isEditing = true
            tableView.allowsMultipleSelectionDuringEditing = true
        } else if btn.tag == 1001 {//selectall
            if tableView.isEditing {
                for num in 0..<dataSource.count {
                    dataSource[num].isSelected = true
                    let index = IndexPath(row: num, section: 0)
                    tableView.selectRow(at: index, animated: true, scrollPosition: .none)
                }
            }
        } else if btn.tag == 1002 {//delete
            //
            let selectArray = tableView.indexPathsForSelectedRows
          
            if selectArray != nil {
//                for indexPath in selectArray!.reversed() {
//                    dataSource.remove(at: indexPath.row)
//                }
                dataSource.removeAll { $0.isSelected }
                tableView.reloadData()
            }
            
        } else {//cancel
            tableView.isEditing = false
            tableView.allowsMultipleSelectionDuringEditing = false
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    //MARK: UITableViewDataSource
    private func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FZHTableViewCell.init(style: .default, reuseIdentifier: "FZHTableViewCell")
        cell.titleLabel.text = dataSource[indexPath.row].name
        return cell
    }
    //MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    //是否可编辑
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    //接受的编辑类型
    internal func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        //此返回值对应左划删除
        //        return .delete
        return UITableViewCell.EditingStyle(rawValue: UITableViewCell.EditingStyle.insert.rawValue | UITableViewCell.EditingStyle.delete.rawValue)!
    }
    //具体操作的处理
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dataSource.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.isEditing {
            dataSource[indexPath.row].isSelected = !dataSource[indexPath.row].isSelected
        }
    }
}

struct Person {
    
    var name: String
    var isSelected: Bool
}
