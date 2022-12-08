

import SwiftUI


struct ContentViewB: View {
    @ObservedObject var glob = Glob()
    @EnvironmentObject var viewRouter: ViewRouter

    var body: some View {
        TabView {
                   RedView()
                     .tabItem {
                         Image(systemName: "house.circle")
                        Text("First Tab")
                      }

                   BlueView()
                     .tabItem {
                        Image(systemName: "person.circle")
                        Text("Second Tab")
                      }
        }
        
}
}

struct ContentViewB_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewB().environmentObject(ViewRouter())
    }
}

struct RedView: View {
    @ObservedObject var glob = Glob()
    @EnvironmentObject var viewRouter: ViewRouter
    @State public var iknow = true
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 30)
            Text("Word of the day")
                .font(.largeTitle)
                .foregroundColor(.white)
            Text("\(glob.streak)")
              .padding()
              .overlay(
                Circle()
                    .stroke(.blue, lineWidth: 4)
                  .padding(2)
              )
            Spacer()
                .frame(height: 30)
            Text("\(glob.array[glob.i])")
                .fontWeight(.bold)
                .font(.title)
                .padding()
                .background(Color.blue)
                .cornerRadius(40)
                .foregroundColor(.white)
                .padding(10)
                .overlay(
                RoundedRectangle(cornerRadius: 40)
                .stroke(Color.blue, lineWidth: 5)
                )
            Spacer()
                .frame(height: 30)
            
            Text("The branch of science concerned with classification, especially of organisms; systematics.")
                .padding(30)
                .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.blue, lineWidth: 4)
            )
            
            HappyDog()
            
           
            
            Button(action: {
                withAnimation {
                    glob.streak = glob.streak + 1
                    viewRouter.currentPage = .page1
                    self.iknow = false
                    
                }
            }) {
                BackButtonContent()
            }
          
            Button(action: {
                viewRouter.currentPage = .page5
            }) {
                BackButtonContent2()
            }
            
            
            
   
            
            
            
        }.frame(maxWidth: .infinity)
            .background(
            LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.top))
    
        }
    
    
}


struct HappyDog : View {
    var body: some View {
        return Image("happyDog")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 300, height: 100)
            .cornerRadius(10)
            .clipped()
    }
}

struct BackButtonContent : View {
    var body: some View {
        return Text("Take Quiz")
            .foregroundColor(.white)
            .frame(width: 200, height: 50)
            .background(Color.purple)
            .cornerRadius(15)
            .padding(.bottom, 0)
            .padding(10)
        
    }
}
struct BackButtonContent2 : View {
    var body: some View {
        return Text("I know this word")
            .foregroundColor(.white)
            .frame(width: 200, height: 50)
            .background(Color.purple)
            .cornerRadius(15)
            .padding(.bottom, 30)
            .padding(50)
        
    }
}

struct BlueView: View {
    var body: some View {
        ZStack{
            Text("The branch of science concerned with classification, especially of organisms; systematics.")
            
            Spacer()
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
            LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.top))
        
    }
}
