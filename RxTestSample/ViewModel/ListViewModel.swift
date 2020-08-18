//
//  ListViewModel.swift
//  RxTestSample
//
//  Created by hklee on 2020/08/14.
//  Copyright © 2020 hklee. All rights reserved.
//

import RxSwift
import RxCocoa
import RxDataSources

// MARK: - Bindable
protocol ListViewModelBindable {
    // V -> VM
    var refreshMyPageData             : BehaviorRelay<Bool> { get }
    var searchTextRelay             : BehaviorRelay<String?> { get }
    
    // VM -> V
    var listDataObservable            : Observable<SearchModel?> { get }
}

struct ListViewModel: ListViewModelBindable {
    // V -> VM
    var refreshMyPageData             = BehaviorRelay<Bool>(value: false)
    var searchTextRelay                  = BehaviorRelay<String?>(value: nil)
    
    // VM -> V
    var listDataObservable    : Observable<SearchModel?> = Observable.just(nil)
    
    init() {
        
        let searchTextObservable = searchTextRelay.asObservable()
        .filterNil()
        .filter{ $0 != "" }
        
        listDataObservable = searchTextObservable
//        .filter { $0 == true }
        .flatMapLatest{ keyword -> Observable<SearchModel?> in
//            var param:[String:Any] = ["sort":"stars",
//                                      "order":"desc"]
            var param:[String:Any] = ["q":keyword]
            return APIService.shared.requestSearch(keyword: keyword, param: param)
        }
    }
}

