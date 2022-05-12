//
//  LayoutLists.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct LayoutLists: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Stack")) {
                    NavigationLink(destination: VStackPage() ) { PageRow(image: "arrow.uturn.up.circle", name: "VStack") }
                    NavigationLink(destination: HStackPage() ) { PageRow(image: "arrow.uturn.right.circle", name: "HStack") }
                    NavigationLink(destination: ZStackPage() ) { PageRow(image: "slash.circle", name: "ZStack") }
                    NavigationLink(destination: SizeClassPage() ) { PageRow(image: "slash.circle", name: "Adjust size class") }
                }
                
                Section(header: Text("Blur")) {
                    NavigationLink(destination: BlurPage() ) { PageRow(image: "arrow.up.right.circle", name: "Blur") }
                    NavigationLink(destination: MaskViewPage() ) { PageRow(image: "arrow.up.right.circle", name: "Mask") }
                    NavigationLink(destination: DividerPage() ) { PageRow(image: "chevron.right.circle", name: "Divider") }
                    NavigationLink(destination: SpacerPage() ) { PageRow(image: "chevron.left.circle", name: "Spacer") }
                }
                
                Section(header: Text("Alert")) {
                    NavigationLink(destination: AlertPage() ) { PageRow(image: "asterisk.circle", name: "Alert") }
                    NavigationLink(destination: ActionSheetPage() ) { PageRow(image: "arrow.down.right.circle", name: "ActionSheet") }
                    NavigationLink(destination: ModalPage() ) { PageRow(image: "arrow.down.left.circle", name: "Modal") }
                    NavigationLink(destination: PopoverPage() ) { PageRow(image: "arrow.up.left.circle", name: "Popover") }
                }
                
                Section(header: Text("Lists")) {
                    NavigationLink(destination: ListPage() ) { PageRow(image: "arrow.up.and.down.circle", name: "List") }
                    NavigationLink(destination: ExpandingListsPage() ) { PageRow(image: "arrow.up.and.down.circle", name: "ExpandingLists") }
                    NavigationLink(destination: MenuPage() ) { PageRow(image: "leaf.arrow.circlepath", name: "Menu") }
                    NavigationLink(destination: FormPage() ) { PageRow(image: "arrow.left.and.right.circle", name: "Form") }
                    NavigationLink(destination: GroupPage() ) { PageRow(image: "arrow.right.arrow.left.circle", name: "Group") }
                    NavigationLink(destination: DisclosureGroupPage() ) { PageRow(image: "arrow.right.arrow.left.circle", name: "DisclosureGroup") }
                    NavigationLink(destination: ScrollViewPage() ) { PageRow(image: "arrow.up.arrow.down.circle", name: "Scroll") }
                    NavigationLink(destination: ScrollViewReaderPage() ) { PageRow(image: "arrow.up.arrow.down.circle", name: "ScrollViewReader") }
                }
                Section(header: Text("Other")) {
                    NavigationLink(destination: EmptyViewPage() ) { PageRow(image: "arrow.right.circle", name: "Empty") }
                    NavigationLink(destination: AnyViewPage() ) { PageRow(image: "arrow.left.circle", name: "AnyView") }
                    NavigationLink(destination: TupleViewPage() ) { PageRow(image: "arrow.down.circle", name: "TupleView") }
                    NavigationLink(destination: EquatableViewPage() ) { PageRow(image: "arrow.up.circle", name: "EquatableView") }
                }
                
                Section(header: Text("Main Tips")) {
                    NavigationLink(destination: ThemePage() ) { PageRow(image: "arrow.right.circle", name: "Theme") }
                    NavigationLink(destination: SafeAreaPage() ) { PageRow(image: "arrow.left.circle", name: "SafeArea") }
                    NavigationLink(destination: DismissPage() ) { PageRow(image: "arrow.down.circle", name: "Dismiss") }
                    NavigationLink(destination: LazyVGridPage() ) { PageRow(image: "arrow.down.circle", name: "LazyVGrid") }
                    NavigationLink(destination: LazyHGridPage() ) { PageRow(image: "arrow.down.circle", name: "LazyHGrid") }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle(Text("Layout"))
        }
    }
}

#if DEBUG
struct LayoutLists_Previews: PreviewProvider {
    static var previews: some View {
        LayoutLists()
    }
}
#endif
