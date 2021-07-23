//
//  SearchService.swift
//  MJMusic
//
//  Created by Sagar Sharma on 23/07/21.
//

import Foundation
import Moya

enum SearchService {
    case search(text: String?)
}

// MARK: - TargetType Protocol Implementation
extension SearchService: TargetType {
    var baseURL: URL { return URL(string: Constants.baseURL)! }
    var path: String {
        switch self {
        case .search:
            return Constants.searchApi
        }
    }
    var method: Moya.Method {
        switch self {
        case .search:
            return .get
        }
    }
    var task: Task {
        switch self {
        case .search(let search):
            return .requestParameters(parameters: ["term" : "\(search ?? "")"], encoding: URLEncoding.queryString)
        }
        
    }
    var sampleData: Data {
        return Data()
    }
    var headers: [String: String]? {
        return [:]
    }
}
