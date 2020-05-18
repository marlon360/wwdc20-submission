/*:
 [Back to Question Generator](@previous)
 
 # Drawing Quiz
 
 After we defined normal quizes with four answer choices, let's create questions with a different input mechanism.
 We are using PencilKit to enable drawings as an answer.
 To interpret the drawing we use CoreML. In order to use CoreML we need a trained model. I used Create ML to train an Image Classifier.
 I used a free dataset of math symbols to train the model. Now we can use the digits 0-9, square root, pi, infinity, etc as answers.
 
*/
import PlaygroundSupport

let question = Question(
    question: "9 - 4",
    correctAnswer: "5"
)

let question2 = Question(
    question: "2 + 2",
    correctAnswer: "4"
)

let question3 = Question(
    question: "Draw the square root symbol",
    correctAnswer: "sqrt"
)

let questions = [question, question2, question3]

PlaygroundPage.current.setLiveView(PencilQuizView(questions: questions))

//: [Go to Summary](@next)
