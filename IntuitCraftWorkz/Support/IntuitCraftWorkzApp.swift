//
//  IntuitCraftWorkzApp.swift
//  IntuitCraftWorkz
//
//  Created by Leif Ashley on 10/13/20.
//

import SwiftUI

@main
struct IntuitCraftWorkzApp: App {
    var body: some Scene {
        WindowGroup {
            RepoListView(fetcher: ReposFetcher())
        }
    }
}
