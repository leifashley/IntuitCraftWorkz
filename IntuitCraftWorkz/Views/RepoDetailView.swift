//
//  RepoDetail.swift
//  IntuitCraftWorkz
//
//  Created by Leif Ashley on 10/19/20.
//

import SwiftUI

struct RepoDetailView: View {
    @State var repo: RepoViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            RepoDetailHeaderView(repo: repo)
            Divider()
            HStack {
                VStack(alignment: .leading) {
                    Text("Default Branch")
                    Text("Has Projects")
                    Text("Has Downloads")
                    Text("Has Wiki")
                }
                VStack(alignment: .leading) {
                    Text("\(repo.defaultBranch)")
                    Text("\(repo.hasProjects)")
                    Text("\(repo.hasDownloads)")
                    Text("\(repo.hasWiki)")
                }
            }
            Divider()
            HStack {
                VStack(alignment: .leading) {
                    Text("Size")
                    Text("Stargazer Count")
                    Text("Watcher Count")
                    Text("Fork Count")
                    Text("Open Issues")
                }
                VStack(alignment: .leading) {
                    Text(repo.size)
                    Text(repo.starGazersCount)
                    Text(repo.watchersCount)
                    Text(repo.forksCount)
                    Text(repo.openIssuesCount)
                }
            }
            
            NavigationLink(destination: RepoIssuesView(fetcher: IssuesFetcher(repo: repo))) {
                ViewIssuesButton(hasIssues: repo.hasOpenIssues)
            }
            .disabled(!repo.hasOpenIssues)
            
            Spacer()
        }
        .padding()
        .padding(.leading, 20)
        .navigationTitle("Repo Detail")
    }
}

struct ViewIssuesButton: View {
    @State var hasIssues: Bool
    
    var body: some View {
        HStack {
            Image(systemName: "ant.fill")
                .font(.title2)
            Text("View Issues")
                .fontWeight(.semibold)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding(10)
        .foregroundColor(.white)
        .background(hasIssues ? Color.blue : Color.gray)
        .cornerRadius(20)
        .padding(20)
    }
}

#if DEBUG

struct RepoDetail_Previews: PreviewProvider {
    static var previews: some View {
        RepoDetailView(repo: sampleRepo())
    }
}

func sampleRepo() -> RepoViewModel {
    var repo = sampleRepo(id: 123, name: "AnimatedFormFieldTableViewCell", description: "UITextField for iOS that enables the user to see both the Input Text and the Placeholder")
    return repo
}

#endif




