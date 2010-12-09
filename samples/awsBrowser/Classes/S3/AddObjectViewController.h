
#import <UIKit/UIKit.h>
#import "ObjectListing.h"


@interface AddObjectViewController : UIViewController {
	NSString *bucket;
	ObjectListing *objectListing;
	
	IBOutlet UITextField* objectName;
	IBOutlet UITextField* objectData;
}

- (id)initWithNibName:(NSString *)nibNameOrNil withBucketName:(NSString*)bucketName objectLister:(ObjectListing*)lister;

-(IBAction)add:(id)sender;
-(IBAction)cancel:(id)sender;

@end
