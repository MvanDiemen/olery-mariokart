import UIKit
import Foundation
import CoreData

class PlayerCell: UITableViewCell {
  @IBOutlet var mName:UILabel?
  @IBOutlet var mMkei:UILabel?
  var playerHandler:PlayerHandler = PlayerHandler()

  func calculateMKEI(score:Int, max_score:Int, games:Int) -> Int {
    var index      = Float(score) / Float(max_score)
    var percentage = Int(round(index * 100))

    return percentage
  }

  func setName(player:NSManagedObject) {
    mName?.text = playerHandler.getPlayerName(player)
  }

  func setMkei(player:NSManagedObject) {
    var name = playerHandler.getPlayerName(player)
    var score = playerHandler.getPlayerScore(player)
    var max   = playerHandler.getPlayerMaxScore(player)
    var games = playerHandler.getPlayerGames(player)

    mMkei?.text = "\(calculateMKEI(score, max_score: max, games: games))"
  }
}
