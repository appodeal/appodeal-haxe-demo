//
//  APDUserInfoProtocol.h
//  Appodeal
//
//  Created by Ivan Doroshenko on 2/10/16.
//  Copyright © 2016 Appodeal, Inc. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <Appodeal/APDDefines.h>

@protocol APDUserInfo <NSObject>

//@property (copy, nonatomic, readonly) NSString *vkId;
//@property (copy, nonatomic, readonly) NSString *facebookId;
@property (copy, nonatomic, readonly) NSString *email;
@property (copy, nonatomic, readonly) NSArray *interests;

@property (strong, nonatomic, readonly) NSDate *birthday;
@property (assign, nonatomic, readonly) NSUInteger age;
@property (assign, nonatomic, readonly) APDUserGender gender;
@property (assign, nonatomic, readonly) APDUserOccupation occupation;
@property (assign, nonatomic, readonly) APDUserRelationship relationship;
@property (assign, nonatomic, readonly) APDUserSmokingAttitude smokingAttitude;
@property (assign, nonatomic, readonly) APDUserAlcoholAttitude alcoholAttitude;

@end
