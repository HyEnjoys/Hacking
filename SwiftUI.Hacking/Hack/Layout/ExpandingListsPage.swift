//
//  ExpandingListsPage.swift
//  SwiftUI.Hacking
//
//  Created by 大大 on 2020/12/10.
//  Copyright © 2020 Yuan. All rights reserved.
//

import SwiftUI

struct ExpandingListsPage: View {
    
    let items: [Bookmark] = [.example1, .example2, .example3]
    /// 进行扩展展示
    var body: some View {
        List(items, children: \.items) { row in
            Image(systemName: row.icon)
            Text(row.name)
        }
        .navigationBarTitle("Expanding List")
    }
}

struct ExpandingListsPage_Previews: PreviewProvider {
    static var previews: some View {
        ExpandingListsPage()
    }
}

struct Bookmark: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    var items: [Bookmark]?

    // some example websites
    static let apple = Bookmark(name: "Apple", icon: "1.circle")
    static let bbc = Bookmark(name: "BBC", icon: "square.and.pencil")
    static let swift = Bookmark(name: "Swift", icon: "bolt.fill")
    static let twitter = Bookmark(name: "Twitter", icon: "mic")

    // some example groups
    static let example1 = Bookmark(name: "Favorites", icon: "star", items: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
    static let example2 = Bookmark(name: "Recent", icon: "timer", items: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
    static let example3 = Bookmark(name: "Recommended", icon: "hand.thumbsup", items: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
}
