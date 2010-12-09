
#import <AWSiOSSDK/SimpleDB/AmazonSimpleDBClient.h>
#import "ItemListing.h"
#import "Constants.h"
#import "ItemViewController.h"

@implementation ItemListing

@synthesize domain, items;

-(id)init {
	return [super initWithNibName:@"ItemListing" bundle:nil];
}

-(void)addItem:(NSString*)itemName {
	NSArray *insertPaths = [NSArray arrayWithObjects:[NSIndexPath indexPathForRow:[items count] inSection:0], nil];
	
	[items addObject:itemName];
	
	[itemsTableView beginUpdates];
	[itemsTableView insertRowsAtIndexPaths:insertPaths withRowAnimation:UITableViewRowAnimationFade];
	[itemsTableView endUpdates];				
}

- (IBAction)done:(id)sender {
	[self.view removeFromSuperview];
}

- (id)initWithNibName:(NSString *)nibNameOrNil andObjects:(NSMutableArray*)theItems domain:(NSString*)domainName {
	if ((self = [super initWithNibName:nibNameOrNil bundle:nil])) {
		items = theItems;
		domain = domainName;
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
    return [items count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
	cell.textLabel.text = [items objectAtIndex:indexPath.row];
    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	SimpleDBGetAttributesRequest* gar = [[SimpleDBGetAttributesRequest alloc] initWithDomainName:domain andItemName:[items objectAtIndex:indexPath.row]];
	SimpleDBGetAttributesResponse* response = [[Constants sdb] getAttributes:gar];
	
	NSMutableArray* data = [[NSMutableArray alloc] initWithCapacity:1];												
	for ( SimpleDBAttribute* attr in response.attributes ) {
		[data addObject:[NSString stringWithFormat:@"%@ => %@", attr.name, attr.value]];
	}
	
	[UIView beginAnimations:@"load" context:nil];    
	[UIView setAnimationDuration:1];	
	[UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.view cache:YES];
	
	ItemViewController* itemView = [[ItemViewController alloc] initWithNibName:@"ItemViewController" 
																	   andData:data
																	  itemName:[items objectAtIndex:indexPath.row]];
	
	[self.view addSubview:itemView.view];
	[UIView commitAnimations];	 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    [super dealloc];
}


@end

