import NaturalLanguage


public func GenerateQuestions(text: String) -> [Question] {

    // find all sentences
    let tokenizer = NLTokenizer(unit: .sentence)
    tokenizer.setLanguage(.english)
    tokenizer.string = text
    
    // tag all numbers
    let tagger = NLTagger(tagSchemes: [.lexicalClass])
    let options: NLTagger.Options = [.omitPunctuation, .omitWhitespace, .joinNames]
    let tags: [NLTag] = [.number]
    
    var questions: [Question] = []
    
    // iterate over sentences
    tokenizer.enumerateTokens(in: text.startIndex..<text.endIndex) { tokenRange, _ in
        let sentence: String = String(text[tokenRange])
        if sentence.count > 130 {
            return true
        }
        tagger.string = sentence
        // tag all numbers in sentence
        tagger.enumerateTags(in: sentence.startIndex..<sentence.endIndex, unit: .word, scheme: .lexicalClass, options: options) { tag, tokenRange in
                if let tag = tag, tags.contains(tag) {
                    let correctAnswer = String(sentence[tokenRange])
                    
                    // check if number is a year
                    if (isYear(text: correctAnswer)) {
                        var question = sentence
                        let replacerText = String(repeating: "_", count: sentence[tokenRange].count)
                        question.replaceSubrange(tokenRange, with: replacerText)
                        
                        
                        let newQuestion = Question(
                            question: question,
                            correctAnswer: correctAnswer,
                            wrongAnswers: generateAnswers(year: Int(correctAnswer)!) // generate wrong answers
                        )
                        questions.append(newQuestion)
                        return true
                    }
                }
                return true
            }
        return true
    }
    
    return questions
    
}

private func isYear(text: String) -> Bool {
    let integer =  Int(text)
    if (integer != nil) {
        if (integer! > 1000 && integer! < 2100) {
            return true
        }
    }
    return false
}

private func generateAnswers(year: Int) -> [String] {
    var years: [Int] = []
    
    while years.count < 3 {
        let randomYear = year + Int.random(in: -25...25)
        if (!years.contains(randomYear) && randomYear != year) {
            years.append(randomYear)
        }
    }
    
    return years.map { String($0) }
    
}
