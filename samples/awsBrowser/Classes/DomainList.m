
#import "DomainList.h"
#import "Constants.h"
#import "ItemListing.h"

@implementation DomainList

static DomainList* _instance = nil;

@synthesize domains;

+(DomainList*)instance
{
	@synchronized([DomainList class]) {
		if (!_instance) {
			[[self alloc] init];
		}
		
		return _instance;
	}
	
	return nil;
}

+(id)alloc
{
	@synchronized([DomainList class]) {
		NSAssert(_instance == nil, @"Attempted to allocate a second instance of a singleton.");
		_instance = [super alloc];
		return _instance;
	}
	
	return nil;
}

-(id)init {
	return [super initWithNibName:@"DomainList" bundle:nil];
}

-(void)addDomain:(NSString*)domainName {
	NSArray *insertPaths = [NSArray arrayWithObjects:[NSIndexPath indexPathForRow:0 inSection:0], nil];
	
	[domains insertObject:domainName atIndex:0];
	
	[domainTableView beginUpdates];
	[domainTableView insertRowsAtIndexPaths:insertPaths withRowAnimation:UITableViewRowAnimationFade];
	[domainTableView endUpdates];				
}

- (IBAction)done:(id)sender {
	[self.view removeFromSuperview];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [domains count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
	cell.textLabel.text = [domains objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSString *selectExpression = [NSString stringWithFormat:@"select itemName() from `%@`", [domains objectAtIndex:indexPath.row]];
	SimpleDBSelectRequest* selectRequest = 	[[SimpleDBSelectRequest alloc] initWithSelectExpression:selectExpression];
	SimpleDBSelectResponse* selectResponse = [[Constants sdb] select:selectRequest];
	
	NSMutableArray* itemNames = [[NSMutableArray alloc] initWithCapacity:1];
	for ( SimpleDBItem* item in selectResponse.items ) {
		[itemNames addObject:item.name];
	}
	
	[UIView beginAnimations:@"load" context:nil];    
	[UIView setAnimationDuration:1];	
	[UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.view cache:YES];
	
	ItemListing* itemList = [[ItemListing alloc] init];
	itemList.domain = [domains objectAtIndex:indexPath.row];
	itemList.items = itemNames;
	
	[self.view addSubview:itemList.view];
	[UIView commitAnimations];		
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    [super dealloc];
}


@end

