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

#import "AWS_SBJsonStreamParserState.h"
#import "AWS_SBJsonStreamParser.h"

#define SINGLETON \
+ (id)sharedInstance { \
    static id state; \
    if (!state) state = [[self alloc] init]; \
    return state; \
}

@implementation AWS_SBJsonStreamParserState

+ (id)sharedInstance { return nil; }

- (BOOL)parser:(AWS_SBJsonStreamParser*)parser shouldAcceptToken:(AWS_SBJson_token_t)token {
	return NO;
}

- (AWS_SBJsonStreamParserStatus)parserShouldReturn:(AWS_SBJsonStreamParser*)parser {
	return AWS_SBJsonStreamParserWaitingForData;
}

- (void)parser:(AWS_SBJsonStreamParser*)parser shouldTransitionTo:(AWS_SBJson_token_t)tok {}

- (BOOL)needKey {
	return NO;
}

- (NSString*)name {
	return @"<aaiie!>";
}

@end

#pragma mark -

@implementation AWS_SBJsonStreamParserStateStart

SINGLETON

- (BOOL)parser:(AWS_SBJsonStreamParser*)parser shouldAcceptToken:(AWS_SBJson_token_t)token {
	return token == AWS_SBJson_token_array_start || token == AWS_SBJson_token_object_start;
}

- (void)parser:(AWS_SBJsonStreamParser*)parser shouldTransitionTo:(AWS_SBJson_token_t)tok {

	AWS_SBJsonStreamParserState *state = nil;
	switch (tok) {
		case AWS_SBJson_token_array_start:
			state = [AWS_SBJsonStreamParserStateArrayStart sharedInstance];
			break;

		case AWS_SBJson_token_object_start:
			state = [AWS_SBJsonStreamParserStateObjectStart sharedInstance];
			break;

		case AWS_SBJson_token_array_end:
		case AWS_SBJson_token_object_end:
			if (parser.supportMultipleDocuments)
				state = parser.state;
			else
				state = [AWS_SBJsonStreamParserStateComplete sharedInstance];
			break;

		case AWS_SBJson_token_eof:
			return;

		default:
			state = [AWS_SBJsonStreamParserStateError sharedInstance];
			break;
	}


	parser.state = state;
}

- (NSString*)name { return @"before outer-most array or object"; }

@end

#pragma mark -

@implementation AWS_SBJsonStreamParserStateComplete

SINGLETON

- (NSString*)name { return @"after outer-most array or object"; }

- (AWS_SBJsonStreamParserStatus)parserShouldReturn:(AWS_SBJsonStreamParser*)parser {
	return AWS_SBJsonStreamParserComplete;
}

@end

#pragma mark -

@implementation AWS_SBJsonStreamParserStateError

SINGLETON

- (NSString*)name { return @"in error"; }

- (AWS_SBJsonStreamParserStatus)parserShouldReturn:(AWS_SBJsonStreamParser*)parser {
	return AWS_SBJsonStreamParserError;
}

@end

#pragma mark -

@implementation AWS_SBJsonStreamParserStateObjectStart

SINGLETON

- (NSString*)name { return @"at beginning of object"; }

- (BOOL)parser:(AWS_SBJsonStreamParser*)parser shouldAcceptToken:(AWS_SBJson_token_t)token {
	switch (token) {
		case AWS_SBJson_token_object_end:
		case AWS_SBJson_token_string:
			return YES;
			break;
		default:
			return NO;
			break;
	}
}

- (void)parser:(AWS_SBJsonStreamParser*)parser shouldTransitionTo:(AWS_SBJson_token_t)tok {
	parser.state = [AWS_SBJsonStreamParserStateObjectGotKey sharedInstance];
}

- (BOOL)needKey {
	return YES;
}

@end

#pragma mark -

@implementation AWS_SBJsonStreamParserStateObjectGotKey

SINGLETON

- (NSString*)name { return @"after object key"; }

- (BOOL)parser:(AWS_SBJsonStreamParser*)parser shouldAcceptToken:(AWS_SBJson_token_t)token {
	return token == AWS_SBJson_token_keyval_separator;
}

- (void)parser:(AWS_SBJsonStreamParser*)parser shouldTransitionTo:(AWS_SBJson_token_t)tok {
	parser.state = [AWS_SBJsonStreamParserStateObjectSeparator sharedInstance];
}

@end

#pragma mark -

@implementation AWS_SBJsonStreamParserStateObjectSeparator

SINGLETON

- (NSString*)name { return @"as object value"; }

- (BOOL)parser:(AWS_SBJsonStreamParser*)parser shouldAcceptToken:(AWS_SBJson_token_t)token {
	switch (token) {
		case AWS_SBJson_token_object_start:
		case AWS_SBJson_token_array_start:
		case AWS_SBJson_token_true:
		case AWS_SBJson_token_false:
		case AWS_SBJson_token_null:
		case AWS_SBJson_token_number:
		case AWS_SBJson_token_string:
			return YES;
			break;

		default:
			return NO;
			break;
	}
}

- (void)parser:(AWS_SBJsonStreamParser*)parser shouldTransitionTo:(AWS_SBJson_token_t)tok {
	parser.state = [AWS_SBJsonStreamParserStateObjectGotValue sharedInstance];
}

@end

#pragma mark -

@implementation AWS_SBJsonStreamParserStateObjectGotValue

SINGLETON

- (NSString*)name { return @"after object value"; }

- (BOOL)parser:(AWS_SBJsonStreamParser*)parser shouldAcceptToken:(AWS_SBJson_token_t)token {
	switch (token) {
		case AWS_SBJson_token_object_end:
		case AWS_SBJson_token_separator:
			return YES;
			break;
		default:
			return NO;
			break;
	}
}

- (void)parser:(AWS_SBJsonStreamParser*)parser shouldTransitionTo:(AWS_SBJson_token_t)tok {
	parser.state = [AWS_SBJsonStreamParserStateObjectNeedKey sharedInstance];
}


@end

#pragma mark -

@implementation AWS_SBJsonStreamParserStateObjectNeedKey

SINGLETON

- (NSString*)name { return @"in place of object key"; }

- (BOOL)parser:(AWS_SBJsonStreamParser*)parser shouldAcceptToken:(AWS_SBJson_token_t)token {
    return AWS_SBJson_token_string == token;
}

- (void)parser:(AWS_SBJsonStreamParser*)parser shouldTransitionTo:(AWS_SBJson_token_t)tok {
	parser.state = [AWS_SBJsonStreamParserStateObjectGotKey sharedInstance];
}

- (BOOL)needKey {
	return YES;
}

@end

#pragma mark -

@implementation AWS_SBJsonStreamParserStateArrayStart

SINGLETON

- (NSString*)name { return @"at array start"; }

- (BOOL)parser:(AWS_SBJsonStreamParser*)parser shouldAcceptToken:(AWS_SBJson_token_t)token {
	switch (token) {
		case AWS_SBJson_token_object_end:
		case AWS_SBJson_token_keyval_separator:
		case AWS_SBJson_token_separator:
			return NO;
			break;

		default:
			return YES;
			break;
	}
}

- (void)parser:(AWS_SBJsonStreamParser*)parser shouldTransitionTo:(AWS_SBJson_token_t)tok {
	parser.state = [AWS_SBJsonStreamParserStateArrayGotValue sharedInstance];
}

@end

#pragma mark -

@implementation AWS_SBJsonStreamParserStateArrayGotValue

SINGLETON

- (NSString*)name { return @"after array value"; }


- (BOOL)parser:(AWS_SBJsonStreamParser*)parser shouldAcceptToken:(AWS_SBJson_token_t)token {
	return token == AWS_SBJson_token_array_end || token == AWS_SBJson_token_separator;
}

- (void)parser:(AWS_SBJsonStreamParser*)parser shouldTransitionTo:(AWS_SBJson_token_t)tok {
	if (tok == AWS_SBJson_token_separator)
		parser.state = [AWS_SBJsonStreamParserStateArrayNeedValue sharedInstance];
}

@end

#pragma mark -

@implementation AWS_SBJsonStreamParserStateArrayNeedValue

SINGLETON

- (NSString*)name { return @"as array value"; }


- (BOOL)parser:(AWS_SBJsonStreamParser*)parser shouldAcceptToken:(AWS_SBJson_token_t)token {
	switch (token) {
		case AWS_SBJson_token_array_end:
		case AWS_SBJson_token_keyval_separator:
		case AWS_SBJson_token_object_end:
		case AWS_SBJson_token_separator:
			return NO;
			break;

		default:
			return YES;
			break;
	}
}

- (void)parser:(AWS_SBJsonStreamParser*)parser shouldTransitionTo:(AWS_SBJson_token_t)tok {
	parser.state = [AWS_SBJsonStreamParserStateArrayGotValue sharedInstance];
}

@end

