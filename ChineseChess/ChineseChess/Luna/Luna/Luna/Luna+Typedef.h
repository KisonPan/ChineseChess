//
//  Luna+Typedef.h
//  Luna
//
//  Created by 李夙璃 on 2018/3/29.
//  Copyright © 2018年 李夙璃. All rights reserved.
//

#ifndef Luna_Typedef_h
#define Luna_Typedef_h

#include <MacTypes.h>

typedef _Bool Bool;
typedef short Int16;

typedef _Bool LCSide;
typedef unsigned char LCChess;
typedef unsigned char LCLocation;
typedef unsigned short LCMove;
typedef unsigned int LCMoveTrack;

typedef unsigned char LCRow;
typedef unsigned char LCColumn;
typedef unsigned short LCRowColumn;

typedef signed char LCRowColumnOffset;
typedef unsigned char LCRowColumnIndex;
typedef unsigned char LCRowColumnFlexibility;
typedef unsigned char LCRowColumnMapState;

#define LC_INLINE static inline

#define LCChessLength 48
#define LCBoardLength 256
#define LCBoardMapLength 65536
#define LCBoardRowsColumnsLength 16

#define LCMoveTrackMaxLength 120

#endif /* Luna_Typedef_h */
