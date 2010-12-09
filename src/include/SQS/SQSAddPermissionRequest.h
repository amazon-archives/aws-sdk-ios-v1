/*
 * Copyright 2010 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 * 
 *  http://aws.amazon.com/apache2.0
 * 
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */


               
/**
 * Add Permission Request
 */   

@interface SQSAddPermissionRequest : NSObject 
    
{
    NSString* queueUrl;
    NSString* label;
    NSMutableArray* aWSAccountIds;
    NSMutableArray* actions;

}


/**
 * 
 */
@property (nonatomic, retain) NSString* queueUrl;

/**
 * 
 */
@property (nonatomic, retain) NSString* label;

/**
 * The AWS account number of the principal who will be given permission.
     * The principal must have an AWS account, but does not need to be signed
     * up for Amazon SQS.
 */
@property (nonatomic, retain) NSMutableArray* aWSAccountIds;

/**
 * The action the client wants to allow for the specified principal.
 */
@property (nonatomic, retain) NSMutableArray* actions;


/**
 * Default constructor for a new AddPermissionRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;
   
/**
 * Constructs a new AddPermissionRequest object.
 * Callers should use properties to initialize any additional object members.
 * 
 * @param theQueueUrl
 * @param theLabel
 * @param theAWSAccountIds The AWS account number of the principal who
     * will be given permission. The principal must have an AWS account, but
     * does not need to be signed up for Amazon SQS.
 * @param theActions The action the client wants to allow for the
     * specified principal.
 */
-(id)initWithQueueUrl:(NSString*)theQueueUrl andLabel:(NSString*)theLabel andAWSAccountIds:(NSMutableArray*)theAWSAccountIds andActions:(NSMutableArray*)theActions;
            
/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString*)description;
    

@end
    