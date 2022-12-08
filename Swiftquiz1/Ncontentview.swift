

import SwiftUI


struct Ncontentview: View {
    @ObservedObject var glob = Glob()
    @EnvironmentObject var viewRouter: ViewRouter

    var body: some View {
        TabView {
                   RedView1()
                     .tabItem {
                         Image(systemName: "house.circle")
                        Text("First Tab")
                      }

                   BlueView1()
                     .tabItem {
                        Image(systemName: "person.circle")
                        Text("Second Tab")
                      }
        }
        
}
}

struct Ncontentview_Previews: PreviewProvider {
    static var previews: some View {
        Ncontentview().environmentObject(ViewRouter())
    }
}

struct RedView1: View {
    @ObservedObject var glob = Glob()
    @EnvironmentObject var viewRouter: ViewRouter

    var body: some View {
        VStack {
            Spacer()
                .frame(height: 30)
            Text("Word of the day")
                .font(.largeTitle)
            Text("13")
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
            Image("check")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 200)
                .cornerRadius(10)
                .clipped()
            
            
            
            
            Button(action: {
                withAnimation {
                    glob.streak = glob.streak + 1
                    viewRouter.currentPage = .page1
                    
                    
                }
            }) {
                
                Text("You have finished for the day")
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.purple)
                    .cornerRadius(15)
                    .padding(.top, 30)
            }
            Spacer()
        }.frame(maxWidth: .infinity)
            .background(
            LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.top))
    
        }
    
    
}






struct BlueView1: View {
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
