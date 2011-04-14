
#import "SQSRequest.h"


@implementation SQSRequest

-(NSString *)endpoint
{
    return [parameters valueForKey:@"QueueUrl"];
}


-(void)setEndpoint:(NSString *)theEndpoint
{
    [parameters setValue:theEndpoint forKey:@"QueueUrl"];
}


@end
