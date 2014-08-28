import Foundation
import CoreData
import UIKit

class PlayerHandler {
  var context:NSManagedObjectContext
  var appDel:AppDelegate
  var request:NSFetchRequest

  init() {
    appDel  = (UIApplication.sharedApplication().delegate as AppDelegate)
    context = appDel.managedObjectContext!
    request = NSFetchRequest(entityName: "Player")
    request.returnsObjectsAsFaults = false
  }

  func addPlayer(name:String) {
    var player = NSEntityDescription.insertNewObjectForEntityForName(
      "Player",
      inManagedObjectContext: context
    ) as NSManagedObject

    player.setValue(name, forKey:"name")
    player.setValue("\(0)", forKey:"games")
    player.setValue("\(0)", forKey:"score")
    player.setValue("\(0)", forKey:"max_score")

    context.save(nil)
  }

  func resetScore() {
    var players = getPlayerList()

    for player in players {
      player.setValue("\(0)", forKey:"games")
      player.setValue("\(0)", forKey:"score")
      player.setValue("\(0)", forKey:"max_score")

      context.save(nil)
    }
  }

  func getPlayerList() -> NSArray {
    request.predicate = nil
    return context.executeFetchRequest(request, error: nil)
  }

  func addPredicate(predicate:NSPredicate) {
    request.predicate = predicate
  }

  func getPlayer(name:String) -> NSManagedObject {
    addPredicate(NSPredicate(format: "name = %@", "" + name))
    var player = context.executeFetchRequest(request, error: nil)
    
    return player[0] as NSManagedObject
  }

  func getPlayerName(player:NSManagedObject) -> String {
    return (player.valueForKey("name") as String)
  }

  func getPlayerGames(player:NSManagedObject) -> Int {
    return (player.valueForKey("games") as String).toInt()!
  }

  func getPlayerScore(player:NSManagedObject) -> Int {
    return (player.valueForKey("score") as String).toInt()!
  }

  func getPlayerMaxScore(player:NSManagedObject) -> Int {
    return (player.valueForKey("max_score") as String).toInt()!
  }

  func updatePlayer(name:String, addedGames:Int, addedScore:Int, addedMaxScore:Int) {
    var player = getPlayer(name)

    var oldScore    = getPlayerScore(player)
    var oldGames    = getPlayerGames(player)
    var oldMaxScore = getPlayerMaxScore(player)

    var score    = oldScore + addedScore
    var games    = oldGames + addedGames
    var maxScore = oldMaxScore + addedMaxScore

    player.setValue(name, forKey:"name")
    player.setValue("\(games)", forKey:"games")
    player.setValue("\(score)", forKey:"score")
    player.setValue("\(maxScore)", forKey:"max_score")

    context.save(nil)
  }
}