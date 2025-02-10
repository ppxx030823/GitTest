//
//  DemoTableViewNormalCell.swift
//  test001
//
//  Created by ppx on 2025/2/7.
//

import Foundation
import UIKit
import SnapKit


class DemoTableViewNormalCell: UITableViewCell {
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
        label.textColor = .blue
        label.font = .systemFont(ofSize: 20)
        return label
    }()

    var label2: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .left
        return label
    }()

    //  MARK: 输入文本
    let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter text here"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .default
        return textField
    }()

    //  MARK: 开关控件
    let switchControl: UISwitch = {
        let switchControl = UISwitch()
        switchControl.isOn = false
        switchControl.addTarget(DemoTableViewNormalCell.self, action: #selector(switchValueChanged), for: .valueChanged)
        return switchControl
    }()

    @objc func switchValueChanged(_ sender: UISwitch) {
        if sender.isOn {
            print("Switch is on")
        } else {
            print("Switch is off")
        }
    }

    //  MARK: 绘图（圆）
    var customeCycle = CustomDrawView()



    //  MARK: 滑动条控件
    let slider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 50
        slider.addTarget(DemoTableViewNormalCell.self, action: #selector(sliderValueChanged), for: .valueChanged)
        return slider
    }()

    @objc func sliderValueChanged(_ sender: UISlider) {
        let value = sender.value
        print("Slider value: \(value)")
    }


    // MARK: 选择器
//    let pickerView: UIPickerView = {
//        let pickerView = UIPickerView()
//        pickerView.dataSource = self
//        pickerView.delegate = self
//        return pickerView
//    }()
//
//    // 实现 UIPickerViewDataSource 协议
//    extension YourViewController: UIPickerViewDataSource {
//        func numberOfComponents(in pickerView: UIPickerView) -> Int {
//            return 1
//        }
//
//        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//            return dataArray.count
//        }
//    }

    // 实现 UIPickerViewDelegate 协议
//    extension YourViewController: UIPickerViewDelegate {
//        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//            return dataArray[row]
//        }
//
//        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//            let selectedValue = dataArray[row]
//            print("Selected value: \(selectedValue)")
//        }
//    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviewsForUserCell()
//        setUpUserCell()
        setUpInputCell()
        animationUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addSubviewsForUserCell() {
        contentView.addSubview(image)
        contentView.addSubview(label1)
        contentView.addSubview(label2)
        contentView.addSubview(textField)
        contentView.addSubview(customeCycle)

    }

    func setUpUserCell() {
        image.snp.makeConstraints { make in
            make.width.height.equalTo(30)
            make.leading.equalToSuperview().inset(5)
            make.centerY.equalToSuperview()
        }

        label1.snp.makeConstraints { make in
//            make.width.height.equalTo(self.image)
            make.centerY.equalToSuperview()
            make.leading.equalTo(self.image.snp_trailingMargin).offset(15)
        }

        label2.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.centerY.equalToSuperview()
        }

        textField.snp.makeConstraints { make in
            make.centerY.equalTo(self.label2)
            make.leading.equalTo(self.label2.snp_trailingMargin).offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
    }

    func setUpInputCell() {
        image.snp.makeConstraints { make in
            make.width.height.equalTo(30)
            make.leading.equalToSuperview().inset(5)
            make.centerY.equalToSuperview()
        }

        label2.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.centerY.equalToSuperview()
        }

        textField.snp.makeConstraints { make in
            make.centerY.equalTo(self.label2)
            make.leading.equalTo(self.label2.snp_trailingMargin).offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }

        customeCycle.snp.makeConstraints { make in
            make.width.height.equalTo(image)
            make.centerY.equalTo(image)
            make.leading.equalTo(image.snp.trailingMargin).offset(10)
        }
    }

    func animationUI() {
        //  MARK: 动画 变透明
        //        UIView.animate(withDuration: 1.0, animations: {
        //            self.customeCycle.alpha = 0.0
        //        }) { (finished) in
        //            if finished {
        //                print("Animation completed")
        //            }
        //        }

        //弹簧动画
//        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: [], animations: {
//            self.customeCycle.transform = CGAffineTransform(scaleX: 1, y: 1)
//        }) { (finished) in
//            if finished {
//                print("Spring animation completed")
//            }
//        }
        //        //动画 滑动
        //        let animation = CABasicAnimation(keyPath: "position.x")
        //        animation.fromValue = self.customeCycle.layer.position.x
        //        animation.toValue = self.customeCycle.layer.position.x + 200
        //        animation.duration = 1.0
        //        self.customeCycle.layer.add(animation, forKey: "positionAnimation")
        //        self.customeCycle.layer.position.x = self.customeCycle.layer.position.x + 200

        //        //关键帧动画（CAKeyframeAnimation）就是自定义滑动轨迹
        //        let animation = CAKeyframeAnimation(keyPath: "position")
        //        let path = UIBezierPath()
        //        path.move(to: CGPoint(x: 100, y: 100))
        //        path.addLine(to: CGPoint(x: 0, y: 0))
        //        path.addLine(to: CGPoint(x: 100, y: 100))
        //        animation.path = path.cgPath
        //        animation.duration = 2.0
        //        self.customeCycle.layer.add(animation, forKey: "pathAnimation")

        //过渡动画
//        let newView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
//        newView.backgroundColor = .green
//
//        UIView.transition(with: self.contentView, duration: 1.0, options: .transitionCrossDissolve, animations: {
//            self.contentView.addSubview(self.customeCycle)
//        }) { (finished) in
//            if finished {
//                print("Transition completed")
//            }
//        }
        //4. 组合动画
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = 0
        scaleAnimation.toValue = 1.5
        scaleAnimation.duration = 1.0

        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue = CGFloat.pi / 2
        rotationAnimation.duration = 1.0

        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [scaleAnimation, rotationAnimation]
        groupAnimation.duration = 1.0

        self.customeCycle.layer.add(groupAnimation, forKey: "groupAnimation")
    }
}
