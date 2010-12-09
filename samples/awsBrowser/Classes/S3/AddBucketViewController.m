
#import "AddBucketViewController.h"
#import <AWSiOSSDK/S3/AmazonS3Client.h>
#import "BucketList.h"
#import "Constants.h"


@implementation AddBucketViewController


-(IBAction)add:(id)sender {
	[bucketName resignFirstResponder];
	
	@try {
		[[Constants s3] createBucket:[[S3CreateBucketRequest alloc] initWithName:bucketName.text]];
		[[BucketList instance] addBucket:bucketName.text];
	}
	@catch ( NSException* exception ) {
		NSLog( @"Failed to Creater Bucket [%@]", exception );
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
