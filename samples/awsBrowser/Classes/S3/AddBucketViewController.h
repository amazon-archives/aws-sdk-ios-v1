
#import <UIKit/UIKit.h>
 

@interface AddBucketViewController : UIViewController {
	IBOutlet UITextField* bucketName;
}

-(IBAction)add:(id)sender;
-(IBAction)cancel:(id)sender;

@end
