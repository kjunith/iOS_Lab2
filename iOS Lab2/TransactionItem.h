//
//  TransactionItem.h
//  iOS Lab2
//
//  Created by JImmie Määttä on 2019-02-15.
//  Copyright © 2019 MaeWik. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TransactionItem : NSObject

@property (strong) NSString *uuid;
@property (strong) NSString *title;
@property (strong) NSString *category;
@property (strong) NSNumber *amount;
@property (strong) NSDate *date;

-(id)initWithTitle:(NSString *)title
      withCategory:(NSString *)category
        withAmount:(NSNumber *)amount
          withDate:(NSDate *)date;

-(NSDictionary *)dictFromTransactionItem;
-(id)initWithDict:(NSDictionary *)transactionItemData;

@end

NS_ASSUME_NONNULL_END
