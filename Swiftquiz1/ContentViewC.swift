

import Foundation

import SwiftUI

struct ContentViewC: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            HappyDog1()
            Button(action: {
                withAnimation {
                    viewRouter.currentPage = .page1
                }
            }) {
                BackButtonContent1()
            }
        }
    }
}

struct ContentViewC_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewC().environmentObject(ViewRouter())
    }
}


struct HappyDog1 : View {
    var body: some View {
        return Image("happyDog")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 300, height: 600)
            .cornerRadius(10)
            .clipped()
    }
}

struct BackButtonContent1 : View {
    var body: some View {
        return Text("Back")
            .foregroundColor(.white)
            .frame(width: 200, height: 50)
            .background(Color.blue)
            .cornerRadius(15)
            .padding(.top, 50)
    }
}
