import Quick
import Nimble
import Pony

class PonyTabBarControllerSpec: QuickSpec {
  override func spec() {
    var tabBarController: PonyTabController!
    
    describe(".viewDidAppear"){
      
      context("when app intro had not been presented"){
        
        beforeEach {
          // Arrange:
          NSUserDefaults.standardUserDefaults().setBool(false, forKey: "appIntroHasBeenPresented")
          let storyboard = UIStoryboard(name:"Main", bundle: NSBundle.mainBundle())
          tabBarController = storyboard.instantiateInitialViewController() as! PonyTabController
          
          // Act:
          UIApplication.sharedApplication().keyWindow?.rootViewController = tabBarController
        }
        
        it("should be presented"){
          // Assert:
          expect(tabBarController.presentedViewController).toEventually(beAnInstanceOf(AppIntroViewController))
        }
        
        context("and dissmiss button was tapped") {
          
          let userDefaults = NSUserDefaults.standardUserDefaults()
          var appIntroViewController: AppIntroViewController?
          
          beforeEach {
            // Arrange:
            userDefaults.setBool(false, forKey: "appIntroHasBeenPresented")
            
            waitUntil { done in
                NSThread.sleepForTimeInterval(0.5)
                done()
            }
           
            // Act:
            tabBarController.viewDidAppear(false)
            
            waitUntil { done in
                NSThread.sleepForTimeInterval(0.5)
                done()
            }
            
            var appIntroViewController = tabBarController.presentedViewController as! AppIntroViewController
            appIntroViewController.dismissButton!.sendActionsForControlEvents(UIControlEvents.TouchUpInside)
          }
          
          it("should set appIntroHasBeenPresented to true"){
            // Assert:
            expect(userDefaults.boolForKey("appIntroHasBeenPresented")).to(beTrue())
          }
          
          it("should dismiss app intro"){
            // Assert:
            expect(tabBarController.presentedViewController
                ).toEventually(beNil())
          }
            
        }
      }
    }
  }
}
