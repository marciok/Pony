import Quick
import Nimble
import Pony

class BreedsTableViewControllerSpec: QuickSpec {
    override func spec() {
        
        var viewController: BreedsTableViewController!
        var tableView: UITableView!
        var cell: UITableViewCell!
        let storyboard = UIStoryboard(name:"Main", bundle: NSBundle.mainBundle())
        
        beforeEach {
            viewController = storyboard.instantiateViewControllerWithIdentifier("breedsTableViewControllerID") as! BreedsTableViewController
            tableView = viewController.tableView
        }
        
        describe("viewDidLoad"){
            
            beforeEach{
                let _ = viewController.viewDidLoad()
                let indexPath = NSIndexPath(forRow: 0, inSection: 0)
                cell = viewController.tableView(tableView, cellForRowAtIndexPath: indexPath)
            }
            
            it("should register class UITableViewCell"){
                expect(cell).to(beAnInstanceOf(UITableViewCell))
            }
            
            it("should have ponyCellReuseIdentifier for reuse indentifier"){
                expect(cell.reuseIdentifier).to(equal("ponyCellReuseIdentifier"))
            }
        }
        
        
        
        describe("numberOfSectionsInTableView"){
            
            it("should be 1"){
                expect(tableView.numberOfSections()).to(equal(1))
            }
        }
        
        describe("cellForRowAtIndexPath"){
            
            beforeEach {
                let indexPath = NSIndexPath(forRow: 0, inSection: 0)
                cell = viewController.tableView(tableView, cellForRowAtIndexPath: indexPath)
            }
            
            it("should dequeue cell with ponyCellReuseIdentifier indentifier"){
                expect(cell.reuseIdentifier).to(equal("ponyCellReuseIdentifier"))
            }
            
            it("should be an instance of UITableViewCell"){
                expect(cell).to(beAnInstanceOf(UITableViewCell))
            }
            
            context("when first cell is dequeued"){
                
                it("should have Shetland as textLabel text"){
                    expect(cell.textLabel!.text!).to(equal("Shetland"))
                }
                
                it("should have an image named shetland") {
                    expect(cell.imageView!.accessibilityIdentifier).to(equal("shetland"))
                }
            }
            
            context("when second cell is dequeued"){
                
                beforeEach {
                    let indexPath = NSIndexPath(forRow: 1, inSection: 0)
                    cell = viewController.tableView(tableView, cellForRowAtIndexPath: indexPath)
                }
                
                it("should have Welsh as textLabel text"){
                    expect(cell.textLabel!.text!).to(equal("Welsh"))
                }
                
                it("should have an image named welsh") {
                    expect(cell.imageView!.accessibilityIdentifier).to(equal("welsh"))
                }
            }
            
            context("when third cell is dequeued"){
                
                beforeEach {
                    let indexPath = NSIndexPath(forRow: 2, inSection: 0)
                    cell = viewController.tableView(tableView, cellForRowAtIndexPath: indexPath)
                }
                
                it("should have Exmoor as textLabel text"){
                    expect(cell.textLabel!.text!).to(equal("Exmoor"))
                }
                
                it("should have an image named exmoor") {
                    expect(cell.imageView!.accessibilityIdentifier).to(equal("exmoor"))
                }
            }
            
        }
    }
}
