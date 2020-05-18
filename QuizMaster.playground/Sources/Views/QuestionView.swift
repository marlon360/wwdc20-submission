import SwiftUI

public struct QuestionView: View {
    
    var question: Question
    
    @State var answered = false
    @State var correct = false
    
    @State var showingPreview = false
        
    public init(question: Question) {
        self.question = question
    }
    
    public var body: some View {
            VStack {
                HStack {
                    ZStack {
                        VStack {
                            Text(self.question.question)
                                .font(.system(size: 26, weight: .bold, design: .default))
                                .multilineTextAlignment(.center)
                                .padding(30)
                            if ((self.question.ARContent) != nil) {
                                Button("Show AR Content") {
                                    self.showingPreview.toggle()
                                }
                            } else if ((self.question.ImageContent) != nil) {
                                Button("Show Image") {
                                    self.showingPreview.toggle()
                                }
                            }
                                
                        }
                        .frame(maxWidth: .infinity, minHeight: 200)
                        .background(RoundedRectangle(cornerRadius: 22).fill(Color.white).shadow(color: Color(.gray).opacity(0.2), radius: 20, x: 0, y: 2))
                        .rotation3DEffect(.degrees(self.answered ? 180.0 : 0.0), axis: (x: 0.0, y: 1.0, z: 0.0))
                        .opacity(self.answered ? 0.0 : 1.0)
                        
                        VStack {
                            Text(self.correct ? "Your answer is correct!" : "Your answer is wrong!")
                                .font(.system(size: 26, weight: .bold, design: .default))
                                .multilineTextAlignment(.center)
                                .padding(30)
                                
                        }
                        .frame(maxWidth: .infinity, minHeight: 200)
                        .background(RoundedRectangle(cornerRadius: 22).fill(Color.white).shadow(color: Color(.gray).opacity(0.2), radius: 20, x: 0, y: 2))
                        .rotation3DEffect(.degrees(self.answered ? 0.0 : 180.0), axis: (x: 0.0, y: -1.0, z: 0.0))
                        .opacity(self.answered ? 1.0 : 0.0)
                        
                    }
                    .animation(.easeInOut(duration: 0.55))
                }
                .padding()
                HStack {
                    AnswerButton(text: self.question.allAnswers[0], correctAnswer: self.question.correctAnswer, answered: $answered, correct: $correct)
                    
                    Spacer()
                        .frame(maxWidth: 20)
                    AnswerButton(text: self.question.allAnswers[1], correctAnswer: self.question.correctAnswer, answered: $answered, correct: $correct)
                    
                }
                .padding()
                HStack {
                   AnswerButton(text: self.question.allAnswers[2], correctAnswer: self.question.correctAnswer, answered: $answered, correct: $correct)
                    
                    Spacer()
                    .frame(maxWidth: 20)
                    
                    AnswerButton(text: self.question.allAnswers[3], correctAnswer: self.question.correctAnswer, answered: $answered, correct: $correct)
                }
                .padding()
            }
        .sheet(isPresented: $showingPreview) {
            VStack(alignment: .leading) {
                HStack {
                    Button("Close") {
                        self.showingPreview.toggle()
                    }
                    Spacer()
                }
                .padding()
                if ((self.question.ARContent) != nil) {
                    ARQuickLookView(name: self.question.ARContent!)
                } else if ((self.question.ImageContent) != nil) {
                    Image(uiImage: UIImage(named: self.question.ImageContent!)!)
                        .resizable()
                        .scaledToFit()
                }
                
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        }
    }
    
}
