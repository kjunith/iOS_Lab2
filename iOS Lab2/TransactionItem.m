//
//  TransactionItem.m
//  iOS Lab2
//
//  Created by JImmie Määttä on 2019-02-15.
//  Copyright © 2019 MaeWik. All rights reserved.
//

#import "TransactionItem.h"

@implementation TransactionItem

-(id)initWithTitle:(NSString *)title
      withCategory:(NSString *)category
        withAmount:(NSNumber *)amount
          withDate:(NSDate *)date{
    self = [super init];
    if (self) {
        self.title = title;
        self.category = category;
        self.amount = amount;
        self.date = date;
        self.uuid = [self generatedUuid];
    }
    return self;
}

-(NSDictionary *)dictFromTransactionItem {
    return @{@"title":self.title,
             @"category":self.category,
             @"amount":self.amount,
             @"date":self.date,
             @"uuid":self.uuid};
}

-(id)initWithDict:(NSDictionary *)transactionItemData {
    self = [super init];
    if (self) {
        self.title = transactionItemData[@"title"];
        self.category = transactionItemData[@"category"];
        self.amount = transactionItemData[@"amount"];
        self.date = transactionItemData[@"date"];
        self.uuid = transactionItemData[@"uuid"];
    }
    return self;
}

-(NSString *)generatedUuid {
    CFUUIDRef uuidRef = CFUUIDCreate(NULL);
    CFStringRef uuidStringRef = CFUUIDCreateString(NULL, uuidRef);
    CFRelease(uuidRef);
    return (__bridge_transfer NSString *)uuidStringRef;
}

@end
