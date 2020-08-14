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
    
    // VM -> V
    var listDataObservable            : Observable<SearchModel?> { get }
}

struct ListViewModel: ListViewModelBindable {
    // V -> VM
    var refreshMyPageData             = BehaviorRelay<Bool>(value: false)
    
    // VM -> V
    var listDataObservable    : Observable<SearchModel?> = Observable.just(nil)
    
    init() {

    }
}

