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
    var sessionList = [SessionModel]()
    
    //MARK: Views
    var highestPercentageLabel = UILabel()
    var sessionListTableView = UITableView()
    var sectionHeader = UIView()
    
    //MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupHighestLabel()
        setupTableView()
        DataLoader.shared.getData { (feedback) in
            self.sessionList = feedback
            let array = self.sessionList.map{$0.exercises.map{$0.practicedAtBpm}}
            let maximum = getMaxVal(array)
            self.sessionListTableView.reloadData()
            self.highestPercentageLabel.text = "\(StringConstants.maxValue)\(maximum)%"

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
            make.topMargin.equalTo(highestPercentageLabel.snp.bottom).offset(10)
            make.left.right.equalTo(view)
            make.bottomMargin.equalTo(view)
        }
    }
    
    func setupHighestLabel() {
        view.addSubview(highestPercentageLabel)
        highestPercentageLabel.snp.makeConstraints { (make) in
            make.left.topMargin.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-10)
            make.height.equalTo(view).multipliedBy(0.05)
        }
        
    }

    
    //MARK: Helpers
    
}


extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessionList[section].exercises.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeader = UIView()
        sectionHeader.backgroundColor = ColorConstants.defaultGray500
        
        let SectionNameLabel = UILabel()
        SectionNameLabel.text = (sessionList[section].name).uppercased()
        SectionNameLabel.textColor = .black
        SectionNameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        SectionNameLabel.frame = CGRect(x: 20, y: -2 , width: self.view.frame.width, height: 50)
        sectionHeader.addSubview(SectionNameLabel)
        
        let dateLabel = UILabel()
        dateLabel.text = String((sessionList[section].practicedOnDate).prefix(10) )
        dateLabel.textColor = .black
        dateLabel.font = UIFont.boldSystemFont(ofSize: 10)
        dateLabel.frame = CGRect(x: 20, y: 15 , width: self.view.frame.width, height: 50)
        sectionHeader.addSubview(dateLabel)
        return sectionHeader
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sessionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sessionListTableView.dequeueReusableCell(withIdentifier: StringConstants.cellId, for: indexPath) as? SessionTableCell
        let exercises = sessionList[indexPath.section].exercises[indexPath.row]
        cell?.setupSessionCell(exercises: exercises)
        return cell ?? UITableViewCell()
    }
}
