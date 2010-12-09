
#import "ObjectViewController.h"


@implementation ObjectViewController


@synthesize objectName, objectData;

-(id)initWithNibName:(NSString *)nibNameOrNil withObjectName:(NSString*)theObjectName withObjectData:(NSString*)theObjectData {
	if ((self = [super initWithNibName:nibNameOrNil bundle:nil])) {
		on = theObjectName;
		od = theObjectData;		
	}	
	
	return self;
}

-(IBAction)done:(id)sender {
	[self.view removeFromSuperview];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.objectName.text = on;
	self.objectData.text = od;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (void)dealloc {
    [super dealloc];
}


@end
