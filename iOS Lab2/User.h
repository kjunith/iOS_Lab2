//
//  User.h
//  iOS Lab2
//
//  Created by Jimmie Määttä on 2019-02-19.
//  Copyright © 2019 MaeWik. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject

@property (strong) NSString *username;
@property (strong) NSString *email;
@property (strong) NSData *picture;
@property (strong) NSMutableArray *transactionItems;

-(NSDictionary *)dictFromUser;
-(id)initWithDict:(NSDictionary *)userData;

@end

NS_ASSUME_NONNULL_END
