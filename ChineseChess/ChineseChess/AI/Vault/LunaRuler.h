//
//  LunaRuler.h
//  ChineseChess
//
//  Created by 李夙璃 on 2017/11/29.
//  Copyright © 2017年 StarLab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Luna.h"

@class LunaRecord;
@interface LunaRuler : NSObject

+ (LunaBoardState)analyzeWithRecords:(NSArray<LunaRecord *> *)records currentSide:(const uint8_t)side;

+ (NSString *)characterRecordWithMove:(uint16_t)move board:(const uint8_t *const)board;

@end
