//
//  HomeSearchPopView.swift
//  PowerBus
//
//  Created by 黄彬彬 on 2018/10/28.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//

import UIKit

class HomeSearchPopView: PBBasePopView {
    
    var searchView: UIView!

    class func retrunHeight() -> CGFloat {
        return 450
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - touch events
    @objc func searchTextFieldEditChanged() {
        // 输入改变
    }
    
    @objc func cancleBtnClick() {
        // 取消
    }

    
    //MARK - UI
    func setupUI() {
        self.titleLabel.text = "选择国家归属地"
        self.searchTextField.addTarget(self, action: #selector(searchTextFieldEditChanged), for: .editingChanged)
        self.contentView.addSubview(self.tableView)
    }
    
    private lazy var searchTextField: UITextField = {
        searchView = UIView.init(frame: CGRect(x: ScreenWidth * 0.064, y: swipView.maxY + 10, width: ScreenWidth - ScreenWidth * 0.128 - 59 - 10, height: 30))
        searchView.setCornerRadius(15)
        searchView.layer.borderWidth = 1
        searchView.layer.borderColor = UIColor.hexadecimalColor(hexadecimal: "#999999").cgColor
        self.addSubview(searchView)
        
        let logoImageView = UIImageView(frame: CGRect(x: 15, y: 4, width: 22, height: 22))
        logoImageView.image = UIImage.init(named: "icon_search")
        logoImageView.contentMode = UIViewContentMode.scaleToFill
        searchView.addSubview(logoImageView)
        
        let searchTextField = UITextField.init(frame: CGRect.init(x: logoImageView.maxX + 25, y: 0, width: self.width - 62, height: 30))
        searchTextField.placeholder = "搜索国家"
        searchTextField.font = UIFont.font13()
        searchTextField.textColor = UIColor.textBlackColor()
        searchView.addSubview(searchTextField)
        
        let cancleBtn = UIButton.init(frame: CGRect.init(x: searchView.maxX + 10, y: searchView.y, width: 59, height: 30))
        cancleBtn.setBackgroundImage(UIImage.init(named:"icon_cancle"), for: .normal)
        cancleBtn.addTarget(self, action: #selector(cancleBtnClick), for: .touchUpInside)
        self.addSubview(cancleBtn)
        return searchTextField;
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: searchView.maxY, width: ScreenWidth, height: HomeSearchPopView.retrunHeight() - searchView.maxY - 20), style: .plain)
        tableView.rowHeight = 75;
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableHeaderView = UIView.init()
        tableView.register(HomeSearchResultCell.self, forCellReuseIdentifier: "HomeSearchResultCell")
        return tableView;
    }()
}

extension HomeSearchPopView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "HomeSearchResultCell")
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
