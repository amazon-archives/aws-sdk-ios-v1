
#import <UIKit/UIKit.h>

@interface BucketList : UIViewController {
	NSMutableArray* buckets;
	IBOutlet UITableView* bucketTableView;
}

@property (nonatomic, retain) NSMutableArray *buckets;

+(BucketList*)instance;

-(id)init;

-(IBAction)done:(id)sender;
-(IBAction)add:(id)sender;

-(void)addBucket:(NSString*)bucketName;

@end
