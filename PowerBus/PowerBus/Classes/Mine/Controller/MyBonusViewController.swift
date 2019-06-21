//
//  MyBonusViewController.swift
//  PowerBus
//
//  Created by 邹勇峰 on 2018/11/2.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//

import UIKit

class MyBonusViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - UI
    override func initLayout() {
        super.initLayout()
        self.titleLabel.text = "我的优惠券"
        self.view.addSubview(self.tableView)
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: NavBarHeight, width: ScreenWidth, height: ScreenHeight - NavBarHeight), style: .grouped)
        tableView.rowHeight = 44;
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedSectionFooterHeight = 0;
        tableView.estimatedSectionHeaderHeight = 0;
        tableView.estimatedRowHeight = 0;
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView.init()
        tableView.register(BonusCell.self, forCellReuseIdentifier: "BonusCell")
        tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        tableView.backgroundColor = UIColor.whiteColor()
        tableView.separatorColor = UIColor.cellLineColor()
        tableView.rowHeight = (ScreenWidth - ScreenWidth * 0.076 * 2) * 222/635 + 8
        tableView.backgroundColor = UIColor.hexadecimalColor(hexadecimal: "#efefef")
        return tableView;
    }()

}

extension MyBonusViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "BonusCell") as! BonusCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
}
