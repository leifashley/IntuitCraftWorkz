//
//  Datasource.swift
//  IntuitCraftWorkz
//
//  Created by Leif Ashley on 10/19/20.
//

import Foundation

protocol Datasource {

}

class GitHubDatasource: Datasource {
    let reposUrl = "https://api.github.com/users/intuit/repos"
    
    
    /// Fetches an array of repos from GitHub
    /// - Parameter completion: returned array of Repos
    func fetchRepos(completion: @escaping (Array<Repo>) -> Void) {
        let network = AppNetwork.current()
        
        network.fetchJsonData(restUrl: reposUrl) { (data) in
            var repos = [Repo]()
            
            do {
                repos = try JSONDecoder().decode(Array<Repo>.self, from: data)
            } catch {
               logger.error("JSON parse error: \(error)")
            }
            
            DispatchQueue.main.async {
                completion(repos)
            }
        }
    }
    
    
    /// Fetches the issues (if any) for a given repo
    /// - Parameters:
    ///   - repo: the repo to use for the fetch
    ///   - completion: returned array of RepoIssues
    func fetchIssues(from repo: Repo, completion: @escaping (Array<RepoIssue>) -> Void) {
        let network = AppNetwork.current()
        
        if let url = repo.issues_url, let index = url.firstIndex(of: "{") {
            let targetUrl = String(url[..<index])
            
            network.fetchJsonData(restUrl: targetUrl) { (data) in
                var issues = [RepoIssue]()
                
                do {
                    issues = try JSONDecoder().decode(Array<RepoIssue>.self, from: data)
                } catch {
                   logger.error("JSON parse error: \(error)")
                }
                
                DispatchQueue.main.async {
                    completion(issues)
                }
            }
        }
        
        
    }
    
}
