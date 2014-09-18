import Foundation
import UIKit
import CoreData

class PlayerOverViewController:UIViewController {
  @IBOutlet var name:UILabel?
  @IBOutlet var games:UILabel?
  @IBOutlet var score:UILabel?
  @IBOutlet var maxScore:UILabel?
  @IBOutlet var mkei:UILabel?

  @IBOutlet var first:UILabel?
  @IBOutlet var second:UILabel?
  @IBOutlet var third:UILabel?
  @IBOutlet var fourth:UILabel?

  var mGames:Int    = 0
  var mMaxScore:Int = 0
  var mScore:Int    = 0
  var mName:String  = ""
  var mFirst:Int    = 0
  var mSecond:Int   = 0
  var mThird:Int    = 0
  var mFourth:Int   = 0

  override func viewDidLoad() {
    super.viewDidLoad()
    self.modalPresentationStyle = .CurrentContext
    self.modalPresentationStyle = .FormSheet

    name?.text     = mName
    games?.text    = "\(mGames)"
    maxScore?.text = "\(mMaxScore)"
    score?.text    = "\(mScore)"
    var index      = Float(mScore) / Float(mMaxScore)
    var percentage = Int(round(index * 100))
    mkei?.text     = "\(percentage)"

    first?.text  = "\(mFirst)"
    second?.text = "\(mSecond)"
    third?.text  = "\(mThird)"
    fourth?.text = "\(mFourth)"
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func setNumbers(newGames:Int, newMaxScore:Int, newScore:Int, newName:String) {
    mGames    = newGames
    mMaxScore = newMaxScore
    mScore    = newScore
    mName     = newName
  }

  func setPlaces(newFirst:Int, newSecond:Int, newThird:Int, newFourth:Int) {
    mFirst  = newFirst
    mSecond = newSecond
    mThird  = newThird
    mFourth = newFourth
  }
}