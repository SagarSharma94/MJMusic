//
//  DetailsViewController.swift
//  MJMusic
//
//  Created by Sagar Sharma on 23/07/21.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var detailTableView: UITableView!

    var detailData:SearchResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Details"
        self.detailTableView.reloadData()
    }
    
}
//MARK: TableView DataSource Methods..
extension DetailsViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.detailCell, for: indexPath) as! DetailCell
        cell.setData(data: detailData)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
