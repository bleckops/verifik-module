//
//  RCTVerifik.h
//  AwesomeProject
//
//  Created by Carlos Bleck on 02/06/23.
//

#import <React/RCTBridgeModule.h>
#import <React/RCTLog.h>
#import <VerifikKit/VerifikKit-Swift.h>
@interface RCTVerifikModule : NSObject <RCTBridgeModule, VerifikProtocol>
@end
