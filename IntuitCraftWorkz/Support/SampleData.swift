//
//  SampleData.swift
//  IntuitCraftWorkz
//
//  Created by Leif Ashley on 10/19/20.
//

import Foundation

#if DEBUG

func sampleRepos() -> Array<RepoViewModel> {
    var repos = [RepoViewModel]()
    
    repos.append(sampleRepo(id: 123, name: "Name1", description: "Desc1"))
    
    return repos
}

func sampleRepo(id: Int, name: String, description: String) -> RepoViewModel {
    var repo = Repo()
    repo.id = id
    repo.name = name
    repo.description = description
    return RepoViewModel(repo: repo)
}


#endif
