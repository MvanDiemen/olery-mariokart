import UIKit
import CoreData

class PlayerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  @IBOutlet var playerList:UITableView?

  @IBAction func addPlayer(sender: AnyObject) {
    self.modalPresentationStyle = .CurrentContext
    self.performSegueWithIdentifier("newPlayer", sender: self)
  }

  @IBAction func unwindToPlayer(segue:UIStoryboardSegue) {
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
}