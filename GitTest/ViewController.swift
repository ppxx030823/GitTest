import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 创建 UILabel
        let label = UILabel()
        label.text = "111"
        label.translatesAutoresizingMaskIntoConstraints = false // 关闭自动转换
        view.addSubview(label)

        // 创建 UILabel2
        let label2 = UILabel()
        label2.text = "111"
        label2.translatesAutoresizingMaskIntoConstraints = false // 关闭自动转换
        view.addSubview(label2)

        // 使用原生自动布局为 UILabel 进行布局
        NSLayoutConstraint.activate([
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.widthAnchor.constraint(equalToConstant: 20),
            label.heightAnchor.constraint(equalToConstant: 20)
        ])

        // 创建 UIButton
        let button = UIButton(type: .system)
        button.setTitle("111", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false // 关闭自动转换
        view.addSubview(button)

        // 创建 UIButton2
        let button2 = UIButton(type: .system)
        button2.setTitle("111", for: .normal)
        button2.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button2.translatesAutoresizingMaskIntoConstraints = false // 关闭自动转换
        view.addSubview(button2)

        // 使用原生自动布局为 UIButton 进行布局
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    // 按钮点击事件处理方法
    @objc func buttonTapped() {
        print("按钮被点击了！")
    }
}
