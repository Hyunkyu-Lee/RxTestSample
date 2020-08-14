//
//  SearchItemCell.swift
//  RxTestSample
//
//  Created by hklee on 2020/08/14.
//  Copyright © 2020 hklee. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class SearchItemCell: UITableViewCell {
    
    var cellBag = DisposeBag()
    
    // MARK: -
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clipsToBounds = true
        selectionStyle = .none
        setViewHierachy()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        cellBag = DisposeBag()
    }
    
}

extension SearchItemCell {
    private func setViewHierachy() {
        
    }
    
    private func setConstraints() {
        
    }
    
    func compose(data: SearchItem) {
        
    }
}
