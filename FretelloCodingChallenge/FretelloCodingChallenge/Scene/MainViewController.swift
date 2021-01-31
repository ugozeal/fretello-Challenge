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
    var sectionHeader = UIView()
    
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
        return sesionList[section].exercises.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeader = UIView()
        sectionHeader.backgroundColor = ColorConstants.defaultGray500
        
        let SectionNameLabel = UILabel()
        SectionNameLabel.text = (sesionList[section].name).uppercased()
        SectionNameLabel.textColor = .black
        SectionNameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        SectionNameLabel.frame = CGRect(x: 20, y: -2 , width: self.view.frame.width, height: 50)
        sectionHeader.addSubview(SectionNameLabel)
        
        let dateLabel = UILabel()
        dateLabel.text = String((sesionList[section].practicedOnDate).prefix(10) )
        dateLabel.textColor = .black
        dateLabel.font = UIFont.boldSystemFont(ofSize: 10)
        dateLabel.frame = CGRect(x: 20, y: 15 , width: self.view.frame.width, height: 50)
        sectionHeader.addSubview(dateLabel)
        return sectionHeader
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sesionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sessionListTableView.dequeueReusableCell(withIdentifier: StringConstants.cellId, for: indexPath) as? SessionTableCell
        let exercises = sesionList[indexPath.section].exercises[indexPath.row]
        cell?.setupSessionCell(exercises: exercises)
        return cell ?? UITableViewCell()
    }
    
    
}
