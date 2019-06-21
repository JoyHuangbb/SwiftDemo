//
//  CommonQuestionViewController.swift
//  PowerBus
//
//  Created by 邹勇峰 on 2018/11/2.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//

import UIKit

class CommonQuestionViewController: BaseViewController {

    let array = NSArray.init(array: ["蓝牙连接后无法获取充电宝","充电宝无法充电","无法归还充电宝","充电宝/二维码/广告牌损坏"])
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //MARK: - UI
    override func initLayout() {
        super.initLayout()
        self.titleLabel.text = "常见问题"
        self.view.addSubview(self.tableView)
        
        let foot = UIView.init(frame: CGRect.init(x: 0, y: 0, width: ScreenWidth, height: 200))
        foot.backgroundColor = UIColor.white
        
        let logindButton = UIButton(type: UIButtonType.custom)
        logindButton.frame = CGRect(x: ScreenWidth * 0.16, y: 110, width: ScreenWidth * 0.68, height: 40)
        logindButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        logindButton.setTitle("联系客服", for: UIControlState.normal)
        logindButton.titleLabel?.font = UIFont.font14()
        logindButton.backgroundColor = UIColor.mainColor()
        logindButton.titleLabel?.textAlignment = .center
//        logindButton.addTarget(self, action:#selector(logindButtonClick), for:.touchUpInside)
        logindButton.setCornerRadius(20)
        foot.addSubview(logindButton)
        
        let bottomButton = UIButton.init(frame: CGRect.init(x: 0, y: logindButton.maxY + 10, width: ScreenWidth, height: 15))
        bottomButton.titleLabel?.font = UIFont.font14()
        bottomButton .setTitleColor(UIColor.textBlackColor(), for: .normal)
        let string = NSMutableAttributedString.init(string: "报告丢失")
        string.addAttribute(.underlineStyle, value: NSNumber.init(value: 1), range: NSRange(location: 0, length: string.length))
        bottomButton.setAttributedTitle(string, for: .normal)
//        bottomButton.addTarget(self, action: #selector(bottomButtonClick), for: .touchUpInside)
        foot.addSubview(bottomButton)
        
        tableView.tableFooterView = foot
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.init(x: 10, y: NavBarHeight, width: ScreenWidth, height: ScreenHeight - NavBarHeight), style: .grouped)
        tableView.rowHeight = 44;
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedSectionFooterHeight = 0;
        tableView.estimatedSectionHeaderHeight = 0;
        tableView.estimatedRowHeight = 0;
        tableView.tableFooterView = UIView.init()
        tableView.register(CommonQaCell.self, forCellReuseIdentifier: "CommonQaCell")
        tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        tableView.backgroundColor = UIColor.whiteColor()
        tableView.separatorColor = UIColor.cellLineColor()
        tableView.backgroundColor = UIColor.white
        return tableView;
    }()
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CommonQuestionViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "CommonQaCell") as! CommonQaCell
        cell.titleLabel.text = array[indexPath.row] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return nil
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
}
