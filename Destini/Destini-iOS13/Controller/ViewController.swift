

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var Story = StoryBrain()
    let story0 = "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: 'Need a ride, boy?'."
    let choice1 = "I'll hop in. Thanks for the help!"
    let choice2 = "Better ask him if he's a murderer first."
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      updateUI()
        
    }
    
    @IBAction func choiceMade(_ sender: UIButton) {
       var userChoice = sender.currentTitle!
    //    print(userChoice)
        
   //  Story.nextStory(userChoice: userChoice )
        
   /*     if userChoice  == choice1
        {
            storyLabel.text = "You see Tiger"
            choice1Button.setTitle("You see Tiger", for: .normal)
        }
        else{
            storyLabel.text = " "
            choice2Button.setTitle("You find a treasure chest", for: .normal)
            
        }
        */
        
        
        
        
        storyLabel.text = Story.nextStory(userChoice: userChoice )
        choice1Button.setTitle(Story.next1Label(userChoice: userChoice ), for: .normal)
        choice2Button.setTitle(Story.next2Label(userChoice: userChoice ), for: .normal)
    }
    
    
    
    func updateUI(){
        
        
        storyLabel.text = story0
        choice1Button.setTitle(choice1, for: .normal)
        choice2Button.setTitle(choice2, for: .normal)
        
        
    }
    
}

