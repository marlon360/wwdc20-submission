/*:
 [Back to Introduction](@previous)
 
 # Basic Quiz
 
 The Basic Quiz contains a question and 4 possibile answers.
 The interface is build with SwiftUI. This makes it very easy to add animations to state changes.
 If you answer the question wrong, the button will play shake animatinon and the questions box turns around a shows a message.
 
 The question is described with the `Question` model locsted in *Sources/Models/Question.swift*.
 This is how you define a question:
*/
import PlaygroundSupport

let question = Question(
    question: "Who is the CEO of Apple?",
    correctAnswer: "Tim Cook",
    wrongAnswers: ["Lisa Jackson", "Larry Page", "Steve Jobs"]
)
/*:
 You can add multiple questions:
*/
let anotherQuestion = Question(
    question: "What is the current macOS (10.15) called?",
    correctAnswer: "Catalina",
    wrongAnswers: ["Sierra", "Leopard", "Mavericks"]
)
/*:
 After you created all your questions you pass an Array of questions to the view:
*/
var questions: [Question] = [question, anotherQuestion]

PlaygroundPage.current.setLiveView(QuizView(questions: questions))

/*:
 Run the code to see it in action.
 
 [Go to Image Quiz](@next)
 
*/
