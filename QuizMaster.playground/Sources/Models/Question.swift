import Foundation

public class Question {
    
    public var question: String
    public var correctAnswer: String
    public var wrongAnswers: [String] = []
    
    public var allAnswers: [String]
    
    public var ARContent: String?
    public var ImageContent: String?
        
    public init(question: String, correctAnswer: String, wrongAnswers: [String] = []) {
        self.question = question
        self.correctAnswer = correctAnswer
        self.wrongAnswers = wrongAnswers
        
        // add all answers to array and randomize order
        self.allAnswers = self.wrongAnswers
        self.allAnswers.append(correctAnswer)
        self.allAnswers.shuffle()
    }
    
    public func addARContent(name: String) {
        self.ARContent = name
    }
    
    public func addImageContent(name: String) {
        self.ImageContent = name
    }
    
}
