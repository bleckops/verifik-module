//
//  RCTVerifik.m
//  AwesomeProject
//
//  Created by Carlos Bleck on 02/06/23.
//

#import "RCTVerifikModule.h"

@implementation RCTVerifikModule

Verifik *v;
RCTResponseSenderBlock callbck;

// To export a module named RCTCalendarModule
RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(initVerifik:(NSString *)token :(RCTResponseSenderBlock) callback)
{
  RCTLogInfo(@"Pretending to init an Verifik: %@", token);
  UIViewController *vc = RCTPresentedViewController();
  callbck = callback;
  v = [[Verifik alloc] initWithVc:vc token:token vp:self];
}

RCT_EXPORT_METHOD(enroll:(NSString *)externalDatabaseRef :(RCTResponseSenderBlock) callback)
{
  RCTLogInfo(@"Pretending to enroll on Verifik: %@", externalDatabaseRef);
  callbck = callback;
  [v enrollWithExternalDataBaseRefID:externalDatabaseRef];
}

RCT_EXPORT_METHOD(authenticate:(NSString *)externalDatabaseRef :(RCTResponseSenderBlock) callback)
{
  RCTLogInfo(@"Pretending to authenticate on Verifik: %@", externalDatabaseRef);
  callbck = callback;
  [v authenticateWithExternalDataBaseRefID:externalDatabaseRef];
}

RCT_EXPORT_METHOD(matchID:(NSString *)externalDatabaseRef :(RCTResponseSenderBlock) callback)
{
  RCTLogInfo(@"Pretending to matchID on Verifik");
  callbck = callback;
  [v matchIDScanWithExternalDataBaseRefID:externalDatabaseRef];
}

RCT_EXPORT_METHOD(ocr:(NSString *)externalDatabaseRef :(RCTResponseSenderBlock) callback)
{
  RCTLogInfo(@"Pretending to ocr on Verifik");
  callbck = callback;
  [v photoIDScanWithExternalDataBaseRefID:externalDatabaseRef];
}

RCT_EXPORT_METHOD(appRegisterKYC:(NSString *)project email:(NSString *)email phone:(NSString *)phone :(RCTResponseSenderBlock) callback)
{
  RCTLogInfo(@"Pretending to appRegister on Verifik:\n project->%@ \n email->%@ \n phone->%@", project, email, phone);
  callbck = callback;
  [v appRegistrationKYCWithProject:project email:email phone:phone];
}

RCT_EXPORT_METHOD(appLoginKYC:(NSString *)project email:(NSString *)email phone:(NSString *)phone :(RCTResponseSenderBlock) callback)
{
  RCTLogInfo(@"Pretending to appLogin on Verifik:\n project->%@ \n email->%@ \n phone->%@", project, email, phone);
  callbck = callback;
  [v appLoginKYCWithProject:project email:email phone:phone];
}


- (void) initVerifikSuccess {
  if(callbck!=nil) {
    callbck(@[[NSNull null], @"Init verifik success"]);
  }
}

-(void)configErrorWithError:(NSString *)error {
  
  if(callbck!=nil) {
    callbck(@[[NSString stringWithFormat:@"CONFIG ERROR: %@",error], [NSNull null]]);
  }
}

-(void)sessionErrorWithError:(NSString *)error {
  if(callbck!=nil) {
    callbck(@[[NSString stringWithFormat:@"SESSION ERROR: %@",error], [NSNull null]]);
  }
}

-(void)enrollmentErrorWithError:(NSString *)error {
  if(callbck!=nil) {
    callbck(@[[NSString stringWithFormat:@"ENROLLMENT ERROR: %@",error], [NSNull null]]);
  }
}

-(void)authErrorWithError:(NSString *)error {
  if(callbck!=nil) {
    callbck(@[[NSString stringWithFormat:@"AUTH ERROR: %@",error], [NSNull null]]);
  }
}

-(void)photoIDMatchErrorWithError:(NSString *)error {
  if(callbck!=nil) {
    callbck(@[[NSString stringWithFormat:@"ID MATCH ERROR: %@",error], [NSNull null]]);
  }
}

-(void)photoIDScanErrorWithError:(NSString *)error {
  if(callbck!=nil) {
    callbck(@[[NSString stringWithFormat:@"PHOTO ID SCAN ERROR: %@",error], [NSNull null]]);
  }
}

-(void)appRegisterErrorWithError:(NSString *)error {
  if(callbck!=nil) {
    callbck(@[[NSString stringWithFormat:@"APP REGISTER ERROR: %@",error], [NSNull null]]);
  }
}

-(void)appLoginErrorWithError:(NSString *)error {
  if(callbck!=nil) {
    callbck(@[[NSString stringWithFormat:@"APP LOGIN ERROR: %@",error], [NSNull null]]);
  }
}

-(void)appPhotoIDScanErrorWithError:(NSString *)error {
  if(callbck!=nil) {
    callbck(@[[NSString stringWithFormat:@"APP PHOTO ID SCAN ERROR: %@",error], [NSNull null]]);
  }
}

- (void)livenessErrorWithError:(NSString * _Nonnull)error {}


- (void)onAppLoginDoneWithDone:(BOOL)done resultToken:(NSString * _Nullable)resultToken {}


- (void)onAppPhotoIDScanDoneWithDone:(BOOL)done resultID:(NSString * _Nullable)resultID {}


- (void)onAppRegisterDoneWithDone:(BOOL)done resultToken:(NSString * _Nullable)resultToken {}


- (void)onAuthDoneWithDone:(BOOL)done {}


- (void)onEnrollmentDoneWithDone:(BOOL)done {}


- (void)onLivenessDoneWithDone:(BOOL)done {}


- (void)onPhotoIDMatchDoneWithDone:(BOOL)done {}


- (void)onPhotoIDScanWithDone:(BOOL)done {}


- (void)onVerifikComplete {}


@end
