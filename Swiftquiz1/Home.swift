
import Foundation
import SwiftUI

struct Home: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        switch viewRouter.currentPage {
        case .page1:
            ContentView()
        case .page2:
            ContentViewB()
        case .page3:
            LoginView()
        case .page4:
            Ncontentview()
        case .page5:
            ContentviewIknow()
        case .page6:
            ContentView2()
        }
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home().environmentObject(ViewRouter())
    }
}
