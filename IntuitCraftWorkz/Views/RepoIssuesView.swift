//
//  RepoIssuesView.swift
//  IntuitCraftWorkz
//
//  Created by Leif Ashley on 10/19/20.
//

import SwiftUI

struct RepoIssuesView: View {
    @State var fetcher: IssuesFetcher
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                RepoDetailHeaderView(repo: fetcher.repoVM)
                Text("Issues").font(.title2).padding(.top, 20)
                Divider()
            }
            .padding()
            
            
            List(fetcher.issues) { issue in
                Text("\(issue.number) - \(issue.title)").lineLimit(2)
            }
        }
        .navigationTitle("Issue Detail")
        .onAppear(perform: {
            fetcher.fetch()
        })
            
    }
    
}

#if DEBUG

struct RepoIssuesView_Previews: PreviewProvider {
    static var previews: some View {
        let repo = sampleRepo(id: 123, name: "AnimatedFormFieldTableViewCell", description: "UITextField for iOS that enables the user to see both the Input Text and the Placeholder")
        
        var issues = [
            RepoIssueViewModel(issue: RepoIssue(id: 1, number: 50, title: "Issue1")),
            RepoIssueViewModel(issue: RepoIssue(id: 2, number: 51, title: "Issue2"))
        ]
        
        RepoIssuesView(fetcher: IssuesFetcher(repo: repo, issues: issues))
    }
}

#endif
