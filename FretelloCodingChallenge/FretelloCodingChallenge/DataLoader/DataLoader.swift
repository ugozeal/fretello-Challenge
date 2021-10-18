//
//  DataLoader.swift
//  FretelloCodingChallenge
//
//  Created by David U. Okonkwo on 1/30/21.
//

import Foundation

final class DataLoader {
    static let shared = DataLoader()
}

extension DataLoader {
    public func getData(success: @escaping ([SessionModel]) -> (), failure: @escaping (String) -> ()) {
        let url = URLConstants.APIURL
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response,error in
            guard let data = data, error == nil else {
                return
            }
            var result: [SessionModel]?
            do{
                result = try JSONDecoder().decode([SessionModel].self, from: data)
            }
            catch {
                print("failed to convert \(error)")
                DispatchQueue.main.async {
                    
                    failure(error.localizedDescription)
                    debugPrint(">>>>", error)
                }
            }
            guard let json = result else {
                return
            }
            DispatchQueue.main.async {
                success(json)
            }
        })
        
        task.resume()
    }
}
