//
//  ReposViewModel.swift
//  IntuitCraftWorkz
//
//  Created by Leif Ashley on 10/19/20.
//

import Foundation

protocol ViewModel {
 
}

extension ViewModel {
    func numToView(value: Int?, defaultText: String = "SingleDash".localized) -> String {
        var result: String?
        
        if let value = value {
            let formatter = NumberFormatter()
            formatter.numberStyle = .none
            
            let numVal = value as NSNumber
            result = formatter.string(from: numVal)
        }
        
        return result ?? defaultText
    }
    
    func boolToView(value: Bool?, defaultText: String = "SingleDash".localized) -> String {
        var result: String?
        
        if let value = value {
            result = value ? "Yes" : "No"
        }
        
        return result ?? defaultText
    }
    
    func stringToView(value: String?, defaultText: String = "SingleDash".localized) -> String {
        var result: String? = value
        
        return result ?? defaultText
    }
}

class RepoViewModel: ViewModel, Identifiable {
    public let id = UUID()
    let repo: Repo
    
    public static func convertArrayToViewModel(from: Array<Repo>) -> Array<RepoViewModel> {
        var result = Array<RepoViewModel>()
        
        for repo in from {
            result.append(RepoViewModel(repo: repo))
        }
        
        return result
    }
    
    var repoId: String {
        return numToView(value: repo.id)
    }
    
    var name: String {
        return stringToView(value: repo.name)
    }
    
    var description: String {
        return stringToView(value: repo.description)
    }
    
    
    var size: String {
        return numToView(value: repo.size)
    }
    
    var starGazersCount: String {
        return numToView(value: repo.stargazers_count)
    }
    
    var watchersCount: String {
        return numToView(value: repo.watchers_count)
    }
    
    var forksCount: String {
        return numToView(value: repo.forks_count)
    }
    
    var openIssuesCount: String {
        return numToView(value: repo.open_issues_count)
    }
    
    var hasOpenIssues: Bool {
        var result = false
        if let count = repo.open_issues_count {
            result = count > 0
        }
        
        return result
    }
    
    var defaultBranch: String {
        return stringToView(value: repo.default_branch)
    }
    
    var hasProjects: String {
        return boolToView(value: repo.has_projects)
    }
    
    var hasDownloads: String {
        return boolToView(value: repo.has_downloads)
    }
    
    var hasWiki: String {
        return boolToView(value: repo.has_wiki)
    }
    
    var issuesUrl: String? {
        return repo.issues_url
    }
    
    init(repo: Repo) {
        self.repo = repo
    }
}

class RepoIssueViewModel: ViewModel, Identifiable {
    public let id = UUID()
    var issue: RepoIssue
    
    var issueId: String {
        return numToView(value: issue.id)
    }
    
    var number: String {
        return numToView(value: issue.number)
    }
    
    var title: String {
        return stringToView(value: issue.title)
    }
    
    
    init(issue: RepoIssue) {
        self.issue = issue
    }
}
