/*:
 [Back to 3D Quiz](@previous)
 
 # Question Generator
 
 After we learned how to create questions, it would be nice to automate this process. Here comes the NaturalLanguage Framework in place.
 
 Lets say we have this paragraph of text:
*/
import PlaygroundSupport

let text = "Apple was founded by Steve Jobs, Steve Wozniak, and Ronald Wayne in April 1976. It was incorporated as Apple Computer, Inc., in January 1977, and sales of its computers grew quickly. Within a few years, Jobs and Wozniak had hired a staff of computer designers and had a production line. Apple went public in 1980 to instant financial success. Over the next few years, Apple shipped new computers featuring innovative graphical user interfaces, such as the original Macintosh in 1984, and Apple's marketing advertisements for its products received widespread critical acclaim. However, the high price of its products and limited application library caused problems, as did power struggles between executives. In 1985, Wozniak departed Apple amicably and remained an honorary employee, while Jobs and others resigned to found NeXT."
/*:
 With the method `GenerateQuestions(text:)` we can generate questions. With the NaturalLanguage Framework we analyse the text.
 First we use the `NLTokenizer` to split the text into sentences. After that we use the `NLTagger` to identify every number in this sentence.
 We want to generate questions about year numbers, so we test if the tagged number is a year. If we found a year we replace the occurence of this year with a blank space and use it as a question. Then we have to generate random false answers by just adding random numbers to the correct year.
*/
let questions = GenerateQuestions(text: text)

PlaygroundPage.current.setLiveView(QuizView(questions: questions))

//: [Go to Drawing Quiz](@next)
