//
//  MBQuadDetectorSubview.h
//  MicroblinkDev
//
//  Created by Dino Gustin on 02/05/2018.
//

#import "MBDisplayableQuadDetection.h"

/**
 * Protocol for processing MBIDisplayableQuadDetection. Subviews implementing this protocol process and draw quad on the screen (e.g. viewfinder drawing document outlining)
 */
@protocol MBIQuadDetectorSubview <NSObject>

/**
 * This method should be called when MBIDisplayableQuadDetection is obtained and quad need to be drawn/redrawn.
 */
- (void)detectionFinishedWithDisplayableQuad:(MBIDisplayableQuadDetection *)displayableQuadDetection;

@end
