import SwiftUI

public struct PencilQuizView: View {
    
    var questions: [Question]
    
   @State var index = 0
        
    public init(questions: [Question]) {
        self.questions = questions
    }
    
    public var body: some View {
        VStack {
            Spacer()
            ZStack {
                ForEach(0..<self.questions.count) { i in
                    DrawingQuestionView(question: self.questions[i])
                        .offset(x: self.getOffset(index: i) * -400)
                        .opacity(((self.index - i) == 0) ? 1.0 : 0.0)
                        .animation(.easeInOut(duration: 0.55))
                }
            }
            
            VStack {
                HStack {
                    Button("Next Question") {
                        self.nextQuestion()
                    }
                    .disabled(!self.nextQuestionAvailable())
                }
                .padding(.top, 50)
            }
            Spacer()
        }
        .padding(12)
        .background(Rectangle().fill(Color.background))
    }
    
    private func getOffset(index: Int) -> CGFloat {
        return CGFloat((self.index - index))
    }
    
    private func nextQuestionAvailable() -> Bool {
        return self.index + 1 < self.questions.count
    }
    
    private func nextQuestion() {
        self.index += 1
    }
    
}
