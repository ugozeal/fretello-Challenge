//
//  SessionTableCell.swift
//  FretelloCodingChallenge
//
//  Created by David U. Okonkwo on 1/30/21.
//

import UIKit
import SnapKit

class SessionTableCell: UITableViewCell {
    //MARK: Properties
    
    //MARK: Views
    var cardView = UIView()
    var sessionNameLabel = UILabel()
    var practiceDateLabel = UILabel()
    var excerciseIdLabel = UILabel()
    var excerciseNameLabel = UILabel()
    var exerciseBpmLabel = UILabel()


    //MARK: Overrides
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCardView()
        setupExcerciseBpmLabel()

        setupSessionNameLabel()
        setupPracticeDateLabel()
        setupExcerciseNameLabel()
        setupExcerciseIdLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError(StringConstants.fatalError)
    }
    
    //MARK: Actions
    func setupSessionCell(exercises: ExerciseModel) {
        
        excerciseNameLabel.text = "\(StringConstants.exerciseName) \(exercises.name)"
        exerciseBpmLabel.text = "\(StringConstants.practisedAt) \(String(exercises.practicedAtBpm)) \(StringConstants.bpm)"
            excerciseIdLabel.text = exercises.exerciseId
    }
    
    func setupCardView() {
        addSubview(cardView)
        cardView.backgroundColor = ColorConstants.cardBgColor
        cardView.layer.cornerRadius = 10
        cardView.snp.makeConstraints { (make) in
            make.left.top.equalTo(10)
            make.right.bottom.equalTo(-10)
        }
    }
    
    func setupExcerciseBpmLabel() {
        cardView.addSubview(excerciseIdLabel)
        excerciseIdLabel.textAlignment = .center
        excerciseIdLabel.text = "1"
        excerciseIdLabel.textColor = .black
        excerciseIdLabel.layer.cornerRadius = 30
        excerciseIdLabel.clipsToBounds = true
        excerciseIdLabel.backgroundColor = ColorConstants.defaultGray500
        
        excerciseIdLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(cardView)
            make.left.equalTo(20)
            make.width.equalTo(60)
            make.height.equalTo(60)
        }

    }
    
    func setupSessionNameLabel() {
        cardView.addSubview(sessionNameLabel)
        sessionNameLabel.font = UIFont.boldSystemFont(ofSize: 15)
        sessionNameLabel.textColor = ColorConstants.nameLabelColor
        sessionNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(cardView.snp.top).offset(20)
            make.left.equalTo(excerciseIdLabel.snp.right).offset(20)
        }
    }
    
    func setupPracticeDateLabel() {
        cardView.addSubview(practiceDateLabel)
        practiceDateLabel.font = UIFont.systemFont(ofSize: 13)
        practiceDateLabel.textColor = ColorConstants.defaultGray500
        practiceDateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(sessionNameLabel.snp.bottom).offset(5)
            make.left.equalTo(excerciseIdLabel.snp.right).offset(20)
        }
    }
    
    func setupExcerciseIdLabel() {
        cardView.addSubview(exerciseBpmLabel)
        exerciseBpmLabel.font = UIFont.systemFont(ofSize: 13)
        exerciseBpmLabel.textColor = ColorConstants.defaultGray500
        exerciseBpmLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(cardView).offset(10)
            make.left.equalTo(excerciseIdLabel.snp.right).offset(20)
        }
    }
    
    func setupExcerciseNameLabel() {
        cardView.addSubview(excerciseNameLabel)
        excerciseNameLabel.font = UIFont.systemFont(ofSize: 13)
        excerciseNameLabel.textColor = ColorConstants.defaultGray500 
        excerciseNameLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(cardView).offset(-10)
            make.left.equalTo(excerciseIdLabel.snp.right).offset(20)
        }
    }
    
}
