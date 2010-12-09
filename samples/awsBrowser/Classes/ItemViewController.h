
#import <UIKit/UIKit.h>


@interface ItemViewController : UIViewController {
	NSMutableArray *data;
	NSString *itemName;
	
	IBOutlet UITableView *dataTableView;	
}

@property (nonatomic, retain) NSMutableArray* data;
@property (nonatomic, retain) NSString* itemName;

- (id)initWithNibName:(NSString *)nibNameOrNil andData:(NSMutableArray*)theData itemName:(NSString*)theItemName;
-(IBAction)done:(id)sender;

@end
