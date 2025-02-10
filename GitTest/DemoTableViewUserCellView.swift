//
//  DemoTableViewUserCell.swift
//  test001
//
//  Created by ppx on 2025/2/7.
//

import Foundation
import UIKit
import SnapKit


class DemoTableViewUserCellView: UITableViewCell {
//    var tableViewUserCell: UITableViewCell!
    var image: UIImageView = {
        let image = UIImageView()
        // 使用系统自带的 SF Symbols 图标
        image.image = UIImage(named: "star.fill")
        image.backgroundColor = .red
        // 设置内容模式为按比例缩放并填满视图
        image.contentMode = .scaleAspectFill
        // 裁剪超出视图边界的部分
        image.clipsToBounds = true
        image.layer.cornerRadius = 5
        return image
    }()

    var label1: UILabel = {
        let label = UILabel()
//        label.text = "www"
        label.textColor = .blue
        label.font = .systemFont(ofSize: 30)
        return label
    }()

    var label2: UILabel = {
        let label = UILabel()
//        label.text = "eee"
        label.textColor = .blue
        label.font = .systemFont(ofSize: 15)
        return label
    }()

    //    lazy var button: UIButton = {
    //        let button = UIButton()
    //        button.setTitle("button", for: .normal)
    //        button.setTitleColor(.red, for: .normal)
    //        button.setTitleColor(.green, for: .selected)
    //        button.addTarget(self, action: #selector(changeLabel), for: .touchUpInside)
    //        return button
    //    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviewsForUserCell()
        setUpUserCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addSubviewsForUserCell() {
        contentView.addSubview(image)
        contentView.addSubview(label1)
        contentView.addSubview(label2)
    }

    func setUpUserCell() {
        image.snp.makeConstraints { make in
            make.width.height.equalTo(30)
            make.leading.equalToSuperview().inset(5)
            make.centerY.equalToSuperview()
        }

        label1.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(image.snp.trailing).offset(5)
        }

        label2.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.top.equalTo(label1.snp.bottom)
            make.leading.equalTo(image.snp.trailing).offset(5)
        }
    }
}
