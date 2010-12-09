
#import "SQSRequest.h"


@implementation SQSRequest

-(NSString*)endpoint {
	return [parameters valueForKey:@"QueueUrl"];
}

@end
