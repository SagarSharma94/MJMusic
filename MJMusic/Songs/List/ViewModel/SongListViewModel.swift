//
//  SongListViewModel.swift
//  MJMusic
//
//  Created by Sagar Sharma on 23/07/21.
//

import Foundation
import Moya

class SongListViewModel {
    private let searchServiceProvider = MoyaProvider<SearchService>(plugins: [NetworkLoggerPlugin()])
    private var searchList :LiveData<Resource<SongsListModel>> = LiveData(Resource(status: Status.Loading, data: nil, message: "Loading..."))
    var searchListData: [SearchResult] = []
    
    // Mark: Get Search Data..
    func requestForSearchList(_ searchtText: String?,completion: @escaping()->Void) {
        callSearchAPI(searchtText).observe { (response) in
            switch response.status {
            case .Loading:
                debugPrint("Loading")
            case .Success:
                self.searchListData.removeAll()
                if let data = response.data?.results{
                    print(data)
                    self.searchListData = data
                    completion()
                }
            case .Error:
                debugPrint(response.message ?? "")
            }
        }
    }
    
    // MARK: Search API.
    private func callSearchAPI(_ text:String?) -> LiveData<Resource<SongsListModel>> {
        self.searchList.value = Resource(status: Status.Loading, data: nil, message: "Loading...")
        searchServiceProvider.request(.search(text: text)){ result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let filteredResponse = try moyaResponse.filterSuccessfulStatusCodes()
                    let user = try filteredResponse.map(SongsListModel.self)
                    self.searchList.value = Resource(status: Status.Success, data: user, message: Constants.kSuccess)
                }
                catch let error {
                    self.searchList.value = Resource(status: Status.Error, data: nil, message: error.localizedDescription)
                }
            case let .failure(error):
                self.searchList.value = Resource(status: Status.Error, data: nil, message: error.response?.description)
                break
            }
        }
        return searchList
    }
    
    //MARK: get searchData Count..
    func getNumberOfSearchItems() -> Int {
        searchListData.count
    }
    
    //MARK: get no. of search items with index ..
    func getNumberOfSearchItemsForIndex(_ index: Int) -> SearchResult? {
        if let item = searchListData.count > index ? searchListData[index] : nil {
            return item
        }
        return nil
    }
}
