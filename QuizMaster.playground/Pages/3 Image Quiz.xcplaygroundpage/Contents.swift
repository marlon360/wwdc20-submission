/*:
 [Back to Basic Quiz](@previous)
 
 # Image Quiz
 
 The Image Quiz extends the Basic Quiz with the ability to add images to a question.
 With SwiftUI you can easily show and hide a sheet.
 
 You define the question like before:
*/
import PlaygroundSupport

let question = Question(
    question: "What animal is this?",
    correctAnswer:"hedgehog",
    wrongAnswers: ["dog", "cat", "tiger"]
)
/*:
 You can use the method `addImageContent(name:)` to add an image to the question.
 If you call this method a button will be added to the question view which shows a sheet with the defined image.
*/
question.addImageContent(name: "hedgehog.jpg")
/*:
 After that you can pass the question array to the view like before.
*/
var questions: [Question] = [question]

PlaygroundPage.current.setLiveView(QuizView(questions: questions))
//: [Go to 3D Quiz](@next)
