//
//  MBVinParserResult.h
//  MicroBlinkDev
//
//  Created by Jura Skrlec on 07/03/2018.
//

#import <Foundation/Foundation.h>
#import "PPMicroBlinkDefines.h"
#import "MBParserResult.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * MBVinParser is used for parsing VIN numbers
 */
PP_CLASS_AVAILABLE_IOS(8.0)
@interface MBVinParserResult : MBParserResult <NSCopying>

- (instancetype)init NS_UNAVAILABLE;

/**
 * Returns the recognized VIN number or empty string if recognition failed.
 */
@property (nonatomic, nullable, strong, readonly) NSString *vin;

@end

NS_ASSUME_NONNULL_END