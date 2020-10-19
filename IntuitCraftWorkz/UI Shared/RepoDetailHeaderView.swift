//
//  RepoDetailHeaderView.swift
//  IntuitCraftWorkz
//
//  Created by Leif Ashley on 10/19/20.
//

import SwiftUI

/// Reusable header for RepoViewModel
struct RepoDetailHeaderView: View {
    let repo: RepoViewModel
    
    var body: some View {
        Group {
            Text(repo.name)
                .font(.headline)
            Text(repo.description)
                .font(.subheadline)
            Text("Repo ID: \(repo.repoId)")
                .padding(.top, 10)
        }
    }
}
