//
//  GameViewModel.swift
//  Code Refresher
//
//  Created by Geordie Jones on 12/6/22.
//

import SwiftUI

class GameViewModel: ObservableObject {
    @Published private var game = Game()
    
    var currentQuestion: Question {
        game.currentQuestion
    }
    
    var questionProgressText: String {
        "\(game.currentQuestionIndex + 1) / \(game.numberOfQuestions)"
    }
    
    var guessWasMade: Bool {
        if let _ = game.guesses[currentQuestion] {
            return true
        } else {
            return false
        }
    }
    
    var score: String {
        let correctAnswers: Double = Double(game.guessCount.correct);
        let totalAnswers: Double = Double(game.guessCount.correct) + Double(game.guessCount.incorrect);
        let percent: Double = (correctAnswers / totalAnswers) * 100.0
        return "\(String(format: "%.1f", percent))%"
    }
    
    var correct: Int {
        game.guessCount.correct
    }
    
    var incorrect: Int {
        game.guessCount.incorrect
    }
    
    var gameIsOver: Bool {
        game.isOver
    }
    
    func makeGuess(atIndex index: Int) {
        game.makeGuessForCurrentQuestion(atIndex: index)
    }
    
    func displayNextScreen() {
        game.updateGameStatus()
    }
    
    func color(forOptionIndex optionIndex: Int) -> Color {
        if let guessedIndex = game.guesses[currentQuestion] {
            if guessedIndex != optionIndex {
                return GameColor.main
            } else if guessedIndex == currentQuestion.correctAnswerIndex {
                return GameColor.correctGuess
            } else {
                return GameColor.incorrectGuess
            }
        } else {
            return GameColor.main
        }
    }
}
