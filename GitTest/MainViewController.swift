//
//  ViewController.swift
//  test001
//
//  Created by ppx on 2025/2/6.
//

import UIKit
import SnapKit
import SwifterSwift

class MainViewController: UIViewController {
    var tableView: UITableView!
    // 存储每个单元格的展开或折叠状态
    let dataSouce = [
        [("ppx", "FirstLabel2")],
        [
            ("Second2", "Second1"),
            ("Second2", "Second2"),
            ("Second2", "Second3"),
        ],
        [
            ("Second3", "Second1"),
            ("Second3", "Second2"),
            ("Second3", "Second3"),
            ("Second3", "Second4"),
            ("Second3", "Second5")
        ]
    ]

    var isExpanded: [[Bool]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let safeArea = view.safeAreaLayoutGuide

        // 创建 UITableView 并设置其 frame
        tableView = UITableView(frame: safeArea.layoutFrame, style: .plain)
        //        tableView = UITableView(frame: view.bounds, style: .plain)

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(DemoTableViewUserCell.self, forCellReuseIdentifier: "DemoTableViewUserCell")
        tableView.register(DemoTableViewNormalCell.self, forCellReuseIdentifier: "DemoTableViewNormalCell")
        tableView.separatorStyle = .none
        view.addSubview(tableView)

        // 初始化 isExpanded 二维数组
        for sectionData in dataSouce {
            let sectionExpanded = [Bool](repeating: false, count: sectionData.count)
            isExpanded.append(sectionExpanded)
        }
    }
}

    //UITableView要展示几组，每组几个，具体展示
extension MainViewController: UITableViewDataSource {

    //几行
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSouce.count
    }

    //每行几个
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSouce[section].count
    }

    //展示你的tableview，将tableview具体展示与cell联系起来的地方
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 && indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DemoTableViewUserCell", for: indexPath) as! DemoTableViewUserCell
            let (label1Text, label2Text) = dataSouce[indexPath.section][indexPath.row]
            cell.label1.text = label1Text
            cell.label2.text = label2Text
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DemoTableViewNormalCell", for: indexPath) as! DemoTableViewNormalCell
            let (label1Text, label2Text) = dataSouce[indexPath.section][indexPath.row]
            cell.label1.text = label1Text
            cell.label2.text = label2Text
            return cell
        }
    }
}

extension MainViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 切换单元格的展开或折叠状态
        isExpanded[indexPath.section][indexPath.row].toggle()
        // 刷新点击的单元格
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

extension MainViewController {
    
    @objc private func goToSecondPage() {
        let secondVC = SecondViewController()
        // 设置回调闭包
        secondVC.dataCallback = { [weak self] data in
            print("Received data from second page: \(data)")
        }
        // 传递数据到第二个页面
        secondVC.receivedData = "Data from first page"
        navigationController?.pushViewController(secondVC, animated: true)
    }
}
#Preview {
    MainViewController()
}
