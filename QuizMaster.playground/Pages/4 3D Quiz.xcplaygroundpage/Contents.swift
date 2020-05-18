/*:
 [Back to Image Quiz](@previous)
 
 # 3D Quiz
 
 The Apple ecosystem offers a lot of possibilites which enhance the normal quiz behaviour.
 An interesting framework is ARKit, which allows you to add AR scene to the question.
 
 You define the question like before:
*/
import PlaygroundSupport

let question = Question(
    question: "What is this object called?",
    correctAnswer: "torus",
    wrongAnswers: ["cube", "cylinder", "pyramid"]
)
/*:
 You can use the method `addARContent(name:)` to add a 3D file (.reality and .usdz) to the question.
 If you call this method a button will be added to the question view which shows a sheet with the defined 3D scene.
*/
question.addARContent(name: "QuizMaster_Torus")

var questions: [Question] = [question]

PlaygroundPage.current.setLiveView(QuizView(questions: questions))
//: [Go to Question Generator](@next)
