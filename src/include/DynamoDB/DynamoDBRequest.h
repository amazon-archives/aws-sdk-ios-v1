
#import <Foundation/Foundation.h>
#import "../AmazonServiceRequest.h"
#import "../AmazonAuthUtils.h"

//#define SIGV4 1

@interface DynamoDBRequest:AmazonServiceRequest {
    NSString            *content;
    NSMutableDictionary *headers;
}


@property (nonatomic, retain) NSString *content;


-(NSArray *)headersToSign;
-(void)addValue:(NSString *)theValue forHeader:(NSString *)theHeader;
-(NSString *)generateAuthorization3;
-(NSString *)generateSignature;
-(NSString *)generateStringToSign;
-(NSArray *)headersToSign;

@end
