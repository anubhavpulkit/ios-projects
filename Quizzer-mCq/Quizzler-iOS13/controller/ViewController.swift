
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var questions: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var secondOption: UIButton!
    
    @IBOutlet var progrssBar: UIProgressView!
    @IBOutlet var trueButton: UIButton!
    @IBOutlet var falseButton: UIButton!
    
    var Quizbrain = quizBrain()
    
    var secondsRemaining = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //questions.text = quiz[questionNumber].question
        updateUI()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func answerTrue(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotRight = Quizbrain.checkAnswer(userAnswer)
        
        
        
        if userGotRight {
            print("Right!")
            sender.backgroundColor = UIColor.green
            
        }
        else{
            print("Wrong!")
            sender.backgroundColor = UIColor.red
        }
        
        Quizbrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    // updateUI()
    
    
    @objc func updateUI() {
        
        let answerChoice = Quizbrain.getAnswer()
        questions.text = Quizbrain.questionsForDisplay()
        trueButton.setTitle(answerChoice[0], for: .normal)
        falseButton.setTitle(answerChoice[1], for: .normal)
        secondOption.setTitle(answerChoice[2], for: .normal)
        
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        secondOption.backgroundColor = UIColor.clear
        
        scoreLabel.text = "\(Quizbrain.getscore())"
        progrssBar.progress = Quizbrain.getProgress()
    }
    
    
}

