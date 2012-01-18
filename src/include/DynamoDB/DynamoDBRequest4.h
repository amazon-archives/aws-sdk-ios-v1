
#import <Foundation/Foundation.h>
#import "../AmazonServiceRequest.h"
#import "../AmazonAuthUtils.h"


@interface DynamoDBRequest4:AmazonServiceRequest {
    NSString            *content;
    NSMutableDictionary *headers;
    NSDate              *overrideDate;
}


@property (nonatomic, retain) NSString *content;
@property (nonatomic, retain) NSDate   *overrideDate;


-(NSString *)sign;

-(void)addValue:(NSString *)theValue forHeader:(NSString *)theHeader;

-(NSString *)extractRegionName:(NSString *)host;
-(NSString *)extractServiceName:(NSString *)host;
-(NSString *)getCanonicalizedHeaderString:(NSMutableDictionary *)headers;
-(NSString *)getSignedHeadersString:(NSMutableDictionary *)headers;
-(NSString *)getCanonicalizedResourcePath:(NSString *)resourcePath;
-(NSString *)getHostFromEndpoint;
-(NSString *)getRequestPayloadWithoutQueryParams;

@end
