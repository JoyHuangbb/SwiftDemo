//
//  MyWalletViewController.swift
//  PowerBus
//
//  Created by 邹勇峰 on 2018/10/30.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//

import UIKit

class MyWalletViewController: BaseViewController {

    let bankArray = NSArray.init(array:["中国建设银行","VISA CARD","中国招商银行"])
    let payArray = NSArray.init(array:["WeChat Payment/微信支付","Alipay/支付宝"])
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupUI()
    }

    func setupUI() {
        self.titleLabel.text = "我的钱包"
        self.view.addSubview(self.tableView)
        self.view.addSubview(self.plusButton)
    }
    
    @objc func plusBankClick() {
        let vc = AddBankCardViewController.init(nibName: nil, bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

    private lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: NavBarHeight, width: ScreenWidth, height: ScreenHeight - NavBarHeight), style: .grouped)
        tableView.rowHeight = 50;
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedSectionFooterHeight = 0;
        tableView.estimatedSectionHeaderHeight = 0;
        tableView.estimatedRowHeight = 0;
        tableView.tableFooterView = UIView.init()
        tableView.register(WalletPayCell.self, forCellReuseIdentifier: "WalletPayCell")
        tableView.register(BankCell.self, forCellReuseIdentifier: "BankCell")
        tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        tableView.backgroundColor = UIColor.whiteColor()
        tableView.separatorColor = UIColor.cellLineColor()
        tableView.backgroundColor = UIColor.white
        return tableView;
    }()
    
    public lazy var plusButton: UIButton = {
        let plusButton = UIButton(frame: CGRect(x: ScreenWidth - 42 - 46, y: 154, width: 42, height: 42))
        plusButton .setBackgroundImage(UIImage.init(named: "icon_plusBankCard"), for: UIControlState.normal)
        plusButton.addTarget(self, action: #selector(plusBankClick), for: .touchUpInside)
        view.addSubview(plusButton)
        return plusButton
    }()
    
    
}

extension MyWalletViewController: UITableViewDelegate, UITableViewDataSource {

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 3 : 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "BankCell") as! BankCell
            cell.logoImageView.image = UIImage.init(named: "icon_bank\(indexPath.row + 1)")
            cell.titleLabel.text = self.bankArray[indexPath.row] as? String
            return cell
        } else {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "WalletPayCell") as! WalletPayCell
            cell.logoImageView.image = UIImage.init(named: "icon_pay\(indexPath.row + 1)")
            cell.titleLabel.text = self.payArray[indexPath.row] as? String

            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return self.setupSectionView(section)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 110 : 56
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func setupSectionView(_ section: Int) -> UIView {
        let sectionView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: ScreenWidth, height: section == 0 ? 110 : 56))
        sectionView.backgroundColor = UIColor.white
        let titleLabel = UILabel.init(frame: CGRect.init(x: ScreenWidth * 0.066, y: section == 0 ? 54 : 18, width: ScreenWidth - 100, height: 18))
        titleLabel.textColor = UIColor.hexadecimalColor(hexadecimal: "#515f47")
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        titleLabel.text = section == 0 ? "信用卡/储蓄卡" : "我的押金账户"
        sectionView.addSubview(titleLabel)
        
        let contentLabel = UILabel.init(frame: CGRect.init(x: ScreenWidth * 0.066, y: titleLabel.maxY, width: ScreenWidth - 100, height: 18))
        contentLabel.textColor = UIColor.hexadecimalColor(hexadecimal: "#515f47")
        contentLabel.font = UIFont.systemFont(ofSize: 8)
        contentLabel.text = section == 0 ? "我们会以加密的方式保存你的信用卡信息" : "绑定信用卡充值押金后即可使用租借功能"
        sectionView.addSubview(contentLabel)
        if section == 1 {
            let rechargeButton = UIButton(frame: CGRect(x: ScreenWidth - 75 - 0.08 * ScreenWidth, y: 18, width: 75, height: 30))
//            rechargeButton.addTarget(self, action: #selector(codeBtnClick), for: .touchUpInside)
            rechargeButton.backgroundColor = UIColor.hexadecimalColor(hexadecimal: "76816e")
            rechargeButton.setCornerRadius(15)
            rechargeButton.setTitle("未充值", for: .normal)
            rechargeButton.titleLabel?.font = UIFont.font13()
            rechargeButton.setTitleColor(UIColor.white, for: .normal)
            sectionView.addSubview(rechargeButton)
        }
        return sectionView
        
    }
}
