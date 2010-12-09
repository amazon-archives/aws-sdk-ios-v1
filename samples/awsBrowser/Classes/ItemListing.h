
#import <UIKit/UIKit.h>

@interface ItemListing : UIViewController {
	NSMutableArray *items;
	NSString *domain;
	
	IBOutlet UITableView *itemsTableView;	
}

@property (nonatomic, retain) NSMutableArray* items;
@property (nonatomic, retain) NSString* domain;

-(id)init;

- (IBAction)done:(id)sender;

-(void)addItem:(NSString*)itemName;

@end
