//
//  LiveData.swift
//  MJMusic
//
//  Created by Sagar Sharma on 23/07/21.
//

import Foundation

class LiveData<T> {
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func observe(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
}

struct Resource<T> {
    var status: Status
    var data: T?
    var message: String?
    func success<T>(product: T.Type, for money: String) -> Resource {
        return Resource(status: Status.Success, data: nil, message: nil)
    }
    func error<T>(product: T.Type, for money: String) -> Resource {
        return Resource(status: Status.Error, data: nil, message: message)
    }
    func loading<T>(product: T.Type, for money: String) -> Resource{
        return Resource(status: Status.Loading, data: nil, message: nil)
    }
}
