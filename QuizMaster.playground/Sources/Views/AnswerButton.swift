import SwiftUI

public struct AnswerButton: View {
        
    var text: String
    var correctAnswer: String
    
    @Binding var answered: Bool
    @Binding var correct: Bool
    
    @State var tapped = false
    
    public init(text: String, correctAnswer: String, answered: Binding<Bool>, correct: Binding<Bool>) {
        self.text = text
        self.correctAnswer = correctAnswer
        self._answered = answered
        self._correct = correct
    }
    
    public var body: some View {
        Button(action: {
            self.tappedButton()
        }) {
            Text(self.text)
                .frame(maxWidth: .infinity)
                .padding(20)
                .background(RoundedRectangle(cornerRadius: 10).fill(self.getBackgroundColor()))
                .foregroundColor(self.getForegroundColor())
                .animation(nil)
        }
        .modifier(Shake(animatableData: CGFloat(self.isWrong() ? 0 : 1)))
        .animation(.default)
        .disabled(self.answered)
    }
    
    private func isCorrect() -> Bool {
        return self.answered && self.text == self.correctAnswer
    }
    
    private func isWrong() -> Bool {
        return self.tapped && self.answered && self.text != self.correctAnswer
    }
    
    private func getForegroundColor() -> Color {
        if (self.isCorrect()) {
            return Color.correctAnswerDark
        }
        if (self.isWrong()) {
            return Color.wrongAnswerDark
        }
        return Color.black
    }
    
    private func getBackgroundColor() -> Color {
        if (self.isCorrect()) {
            return Color.correctAnswerLight
        }
        if (self.isWrong()) {
            return Color.wrongAnswerLight
        }
        return Color.white
    }
    
    private func tappedButton () -> Void {
        self.tapped = true;
        if (self.text == self.correctAnswer) {
            self.correct = true;
        }
        self.answered = true
    }
    
}

struct Shake: GeometryEffect {
    var amount: CGFloat = 10
    var shakesPerUnit = 3
    var animatableData: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX:
            amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)),
            y: 0))
    }
}
