
#import "AWSiosDEMOViewController.h"
#import "Constants.h"
#import "BucketList.h"
#import "DomainList.h"

@implementation AWSiosDEMOViewController


- (IBAction)listBuckets:(id)sender {	
	if ( [ACCESS_KEY isEqualToString:@"CHANGE ME"] || [SECRET_KEY isEqualToString:@"CHANGE ME"] ) {
		[[Constants credentialsAlert] show];
	}
	else {
		NSArray* buckets = [[Constants s3] listBuckets];
		NSMutableArray* bucketNames = [[NSMutableArray alloc] initWithCapacity:1];
		for ( S3Bucket* bucket in buckets ) {
			[bucketNames addObject:[bucket name]];
		}
		
		[UIView beginAnimations:@"load" context:nil];    
		[UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.view cache:YES];
		
		BucketList* bucketList = [BucketList instance];
		bucketList.buckets = bucketNames;
		
		[self.view addSubview:bucketList.view];
		[UIView commitAnimations];	
	}
}

- (IBAction)listDomains:(id)sender {
	if ( [ACCESS_KEY isEqualToString:@"CHANGE ME"] || [SECRET_KEY isEqualToString:@"CHANGE ME"] ) {
		[[Constants credentialsAlert] show];
	}
	else {
		SimpleDBListDomainsRequest* listDomainsRequest = [[[SimpleDBListDomainsRequest alloc] init] autorelease];
		SimpleDBListDomainsResponse* listDomainsResponse = [[Constants sdb] listDomains:listDomainsRequest];
		
		NSMutableArray* domainNames = [[NSMutableArray alloc] initWithCapacity:[listDomainsResponse.domainNames count]];
		for ( NSString* name in listDomainsResponse.domainNames ) {
			[domainNames addObject:name];
		}
		
		[UIView beginAnimations:@"load" context:nil];    
		[UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.view cache:YES];
		
		DomainList* domainList = [DomainList instance];
		domainList.domains = domainNames;
		
		[self.view addSubview:domainList.view];
		[UIView commitAnimations];	
	}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
}

- (void)dealloc {
    [super dealloc];
}

@end
