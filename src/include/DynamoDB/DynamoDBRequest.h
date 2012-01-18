
#import <Foundation/Foundation.h>
#import "../AmazonServiceRequest.h"
#import "../AmazonAuthUtils.h"


@interface DynamoDBRequest:AmazonServiceRequest {
    NSString            *content;
    NSMutableDictionary *headers;
}


@property (nonatomic, retain) NSString *content;


-(NSArray *)headersToSign;
-(void)addValue:(NSString *)theValue forHeader:(NSString *)theHeader;
-(NSString *)generateAuthorization;
-(NSString *)generateSignature;
-(NSString *)generateStringToSign;
-(NSArray *)headersToSign;
-(NSString *)getHostFromEndpoint;

+(NSData *)hash:(NSData *)data;


@end
