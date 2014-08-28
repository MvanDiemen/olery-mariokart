import UIKit

extension PlayerViewController {
  func showAlert(){
    var createAccountErrorAlert: UIAlertView = UIAlertView()

    createAccountErrorAlert.delegate = self

    createAccountErrorAlert.title = "Reset score"
    createAccountErrorAlert.message = "This will reset all players score"
    createAccountErrorAlert.addButtonWithTitle("Dismiss")
    createAccountErrorAlert.addButtonWithTitle("Continue")

    createAccountErrorAlert.show()
  }

  func alertView(View: UIAlertView!, clickedButtonAtIndex buttonIndex: Int){

    switch buttonIndex{

    case 1:
      playerHandler.resetScore()
      break;
    case 0:
      break;
    default:
      break;
    }
  }
}