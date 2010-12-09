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
 * Publish Request
 */   

@interface SNSPublishRequest : NSObject 
    
{
    NSString* topicArn;
    NSString* message;
    NSString* subject;

}


/**
 * The topic you want to publish to.
 */
@property (nonatomic, retain) NSString* topicArn;

/**
 * The message you want to send to the topic. <p>Constraints: Messages
     * must be UTF-8 encoded strings at most 8 KB in size (8192 bytes, not
     * 8192 characters).
 */
@property (nonatomic, retain) NSString* message;

/**
 * Optional parameter to be used as the "Subject" line of when the
     * message is delivered to e-mail endpoints. This field will also be
     * included, if present, in the standard JSON messages delivered to other
     * endpoints. <p>Constraints: Subjects must be ASCII text that begins
     * with a letter, number or punctuation mark; must not include line
     * breaks or control characters; and must be less than 100 characters
     * long.
 */
@property (nonatomic, retain) NSString* subject;


/**
 * Default constructor for a new PublishRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;
   
/**
 * Constructs a new PublishRequest object.
 * Callers should use properties to initialize any additional object members.
 * 
 * @param theTopicArn The topic you want to publish to.
 * @param theMessage The message you want to send to the topic.
     * <p>Constraints: Messages must be UTF-8 encoded strings at most 8 KB in
     * size (8192 bytes, not 8192 characters).
 */
-(id)initWithTopicArn:(NSString*)theTopicArn andMessage:(NSString*)theMessage;
    
/**
 * Constructs a new PublishRequest object.
 * Callers should use properties to initialize any additional object members.
 * 
 * @param theTopicArn The topic you want to publish to.
 * @param theMessage The message you want to send to the topic.
     * <p>Constraints: Messages must be UTF-8 encoded strings at most 8 KB in
     * size (8192 bytes, not 8192 characters).
 * @param theSubject Optional parameter to be used as the "Subject" line
     * of when the message is delivered to e-mail endpoints. This field will
     * also be included, if present, in the standard JSON messages delivered
     * to other endpoints. <p>Constraints: Subjects must be ASCII text that
     * begins with a letter, number or punctuation mark; must not include
     * line breaks or control characters; and must be less than 100
     * characters long.
 */
-(id)initWithTopicArn:(NSString*)theTopicArn andMessage:(NSString*)theMessage andSubject:(NSString*)theSubject;
            
/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString*)description;
    

@end
    