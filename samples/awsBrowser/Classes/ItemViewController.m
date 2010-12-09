
#import <AWSiOSSDK/SimpleDB/AmazonSimpleDBClient.h>
#import "ItemViewController.h"
#import "Constants.h"

@implementation ItemViewController

@synthesize data, itemName;

-(id)init {
	return [super initWithNibName:@"ItemViewController" bundle:nil];
}

- (IBAction)done:(id)sender {
	[self.view removeFromSuperview];
}

- (id)initWithNibName:(NSString *)nibNameOrNil andData:(NSMutableArray*)theData itemName:(NSString*)theItemName {
	if ((self = [super initWithNibName:nibNameOrNil bundle:nil])) {
		data = theData;
		itemName = theItemName;
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
    return [data count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
	cell.textLabel.text = [data objectAtIndex:indexPath.row];
    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    [super dealloc];
}


@end

