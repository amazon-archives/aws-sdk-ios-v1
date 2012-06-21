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

#import "AmazonKeyChainWrapper.h"
#import <AWSiOSSDK/AmazonLogger.h>




NSString *kKeychainAccessKeyIdentifier;
NSString *kKeychainSecretKeyIdentifier;
NSString *kKeychainSecrutiyTokenIdentifier;
NSString *kKeychainExpirationDateIdentifier;

NSString *kKeychainUidIdentifier;
NSString *kKeychainKeyIdentifier;


@implementation AmazonKeyChainWrapper

+(void)initialize {
    NSString *bundleID = [NSBundle mainBundle].bundleIdentifier;
    kKeychainAccessKeyIdentifier = [[NSString stringWithFormat:@"%@.AWSAccessKey", bundleID] retain];
    kKeychainSecretKeyIdentifier= [[NSString stringWithFormat:@"%@.AWSSecretKey", bundleID] retain];
    kKeychainSecrutiyTokenIdentifier  = [[NSString stringWithFormat:@"%@.AWSSecurityToken", bundleID] retain];
    kKeychainExpirationDateIdentifier = [[NSString stringWithFormat:@"%@.AWSExpirationDate", bundleID] retain];
    
    kKeychainUidIdentifier = [[NSString stringWithFormat:@"%@.UID", bundleID] retain]; 
    kKeychainKeyIdentifier = [[NSString stringWithFormat:@"%@.KEY", bundleID] retain];
}

+(bool)areCredentialsExpired
{
    AMZLogDebug(@"areCredentialsExpired");

    NSString *expiration = [AmazonKeyChainWrapper getValueFromKeyChain:kKeychainExpirationDateIdentifier];
    if (expiration == nil) {
        return YES;
    }
    else {
        NSDate *expirationDate = [AmazonKeyChainWrapper convertStringToDate:expiration];

        AMZLog(@"expirationDate : %@, %@", expiration, expirationDate);

        return [AmazonKeyChainWrapper isExpired:expirationDate];
    }
}

+(void)registerDeviceId:(NSString *)uid andKey:(NSString *)key
{
    [AmazonKeyChainWrapper storeValueInKeyChain:uid forKey:kKeychainUidIdentifier];
    [AmazonKeyChainWrapper storeValueInKeyChain:key forKey:kKeychainKeyIdentifier];
}

+(NSString *)getKeyForDevice
{
    return [AmazonKeyChainWrapper getValueFromKeyChain:kKeychainKeyIdentifier];
}

+(NSString *)getUidForDevice
{
    return [AmazonKeyChainWrapper getValueFromKeyChain:kKeychainUidIdentifier];
}

+(AmazonCredentials *)getCredentialsFromKeyChain
{
    NSString *accessKey     = [AmazonKeyChainWrapper getValueFromKeyChain:kKeychainAccessKeyIdentifier];
    NSString *secretKey     = [AmazonKeyChainWrapper getValueFromKeyChain:kKeychainSecretKeyIdentifier];
    NSString *securityToken = [AmazonKeyChainWrapper getValueFromKeyChain:kKeychainSecrutiyTokenIdentifier];

    if ((accessKey != nil) && (secretKey != nil) && (securityToken != nil)) {
        if (![AmazonKeyChainWrapper areCredentialsExpired]) {
            AmazonCredentials *credentials = [[[AmazonCredentials alloc] initWithAccessKey:accessKey withSecretKey:secretKey] autorelease];
            credentials.securityToken = securityToken;

            return credentials;
        }
    }

    return nil;
}

+(void)storeCredentialsInKeyChain:(NSString *)theAccessKey secretKey:(NSString *)theSecretKey securityToken:(NSString *)theSecurityToken expiration:(NSString *)theExpirationDate
{
    [AmazonKeyChainWrapper storeValueInKeyChain:theAccessKey forKey:kKeychainAccessKeyIdentifier];
    [AmazonKeyChainWrapper storeValueInKeyChain:theSecretKey forKey:kKeychainSecretKeyIdentifier];
    [AmazonKeyChainWrapper storeValueInKeyChain:theSecurityToken forKey:kKeychainSecrutiyTokenIdentifier];
    [AmazonKeyChainWrapper storeValueInKeyChain:theExpirationDate forKey:kKeychainExpirationDateIdentifier];
}

+(bool)isExpired:(NSDate *)date
{
    NSDate *soon = [NSDate dateWithTimeIntervalSinceNow:(15 * 60)];  // Fifteen minutes from now.

    if ( [soon compare:date] == NSOrderedDescending) {
        return YES;
    }
    else {
        return NO;
    }
}

+(NSDate *)convertStringToDate:(NSString *)expiration
{
    if (expiration != nil)
    {
        long long exactSecondOfExpiration = (long long)([expiration longLongValue] / 1000);
        return [[[NSDate alloc] initWithTimeIntervalSince1970:exactSecondOfExpiration] autorelease];
    }
    else
    {
        return nil;
    }
}

+(NSString *)getValueFromKeyChain:(NSString *)key
{
    AMZLogDebug(@"Get Value for KeyChain key:[%@]", key);

    NSMutableDictionary *queryDictionary = [[[NSMutableDictionary alloc] init] autorelease];

    [queryDictionary setObject:[key dataUsingEncoding:NSUTF8StringEncoding] forKey:(id)kSecAttrGeneric];
    [queryDictionary setObject:(id) kCFBooleanTrue forKey:(id)kSecReturnAttributes];
    [queryDictionary setObject:(id) kSecMatchLimitOne forKey:(id)kSecMatchLimit];
    [queryDictionary setObject:(id) kCFBooleanTrue forKey:(id)kSecReturnData];
    [queryDictionary setObject:(id) kSecClassGenericPassword forKey:(id)kSecClass];

    NSDictionary *returnedDictionary = [[[NSMutableDictionary alloc] init] autorelease];
    OSStatus     keychainError       = SecItemCopyMatching((CFDictionaryRef)queryDictionary, (CFTypeRef *)&returnedDictionary);
    if (keychainError == noErr)
    {
        NSData *rawData = [returnedDictionary objectForKey:(id)kSecValueData];
        return [[[NSString alloc] initWithBytes:[rawData bytes] length:[rawData length] encoding:NSUTF8StringEncoding] autorelease];
    }
    else
    {
        return nil;
    }
}

+(void)storeValueInKeyChain:(NSString *)value forKey:(NSString *)key
{
    AMZLogDebug(@"Storing value:[%@] in KeyChain as key:[%@]", value, key);

    NSMutableDictionary *keychainDictionary = [[[NSMutableDictionary alloc] init] autorelease];
    [keychainDictionary setObject:[key dataUsingEncoding:NSUTF8StringEncoding]      forKey:(id)kSecAttrGeneric];
    [keychainDictionary setObject:(id) kSecClassGenericPassword forKey:(id)kSecClass];
    [keychainDictionary setObject:[value dataUsingEncoding:NSUTF8StringEncoding]    forKey:(id)kSecValueData];
    [keychainDictionary setObject:[key dataUsingEncoding:NSUTF8StringEncoding]      forKey:(id)kSecAttrAccount];
    [keychainDictionary setObject:(id) kSecAttrAccessibleWhenUnlockedThisDeviceOnly forKey:(id)kSecAttrAccessible];

    OSStatus keychainError = SecItemAdd((CFDictionaryRef)keychainDictionary, NULL);
    if (keychainError == errSecDuplicateItem) {
        SecItemDelete((CFDictionaryRef)keychainDictionary);
        SecItemAdd((CFDictionaryRef)keychainDictionary, NULL);
    }
}

+(void)wipeKeyChain
{
    OSStatus keychainError = SecItemDelete((CFDictionaryRef)[AmazonKeyChainWrapper createKeychainDictionaryForKey : kKeychainAccessKeyIdentifier]);

    AMZLogDebug(@"Keychain Key: kKeychainAccessKeyIdentifier, Error Code: %ld", keychainError);

    keychainError = SecItemDelete((CFDictionaryRef)[AmazonKeyChainWrapper createKeychainDictionaryForKey : kKeychainSecretKeyIdentifier]);
    AMZLogDebug(@"Keychain Key: kKeychainSecretKeyIdentifier, Error Code: %ld", keychainError);

    keychainError = SecItemDelete((CFDictionaryRef)[AmazonKeyChainWrapper createKeychainDictionaryForKey : kKeychainSecrutiyTokenIdentifier]);
    AMZLogDebug(@"Keychain Key: kKeychainSecrutiyTokenIdentifier, Error Code: %ld", keychainError);

    keychainError = SecItemDelete((CFDictionaryRef)[AmazonKeyChainWrapper createKeychainDictionaryForKey : kKeychainExpirationDateIdentifier]);
    AMZLogDebug(@"Keychain Key: kKeychainExpirationDateIdentifier, Error Code: %ld", keychainError);

    keychainError = SecItemDelete((CFDictionaryRef)[AmazonKeyChainWrapper createKeychainDictionaryForKey : kKeychainUidIdentifier]);
    AMZLogDebug(@"Keychain Key: kKeychainUidIdentifier, Error Code: %ld", keychainError);

    keychainError = SecItemDelete((CFDictionaryRef)[AmazonKeyChainWrapper createKeychainDictionaryForKey : kKeychainKeyIdentifier]);
    AMZLogDebug(@"Keychain Key: kKeychainKeyIdentifier, Error Code: %ld", keychainError);
}

+(void)wipeCredentialsFromKeyChain
{
    OSStatus keychainError = SecItemDelete((CFDictionaryRef)[AmazonKeyChainWrapper createKeychainDictionaryForKey : kKeychainAccessKeyIdentifier]);

    AMZLogDebug(@"Keychain Key: kKeychainAccessKeyIdentifier, Error Code: %ld", keychainError);

    keychainError = SecItemDelete((CFDictionaryRef)[AmazonKeyChainWrapper createKeychainDictionaryForKey : kKeychainSecretKeyIdentifier]);
    AMZLogDebug(@"Keychain Key: kKeychainSecretKeyIdentifier, Error Code: %ld", keychainError);

    keychainError = SecItemDelete((CFDictionaryRef)[AmazonKeyChainWrapper createKeychainDictionaryForKey : kKeychainSecrutiyTokenIdentifier]);
    AMZLogDebug(@"Keychain Key: kKeychainSecrutiyTokenIdentifier, Error Code: %ld", keychainError);

    keychainError = SecItemDelete((CFDictionaryRef)[AmazonKeyChainWrapper createKeychainDictionaryForKey : kKeychainExpirationDateIdentifier]);
    AMZLogDebug(@"Keychain Key: kKeychainExpirationDateIdentifier, Error Code: %ld", keychainError);
}

+(NSMutableDictionary *)createKeychainDictionaryForKey:(NSString *)key
{
    NSMutableDictionary *dictionary = [[[NSMutableDictionary alloc] init] autorelease];

    [dictionary setObject:[key dataUsingEncoding:NSUTF8StringEncoding]      forKey:(id)kSecAttrGeneric];
    [dictionary setObject:(id) kSecClassGenericPassword forKey:(id)kSecClass];
    [dictionary setObject:[key dataUsingEncoding:NSUTF8StringEncoding]      forKey:(id)kSecAttrAccount];
    [dictionary setObject:(id) kSecAttrAccessibleWhenUnlockedThisDeviceOnly forKey:(id)kSecAttrAccessible];

    return dictionary;
}

@end
