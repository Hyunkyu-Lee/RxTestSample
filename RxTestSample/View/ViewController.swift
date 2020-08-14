//
//  ViewController.swift
//  RxTestSample
//
//  Created by hklee on 2020/08/14.
//  Copyright © 2020 hklee. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxViewController
import RxOptional
import SnapKit


class ViewController: UIViewController {

    var disposeBag = DisposeBag()
    
    var viewModel = ListViewModel()
    
    lazy var contentView: UIView = {
        let _contentView = UIView()
        _contentView.backgroundColor = .systemBackground
        _contentView.translatesAutoresizingMaskIntoConstraints = false
        return _contentView
    }()
    
    lazy var searchTextField: UITextField = {
        let _searchTextField = UITextField()
        _searchTextField.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        _searchTextField.placeholder = "Search Repositories"
        _searchTextField.textAlignment = .left
        _searchTextField.textColor = .label
        _searchTextField.tintColor = #colorLiteral(red: 1, green: 0.2, blue: 0.2, alpha: 1)
        _searchTextField.backgroundColor = .clear
        _searchTextField.clearButtonMode = .whileEditing
        _searchTextField.returnKeyType = .search
        return _searchTextField
    }()
    
    lazy var searchButton:UIButton = {
        let _searchButton = UIButton(type:.custom)
        _searchButton.backgroundColor = .clear
        _searchButton.contentMode = .scaleAspectFit
        _searchButton.layer.borderWidth = 1
        _searchButton.layer.borderColor = #colorLiteral(red: 1, green: 0.2, blue: 0.2, alpha: 1)
        _searchButton.layer.cornerRadius = 10
        _searchButton.setTitle("Search", for: .normal)
        _searchButton.titleLabel?.textColor = .label
        _searchButton.isExclusiveTouch = true
        _searchButton.translatesAutoresizingMaskIntoConstraints = false
        return _searchButton
    }()
    
    lazy var bottomLineView : UIView = {
        var _bottomLineView = UIView()
        _bottomLineView.backgroundColor = .systemGray2
        _bottomLineView.translatesAutoresizingMaskIntoConstraints = false
        return _bottomLineView
    }()
    
    lazy var tableView: UITableView = { [weak self] in
        let _tableView = UITableView(frame: .zero, style: .plain)
        _tableView.separatorStyle        = .none
        _tableView.estimatedRowHeight    = 168
        _tableView.backgroundColor       = .secondarySystemBackground
        _tableView.register(SearchItemCell.self, forCellReuseIdentifier: String(describing: SearchItemCell.self))
        _tableView.showsVerticalScrollIndicator = false
        _tableView.rowHeight = UITableView.automaticDimension
        _tableView.contentInset =  UIEdgeInsets(top: 56, left: 0, bottom: 0, right: 0)
        _tableView.translatesAutoresizingMaskIntoConstraints = false
        return _tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViewHierachy()
        self.setConstraints()
        self.bind()
    }


    func setViewHierachy() {
        contentView.addSubview(searchTextField)
        contentView.addSubview(searchButton)
        contentView.addSubview(bottomLineView)
        self.view.addSubview(tableView)
        self.view.addSubview(contentView)
        
    }
    
    func setConstraints() {
        searchTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(59)
            make.centerY.equalToSuperview()
        }
        
        searchButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(19)
            make.centerY.equalToSuperview()
            make.width.equalTo(80)
            make.height.equalTo(30)
        }
        
        bottomLineView.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        contentView.snp.makeConstraints { make in
            let window = UIApplication.shared.windows.first
            make.top.equalToSuperview().inset(window?.safeAreaInsets.top ?? 0)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(56)
        }
        
        tableView.snp.makeConstraints {(make) in
            make.edges.equalToSuperview()
        }
    }
    
    func bind() {
        
    }
}

