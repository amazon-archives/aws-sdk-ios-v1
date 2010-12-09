
#import <UIKit/UIKit.h>


@interface ObjectViewController : UIViewController {
	NSString* on;
	NSString* od;
	
	IBOutlet UILabel* objectName;
	IBOutlet UILabel* objectData;
}

@property (nonatomic, retain) IBOutlet UILabel* objectName;
@property (nonatomic, retain) IBOutlet UILabel* objectData;


-(id)initWithNibName:(NSString *)nibNameOrNil withObjectName:(NSString*)objectName withObjectData:(NSString*)objectData;

-(IBAction)done:(id)sender;

@end
