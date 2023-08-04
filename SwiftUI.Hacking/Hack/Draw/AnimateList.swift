import SwiftUI

struct AnimateList: View {
    var body: some View {
        List {
            NavigationLink(destination: BasicAnimatePage()) {
                PageRow(image: "livephoto.play", name: "Basic")
            }
            NavigationLink(destination: SpringAnimatePage()) {
                PageRow(image: "scope", name: "Spring")
            }
            NavigationLink(destination: BindingValueAnimatePage()) {
                PageRow(image: "figure.barre", name: "Binding Value")
            }
            NavigationLink(destination: ExplicitAnimatePage()) {
                PageRow(image: "figure.roll", name: "Explicit")
            }
            NavigationLink(destination: DelayAnimatePage()) {
                PageRow(image: "figure.roll.runningpace", name: "Delay")
            }
            NavigationLink(destination: immediatelyAnimatePage()) {
                PageRow(image: "figure.american.football", name: "Immediately Appear")
            }
            NavigationLink(destination: MatchedGeometryEffectPage()) {
                PageRow(image: "figure.archery", name: "MatchedGeometryEffect")
            }
            NavigationLink(destination: MatchedGeometryEffectPage2()) {
                PageRow(image: "figure.australian.football", name: "MatchedGeometryEffect2")
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("Animations")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AnimateList_Previews: PreviewProvider {
    static var previews: some View {
        AnimateList()
    }
}
