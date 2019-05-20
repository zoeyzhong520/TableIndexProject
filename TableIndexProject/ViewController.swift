//
//  ViewController.swift
//  TableIndexProject
//
//  Created by zhifu360 on 2019/5/20.
//  Copyright © 2019 ZZJ. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: ScreenSize.width, height: ContentHeight), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: BaseTableReuseIdentifier)
        return tableView
    }()
    
    ///分组标题
    let sectionIndexTitles = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPage()
    }

    func setPage() {
        title = "演示"
        view.addSubview(tableView)
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionIndexTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BaseTableReuseIdentifier, for: indexPath)
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16)
        cell.textLabel?.textColor = UIColor.black
        cell.textLabel?.text = "第\(indexPath.row)个"
        cell.textLabel?.textAlignment = .center
        return cell
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        //每个分组对应的index
        var sectionIndex: Int = 0
        for item in sectionIndexTitles {
            if item == title {
                return sectionIndex
            }
            sectionIndex += 1
        }
        return 0
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionIndexTitles
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionIndexTitles[section]
    }
    
}

