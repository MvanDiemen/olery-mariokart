import Foundation
import UIKit

class NewPlayerViewController:UIViewController {
  @IBOutlet var name:UITextField?
  var playerHandler = PlayerHandler()

  @IBAction func savePlayer (segue : UIStoryboardSegue) {
    NSLog("Added \(name!.text)")
    playerHandler.addPlayer(name!.text)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

  }

  override func didReceiveMemoryWarning() {
    // nothing
  }
}