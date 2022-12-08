

import SwiftUI


struct ContentviewIknow: View {
    @ObservedObject var glob = Glob()
    @EnvironmentObject var viewRouter: ViewRouter

    var body: some View {
        TabView {
                   RedView2()
                     .tabItem {
                         Image(systemName: "house.circle")
                        Text("First Tab")
                      }

                   BlueView2()
                     .tabItem {
                        Image(systemName: "person.circle")
                        Text("Second Tab")
                      }
        }
        
}
}

struct ContentviewIknow_Previews: PreviewProvider {
    static var previews: some View {
        ContentviewIknow().environmentObject(ViewRouter())
    }
}

struct RedView2: View {
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
            Text("\(glob.array[glob.i+2])")
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
            Text("Relating to ordinary citizens and their concerns, as distinct from military or ecclesiastical matters.")
                .padding(40)
                .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.blue, lineWidth: 4)
            )
            
            Image("happyDog")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 200)
                .cornerRadius(10)
                .clipped()
            
            
            
            
            Button(action: {
                withAnimation {
                    glob.streak = glob.streak + 1
                    viewRouter.currentPage = .page6
                    
                    
                }
            }) {
                
                Text("Take Quiz")
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






struct BlueView2: View {
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
