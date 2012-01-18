/*
 * Copyright 2010-2012 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import <Foundation/Foundation.h>

/** Base class for type-specific response unmarshallers.
 */
@interface AmazonUnmarshallerXMLParserDelegate:NSObject<NSXMLParserDelegate> {
    NSMutableString                     *currentText;
    NSString                            *currentTag;
    AmazonUnmarshallerXMLParserDelegate *caller;
    id                                  parentObject;
    SEL                                 parentSetter;
    NSString                            *endElementTagName;
}

/** Inner text of the current XML node */
@property (nonatomic, readonly) NSString *currentText;
/** The tag name of the current XML node */
@property (nonatomic, retain) NSString   *currentTag;

/** If an alias has been set, this is the expected container tag for the unmarshaller. */
@property (nonatomic, retain) NSString *endElementTagName;

/** Set up this unmarshaller at the bottom of a call chain.
 * When parsing nested tags, control is handed to another delegate.
 * When that delegate is done, it will
 * <ul>
 * <li>set the parser's delegate to the caller, returning control to it.</li>
 * <li>assign the object it created to the parent field with <code>[parent setter:object]</code>.</li>
 * </ul>
 * @param aCaller	The unmarshaller to return control to when this one is done
 * @param parent	The object to set my unmarshalled value on
 * @param setter	The setter to call on the parent object
 */
-(AmazonUnmarshallerXMLParserDelegate *) initWithCaller:(AmazonUnmarshallerXMLParserDelegate *)aCaller withParentObject:(id)parent withSetter:(SEL)setter;

/** Set up this unmarshaller at the bottom of a call chain.
 * When parsing nested tags, control is handed to another delegate.
 * When that delegate is done, it will
 * <ul>
 * <li>set the parser's delegate to the caller, returning control to it.</li>
 * <li>assign the object it created to the parent field with <code>[parent setter:object]</code>.</li>
 * </ul>
 * @param aCaller	The unmarshaller to return control to when this one is done
 * @param parent	The object to set my unmarshalled value on
 * @param setter	The setter to call on the parent object
 * @param alias		Use this parser for a different container tag which has the same contents.
 */
-(AmazonUnmarshallerXMLParserDelegate *) initWithCaller:(AmazonUnmarshallerXMLParserDelegate *)aCaller withParentObject:(id)parent withSetter:(SEL)setter withAlias:(NSString *)alias;

@end
