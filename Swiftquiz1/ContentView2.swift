import SwiftUI


struct ContentView2: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State private var isAlertPresented = false
    @State private var isCorrect = false
    @State private var isSheetPresented = false
    @State private var currentQuestion = 0
    @State private var correctAnswers = 0
    @ObservedObject var glob = Glob()
    
    var questions = [Question(title: "Civil includes...",
                              option1: "All life",
                              option2: "Robots",
                              option3: "Cyborgs",
                              option4: "Plants",
                              correctOption: 1),
                     Question(title: "It is typically used by",
                              option1: "Scientist",
                              option2: "Robots",
                              option3: "Monkeys",
                              option4: "in classrooms",
                              correctOption: 1),
                     Question(title: "It was made by",
                              option1: "Google",
                              option2: "Oxford",
                              option3: "Harvard",
                              option4: "Yahoo",
                              correctOption: 1),
    
                     Question(title: "desert includes...",
                                               option1: "All life",
                                               option2: "Robots",
                                               option3: "Cyborgs",
                                               option4: "Plants",
                                               correctOption: 1),
                    Question(title: "It is typically used by",
                                               option1: "Scientist",
                                               option2: "Robots",
                                               option3: "Monkeys",
                                               option4: "in classrooms",
                                               correctOption: 1),
                    Question(title: "It was made by",
                                               option1: "Google",
                                               option2: "Oxford",
                                               option3: "Harvard",
                                               option4: "Yahoo",
                                               correctOption: 1)
    
    
    ]
    
    var body: some View {
        VStack{
            ProgressView(value: Double(currentQuestion),
                                 total: Double(questions.count)/2)
                        .padding()
            
            Text(questions[currentQuestion].title)
                .padding()
            
            HStack {
                VStack {
                    Button(action: {
                        viewRouter.currentPage = .page2
                    }) {
                  
                    }
                    Button {
                        didTapOption(1)
                    } label: {
                        Image(systemName: "triangle.fill")
                        Text(questions[currentQuestion].option1)
                    }.padding()
                    .background(Color.blue.opacity(0.5))
                    .cornerRadius(15)
                    .animation(.spring(response: 2))
                    Button {
                        didTapOption(2)
                    } label: {
                        Image(systemName: "circle.fill")
                        Text(questions[currentQuestion].option2)
                    }.padding()
                    .background(Color.red.opacity(0.5))
                    .cornerRadius(15)
                    .animation(.spring(response: 2))
                }
                .padding()
                VStack {
                    Button {
                        didTapOption(3)
                    } label: {
                        Image(systemName: "diamond.fill")
                        Text(questions[currentQuestion].option3)
                    }.padding()
                    .background(Color.yellow.opacity(0.5))
                    .cornerRadius(15)
                    .animation(.spring(response: 2))
                    Button {
                        didTapOption(4)
                    } label: {
                        Image(systemName: "square.fill")
                        Text(questions[currentQuestion].option4)
                    }.padding()
                    .background(Color.green.opacity(0.5))
                    .cornerRadius(15)
                    .animation(.spring(response: 2))
                }
                .padding()
            }
            .padding()
        }
        .alert(isPresented: $isAlertPresented) {
            Alert(title: Text(isCorrect ? "Well done" : "You Suck"),
                  message: Text(isCorrect ? "Congrats 🎉" : "Try harder😔"),
                  dismissButton: .default(Text("OK")){
                    currentQuestion += 1
                    if currentQuestion == questions.count/2 {
                        
                        currentQuestion = 0
                        isSheetPresented = true
                        glob.streak += 1
                        
                    }
                
                   
                
                  })
        }
        .sheet(isPresented: $isSheetPresented) {
            ScoreView(score: correctAnswers, totalScore: questions.count)
    
        }
    }
    
    func didTapOption(_ optionNumber: Int) {
        if optionNumber == questions[currentQuestion].correctOption {
            print("Correct!")
            isCorrect = true
            correctAnswers += 1
        } else {
            print("Wrong!")
            isCorrect = false
      
        }
        isAlertPresented = true
    }
    
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2().environmentObject(ViewRouter())
    }
}
