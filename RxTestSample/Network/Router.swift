//
//  Router.swift
//  RxTestSample
//
//  Created by hklee on 2020/08/14.
//  Copyright © 2020 hklee. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import RxAlamofire

enum Router {
    case search(q: String)
}


extension Router {
    static var hostDomain: String {
        return "https://api.github.com"
    }
    static let manager: Alamofire.Session = {
        let manager = Alamofire.Session.default
        manager.sessionConfiguration.timeoutIntervalForRequest = 10
        manager.sessionConfiguration.timeoutIntervalForResource = 10
        manager.sessionConfiguration.httpMaximumConnectionsPerHost = 5
        manager.sessionConfiguration.httpCookieStorage = HTTPCookieStorage.shared
        manager.sessionConfiguration.urlCache = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)
        return manager
        
    }()
    
    var path: String {
        switch self {
        case let .search(search):
            _ = search
            return "/search/repositories"
        }
    }
    
    var url: URL {
        switch self {
        case .search:
            let url = try! Router.hostDomain.asURL()
            return url.appendingPathComponent(path)
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .search:
            return .get
//            return .post
//            return .put
//           return .delete
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .search:
            return URLEncoding.default

//            return URLEncoding.methodDependent
//            return JSONEncoding.default
        }
    }
    
    static var defaultHeaders: HTTPHeaders {
        var headers = HTTPHeaders.default
        headers.update(.contentType("application/vnd.github.mercy-preview+json"))
        return headers
    }
    
    func buildRequest(parameters: Parameters) -> Observable<Data> {
        #if DEBUG
        print("[HTTP Request] -> \(self.url)?\(parameters.map { "\($0)=\($1)" }.joined(separator: "&"))")
        #endif
        
        return Router.manager.rx
            .request(self.method, self.url,
                     parameters: parameters,
                     encoding: self.parameterEncoding,
                     headers: Router.defaultHeaders
            )
            .retry(2)
            .responseData()
            .flatMapLatest({ (response, data) -> Observable<Data> in
                print(response.statusCode)
                
                return Observable.just(data)
                
            })
            .catchError({ (Error) -> Observable<Data> in
                print(Error)
                return Observable.just(Data.init(base64Encoded: Error.localizedDescription) ?? Data.init())
            })
            .observeOn(MainScheduler.instance)
        
    }
}

