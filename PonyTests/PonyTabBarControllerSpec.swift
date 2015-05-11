import Quick
import Nimble
import Pony

class PonyTabBarControllerSpec: QuickSpec {
  override func spec() {
    var tabBarController: PonyTabController!
    
    describe(".viewDidAppear"){
      
      context("When app intro had never been dismissed"){
        
        var appIntroViewController: AppIntroViewController?
        
        beforeEach{
            // Arrange:
            NSUserDefaults.standardUserDefaults().setBool(false, forKey: "appIntroHasBeenPresented")
            let storyboard = UIStoryboard(name:"Main", bundle: NSBundle.mainBundle())
            tabBarController = storyboard.instantiateInitialViewController() as! PonyTabController
            let window = UIWindow(frame: UIScreen.mainScreen().bounds)
            window.makeKeyAndVisible()
            window.rootViewController = tabBarController
            
            // Act:
            tabBarController.beginAppearanceTransition(true, animated: false) // Triggers viewWillAppear
            tabBarController.endAppearanceTransition() // Triggers viewDidAppear
            
            appIntroViewController = tabBarController.presentedViewController as! AppIntroViewController!
        }
        
        it("should set the appIntroDelegate"){
            // Assert:
            expect(appIntroViewController!.delegate as? PonyTabController).to(equal(tabBarController))
        }
        
        it("should be presented"){
          // Assert:
          expect(tabBarController.presentedViewController)
            .toEventually(beAnInstanceOf(AppIntroViewController))
        }
        
        context("and appIntroDidFinish is called") {
          
          let userDefaults = NSUserDefaults.standardUserDefaults()
          
          beforeEach {
            // Arrange:
            userDefaults.setBool(false, forKey: "appIntroHasBeenPresented")
            
            // Act:
            // Triggers viewWillAppear and viewDidAppear:animated
            tabBarController.beginAppearanceTransition(true, animated: false)
            tabBarController.endAppearanceTransition()

            // - Dismissing app intro.
            tabBarController.appIntroDidFinish(appIntroViewController)
          }
          
          it("should be set as the appIntroDelegate"){
            // Assert:
            expect(appIntroViewController!.isBeingDismissed()).toEventually(beTrue())
          }
        }
      }
    }
  }
}
