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
 * Send Message Request
 */   

@interface SQSSendMessageRequest : NSObject 
    
{
    NSString* queueUrl;
    NSString* messageBody;

}


/**
 * 
 */
@property (nonatomic, retain) NSString* queueUrl;

/**
 * The message to send.
 */
@property (nonatomic, retain) NSString* messageBody;


/**
 * Default constructor for a new SendMessageRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;
   
/**
 * Constructs a new SendMessageRequest object.
 * Callers should use properties to initialize any additional object members.
 * 
 * @param theQueueUrl
 * @param theMessageBody The message to send.
 */
-(id)initWithQueueUrl:(NSString*)theQueueUrl andMessageBody:(NSString*)theMessageBody;
            
/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString*)description;
    

@end
    