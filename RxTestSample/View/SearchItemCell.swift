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

    lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        label.textAlignment = .left
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var languageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        label.textAlignment = .left
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var bottomLineView: UIView = {
        let _bottomLineView = UIView()
        _bottomLineView.backgroundColor = .systemGray
        return _bottomLineView
    }()
    
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
        addSubview(fullNameLabel)
        addSubview(descriptionLabel)
        addSubview(languageLabel)
        addSubview(bottomLineView)
    }
    
    private func setConstraints() {
        fullNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        descriptionLabel.snp.makeConstraints {[unowned self] make in
            make.top.equalTo(self.fullNameLabel.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        languageLabel.snp.makeConstraints {[unowned self] make in
            make.top.equalTo(self.descriptionLabel.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(10)
        }
        
        bottomLineView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
        
    }
    
    func compose(data: SearchItem) {
        fullNameLabel.text = data.name ?? ""
        descriptionLabel.text = data.description
        languageLabel.text = data.language ?? ""
    }
}
