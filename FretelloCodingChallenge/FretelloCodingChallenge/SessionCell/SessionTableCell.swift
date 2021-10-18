//
//  SessionTableCell.swift
//  FretelloCodingChallenge
//
//  Created by David U. Okonkwo on 1/30/21.
//

import UIKit
import SnapKit
import Kingfisher

class SessionTableCell: UITableViewCell {
    //MARK: Properties
    
    //MARK: Views
    var cardView = UIView()
    var sessionNameLabel = UILabel()
    var practiceDateLabel = UILabel()
    var excerciseIdLabel = UILabel()
    var excerciseNameLabel = UILabel()
    var exerciseBpmLabel = UILabel()
    var exerciseImageView = UIImageView()


    //MARK: Overrides
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCardView()
        setupSessionImage()

        setupSessionNameLabel()
        setupPracticeDateLabel()
        setupExcerciseNameLabel()
        setupBPMLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError(StringConstants.fatalError)
    }
    
    //MARK: Actions
    func setupSessionCell(exercises: ExerciseModel) {
        DispatchQueue.main.async {
            do {
                guard let url = URL(string: "\(URLConstants.ImageURL)\(exercises.exerciseId).png") else { return }
                self.exerciseImageView.kf.setImage(with: url)
//                UIImage.loadFrom(url: url) { image in
//                    self.exerciseImageView.kf.setImage(with: url)
//                }
            }
        }
        
        excerciseNameLabel.text = "\(StringConstants.exerciseName) \(exercises.name)"
        exerciseBpmLabel.text = "\(StringConstants.practisedAt) \(String(exercises.practicedAtBpm)) \(StringConstants.bpm)"
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
    
    func setupSessionImage() {
        cardView.addSubview(exerciseImageView)
        exerciseImageView.layer.cornerRadius = 30
        exerciseImageView.clipsToBounds = true
        exerciseImageView.contentMode = .scaleAspectFill
        exerciseImageView.snp.makeConstraints { (make) in
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
            make.left.equalTo(exerciseImageView.snp.right).offset(20)
        }
    }
    
    func setupPracticeDateLabel() {
        cardView.addSubview(practiceDateLabel)
        practiceDateLabel.font = UIFont.systemFont(ofSize: 13)
        practiceDateLabel.textColor = ColorConstants.defaultGray500
        practiceDateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(sessionNameLabel.snp.bottom).offset(5)
            make.left.equalTo(exerciseImageView.snp.right).offset(20)
        }
    }
    
    func setupBPMLabel() {
        cardView.addSubview(exerciseBpmLabel)
        exerciseBpmLabel.font = UIFont.systemFont(ofSize: 13)
        exerciseBpmLabel.textColor = ColorConstants.defaultGray500
        exerciseBpmLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(cardView).offset(10)
            make.left.equalTo(exerciseImageView.snp.right).offset(20)
        }
    }
    
    func setupExcerciseNameLabel() {
        cardView.addSubview(excerciseNameLabel)
        excerciseNameLabel.font = UIFont.systemFont(ofSize: 13)
        excerciseNameLabel.textColor = ColorConstants.defaultGray500 
        excerciseNameLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(cardView).offset(-10)
            make.left.equalTo(exerciseImageView.snp.right).offset(20)
        }
    }
    
}
