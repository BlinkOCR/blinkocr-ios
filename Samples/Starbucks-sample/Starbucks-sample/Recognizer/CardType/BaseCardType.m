//
//  BaseCardType.m
//  Starbucks-sample
//
//  Created by Jure Cular on 09/07/2017.
//  Copyright © 2017 MicroBlink. All rights reserved.
//

#import "BaseCardType.h"

@implementation BaseCardType

- (instancetype)initWith:(PPDecodingInfo *)cardNumberDecodingInfo
    securityCodeDecodingInfo:(PPDecodingInfo *)securityCodeDecodingInfo
       cardNumberRegexParser:(PPRegexOcrParserFactory *)cardNumberRegexParser
     securityCodeRegexParser:(PPRegexOcrParserFactory *)securityCodeRegexParser
                 cardTypeKey:(NSString *)cardTypeKey
             securityCodeKey:(NSString *)securityCodeKey
               cardNumberKey:(NSString *)cardNumberKey {
    self = [super init];
    if (self) {
        _cardNumberDecodingInfo = cardNumberDecodingInfo;
        _securityCodeDecodingInfo = securityCodeDecodingInfo;
        _cardNumberRegexParser = cardNumberRegexParser;
        _securityCodeRegexParser = securityCodeRegexParser;
        _cardTypeKey = cardTypeKey;
        _securityCodeKey = securityCodeKey;
        _cardNumberKey = cardNumberKey;
    }
    return self;
}

+ (PPRegexOcrParserFactory *)createParserWithCharWhiteList:(NSSet *)charWhiteList
                                         minimalLineHeight:(NSUInteger)minimalLineHeight
                                         maximalLineHeight:(NSUInteger)maximalLineHeight
                                          maxCharsExpected:(NSUInteger)maxCharsExpected
                                                     regex:(NSString *)regex {
    PPRegexOcrParserFactory *parser = [[PPRegexOcrParserFactory alloc] initWithRegex:regex];

    parser.startsWithWhitespace = YES;
    parser.endsWithWhitespace = YES;

    PPOcrEngineOptions *engineOptions = [[PPOcrEngineOptions alloc] init];

    engineOptions.charWhitelist = charWhiteList;
    engineOptions.minimalLineHeight = minimalLineHeight;
    engineOptions.maximalLineHeight = maximalLineHeight;
    engineOptions.maxCharsExpected = maxCharsExpected;
    engineOptions.colorDropoutEnabled = NO;

    [parser setOptions:engineOptions];

    return parser;
}

+ (NSMutableSet *)numberWhitelist {
    // initialize new char whitelist
    NSMutableSet *charWhitelist = [[NSMutableSet alloc] init];

    // Add chars '0'-'9'
    for (int c = '0'; c <= '9'; c++) {
        [charWhitelist addObject:[PPOcrCharKey keyWithCode:c font:PP_OCR_FONT_ANY]];
    }
    return charWhitelist;
}

+ (NSSet *)charAndNumberWhiteList {
    NSMutableSet *charWhiteList = [BaseCardType numberWhitelist];

    for (int c = 'a'; c <= 'z'; c++) {
        [charWhiteList addObject:[PPOcrCharKey keyWithCode:c font:PP_OCR_FONT_ANY]];
    }
    return charWhiteList;
}

@end
