
#import "BucketList.h"
#import <AWSiOSSDK/S3/AmazonS3Client.h>
#import "AddBucketViewController.h"
#import "Constants.h"
#import "ObjectListing.h"

@implementation BucketList

static BucketList* _instance = nil;

@synthesize buckets;

+(BucketList*)instance
{
	@synchronized([BucketList class]) {
		if (!_instance) {
			[[self alloc] init];
		}
		
		return _instance;
	}
	
	return nil;
}

+(id)alloc
{
	@synchronized([BucketList class]) {
		NSAssert(_instance == nil, @"Attempted to allocate a second instance of a singleton.");
		_instance = [super alloc];
		return _instance;
	}
	
	return nil;
}

-(id)init {
	return [super initWithNibName:@"BucketList" bundle:nil];
}

-(void)addBucket:(NSString*)bucketName {
	NSArray *insertPaths = [NSArray arrayWithObjects:[NSIndexPath indexPathForRow:0 inSection:0], nil];
	
	[buckets insertObject:bucketName atIndex:0];
				
	[bucketTableView beginUpdates];
	[bucketTableView insertRowsAtIndexPaths:insertPaths withRowAnimation:UITableViewRowAnimationFade];
	[bucketTableView endUpdates];				
}

- (IBAction)done:(id)sender {
	[self.view removeFromSuperview];
}

- (IBAction)add:(id)sender {
	[UIView beginAnimations:@"Add Bucket" context:nil];    
	[UIView setAnimationDuration:1];	
	[UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.view cache:YES];
	
	AddBucketViewController* addBucket = [[AddBucketViewController alloc] initWithNibName:@"AddBucketViewController" bundle:nil];
	
	[self.view addSubview:addBucket.view];
	[UIView commitAnimations];	
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [buckets count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
	cell.textLabel.text = [buckets objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
		[[Constants s3] deleteBucket:[[S3DeleteBucketRequest alloc] initWithName: [buckets objectAtIndex:indexPath.row]]];
		[buckets removeObjectAtIndex:indexPath.row];		
		
		NSArray* indexPaths = [NSArray arrayWithObjects:indexPath, nil];
		
		[tableView beginUpdates];
		[tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
		[tableView endUpdates];			
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
    }   
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	S3ListObjectsRequest* listObjectRequest = [[S3ListObjectsRequest alloc] initWithName:[buckets objectAtIndex:indexPath.row]];
	
	S3ListObjectsResponse* listObjectResponse = [[Constants s3] listObjects:listObjectRequest];
	S3ListObjectsResult* listObjectsResults = listObjectResponse.listObjectsResult;
	
	NSMutableArray* objectSummaries = listObjectsResults.objectSummaries;
	NSMutableArray* objectNames = [[NSMutableArray alloc] initWithCapacity:1];
	for ( S3ObjectSummary* objectSummary in objectSummaries ) {
		[objectNames addObject:[objectSummary key]];
	}
	
	[UIView beginAnimations:@"load" context:nil];    
	[UIView setAnimationDuration:1];	
	[UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.view cache:YES];
	
	ObjectListing* objectList = [[ObjectListing alloc] init];
	objectList.bucket = [buckets objectAtIndex:indexPath.row];
	objectList.objects = objectNames;
	
	[self.view addSubview:objectList.view];
	[UIView commitAnimations];		
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    [super dealloc];
}


@end

