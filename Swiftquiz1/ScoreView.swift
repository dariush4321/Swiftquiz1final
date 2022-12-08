

import SwiftUI

struct ScoreView: View {
    
    var score: Int
    var totalScore: Int
    @EnvironmentObject var viewRouter: ViewRouter
    @ObservedObject var glob = Glob()

    var body: some View {
        ZStack {
        
            VStack {
                CircularProgressView(progress: CGFloat(score) / CGFloat(totalScore/2))
                    .frame(width: 150, height: 150).padding(30)
                Text("Your score was:")
                Text("\(score)/\(totalScore/2)")
                Image(score == totalScore ? "pro" : "noob")
                           .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 400)
                Button(action: {
                    viewRouter.currentPage = .page4
                    self.glob.newword = self.glob.newword + 3
                    self.glob.streak = self.glob.streak + 1
                }) {
                    Text("Continue")
                        .padding()
                        .background(Color.purple.opacity(1))
                        .cornerRadius(15)
                        .animation(.spring(response: 2))
                        .foregroundColor(.white)
                }.padding(60)
            }
            
        }.frame(maxWidth: .infinity)
            .background(
            LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all))
    }
 
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(score: 10, totalScore: 15)
        
    }
}
