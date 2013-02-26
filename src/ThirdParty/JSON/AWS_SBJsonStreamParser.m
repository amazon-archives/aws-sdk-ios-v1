/*
 Copyright (c) 2010, Stig Brautaset.
 All rights reserved.

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are
 met:

 Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.

 Redistributions in binary form must reproduce the above copyright
 notice, this list of conditions and the following disclaimer in the
 documentation and/or other materials provided with the distribution.

 Neither the name of the the author nor the names of its contributors
 may be used to endorse or promote products derived from this software
 without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
 IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
 TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
 PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "AWS_SBJsonStreamParser.h"
#import "AWS_SBJsonTokeniser.h"
#import "AWS_SBJsonStreamParserState.h"
#import <limits.h>

@implementation AWS_SBJsonStreamParser

@synthesize supportMultipleDocuments;
@synthesize error;
@synthesize delegate;
@synthesize maxDepth;
@synthesize state;
@synthesize stateStack;

#pragma mark Housekeeping

- (id)init {
	self = [super init];
	if (self) {
		maxDepth = 32u;
        stateStack = [[NSMutableArray alloc] initWithCapacity:maxDepth];
        state = [AWS_SBJsonStreamParserStateStart sharedInstance];
		tokeniser = [[AWS_SBJsonTokeniser alloc] init];
	}
	return self;
}

- (void)dealloc {
	self.error = nil;
    self.state = nil;
	[stateStack release];
	[tokeniser release];
	[super dealloc];
}

#pragma mark Methods

- (NSString*)tokenName:(AWS_SBJson_token_t)token {
	switch (token) {
		case AWS_SBJson_token_array_start:
			return @"start of array";
			break;

		case AWS_SBJson_token_array_end:
			return @"end of array";
			break;

		case AWS_SBJson_token_number:
			return @"number";
			break;

		case AWS_SBJson_token_string:
			return @"string";
			break;

		case AWS_SBJson_token_true:
		case AWS_SBJson_token_false:
			return @"boolean";
			break;

		case AWS_SBJson_token_null:
			return @"null";
			break;

		case AWS_SBJson_token_keyval_separator:
			return @"key-value separator";
			break;

		case AWS_SBJson_token_separator:
			return @"value separator";
			break;

		case AWS_SBJson_token_object_start:
			return @"start of object";
			break;

		case AWS_SBJson_token_object_end:
			return @"end of object";
			break;

		case AWS_SBJson_token_eof:
		case AWS_SBJson_token_error:
			break;
	}
	NSAssert(NO, @"Should not get here");
	return @"<aaiiie!>";
}

- (void)maxDepthError {
    self.error = [NSString stringWithFormat:@"Input depth exceeds max depth of %u", maxDepth];
    self.state = [AWS_SBJsonStreamParserStateError sharedInstance];
}

- (void)handleObjectStart {
	if (stateStack.count >= maxDepth) {
        [self maxDepthError];
        return;
	}

    [delegate parserFoundObjectStart:self];
    [stateStack addObject:state];
    self.state = [AWS_SBJsonStreamParserStateObjectStart sharedInstance];
}

- (void)handleArrayStart {
	if (stateStack.count >= maxDepth) {
        [self maxDepthError];
        return;
    }
	
	[delegate parserFoundArrayStart:self];
    [stateStack addObject:state];
    self.state = [AWS_SBJsonStreamParserStateArrayStart sharedInstance];
}

- (AWS_SBJsonStreamParserStatus)parse:(NSData *)data_ {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    @try {
        [tokeniser appendData:data_];
        
        for (;;) {
            
            if ([state isKindOfClass:[AWS_SBJsonStreamParserStateError class]])
                return AWS_SBJsonStreamParserError;
            
            NSObject *token;
            AWS_SBJson_token_t tok = [tokeniser getToken:&token];
            switch (tok) {
                case AWS_SBJson_token_eof:
                    return [state parserShouldReturn:self];
                    break;
                    
                case AWS_SBJson_token_error:
                    self.state = [AWS_SBJsonStreamParserStateError sharedInstance];
                    self.error = tokeniser.error;
                    return AWS_SBJsonStreamParserError;
                    break;
                    
                default:
                    
                    if (![state parser:self shouldAcceptToken:tok]) {
                        NSString *tokenName = [self tokenName:tok];
                        NSString *stateName = [state name];
                        
                        self.error = [NSString stringWithFormat:@"Token '%@' not expected %@", tokenName, stateName];
                        self.state = [AWS_SBJsonStreamParserStateError sharedInstance];
                        return AWS_SBJsonStreamParserError;
                    }
                    
                    switch (tok) {
                        case AWS_SBJson_token_object_start:
                            [self handleObjectStart];
                            break;
                            
                        case AWS_SBJson_token_object_end:
                            self.state = [stateStack lastObject];
                            [stateStack removeLastObject];
                            [state parser:self shouldTransitionTo:tok];
                            [delegate parserFoundObjectEnd:self];
                            break;
                            
                        case AWS_SBJson_token_array_start:
                            [self handleArrayStart];
                            break;
                            
                        case AWS_SBJson_token_array_end:
                            self.state = [stateStack lastObject];
                            [stateStack removeLastObject];
                            [state parser:self shouldTransitionTo:tok];
                            [delegate parserFoundArrayEnd:self];
                            break;
                            
                        case AWS_SBJson_token_separator:
                        case AWS_SBJson_token_keyval_separator:
                            [state parser:self shouldTransitionTo:tok];
                            break;
                            
                        case AWS_SBJson_token_true:
                            [delegate parser:self foundBoolean:YES];
                            [state parser:self shouldTransitionTo:tok];
                            break;
                            
                        case AWS_SBJson_token_false:
                            [delegate parser:self foundBoolean:NO];
                            [state parser:self shouldTransitionTo:tok];
                            break;
                            
                        case AWS_SBJson_token_null:
                            [delegate parserFoundNull:self];
                            [state parser:self shouldTransitionTo:tok];
                            break;
                            
                        case AWS_SBJson_token_number:
                            [delegate parser:self foundNumber:(NSNumber*)token];
                            [state parser:self shouldTransitionTo:tok];
                            break;
                            
                        case AWS_SBJson_token_string:
                            if ([state needKey])
                                [delegate parser:self foundObjectKey:(NSString*)token];
                            else
                                [delegate parser:self foundString:(NSString*)token];
                            [state parser:self shouldTransitionTo:tok];
                            break;
                            
                        default:
                            break;
                    }
                    break;
            }
        }
        return AWS_SBJsonStreamParserComplete;
    }
    @finally {
        [pool drain];
    }
}

@end
