
#import <UIKit/UIKit.h>

@interface ObjectListing : UIViewController {
	NSMutableArray *objects;
	NSString *bucket;
	
	IBOutlet UITableView *objectsTableView;	
}

@property (nonatomic, retain) NSMutableArray* objects;
@property (nonatomic, retain) NSString* bucket;

-(id)init;

- (IBAction)done:(id)sender;
- (IBAction)add:(id)sender;

-(void)addObject:(NSString*)objectName;

@end
