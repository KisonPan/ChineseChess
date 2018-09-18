//
//  Luna+MoveLegal.m
//  Luna
//
//  Created by 李夙璃 on 2018/9/17.
//  Copyright © 2018年 李夙璃. All rights reserved.
//

#import "Luna+MoveLegal.h"

// MARK: - 任意着法 合理检测函数簇
Bool _LCMoveIsLegal_K(LCPositionRef position, const LCMove *const move) {
    return true;
}

Bool _LCMoveIsLegal_A(LCPositionRef position, const LCMove *const move) {
    return true;
}

Bool _LCMoveIsLegal_B(LCPositionRef position, const LCMove *const move) {
    return true;
}

Bool _LCMoveIsLegal_N(LCPositionRef position, const LCMove *const move) {
    return true;
}

Bool _LCMoveIsLegal_R(LCPositionRef position, const LCMove *const move) {
    return true;
}

Bool _LCMoveIsLegal_C(LCPositionRef position, const LCMove *const move) {
    return true;
}

Bool _LCMoveIsLegal_P(LCPositionRef position, const LCMove *const move) {
    return true;
}

Bool (*const _LCMoveIsLegal[16])(LCPositionRef, const LCMove *const) = {
    _LCMoveIsLegal_K,
    _LCMoveIsLegal_A, _LCMoveIsLegal_A,
    _LCMoveIsLegal_B, _LCMoveIsLegal_B,
    _LCMoveIsLegal_N, _LCMoveIsLegal_N,
    _LCMoveIsLegal_R, _LCMoveIsLegal_R,
    _LCMoveIsLegal_C, _LCMoveIsLegal_C,
    _LCMoveIsLegal_P, _LCMoveIsLegal_P, _LCMoveIsLegal_P, _LCMoveIsLegal_P, _LCMoveIsLegal_P
};

const UInt8 _LCChessSideMap[LCChessLength] = {
    LCSideNull, LCSideNull, LCSideNull, LCSideNull,
    LCSideNull, LCSideNull, LCSideNull, LCSideNull,
    LCSideNull, LCSideNull, LCSideNull, LCSideNull,
    LCSideNull, LCSideNull, LCSideNull, LCSideNull,
    
    LCSideRed, LCSideRed, LCSideRed, LCSideRed,
    LCSideRed, LCSideRed, LCSideRed, LCSideRed,
    LCSideRed, LCSideRed, LCSideRed, LCSideRed,
    LCSideRed, LCSideRed, LCSideRed, LCSideRed,
    
    LCSideBlack, LCSideBlack, LCSideBlack, LCSideBlack,
    LCSideBlack, LCSideBlack, LCSideBlack, LCSideBlack,
    LCSideBlack, LCSideBlack, LCSideBlack, LCSideBlack,
    LCSideBlack, LCSideBlack, LCSideBlack, LCSideBlack
};

// MARK: - 任意着法 合理检测（用于杀手着法）
Bool LCPositionAnyMoveIsLegal(LCPositionRef position, const LCMove *const move) {
    register const LCChess chess = position->board[LCMoveGetLocationFrom(*move)];
    
    if (_LCChessSideMap[chess] == position->side && _LCChessSideMap[position->board[LCMoveGetLocationTo(*move)]] != position->side) {
        return _LCMoveIsLegal[chess & 0xf](position, move);
    }
    
    return false;
}
