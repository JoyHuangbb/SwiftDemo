//
//  MineViewController.swift
//  PowerBus
//
//  Created by 黄彬彬 on 2018/10/29.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//

import UIKit

class MineViewController: BaseViewController {
    
    var dataArray = [["账户与安全":"Smartphone"], ["我的钱包":"Wallet"], ["订单记录":"Record"], ["我的优惠券":"Discount"], ["常见问题":"常见问题"], ["关于我们":"关于我们"]]

    //MARK: - life cycle
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
        self.navigationView.isHidden = true
        self.view.addSubview(tableView)
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: self.view.frame, style: .grouped)
        tableView.rowHeight = 44;
        tableView.delegate = self
        tableView.dataSource = self
        let headView = MineHeadView.init(frame: CGRect(x: 0, y: 0, width: self.view.width, height: StatusBarHeight + 165))
        headView.backButtonCallBack = {()->() in
            self.goBack()
        }
        tableView.tableHeaderView = headView
        tableView.tableFooterView = self.bottomView
        tableView.register(MineTableViewCell.self, forCellReuseIdentifier: "MineTableViewCell")
        tableView.bounces = false
        tableView.separatorInset = UIEdgeInsetsMake(0, 30, 0, 0)
        tableView.backgroundColor = UIColor.whiteColor()
        return tableView;
    }()
    
    public lazy var bottomView: UIView = {
        let bottomView = UIView.init(frame: CGRect(x: 0, y: 0, width: self.view.width, height: 0))
        bottomView.height = ScreenHeight - (StatusBarHeight + 165) - CGFloat(dataArray.count * 44) - 25
        bottomView.backgroundColor = UIColor.whiteColor()
        if bottomView.height < 70 {
            bottomView.height = 70
        }
        let imageView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 130, height: 35))
        imageView.center = bottomView.center
        imageView.y = bottomView.height - 70
        imageView.image = UIImage.init(named: "ReturnAfterUse拷贝5")
        imageView.contentMode = UIViewContentMode.scaleToFill
        imageView.clipsToBounds = true;
        bottomView.addSubview(imageView)
        
        return bottomView
    }()
}

extension MineViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "MineTableViewCell") as! MineTableViewCell
    
        let dict = dataArray[indexPath.row]
        cell.logoImageView.image = UIImage.init(named: Array(dict.values)[0])
        cell.titleLabel.text = Array(dict.keys)[0]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            print("账户与安全")
            let vc = AccountSafeViewController.init(nibName: nil, bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            print("我的钱包")
            let vc = MyWalletViewController.init(nibName: nil, bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 2:
            print("订单记录")
            let vc = OrderRecordsViewController.init(nibName: nil, bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = MyBonusViewController.init(nibName: nil, bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
            print("我的优惠券")
            
        case 4:
            let vc = CommonQuestionViewController.init(nibName: nil, bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
            print("常见问题")
            
        case 5:
            let vc = AboutUSViewController.init(nibName: nil, bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
            print("关于我们")
            
        default:
            print("")
            
        }
    }
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

class MineTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(self.logoImageView)
        self.contentView.addSubview(self.titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public lazy var logoImageView: UIImageView = {
        let logoImageView = UIImageView(frame: CGRect(x: 30, y: 11, width: 22, height: 22))
        logoImageView.contentMode = UIViewContentMode.scaleToFill
        logoImageView.clipsToBounds = true
        return logoImageView
    }()
    
    public lazy var titleLabel: UILabel = {
        let titleLabel = UILabel.init(frame: CGRect(x: logoImageView.maxX + 30, y: 0, width: 150, height: 44))
        titleLabel.textAlignment = NSTextAlignment.left
        titleLabel.textColor = UIColor.textBlackColor()
        titleLabel.font = UIFont.font15()
        return titleLabel
    }()
}
