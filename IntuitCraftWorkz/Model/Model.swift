//
//  Model.swift
//  IntuitCraftWorkz
//
//  Created by Leif Ashley on 10/19/20.
//

import Foundation

struct Repo: Codable, Identifiable {
    var id: Int?
    var name: String?
    var description: String?
    
    var size: Int?
    var stargazers_count: Int?
    var watchers_count: Int?
    var forks_count: Int?
    var open_issues_count: Int?
    
    var default_branch: String?
    var has_projects: Bool?
    var has_downloads: Bool?
    var has_wiki: Bool?
    var has_issues: Bool?
    
    var issues_url: String?
    
    init() {}
}

struct RepoIssue: Codable, Identifiable {
    var id: Int?
    var number: Int?
    var title: String?
}
