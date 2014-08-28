import Foundation
import CoreData
import UIKit

class NewGameViewController:UIViewController {
  @IBOutlet var firstPlayerName:UILabel?
  @IBOutlet var secondPlayerName:UILabel?
  @IBOutlet var thirdPlayerName:UILabel?
  @IBOutlet var fourthPlayerName:UILabel?
  
  @IBOutlet var firstFirstPlayer:UILabel?
  @IBOutlet var secondFirstPlayer:UILabel?
  @IBOutlet var thirdFirstPlayer:UILabel?
  @IBOutlet var fourthFirstPlayer:UILabel?

  @IBOutlet var firstSecondPlayer:UILabel?
  @IBOutlet var secondSecondPlayer:UILabel?
  @IBOutlet var thirdSecondPlayer:UILabel?
  @IBOutlet var fourthSecondPlayer:UILabel?

  @IBOutlet var firstThirdPlayer:UILabel?
  @IBOutlet var secondThirdPlayer:UILabel?
  @IBOutlet var thirdThirdPlayer:UILabel?
  @IBOutlet var fourthThirdPlayer:UILabel?

  @IBOutlet var firstFourthPlayer:UILabel?
  @IBOutlet var secondFourthPlayer:UILabel?
  @IBOutlet var thirdFourthPlayer:UILabel?
  @IBOutlet var fourthFourthPlayer:UILabel?

  @IBOutlet var firstFirstPlayerStepper:UIStepper?
  @IBOutlet var secondFirstPlayerStepper:UIStepper?
  @IBOutlet var thirdFirstPlayerStepper:UIStepper?
  @IBOutlet var fourthFirstPlayerStepper:UIStepper?

  @IBOutlet var firstSecondPlayerStepper:UIStepper?
  @IBOutlet var secondSecondPlayerStepper:UIStepper?
  @IBOutlet var thirdSecondPlayerStepper:UIStepper?
  @IBOutlet var fourthSecondPlayerStepper:UIStepper?

  @IBOutlet var firstThirdPlayerStepper:UIStepper?
  @IBOutlet var secondThirdPlayerStepper:UIStepper?
  @IBOutlet var thirdThirdPlayerStepper:UIStepper?
  @IBOutlet var fourthThirdPlayerStepper:UIStepper?

  @IBOutlet var firstFourthPlayerStepper:UIStepper?
  @IBOutlet var secondFourthPlayerStepper:UIStepper?
  @IBOutlet var thirdFourthPlayerStepper:UIStepper?
  @IBOutlet var fourthFourthPlayerStepper:UIStepper?


  var playerHandler:PlayerHandler = PlayerHandler()
  var players         = []
  var names           = [String]()
  var NOPlayers:Int   = 0
  var scoreOne:Int    = 0
  var scoreTwo:Int    = 0
  var scoreThree:Int  = 0
  var scoreFour:Int   = 0

  @IBAction func changedValue11(sender: UIStepper) {
    firstFirstPlayer!.text = Int(sender.value).description
  }

  @IBAction func changedValue12(sender: UIStepper) {
    secondFirstPlayer!.text = Int(sender.value).description
  }

  @IBAction func changedValue13(sender: UIStepper) {
    thirdFirstPlayer!.text = Int(sender.value).description
  }

  @IBAction func changedValue14(sender: UIStepper) {
    fourthFirstPlayer!.text = Int(sender.value).description
  }

  @IBAction func changedValue21(sender: UIStepper) {
    firstSecondPlayer!.text = Int(sender.value).description
  }

  @IBAction func changedValue22(sender: UIStepper) {
    secondSecondPlayer!.text = Int(sender.value).description
  }

  @IBAction func changedValue23(sender: UIStepper) {
    thirdSecondPlayer!.text = Int(sender.value).description
  }

  @IBAction func changedValue24(sender: UIStepper) {
    fourthSecondPlayer!.text = Int(sender.value).description
  }

  @IBAction func changedValue31(sender: UIStepper) {
    firstThirdPlayer!.text = Int(sender.value).description
  }

  @IBAction func changedValue32(sender: UIStepper) {
    secondThirdPlayer!.text = Int(sender.value).description
  }

  @IBAction func changedValue33(sender: UIStepper) {
    thirdThirdPlayer!.text = Int(sender.value).description
  }

  @IBAction func changedValue34(sender: UIStepper) {
    fourthThirdPlayer!.text = Int(sender.value).description
  }

  @IBAction func changedValue41(sender: UIStepper) {
    firstFourthPlayer!.text = Int(sender.value).description
  }

  @IBAction func changedValue42(sender: UIStepper) {
    secondFourthPlayer!.text = Int(sender.value).description
  }

  @IBAction func changedValue43(sender: UIStepper) {
    thirdFourthPlayer!.text = Int(sender.value).description
  }

  @IBAction func changedValue44(sender: UIStepper) {
    fourthFourthPlayer!.text = Int(sender.value).description
  }

  @IBAction func saveGame() {
    saveFirstPlayer()
    saveSecondPlayer()
    if (NOPlayers >= 3) {
      saveThirdPlayer()
    }

    if (NOPlayers == 4) {
      saveFourthPlayer()
    }
  }

  func setPlayers(passed:NSArray) {
    players = passed
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    NOPlayers = players.count
    names = [String]()
    for player in players {
      names.append("\(player)")
    }

    firstPlayerName?.text = names[0]
    secondPlayerName?.text = names[1]
    scoreOne = NOPlayers - 1
    scoreTwo = NOPlayers - 2

    if (NOPlayers == 4) {
      fourthPlayerName?.text = names[3]
      thirdPlayerName?.text = names[2]
      scoreFour = NOPlayers - 4
    } else if (NOPlayers == 3) {
      fourthPlayerName?.text = "Not Playing"
      thirdPlayerName?.text = names[2]
      scoreFour = NOPlayers - 3
    } else {
      fourthPlayerName?.text = "Not Playing"
      thirdPlayerName?.text = "Not Playing"
    }
  }

  override func viewDidAppear(animated: Bool) {
    viewDidLoad()
  }

  func saveFirstPlayer() {
    var score    = 0
    var games    = 0
    var maxScore = 0

    var firstStepper  = Int(firstFirstPlayerStepper!.value)
    var secondStepper = Int(secondFirstPlayerStepper!.value)
    var thirdStepper  = Int(thirdFirstPlayerStepper!.value)
    var fourthStepper = Int(fourthFirstPlayerStepper!.value)

    score += scoreOne * firstStepper
    score += scoreTwo * secondStepper
    score += scoreThree * thirdStepper
    score += scoreFour * fourthStepper

    games += firstStepper + secondStepper + thirdStepper + fourthStepper

    maxScore = games * (NOPlayers - 1)

    playerHandler.updatePlayer(names[0], addedGames: games, addedScore: score, addedMaxScore: maxScore)
  }

  func saveSecondPlayer() {
    var score1    = 0
    var games1    = 0
    var maxScore1 = 0

    var firstStepper  = Int(firstSecondPlayerStepper!.value)
    var secondStepper = Int(secondSecondPlayerStepper!.value)
    var thirdStepper  = Int(thirdSecondPlayerStepper!.value)
    var fourthStepper = Int(fourthSecondPlayerStepper!.value)

    score1 += scoreOne * firstStepper
    score1 += scoreTwo * secondStepper
    score1 += scoreThree * thirdStepper
    score1 += scoreFour * fourthStepper

    games1 += firstStepper + secondStepper + thirdStepper + fourthStepper

    maxScore1 = games1 * (NOPlayers - 1)

    playerHandler.updatePlayer(names[1], addedGames: games1, addedScore: score1, addedMaxScore: maxScore1)
  }

  func saveThirdPlayer() {
    var score2    = 0
    var games2    = 0
    var maxScore2 = 0

    var firstStepper  = Int(firstThirdPlayerStepper!.value)
    var secondStepper = Int(secondThirdPlayerStepper!.value)
    var thirdStepper  = Int(thirdThirdPlayerStepper!.value)
    var fourthStepper = Int(fourthThirdPlayerStepper!.value)

    score2 += scoreOne * firstStepper
    score2 += scoreTwo * secondStepper
    score2 += scoreThree * thirdStepper
    score2 += scoreFour * fourthStepper

    games2 += firstStepper + secondStepper + thirdStepper + fourthStepper

    maxScore2 = games2 * (NOPlayers - 1)

    playerHandler.updatePlayer(names[2], addedGames: games2, addedScore: score2, addedMaxScore: maxScore2)
  }

  func saveFourthPlayer() {
    var score3    = 0
    var games3    = 0
    var maxScore3 = 0

    var firstStepper  = Int(firstFourthPlayerStepper!.value)
    var secondStepper = Int(secondFourthPlayerStepper!.value)
    var thirdStepper  = Int(thirdFourthPlayerStepper!.value)
    var fourthStepper = Int(fourthFourthPlayerStepper!.value)

    score3 += scoreOne * firstStepper
    score3 += scoreTwo * secondStepper
    score3 += scoreThree * thirdStepper
    score3 += scoreFour * fourthStepper

    games3 += firstStepper + secondStepper + thirdStepper + fourthStepper

    maxScore3 = games3 * (NOPlayers - 1)

    playerHandler.updatePlayer(names[3], addedGames: games3, addedScore: score3, addedMaxScore: maxScore3)
  }
}