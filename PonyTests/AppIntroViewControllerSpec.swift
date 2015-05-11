import Quick
import Nimble
import Pony

class AppIntroViewControllerSpec: QuickSpec {
  override func spec() {
    
    var viewController: AppIntroViewController!
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    describe("dismissButtonTapped"){
      
      context("when it recevies a touch"){
        
        var tapHandlerTriggered: Bool!
        
        beforeEach {
          let storyboard = UIStoryboard(name: "Main", bundle:NSBundle.mainBundle())
          viewController = storyboard.instantiateViewControllerWithIdentifier("appIntroViewControllerID") as! AppIntroViewController
          
          let rootViewController = UIApplication.sharedApplication().keyWindow!.rootViewController!
          
          if rootViewController.presentedViewController != nil {
            // Setting to true to avoid the app intro to be presented again
            userDefaults.setBool(true, forKey: "appIntroHasBeenPresented")
            waitUntil { done in
              rootViewController.dismissViewControllerAnimated(false){
                done()
              }
            }
          }
          
          waitUntil { done in
            rootViewController.presentViewController(viewController, animated: false){
              done()
            }
          }
          
          userDefaults.setBool(false, forKey: "appIntroHasBeenPresented")
          
//          viewController.dismissButtonTapHandler = {
//            tapHandlerTriggered = true
//          }
          
          viewController.dismissButton!.sendActionsForControlEvents(UIControlEvents.TouchUpInside)
        }
        
        afterEach {
          tapHandlerTriggered = false
          userDefaults.setBool(false, forKey: "appIntroHasBeenPresented")
          let rootViewController = UIApplication.sharedApplication().keyWindow!.rootViewController!
          waitUntil { done in
            rootViewController.dismissViewControllerAnimated(false){
              done()
            }
          }
        }
        
        it("should call the dimiss tap handler"){
          expect(tapHandlerTriggered).to(beTrue())
        }
      }
    }
  }
}
