//
//  LunaRecordStack.h
//  ChineseChess
//
//  Created by 李夙璃 on 2017/11/27.
//  Copyright © 2017年 StarLab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LunaCodingProtocol.h"
#import "LunaRecord.h"

@interface LunaRecordStack : NSObject

- (instancetype)initWithCoder:(id<LunaCoding>)coder;

@property (nonatomic) uint8_t firstSide;

@property (nonatomic) NSString *firstCode;

- (void)reloadWith:(NSString *)file;

- (NSString *)historyFileWithCode:(BOOL)withCode;

// MARK: - Stack Operation.
- (void)push:(LunaRecord *)history;

- (LunaRecord *)pop;

- (LunaRecord *)peek;

- (void)clear;

- (NSArray<LunaRecord *> *)allRecords;

- (NSUInteger)count;

@end
