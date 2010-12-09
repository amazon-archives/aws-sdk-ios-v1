
#import <AWSiOSSDK/S3/AmazonS3Client.h>
#import "AddObjectViewController.h"
#import "ObjectViewController.h"
#import "Constants.h"

@implementation ObjectListing

@synthesize bucket, objects;

-(id)init {
	return [super initWithNibName:@"ObjectListing" bundle:nil];
}

-(void)addObject:(NSString*)objectName {
	NSArray *insertPaths = [NSArray arrayWithObjects:[NSIndexPath indexPathForRow:[objects count] inSection:0], nil];
	
	[objects addObject:objectName];
	
	[objectsTableView beginUpdates];
	[objectsTableView insertRowsAtIndexPaths:insertPaths withRowAnimation:UITableViewRowAnimationFade];
	[objectsTableView endUpdates];				
}

- (IBAction)done:(id)sender {
	[self.view removeFromSuperview];
}

- (IBAction)add:(id)sender {
	[UIView beginAnimations:@"Add Object" context:nil];    
	[UIView setAnimationDuration:1];	
	[UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.view cache:YES];
	
	AddObjectViewController* addObject = [[AddObjectViewController alloc] initWithNibName:@"AddObjectViewController" withBucketName:bucket objectLister:self];
	
	[self.view addSubview:addObject.view];
	[UIView commitAnimations];		
}

- (id)initWithNibName:(NSString *)nibNameOrNil andObjects:(NSMutableArray*)theObjects bucket:(NSString*)bucketName {
	if ((self = [super initWithNibName:nibNameOrNil bundle:nil])) {
		objects = theObjects;
		bucket = bucketName;
	}	
	
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [objects count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
	cell.textLabel.text = [objects objectAtIndex:indexPath.row];
    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	S3GetObjectRequest* getObjectRequest = [[S3GetObjectRequest alloc] initWithKey:[objects objectAtIndex:indexPath.row] withBucket:bucket];
	S3GetObjectResponse* getObjectResponse = [[Constants s3] getObject:getObjectRequest];
	
	NSString *objectData = [[NSString alloc] initWithData:getObjectResponse.body encoding:NSUTF8StringEncoding];	
	
	[UIView beginAnimations:@"load" context:nil];    
	[UIView setAnimationDuration:1];	
	[UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.view cache:YES];
	
	ObjectViewController* objectView = [[ObjectViewController alloc] initWithNibName:@"ObjectViewController" 
																	  withObjectName:[objects objectAtIndex:indexPath.row]
																	  withObjectData:objectData];
	
	[self.view addSubview:objectView.view];
	[UIView commitAnimations];	
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
		S3DeleteObjectRequest *dor = [[S3DeleteObjectRequest alloc] init];
		dor.bucket = bucket;
		dor.key = [objects objectAtIndex:indexPath.row];
		
		[[Constants s3] deleteObject:dor];
		[objects removeObjectAtIndex:indexPath.row];		
		
		NSArray* indexPaths = [NSArray arrayWithObjects:indexPath, nil];
		
		[tableView beginUpdates];
		[tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
		[tableView endUpdates];			
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
    }   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    [super dealloc];
}


@end

