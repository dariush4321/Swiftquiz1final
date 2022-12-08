

import SwiftUI

@main

struct SwiftUIqiz: App {
    @StateObject var viewRouter = ViewRouter()
       
       var body: some Scene {
           WindowGroup {
               Home().environmentObject(viewRouter)
           }
       }
}

