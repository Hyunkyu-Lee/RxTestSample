//
//  APIService.swift
//  RxTestSample
//
//  Created by hklee on 2020/08/14.
//  Copyright © 2020 hklee. All rights reserved.
//

import Foundation
import RxAlamofire
import RxSwift
import RxCocoa
import RxOptional

struct APIService {
    
    static let shared = APIService()
    
    var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        decoder.dateDecodingStrategy = .formatted(formatter)
        return decoder
    }
}

extension APIService {
    func requestSearch(keyword: String, param: [String:Any]) -> Observable<SearchModel?> {
        return Router.search(q: keyword)
        .buildRequest(parameters: param)
            .flatMap{ data -> Observable<SearchModel?> in
                
                do { let result = try? self.decoder.decode(SearchModel.self, from: data)
//                    print(result)
                } catch let error {
                    print(error)
                }
                
                if let result = try? self.decoder.decode(SearchModel.self, from: data) {
                    return .just(result)
                }
                return .just(nil)
                
        }.share()
    }
}
