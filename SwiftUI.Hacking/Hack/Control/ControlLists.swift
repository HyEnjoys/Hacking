//
//  ControlLists.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct ControlLists: View {
    
    @EnvironmentObject var tabState : TabBarState
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Basic")) {
                    NavigationLink(destination:
                        TextPage().onAppear {
                            tabState.hidden = true
                        }.onDisappear {
                            tabState.hidden = false
                        }
                    ) {
                        PageRow(image: "textformat.size", name: "Test")
                    }
                    NavigationLink(destination: LabelPage() ) { PageRow(image: "textformat.size", name: "Label") }
                    NavigationLink(destination: ImagePage() ) { PageRow(name: "Image") }
                    NavigationLink(destination: TextFieldPage() ) { PageRow(image: "textformat.size", name: "TextField") }
                    NavigationLink(destination: TextEditorPage() ) { PageRow(image: "textformat.size", name: "TextEditor") }
                }
                Section(header: Text("Button")) {
                    NavigationLink(destination: ButtonPage() ) { PageRow(image: "textformat.size", name: "Button") }
                    NavigationLink(destination: EditButtonPage() ) { PageRow(name: "EditButton") }
                }
                Section(header: Text("Picker")) {
                    NavigationLink(destination: PickerSamplePage() ) {
                        PageRow(image: "figure.pickleball", name: "Picker")
                    }
                    NavigationLink(destination: DatePickerPage() ) {
                        PageRow(image: "figure.pilates", name: "DatePicker")
                    }
                    NavigationLink(destination: ColorPickerPage() ) {
                        PageRow(image: "tropicalstorm", name: "ColorPicker")
                    }
                    if #available(iOS 16.0, *) {
                        NavigationLink(destination: PhotoPickerPage() ) {
                            PageRow(image: "tropicalstorm.circle", name: "PhotoPicker")
                        }
                    }
                    NavigationLink(destination: FilePickerPage() ) {
                        PageRow(image: "folder.fill.badge.questionmark", name: "FilePicker")
                    }
                    NavigationLink(destination: FileExportPage() ) {
                        PageRow(image: "square.grid.3x1.folder.badge.plus", name: "FileExport")
                    }
                }
                Section(header: Text("UI")) {
                    NavigationLink(destination: VideoPlayerPage()) {
                        PageRow(image: "square.and.arrow.down", name: "VideoPlayer")
                    }
                }
                Section(header: Text("Value")) {
                    NavigationLink(destination: TogglePage() ) { PageRow(image: "textformat.size", name: "Toggle") }
                    NavigationLink(destination: StepperPage() ) { PageRow(name: "Stepper") }
                    NavigationLink(destination: SliderPage() ) { PageRow(image: "textformat.size", name: "Slider") }
                    NavigationLink(destination: ProgressViewPage() ) { PageRow(image: "textformat.size", name: "ProgressView") }
                }
                
                Section(header: Text("Support")) {
                    NavigationLink(destination: ViewModifierPage() ) { PageRow(image: "textformat.size", name: "ViewModifier") }
                    NavigationLink(destination: ViewBuilderPage() ) { PageRow(name: "ViewBuilder") }
                    NavigationLink(destination: AppearPage() ) {
                        PageRow(name: "Appear")
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle(Text("Control"))
        }
        .onAppear {
            print("ControlLists onAppear")
        }
        .onDisappear {
            print("ControlLists onDisappear")
        }
    }
}

#if DEBUG
struct ControlLists_Previews: PreviewProvider {
    static var previews: some View {
        ControlLists()
    }
}
#endif
