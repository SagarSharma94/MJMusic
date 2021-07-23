//
//  SongsListViewController.swift
//  MJMusic
//
//  Created by Sagar Sharma on 23/07/21.
//

import UIKit
import Foundation

class SongsListViewController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var loaderView: UIActivityIndicatorView!
    
    private var songListViewModel = SongListViewModel()
    
    private var isShowIndicator: Bool = false {
        didSet {
            if isShowIndicator{
                loaderView.startAnimating()
            } else {
                loaderView.stopAnimating()
            }
        }
    }
    
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.callSearchListAPI("Michael+jackson")
        refreshControl.addTarget(self, action: #selector(pullToRefesh), for: .valueChanged)
        listTableView.refreshControl = refreshControl
    }
    
    //MARK: Pull to Refresh..
    @objc func pullToRefesh(refreshControl: UIRefreshControl) {
        refreshControl.endRefreshing()
        self.callSearchListAPI("Michael+jackson")
    }
    
    //MARK: Call Search List API..
    func callSearchListAPI(_ searchText: String?) {
        self.isShowIndicator = true
        songListViewModel.requestForSearchList(searchText) { [weak self] in
            DispatchQueue.main.async {
                self?.listTableView.reloadData()
                self?.isShowIndicator = false
            }
        }
    }
    
    //MARK: Segue for navigation..
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? DetailsViewController else { return }
        vc.detailData = sender as? SearchResult
    }
}

//MARK: TableView DataSource Methods..
extension SongsListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songListViewModel.getNumberOfSearchItems()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.listCell, for: indexPath) as! SongListCell
        cell.setData(data: songListViewModel.getNumberOfSearchItemsForIndex(indexPath.row))
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

//MARK: TableView Delegates Methods..
extension  SongsListViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "navigateToDetail"
                          , sender: songListViewModel.getNumberOfSearchItemsForIndex(indexPath.row))
    }
    
}
