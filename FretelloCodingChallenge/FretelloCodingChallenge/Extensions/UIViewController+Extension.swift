//
//  UIViewController+Extension.swift
//  FretelloCodingChallenge
//
//  Created by David U. Okonkwo on 1/30/21.
//

import UIKit

extension UIViewController {
    func handleError(prompt: String) {
        let alert = UIAlertController(title: StringConstants.oops, message: prompt, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: StringConstants.ok, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
