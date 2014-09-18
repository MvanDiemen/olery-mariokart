import UIKit
import CoreData

class PlayerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  @IBOutlet var playerList:UITableView?
  var selectedPlayer:NSManagedObject?

  @IBAction func addPlayer(sender: AnyObject) {
    self.modalPresentationStyle = .CurrentContext
    self.performSegueWithIdentifier("newPlayer", sender: self)
  }

  @IBAction func unwindToPlayer(segue:UIStoryboardSegue) {
    self.view.viewWithTag(99)?.removeFromSuperview()
    updateList()
    viewDidLoad()
  }

  @IBAction func resetScore(sender: UIButton) {
    showAlert()
  }

  var playerHandler:PlayerHandler = PlayerHandler()
  var list:NSArray = []

  override func viewDidLoad() {
    super.viewDidLoad()

    playerList?.delegate   = self
    playerList?.dataSource = self

    updateList()
    self.playerList?.reloadData()
  }

  override func viewDidAppear(animated: Bool) {
    updateList()
  }

  func updateList() {
    list = playerHandler.getPlayerList()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return list.count
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cell: PlayerCell = playerList?.dequeueReusableCellWithIdentifier("Player") as PlayerCell

    var player = list[indexPath.row] as NSManagedObject

    cell.setName(player)
    cell.setMkei(player)

    return cell
  }

  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    var cell = playerList?.cellForRowAtIndexPath(indexPath) as PlayerCell
    selectedPlayer = playerHandler.getPlayer(cell.mName!.text!)

    self.performSegueWithIdentifier("showPlayer", sender: cell)
  }

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    self.modalPresentationStyle = .CurrentContext
    self.modalPresentationStyle = .FormSheet

    if (segue.identifier == "showPlayer") {
      var vc:PlayerOverViewController = segue.destinationViewController as PlayerOverViewController

      var cell = playerList!.cellForRowAtIndexPath(playerList!.indexPathForSelectedRow()!) as PlayerCell

      selectedPlayer = playerHandler.getPlayer(cell.mName!.text!)
      
      var name:String = playerHandler.getPlayerName(selectedPlayer!)

      var score:Int = playerHandler.getPlayerScore(selectedPlayer!)
      var max:Int   = playerHandler.getPlayerMaxScore(selectedPlayer!)
      var games:Int = playerHandler.getPlayerGames(selectedPlayer!)

      var firsts:Int  = playerHandler.getFirsts(selectedPlayer!)
      var seconds:Int = playerHandler.getSeconds(selectedPlayer!)
      var thirds:Int  = playerHandler.getThirds(selectedPlayer!)
      var fourths:Int = playerHandler.getFourths(selectedPlayer!)
      
      vc.setNumbers(games, newMaxScore: max, newScore: score, newName: name)
      vc.setPlaces(firsts, newSecond: seconds, newThird: thirds, newFourth: fourths)
    }
    
    var blur:UIBlurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
    //      var vibrancy:UIVibrancyEffect = UIVibrancyEffect(forBlurEffect: blur)
    var effectView:UIVisualEffectView = UIVisualEffectView(effect: blur)

    effectView.frame = CGRectMake(0, 0, 640, 1136)
    effectView.tag = 99

    self.view.addSubview(effectView)
  }
}