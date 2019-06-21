//
//  OrderRecordsViewController.swift
//  PowerBus
//
//  Created by 黄彬彬 on 2018/11/2.
//  Copyright © 2018 黄彬彬. All rights reserved.
//

import UIKit

class OrderRecordsViewController: BaseViewController {

    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initLayout();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Navigation
    override func initLayout() {
        super.initLayout()
        self.view.addSubview(tableView)
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect(x: 0, y: NavBarHeight, width: self.view.width, height: self.view.height - NavBarHeight), style: .grouped)
        tableView.rowHeight = 150
        tableView.sectionHeaderHeight = 11
        tableView.sectionFooterHeight = CGFloat.leastNormalMagnitude
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView.init()
        tableView.register(OrderRecordTableViewCell.self, forCellReuseIdentifier: "OrderRecordsViewController")
        return tableView
    }()

}

extension OrderRecordsViewController: UITableViewDelegate, UITableViewDataSource, OrderRecordTableViewCellProtocol {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: OrderRecordTableViewCell! = self.tableView.dequeueReusableCell(withIdentifier: "OrderRecordsViewController") as! OrderRecordTableViewCell
        cell.cellTag = indexPath.section
        cell.delegate = self
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = OrderRecordDetailViewController.init(nibName: nil, bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 11
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func orderRecordTableViewCellQuestionButtoncallBack() {
        print("订单有问题？")
        let vc = UploadErrorViewController.init(nibName: nil, bundle: nil)
        vc.errorType = UploadErrorType.OrderError.rawValue
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
