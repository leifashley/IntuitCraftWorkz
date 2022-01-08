//
//  Fetchers.swift
//  IntuitCraftWorkz
//
//  Created by Leif Ashley on 10/19/20.
//

import Foundation

public class ReposFetcher: ObservableObject {
    @Published var repos: Array<RepoViewModel> = []
    @Published var isFetching: Bool
    
    init() {
        isFetching = true
        let datasource = GitHubDatasource()
        
        datasource.fetchRepos { (repos) in
            self.isFetching = false
            
            var reposVM: Array<RepoViewModel> = []
            for repo in repos {
                reposVM.append(RepoViewModel(repo: repo))
            }
            
            self.repos = reposVM
        }
    }
    
    init(repos: Array<RepoViewModel>) {
        isFetching = false
        self.repos = repos
    }
}

public class IssuesFetcher: ObservableObject {
    var repoVM: RepoViewModel
    @Published var issues: Array<RepoIssueViewModel> = []
    @Published var isFetching: Bool = false
    
    init(repo: RepoViewModel) {
        self.repoVM = repo
    }
    
    init(repo: RepoViewModel, issues: Array<RepoIssueViewModel>) {
        isFetching = false
        self.repoVM = repo
        self.issues = issues
    }
    
    func fetch() {
        isFetching = true
        
        guard let repo = repoVM.repo else {
            isFetching = false
            return
        }
        
        let datasource = GitHubDatasource()
        datasource.fetchIssues(from: repo) { (issues) in
            self.isFetching = false
            
            var itemsVM: Array<RepoIssueViewModel> = []
            for issue in issues {
                itemsVM.append(RepoIssueViewModel(issue: issue))
            }
            
            logger.debug("Issues fetched: \(itemsVM.count)")
            self.issues = itemsVM
        }
    }
}
