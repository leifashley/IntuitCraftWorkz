//
//  ContentView.swift
//  IntuitCraftWorkz
//
//  Created by Leif Ashley on 10/13/20.
//

import SwiftUI

struct RepoListView: View {
    @ObservedObject var fetcher: ReposFetcher
        
    var body: some View {
        ZStack(alignment: .center) {
            VStack {
                NavigationView {
                    List(fetcher.repos) { repo in
                        NavigationLink(destination: RepoDetailView(repo: repo)) {
                            RepoCell(repo: repo)
                        }
                    }.navigationTitle("Intuit GitHub")
                }
                .navigationViewStyle(.stack)
                .disabled(fetcher.isFetching)
                .blur(radius: fetcher.isFetching ? 3 : 0)
            }
            
            LoadingDataView(isLoading: $fetcher.isFetching)
        }
        
    }
}

struct RepoCell: View {
    var repo: RepoViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(repo.name)").font(.title3)
            Text("\(repo.description)")
                .font(.footnote)
                .lineLimit(2)
        }
    }
}

#if DEBUG

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RepoListView(fetcher: ReposFetcher(repos: sampleRepos()))
    }
}


#endif

