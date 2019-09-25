//
//  RestroomCreateViewController.swift
//  FirstCitizen
//
//  Created by Lee on 24/09/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class RestroomCreateViewController: UIViewController {
  
  private let tableView = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationSet()
    configure()
    autoLayout()
  }
  
  private func navigationSet() {
    navigationItem.title = "긴급 똥휴지"
    
    let barButton = UIBarButtonItem(title: "의 뢰", style: .done, target: self, action: #selector(barButtonAction))
    navigationItem.rightBarButtonItem = barButton
  }
  
  @objc private func barButtonAction() {
    
  }
  
  private func configure() {
    view.backgroundColor = .white
    
    tableView.dataSource = self
    tableView.separatorStyle = .none
    view.addSubview(tableView)
    
    view.bindToKeyboard()
  }
  
  private struct Standard {
    static let space: CGFloat = 8
    
  }
  
  private func autoLayout() {
    let guide = view.safeAreaLayoutGuide
    
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
  }
}

extension RestroomCreateViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 8
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.row {
    case 0:
      let cell = UITableViewCell()
      
      cell.selectionStyle = .none
      cell.textLabel?.text = " 위치 입력"
      cell.textLabel?.upsFontHeavy(ofSize: 24)
      
      return cell
      
    case 1:
      let cell = UITableViewCell()
      
      cell.selectionStyle = .none
      cell.textLabel?.text = "현재위치"
      cell.textLabel?.textAlignment = .center
      cell.textLabel?.upsFontHeavy(ofSize: 15)
      
      return cell
      
    case 2:
      let cell = RequestCreateAddressCell()
      
      cell.setting(type: .map)
      
      return cell
      
    case 3:
      let cell = RequestCreateAddressCell()
      
      cell.setting(type: .text)
      
      return cell
      
    case 4:
      let cell = UITableViewCell()
      
      cell.selectionStyle = .none
      cell.textLabel?.text = " 제목"
      cell.textLabel?.upsFontHeavy(ofSize: 24)
      
      return cell
      
    case 5:
      let cell = RequestCreateTextAddCell()
      
      cell.setting(type: .field)
      cell.textField.delegate = self
      
      return cell
      
    case 6:
      let cell = UITableViewCell()
      
      cell.selectionStyle = .none
      cell.textLabel?.text = " 내용"
      cell.textLabel?.upsFontHeavy(ofSize: 24)
      
      return cell
      
    case 7:
      let cell = RequestCreateTextAddCell()
      
      cell.setting(type: .view)
      
      return cell
      
    default:
      return UITableViewCell()
    }
  }
}

extension RestroomCreateViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
}