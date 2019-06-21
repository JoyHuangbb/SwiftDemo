//
//  AccountSafeViewController.swift
//  PowerBus
//
//  Created by 黄彬彬 on 2018/10/29.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//

import UIKit

class AccountSafeViewController: BaseViewController {

    let array = NSArray.init(array: ["Facebook账号","Google账号","WeChat账号"])
    
    //life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - UI
    override func initLayout() {
        super.initLayout()
        self.titleLabel.text = "账户与安全"
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
        tableView.tableFooterView = UIView.init()
        tableView.register(AccountSafeCell.self, forCellReuseIdentifier: "AccountSafeCell")
        tableView.register(ThirdAccountCell.self, forCellReuseIdentifier: "ThirdAccountCell")
        tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        tableView.backgroundColor = UIColor.whiteColor()
        tableView.separatorColor = UIColor.cellLineColor()
        tableView.backgroundColor = UIColor.white
        return tableView;
    }()
}

extension AccountSafeViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 2 : 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "AccountSafeCell") as! AccountSafeCell
            if indexPath.row == 0 {
                cell.titleLabel.text = "手机号码"
                cell.detailLabel.text = "+8615516347782"
            } else {
                cell.titleLabel.text = "登录密码设置"

            }
            return cell
        } else {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "ThirdAccountCell") as! ThirdAccountCell
            cell.logoImageView.image = UIImage.init(named: "icon_account\(indexPath.row + 1)")
            cell.titleLabel.text = self.array[indexPath.row] as? String
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 && indexPath.row == 0 {
            let vc = CurrentMobileViewController.init(nibName: nil, bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
            
        } else if indexPath.section == 0 && indexPath.row == 1 {
            let vc = SetPassWordViewController.init(nibName: nil, bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return self.setupSectionView(section)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func setupSectionView(_ section: Int) -> UIView {
        let sectionView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: ScreenWidth, height: 36))
        sectionView.backgroundColor = UIColor.white
        let titleLabel = UILabel.init(frame: CGRect.init(x: ScreenWidth * 0.066, y: 0, width: ScreenWidth - 100, height: 36))
        titleLabel.textColor = UIColor.textBlackColor()
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.text = section == 0 ? "我的手机号" : "关联第三方社交账号"
        sectionView.addSubview(titleLabel)
        return sectionView
    }
}
