
#import <UIKit/UIKit.h>

@interface DomainList : UIViewController {
	NSMutableArray* domains;
	IBOutlet UITableView* domainTableView;
}

@property (nonatomic, retain) NSMutableArray *domains;

+(DomainList*)instance;

-(id)init;

-(IBAction)done:(id)sender;

@end
