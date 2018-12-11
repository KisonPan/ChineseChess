//
//  Luna+Evaluate.h
//  Luna
//
//  Created by 李夙璃 on 2018/6/19.
//  Copyright © 2018年 李夙璃. All rights reserved.
//

#import "Luna+Position.h"

typedef struct {
	const Int16 * dynamicChessValue[LCChessLength];
	Int16 material;
	Int16 value;
} LCEvaluate;

typedef const LCEvaluate *const LCEvaluateRef;

typedef LCEvaluate *const LCMutableEvaluateRef;

// MARK: - LCEvaluate Life Cycle
extern LCMutableEvaluateRef LCEvaluateCreateMutable(void);

extern void LCEvaluateInit(LCMutableEvaluateRef evaluate, LCPositionRef position);

extern void LCEvaluateRelease(LCEvaluateRef evaluate);

// MARK: - Evaluate
extern void LCEvaluatePosition(LCMutableEvaluateRef evaluate, LCPositionRef position);

// MARK: - Position Draw （和棋检测）
extern const Int16 LCPositionDrawValue;

LC_INLINE Bool LCPositionIsDraw(LCPositionRef position) {
    return !(position->bitchess & 0x07ff07ff);
}

// MARK: - Position Death（杀棋检测）
extern const Int16 LCPositionCheckMateValue;
extern const Int16 LCPositionWinValue;
