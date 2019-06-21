//
//  ChooseCountryController.swift
//  PowerBus
//
//  Created by 邹勇峰 on 2018/10/28.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//

import UIKit

class ChooseCountryController: BaseViewController {
    var searchView: UIView!
    
    typealias tapCell = (String) -> ()
    public var userTapped: tapCell?

    let array = NSArray.init(array: ["A","B","C"])
    let nameArray = NSArray.init(array: [["澳大利亚   Australia   +61","阿塞拜疆   Azerbaijan   +61","澳大利亚   Australia   +61","阿塞拜疆   Azerbaijan   +61","阿塞拜疆   Azerbaijan   +61"],["巴西   Brazil   +61","巴西   Brazil   +61","巴西   Brazil   +61","巴西   Brazil   +61","巴西   Brazil   +61"],["中国   China   +61","中国   China   +61","中国   China   +61","中国   China   +61","中国   China   +61"]])

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.setupUI()
    }

    func setupUI() {
        self.titleLabel.text = "选择国家归属地"
        self.searchTextField.addTarget(self, action: #selector(searchTextFieldEditChanged), for: .editingChanged)
        self.view.addSubview(self.tableView)
    }
    
    @objc func searchTextFieldEditChanged() {
        // 输入改变
    }
    
    @objc func cancleBtnClick() {
        // 取消
        self.searchTextField.resignFirstResponder()
    }
    
    private lazy var searchTextField: UITextField = {
        searchView = UIView.init(frame: CGRect(x: ScreenWidth * 0.064, y: 70 + StatusBarHeight, width: ScreenWidth - ScreenWidth * 0.128 - 59 - 10, height: 30))
        searchView.setCornerRadius(15)
        searchView.layer.borderWidth = 1
        searchView.layer.borderColor = UIColor.hexadecimalColor(hexadecimal: "#999999").cgColor
        self.view.addSubview(searchView)
        
        let logoImageView = UIImageView(frame: CGRect(x: 15, y: 4, width: 22, height: 22))
        logoImageView.image = UIImage.init(named: "icon_search")
        logoImageView.contentMode = UIViewContentMode.scaleToFill
        searchView.addSubview(logoImageView)
        
        let searchTextField = UITextField.init(frame: CGRect.init(x: logoImageView.maxX + 25, y: 0, width: view.width - 62, height: 30))
        searchTextField.placeholder = "搜索国家"
        searchTextField.font = UIFont.font13()
        searchTextField.textColor = UIColor.textBlackColor()
        searchView.addSubview(searchTextField)
        
        let cancleBtn = UIButton.init(frame: CGRect.init(x: searchView.maxX + 10, y: searchView.y, width: 59, height: 30))
        cancleBtn.setBackgroundImage(UIImage.init(named:"icon_cancle"), for: .normal)
        cancleBtn.addTarget(self, action: #selector(cancleBtnClick), for: .touchUpInside)
        self.view.addSubview(cancleBtn)
        return searchTextField;
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: searchView.maxY + 20, width: ScreenWidth, height: ScreenHeight - searchView.maxY - 20), style: .plain)
        tableView.rowHeight = 44;
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView.init()
        tableView.register(CountryCell.self, forCellReuseIdentifier: "default")
        return tableView;
    }()

}

extension ChooseCountryController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return array.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "default") as! CountryCell
        cell.textLabel?.textAlignment = .center
        let subArray = self.nameArray[indexPath.section] as? NSArray
        cell.textLabel?.text = subArray![indexPath.row] as? String
        cell.textLabel?.textColor = UIColor.textBlackColor()
        if indexPath.row == 0 {
            cell.titleLabel.text = self.array[indexPath.section] as? String
        } else {
            cell.titleLabel.text = ""
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let subArray = self.nameArray[indexPath.section] as? NSArray
        self.userTapped?(subArray![indexPath.row] as! String)
        self.navigationController?.popViewController(animated: true)
    }
}

