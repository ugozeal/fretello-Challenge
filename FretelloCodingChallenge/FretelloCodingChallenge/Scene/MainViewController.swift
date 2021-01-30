//
//  ViewController.swift
//  FretelloCodingChallenge
//
//  Created by David U. Okonkwo on 1/29/21.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    //MARK: Properties
    var sesionList = [SessionModel]()
    
    //MARK: Views
    var sessionListTableView = UITableView()
    
    //MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupTableView()
        DataLoader.shared.getData { (feedback) in
                self.sesionList = feedback
            self.reloadTableView()
        } failure: { (error) in
            self.handleError(prompt: error)
        }
    }
    
    //MARK: Actions
    func setupTableView() {
        view.addSubview(sessionListTableView)
        //Set Delegate
        sessionListTableView.delegate = self
        sessionListTableView.dataSource = self
        //Set the height
        sessionListTableView.rowHeight = view.frame.height / 8
        sessionListTableView.register(SessionTableCell.self, forCellReuseIdentifier: StringConstants.cellId)
        //Set Constraints
        sessionListTableView.snp.makeConstraints { (make) in
            make.topMargin.equalTo(view).offset(10)
            make.left.right.equalTo(view)
            make.bottomMargin.equalTo(view)
        }
    }
    
    //MARK: Helpers
    func reloadTableView() {
        DispatchQueue.main.async {
            self.sessionListTableView.reloadData()
        }
    }

}


extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sesionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sessionListTableView.dequeueReusableCell(withIdentifier: StringConstants.cellId, for: indexPath) as? SessionTableCell
        let exercises = sesionList[indexPath.row]
        cell?.setupSessionCell(exercises: exercises)
        return cell ?? UITableViewCell()
    }
    
    
}
