//
//  Luna+Heuristic.m
//  Luna
//
//  Created by 李夙璃 on 2018/9/17.
//  Copyright © 2018年 李夙璃. All rights reserved.
//

#import "Luna+Heuristic.h"
#include <memory.h>

/* MARK: - LCHistoryTrack
 * the index is move.
 */
void LCHistoryTrackClear(LCMutableHistoryTrackRef history) {
    memset(history->history, 0, LCBoardMapLength);
}
