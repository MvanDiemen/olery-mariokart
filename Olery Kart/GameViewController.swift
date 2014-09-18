import UIKit
import CoreData

class GameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  @IBOutlet var playerList:UITableView?
  var playerHandler:PlayerHandler = PlayerHandler()
  var list:NSArray = []

  @IBAction func startPlaying(segue: UIStoryboardSegue) {
    self.performSegueWithIdentifier("startPlaying", sender: self)
  }

  @IBAction func unwindToGame(segue:UIStoryboardSegue) {
    self.view.viewWithTag(99)?.removeFromSuperview()
    viewDidLoad()
  }
                            
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.

    updateList()
  }
  
  override func viewDidAppear(animated: Bool) {
    viewDidLoad()
  }

  func updateList() {
    list = playerHandler.getPlayerList()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
    return 1
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return list.count
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cell: PlayerCell = playerList?.dequeueReusableCellWithIdentifier("Player") as PlayerCell

    var player = list[indexPath.row] as NSManagedObject

    cell.setName(player)

    return cell
  }

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
    self.modalPresentationStyle = .CurrentContext
    self.modalPresentationStyle = .FormSheet
    
    if (segue.identifier == "startPlaying") {
      var players = []
      players     = playerList!.indexPathsForSelectedRows()!
      var names   = [String]()

      for player in players {
        var cell = playerList!.cellForRowAtIndexPath(player as NSIndexPath) as PlayerCell
        names.append(cell.mName!.text!)
      }

      var vc:NewGameViewController = segue.destinationViewController as NewGameViewController
      vc.setPlayers(names)
    }

    var blur:UIBlurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
    //      var vibrancy:UIVibrancyEffect = UIVibrancyEffect(forBlurEffect: blur)
    var effectView:UIVisualEffectView = UIVisualEffectView(effect: blur)

    effectView.frame = CGRectMake(0, 0, 640, 1136)
    effectView.tag = 99

    self.view.addSubview(effectView)
  }
}

