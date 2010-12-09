
#import "AddObjectViewController.h"
#import <AWSiOSSDK/S3/AmazonS3Client.h>
#import "Constants.h"

@implementation AddObjectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil withBucketName:(NSString*)bucketName objectLister:(ObjectListing*)lister {
	if ((self = [super initWithNibName:nibNameOrNil bundle:nil])) {
		bucket = bucketName;
		objectListing = lister;
	}	
	
	return self;
}

-(IBAction)add:(id)sender {
	[objectName resignFirstResponder];
	[objectData resignFirstResponder];

	NSData* data = [objectData.text dataUsingEncoding:NSUTF8StringEncoding];
		
	@try {
		S3PutObjectRequest *por = [[S3PutObjectRequest alloc] initWithKey:objectName.text inBucket:bucket];
		por.data = data;
		
		[[Constants s3] putObject:por];
		
		[objectListing addObject:objectName.text];		
	}
	@catch ( NSException* exception ) {
		NSLog( @"Failed to Create Object [%@]", exception );
	}
			
	[self.view removeFromSuperview];	
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	return YES;
}

-(IBAction)cancel:(id)sender {
	[self.view removeFromSuperview];
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
