//
//  RxTestSampleTests.swift
//  RxTestSampleTests
//
//  Created by hklee on 2020/08/14.
//  Copyright © 2020 hklee. All rights reserved.
//

import XCTest

import RxTest
import RxBlocking
import RxCocoa
import RxSwift

@testable import RxTestSample

class RxTestSampleTests: XCTestCase {

    var viewModel : ListViewModel!
    var scheduler : TestScheduler!
    var disposeBag : DisposeBag!
    
    fileprivate var apiService = APIService.init()
    
    override func setUp() {
        super.setUp()
        viewModel = ListViewModel()
        scheduler = TestScheduler(initialClock: 0)
        disposeBag = DisposeBag()
    }

    func testExample() {
        let resultObservable = viewModel.listDataObservable
        
        scheduler.createHotObservable([.next(10, "RxSwift")])
            .bind(to: viewModel.searchTextRelay)
            .disposed(by: disposeBag)
        
        scheduler.start()
            let result = resultObservable.toBlocking()
            let values = try! result.first()!
            XCTAssertGreaterThan(values?.items?.count ?? 0, 0)
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
