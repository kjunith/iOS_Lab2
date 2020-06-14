//
//  User.m
//  iOS Lab2
//
//  Created by Jimmie Määttä on 2019-02-19.
//  Copyright © 2019 MaeWik. All rights reserved.
//

#import "User.h"

@implementation User

-(NSDictionary *)dictFromUser {
    return @{@"username":self.username,
             @"email":self.email,
             @"picture":self.picture
             };
}

-(id)initWithDict:(NSDictionary *)userData {
    self = [super init];
    if (self) {
        self.username = userData[@"username"];
        self.email = userData[@"email"];
        self.picture = userData[@"picture"];
    }
    return self;
}

@end
