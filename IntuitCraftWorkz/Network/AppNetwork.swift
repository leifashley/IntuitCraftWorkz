//
//  AppNetwork.swift
//  IntuitCraftWorkz
//
//  Created by Leif Ashley on 10/19/20.
//

import Foundation


/// Core network class, app wide
class AppNetwork {
    /// Returns the current app network - might change over time
    /// - Returns: AppNetwork insance
    static func current() -> AppNetwork {
        return AppNetwork()
    }
    
    
    /// Fetches a data response and handles network errors
    ///
    /// - Parameters:
    ///   - restUrl: URL string used for the fetch
    ///   - completion: closure callback using the resulting Data
    func fetchJsonData(restUrl: String, completion: @escaping (Data) -> Void) {
        if let url = URL(string: restUrl) {
            URLSession.shared.dataTask(with: url) {(data, response, error) in
                var resultData: Data?
                
                if let d = data {
                    resultData = d
                } else {
                    logger.warn("Datasource - No Data")
                }
                
                completion(resultData ?? Data())
            }.resume()
        } else {
            logger.error("Datasource has invalid url")
            completion(Data())
        }
    }
}
