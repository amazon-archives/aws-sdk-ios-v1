
#import "SESRequest.h"

@implementation SESRequest

-(void)sign
{
    [self setParameterValue:credentials.accessKey forKey:@"AWSAccessKeyId"];
}

-(NSMutableURLRequest *)configureURLRequest
{
    NSMutableURLRequest *mutableURLRequest = [super configureURLRequest];

    NSString            *rfc822Date = [[NSDate date] stringWithRFC822Format];
    NSString            *nonce      = [AmazonAuthUtils nonce];
    NSString            *sts        = [AmazonAuthUtils getV3StringToSign:rfc822Date nonce:nonce];
    NSString            *signature  = [AmazonAuthUtils signRequestV3:self sts:sts credentials:credentials];

    [mutableURLRequest setValue:nonce forHTTPHeaderField:@"x-amz-nonce"];
    [mutableURLRequest setValue:rfc822Date forHTTPHeaderField:@"Date"];
    [mutableURLRequest setValue:[AmazonAuthUtils amznAuthorization:credentials.accessKey algorithm:@"HmacSHA256" signature:signature]   forHTTPHeaderField:@"X-Amzn-Authorization"];

    return mutableURLRequest;
}


@end
