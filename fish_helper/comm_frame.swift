//
//  comm_frame.swift
//  fish_helper
//
//  Created by 洪远洋 on 5/7/16.
//  Copyright © 2016 洪远洋. All rights reserved.
//

import Foundation



let USER_LOG_FRM:UInt8 = 0;
let USER_LOG_RSP_FRM:UInt8 = 1;
let DEV_REG_FRM:UInt8 = 2;
let DEV_REG_RSP_FRM:UInt8 = 3;
let REAL_DATA_FRM:UInt8 = 4;
let REAL_DATA_RSP_FRM:UInt8 = 5;
let SYS_CFG_FRM:UInt8 = 6;
let SYS_CFG_RSP_FRM:UInt8 = 7;
let MODE_CFG_FRM:UInt8 = 8;
let MODE_CFG_RSP_FRM:UInt8 = 9;
let EVENT_FRM:UInt8 = 0xa;
let EVENT_RSP_FRM:UInt8 = 0xb;
let HIS_INFO_FRM:UInt8 = 0xc;
let HIS_INFO_RSP_FRM:UInt8 = 0xd;
let ENT_DAY_7_FRM:UInt8 = 0xe;
let PUSH_INFO_FRM:UInt8 = 0x10;
let PUSH_INFO_RSP_FRM:UInt8 = 0x11;


//frame head
let DEV_ID_ADDR:UInt8	 = 0;
let DEV_ID_LEN:UInt8	 = 8;
let MANU_ID_ADDR:UInt8	 = DEV_ID_ADDR + DEV_ID_LEN
let MANU_ID_LEN:UInt8	 = 1
let DEV_TYPE_TERM:UInt8	= 1
let DEV_TYPE_FISH:UInt8	= 2
let DEV_TYPE_BARN:UInt8	= 5
let DEV_TYPE_FISH_SIG_CTRL:UInt8	= 6
let DEV_TYPE_FISH_MULTI_CTRL:UInt8	= 7
let DEV_TYPE_FISH_ONLY_CTRL:UInt8	= 8
let DEV_TYPE_FISH_DETECT_CTRL:UInt8	= 9
let DEV_TYPE_BARN_TMP:UInt8	= 10
let DEV_TYPE_FISH_FEED:UInt8	= 11
let DEV_TYPE_BARN_CO2:UInt8	= 12
let DEV_TYPE_FISH_PH:UInt8	= 13

let DEV_TYPE_ADDR:UInt8	 = MANU_ID_ADDR + MANU_ID_LEN;
let DEV_TYPE_LEN:UInt8	 = 1;
let FRM_TYPE_ADDR:UInt8	 = DEV_TYPE_ADDR + DEV_TYPE_LEN;
let FRM_TYPE_LEN:UInt8	 = 1;
let FRAME_LEN_ADDR:UInt8	 = FRM_TYPE_ADDR + FRM_TYPE_LEN;
let FRAME_LEN_LEN:UInt8	= 2;
let FRAME_HEAD_LEN:UInt8	 = FRAME_LEN_ADDR+FRAME_LEN_LEN;
//  USER_LOG_FRM
let USER_LOG_TYPE_LOG:UInt8	= 0x0;
let USER_LOG_TYPE_REG:UInt8	= 0x1;
let USER_LOG_TYPE_CITY:UInt8	= 0x2;
let USER_LOG_TYPE_USER_MODIFY:UInt8	= 0x3;
let USER_LOG_TYPE_USER_CREATE:UInt8	= 0x4;
let USER_LOG_TYPE_ADDR:UInt8	 = FRAME_LEN_ADDR+FRAME_LEN_LEN;
let USER_LOG_TYPE_LEN:UInt8	 = 1;
let USER_LOG_NAME_ADDR:UInt8	 = USER_LOG_TYPE_ADDR+USER_LOG_TYPE_LEN;
let USER_LOG_NAME_LEN:UInt8		= 32;
let USER_LOG_PWD_ADDR:UInt8	 = USER_LOG_NAME_ADDR+USER_LOG_NAME_LEN
let USER_LOG_PWD_LEN:UInt8		= 16;
let USER_LOG_DEV_NUM_ADDR:UInt8	 = USER_LOG_PWD_ADDR + USER_LOG_PWD_LEN;
let USER_LOG_DEV_NUM_LEN:UInt8	 = 1;
let USER_LOG_DEV_INFO_ADDR:UInt8 = USER_LOG_DEV_NUM_ADDR+USER_LOG_DEV_NUM_LEN;

//city_Reg
let USER_REG_CITY_ADDR:UInt8	 = USER_LOG_NAME_ADDR+USER_LOG_NAME_LEN
let USER_REG_CITY_LEN:UInt8	 = 4;
//user_reg
let USER_REG_DEV_CITY_ADDR:UInt8	 = USER_LOG_PWD_ADDR+USER_LOG_PWD_LEN;
let USER_REG_DEV_ID_ADDR:UInt8	 = USER_LOG_PWD_ADDR+USER_LOG_PWD_LEN;
let USER_REG_DEV_ID_LEN:UInt8	 = 16;
let USER_REG_DEV_NAME_ADDR:UInt8	 = USER_REG_DEV_ID_ADDR+USER_REG_DEV_ID_LEN;
let USER_REG_DEV_NAME_LEN:UInt8	 = 15;
let USER_REG_DEV_PWD_ADDR:UInt8	 = USER_REG_DEV_NAME_ADDR+USER_REG_DEV_NAME_LEN;
let USER_REG_DEV_PWD_LEN:UInt8	 = 16;

//user_modify
let USER_MODIFY_NAME_ADDR:UInt8	 = USER_LOG_PWD_ADDR+USER_LOG_PWD_LEN;
let USER_MODIFY_NAME_LEN:UInt8	 = 32;
let USER_MODIFY_PWD_ADDR:UInt8	 = USER_MODIFY_NAME_ADDR+USER_MODIFY_NAME_LEN;
let USER_MODIFY_PWD_LEN:UInt8	 = 16;

/*let USER_LOG_DEV_TYPE_LEN = 1;
	let USER_LOG_DEV_ID_LEN = DEV_ID_LEN;
	let USER_LOG_SYS_VER_LEN = 2;
	let USER_LOG_TIME_VER_LEN = 2;
	let USER_LOG_DEV_INFO_LEN = USER_LOG_DEV_TYPE_LEN+USER_LOG_DEV_ID_LEN
 +USER_LOG_SYS_VER_LEN+USER_LOG_TIME_VER_LEN;*/
//  USER_LOG_RSP_FRM
let USER_LOG_RSP_TYPE_LOG:UInt8	= 0x0
let USER_LOG_RSP_TYPE_REG:UInt8	= 0x1
let USER_LOG_RSP_TYPE_CITY:UInt8	= 0x2
let USER_LOG_RSP_TYPE_USER_MODIFY:UInt8	= 0x3
let USER_LOG_RSP_TYPE_ADDR:UInt8 = FRAME_LEN_ADDR+FRAME_LEN_LEN
let USER_LOG_RSP_TYPE_LEN:UInt8	 = 1
let USER_LOG_RSP_RES_ADDR:UInt8	= USER_LOG_RSP_TYPE_ADDR+USER_LOG_RSP_TYPE_LEN
let USER_LOG_RSP_RES_LEN:UInt8	 = 1
let USER_LOG_RSP_CITY_ADDR:UInt8		=  USER_LOG_RSP_RES_ADDR+USER_LOG_RSP_RES_LEN
let USER_LOG_RSP_CITY_LEN:UInt8	 = 4
let USER_LOG_RSP_NUM_ADDR:UInt8		= USER_LOG_RSP_CITY_ADDR+USER_LOG_RSP_CITY_LEN
let USER_LOG_RSP_NUM_LEN:UInt8	 = 1
let USER_LOG_RSP_ID_TYPE_ADDR:UInt8	 = USER_LOG_RSP_NUM_ADDR+USER_LOG_RSP_NUM_LEN
let USER_LOG_RSP_ID_TYPE_LEN:UInt8	 = 1
let USER_LOG_RSP_ID_LEN:UInt8	 = DEV_ID_LEN
let USER_LOG_RSP_DEV_NAME_LEN:UInt8	 = 15
let USER_LOG_RSP_MANU_ID_LEN:UInt8	 = 1
let USER_LOG_RSP_SYS_VER_LEN:UInt8	 = 2
let USER_LOG_RSP_MODE_VER_LEN:UInt8	 = 2
let USER_LOG_RSP_ID_TOL_LEN:UInt8	 = USER_LOG_RSP_ID_TYPE_LEN+DEV_ID_LEN+USER_LOG_RSP_DEV_NAME_LEN+USER_LOG_RSP_MANU_ID_LEN+USER_LOG_RSP_SYS_VER_LEN+USER_LOG_RSP_MODE_VER_LEN
let USER_LOG_RSP_USER_TYPE_LEN:UInt8	 = 1
let USER_LOG_RSP_DIAL_ALARM_LEN:UInt8	 = 2
let USER_LOG_RSP_MSG_ALARM_LEN:UInt8	 = 2

//  REAL_DATA_FRM
let REAL_DATA_CITY_CODE_ADDR:UInt8 = FRAME_LEN_ADDR+FRAME_LEN_LEN;
let REAL_DATA_CITY_CODE_LEN:UInt8 = 4;
let REAL_DATA_LEN:UInt8 =  REAL_DATA_CITY_CODE_ADDR + REAL_DATA_CITY_CODE_LEN;
//	REAL_DATA_RSP_FRM
let MOTOR_STAT_MANU_ON:UInt8 = 1;
let 	MOTOR_STAT_MANU_OFF:UInt8 = 0;
let MOTOR_STAT_AUTO_OFF:UInt8 =	2;
let MOTOR_STAT_AUTO_ON:UInt8 = 3;
let MOTOR_STAT_TIME_ON:UInt8 = 5;
let MOTOR_STAT_TIME_OFF:UInt8 = 4;


let MAX_VAR_NUM:UInt8 =	16;
let	REAL_DATA_RSP_TIME_ADDR:UInt8 =	(FRAME_LEN_ADDR+FRAME_LEN_LEN);
let REAL_DATA_RSP_TIME_LEN:UInt8 =	4;
let REAL_DATA_SYS_VER_RSP_ADDR:UInt8 =	(REAL_DATA_RSP_TIME_ADDR+REAL_DATA_RSP_TIME_LEN);
let REAL_DATA_SYS_VER_RSP_LEN:UInt8	= 2;
let REAL_DATA_MODE_VER_RSP_ADDR:UInt8 = REAL_DATA_SYS_VER_RSP_ADDR+REAL_DATA_SYS_VER_RSP_LEN;
let REAL_DATA_MODE_VER_RSP_LEN:UInt8 = 2;
/*
	let REAL_DATA_SYS_CFG_RSP_ADDR = (REAL_DATA_MODE_VER_RSP_ADDR+REAL_DATA_MODE_VER_RSP_LEN);
	let REAL_DATA_SYS_CFG_RSP_LEN = 1;
 
	let REAL_DATA_MODE_CFG_RSP_ADDR = ( REAL_DATA_SYS_CFG_RSP_ADDR+REAL_DATA_SYS_CFG_RSP_LEN);
	let REAL_DATA_MODE_CFG_RSP_LEN = 1;
	*/
let	REAL_DATA_NUM_RSP_ADDR:UInt8 = REAL_DATA_MODE_VER_RSP_ADDR + REAL_DATA_MODE_VER_RSP_LEN ;
let	REAL_DATA_NUM_RSP_LEN:UInt8	= 2;
let	REAL_DATA_VAR_RSP_ADDR:UInt8	= (REAL_DATA_NUM_RSP_ADDR+REAL_DATA_NUM_RSP_LEN);
let	REAL_DATA_TYPE_WTMP:UInt8 =	1;
let	REAL_DATA_TYPE_WTMP_LEN:UInt8	= 4;
let	REAL_DATA_TYPE_DO:UInt8	= 2;
let	REAL_DATA_TYPE_DO_LEN:UInt8 =	4;
let	REAL_DATA_TYPE_ATMP:UInt8	= 6;
let	REAL_DATA_TYPE_ATMP_LEN:UInt8	= 4;
let	REAL_DATA_TYPE_STAT:UInt8	= 3;
let	REAL_DATA_TYPE_STAT_LEN:UInt8	= 1;
let	REAL_DATA_TYPE_TMP:UInt8 =	1;
let	REAL_DATA_TYPE_AWET:UInt8	= 8;
let	REAL_DATA_TYPE_AWET_LEN:UInt8	= 4;
let	REAL_DATA_TYPE_SWET:UInt8	= 9;
let	REAL_DATA_TYPE_SWET_LEN:UInt8	= 2;
let	REAL_DATA_TYPE_STMP:UInt8	= 15;
let	REAL_DATA_TYPE_STMP_LEN:UInt8	= 2;
let	REAL_DATA_TYPE_CO2:UInt8	= 16;
let	REAL_DATA_TYPE_CO2_LEN:UInt8	= 2;
let	REAL_DATA_TYPE_STAT_FLAG:UInt8	= 10;
let	REAL_DATA_TYPE_STAT_FLAG_LEN:UInt8 = 1;
let	REAL_DATA_TYPE_PH:UInt8	= 7;
let	REAL_DATA_TYPE_PH_LEN:UInt8 = 2;
let	REAL_DATA_TYPE_AM:UInt8	= 17;
let	REAL_DATA_TYPE_AM_LEN:UInt8 = 2;
let	REAL_DATA_TYPE_ROLL_STAT:UInt8	= 18;
let	REAL_DATA_TYPE_ROLL_STAT_LEN:UInt8 = 2;
//11-13 remain for tmp_wet sh
let	REAL_DATA_TYPE_OP_FLAG:UInt8	= 14;
let	REAL_DATA_TYPE_OP_FLAG_LEN:UInt8 = 1;
let	REAL_DATA_TYPE_FALSE:UInt8	= 0xff;

//  MODE_CFG_FRM
var MODE_CFG_TYPE_TIME:UInt8	=	0x1;
var MODE_CFG_TYPE_EXIT:UInt8	=	0x3;
var MODE_CFG_TYPE_CTRL:UInt8	=	0x4;
var MODE_CFG_TYPE_SYNC:UInt8	=	0x5;
var MODE_CFG_TYPE_OP:UInt8	=	0x6;
var MODE_CFG_TYPE_ADDR:UInt8 =  FRAME_LEN_ADDR+FRAME_LEN_LEN;
var MODE_CFG_TYPE_LEN:UInt8 = 1;
var MODE_CFG_VER_ADDR:UInt8 = MODE_CFG_TYPE_ADDR+MODE_CFG_TYPE_LEN;
var MODE_CFG_VER_LEN:UInt8 = 2;
//cfg
var MODE_CFG_NUM_ADDR:UInt8 = MODE_CFG_VER_ADDR+MODE_CFG_VER_LEN;
var MODE_CFG_NUM_LEN:UInt8 = 1;
var MODE_CFG_INFO_ADDR:UInt8 = MODE_CFG_NUM_ADDR+MODE_CFG_NUM_LEN;
var MODE_CFG_INFO_START_LEN:UInt8 = 2;
var MODE_CFG_INFO_END_LEN:UInt8 = 2;
var MODE_CFG_INFO_STAT_SIG:UInt8 = 1;
var MODE_CFG_INFO_STAT_ON:UInt8 = 16;
var MODE_CFG_INFO_STAT_LEN:UInt8 = 1;
var MODE_CFG_INFO_START_DATE_LEN:UInt8 = 2;
var MODE_CFG_INFO_END_DATE_LEN:UInt8 = 2;
var MODE_CFG_INFO_LEN:UInt8 = MODE_CFG_INFO_START_LEN + MODE_CFG_INFO_END_LEN + MODE_CFG_INFO_STAT_LEN+MODE_CFG_INFO_START_DATE_LEN + MODE_CFG_INFO_END_DATE_LEN;
//sync

var MODE_CFG_SYNC_LEN = MODE_CFG_VER_ADDR+MODE_CFG_VER_LEN;

//manu_ctrl
var MOTOR_STAT_FEED_ON:UInt8 = 3;
var 	MOTOR_STAT_FEED_OFF:UInt8 = 2;
var MODE_CFG_STAT_ADDR:UInt8	= MODE_CFG_VER_ADDR+MODE_CFG_VER_LEN;
var MODE_CFG_STAT_LEN:UInt8 = 1;
var MODE_CFG_DELAY_ADDR:UInt8 = MODE_CFG_STAT_ADDR + MODE_CFG_STAT_LEN;
var MODE_CFG_DELAY_LEN:UInt8 = 2;
var   MODE_CFG_STAT_FLAG_ADDR:UInt8 =    (MODE_CFG_DELAY_ADDR + MODE_CFG_DELAY_LEN);
var    MODE_CFG_STAT_FLAG_LEN:UInt8   = 1;
//mode_change
var MODE_CFG_MODE_ADDR:UInt8	= MODE_CFG_VER_ADDR+MODE_CFG_VER_LEN;
var MODE_CFG_MODE_LEN:UInt8 = 1;
//  MODE_CFG_RSP_FRM
var MODE_CFG_RSP_TYPE_EXIT:UInt8	=	MODE_CFG_TYPE_EXIT;
var MODE_CFG_RSP_TYPE_CTRL:UInt8	=	MODE_CFG_TYPE_CTRL;
var MODE_CFG_RSP_TYPE_TIME:UInt8	=	MODE_CFG_TYPE_TIME;
var MODE_CFG_RSP_TYPE_OP:UInt8 	=	MODE_CFG_TYPE_OP;
//var MODE_CFG_TYPE_SYNC	=	0x5;

var MODE_CFG_RSP_TYPE_ADDR:UInt8 =  FRAME_LEN_ADDR+FRAME_LEN_LEN;
var MODE_CFG_RSP_TYPE_LEN:UInt8 = MODE_CFG_TYPE_LEN;
//sync
var MODE_CFG_RSP_VER_ADDR:UInt8 = MODE_CFG_RSP_TYPE_ADDR + MODE_CFG_RSP_TYPE_LEN;
var MODE_CFG_RSP_VER_LEN:UInt8 = MODE_CFG_VER_LEN;

var MODE_CFG_RSP_NUM_ADDR:UInt8 = MODE_CFG_RSP_VER_ADDR+MODE_CFG_RSP_VER_LEN;
var MODE_CFG_RSP_NUM_LEN:UInt8 = MODE_CFG_NUM_LEN;

var MODE_CFG_RSP_INFO_ADDR:UInt8 = MODE_CFG_RSP_NUM_ADDR+MODE_CFG_RSP_NUM_LEN;
//else
var MODE_CFG_RSP_RES_ADDR:UInt8 = MODE_CFG_RSP_VER_ADDR+MODE_CFG_RSP_VER_LEN;
var MODE_CFG_RSP_RES_LEN:UInt8 = 1;

//HIS
var HIS_INFO_DAY_TYPE_AM:UInt8 = 0;
var HIS_INFO_DAY_TYPE_PM:UInt8 = 1;
var HIS_INFO_DAY_TYPE_ADDR:UInt8 = FRAME_LEN_ADDR+FRAME_LEN_LEN;
var HIS_INFO_DAY_TYPE_LEN:UInt8 = 1;

var HIS_INFO_DATE_TYPE_TODAY:UInt8 = 0;
var HIS_INFO_DATE_TYPE_YDAY:UInt8 = 1;
var HIS_INFO_DATE_TYPE_Y2DAY:UInt8 = 2;
var HIS_INFO_DATE_TYPE_Y7DAY:UInt8 = 3;
var HIS_INFO_DATE_TYPE_YmoreDAY:UInt8 = 4;
var HIS_INFO_DATE_TYPE_ADDR:UInt8 = HIS_INFO_DAY_TYPE_ADDR+HIS_INFO_DAY_TYPE_LEN;
var HIS_INFO_DATE_TYPE_LEN:UInt8 = 2;
//HIS_RSP

var HIS_INFO_RSP_DAY_TYPE_ADDR:UInt8 = FRAME_LEN_ADDR+FRAME_LEN_LEN;
var HIS_INFO_RSP_DAY_TYPE_LEN:UInt8 = 1;

var HIS_INFO_RSP_DATE_TYPE_ADDR:UInt8 = HIS_INFO_RSP_DAY_TYPE_ADDR+HIS_INFO_RSP_DAY_TYPE_LEN;
var HIS_INFO_RSP_DATE_TYPE_LEN:UInt8 = 2;

var HIS_INFO_RSP_INFO_ADDR:UInt8 = HIS_INFO_RSP_DATE_TYPE_ADDR + HIS_INFO_RSP_DATE_TYPE_LEN;
var HIS_INFO_RSP_INFO_FISH_ADDR:UInt8 = HIS_INFO_RSP_DATE_TYPE_ADDR + HIS_INFO_RSP_DATE_TYPE_LEN-1;
var HIS_INFO_RSP_INFO_VALID_LEN:UInt8 = 1;
var HIS_INFO_RSP_INFO_TMP_LEN:UInt8 = 2;
var HIS_INFO_RSP_INFO_WET_LEN:UInt8 = 2;
var HIS_INFO_RSP_INFO_CO2_LEN:UInt8 = 2;
var HIS_INFO_RSP_INFO_OX_LEN:UInt8 = 2;
var HIS_INFO_RSP_INFO_PH_LEN:UInt8 = 2;
var HIS_INFO_RSP_INFO_AM_LEN:UInt8 = 2;
var HIS_INFO_RSP_INFO_LT_LEN:UInt8 = 2;//光照
var HIS_INFO_RSP_INFO_STAT_LEN:UInt8 = 1;

//	SYS_CFG_FRM
var MAX_SYS_VAR_NUM:UInt8 =	16;
var SYS_CFG_TYPE_VAR:UInt8 = 1;
var SYS_CFG_TYPE_ADJ:UInt8 = 2;
var SYS_CFG_TYPE_SYNC:UInt8 = 3;
var SYS_CFG_TYPE_ALARM:UInt8 = 5;

var SYS_CFG_TYPE_ADDR:UInt8 = FRAME_LEN_ADDR+FRAME_LEN_LEN;
var SYS_CFG_TYPE_LEN:UInt8 = 1;
var SYS_CFG_VER_ADDR:UInt8 = SYS_CFG_TYPE_ADDR + SYS_CFG_TYPE_LEN;
var SYS_CFG_VER_LEN:UInt8 = 2;
//var
var SYS_CFG_NUM_ADDR:UInt8 = SYS_CFG_VER_ADDR+SYS_CFG_VER_LEN;
var SYS_CFG_NUM_LEN:UInt8 = 1;
var SYS_CFG_INFO_ADDR = SYS_CFG_NUM_ADDR+SYS_CFG_NUM_LEN;
var SYS_CFG_INFO_TYPE_LEN:UInt8 = 1;
var SYS_CFG_INFO_TYPE_DO_MAX:UInt8 = 1;
var SYS_CFG_INFO_TYPE_DO_MIN:UInt8 = 2;
var SYS_CFG_INFO_TYPE_DO_UP:UInt8 = 3;
var SYS_CFG_INFO_TYPE_SALT:UInt8 = 4;
var SYS_CFG_INFO_TYPE_TMP_AIR_MAX:UInt8 = 9;
var SYS_CFG_INFO_TYPE_TMP_AIR_MIN:UInt8 = 0xa;
var SYS_CFG_INFO_TYPE_WET_AIR_MAX:UInt8 = 0xb;
var SYS_CFG_INFO_TYPE_WET_AIR_MIN:UInt8 = 0xc;
var SYS_CFG_INFO_TYPE_DO_MIN1:UInt8 = 0xF;
var SYS_CFG_INFO_TYPE_DO_MIN2:UInt8 = 0x10;
var SYS_CFG_INFO_TYPE_DO_MIN3:UInt8 = 0x11;
var SYS_CFG_INFO_TYPE_DO_MIN4:UInt8 = 0x12;
var SYS_CFG_INFO_TYPE_WT_TMP_MAX:UInt8 = 0x13;
var SYS_CFG_INFO_TYPE_WT_TMP_MIN:UInt8 = 0x14;
var SYS_CFG_INFO_TYPE_TMP_AIR_MAX1:UInt8 = 0x15;
var SYS_CFG_INFO_TYPE_TMP_AIR_MAX2:UInt8 = 0x16;
var SYS_CFG_INFO_TYPE_TMP_AIR_MAX3:UInt8 = 0x17;
var SYS_CFG_INFO_TYPE_TMP_AIR_MAX4:UInt8 = 0x18;
var SYS_CFG_INFO_TYPE_TMP_AIR_NORM:UInt8 = 0x19;
var SYS_CFG_INFO_TYPE_TMP_SOIL_MAX:UInt8 = 0x1a;
var SYS_CFG_INFO_TYPE_TMP_SOIL_MIN:UInt8 = 0x1b;
var SYS_CFG_INFO_TYPE_WET_SOIL_MAX:UInt8 = 0x1c;
var SYS_CFG_INFO_TYPE_WET_SOIL_MIN:UInt8 = 0x1d;
var SYS_CFG_INFO_DO_LEN:UInt8 = 2;
var SYS_CFG_INFO_SALT_LEN:UInt8 = 2;
var SYS_CFG_INFO_TMP_LEN:UInt8 = 2;
var SYS_CFG_INFO_WET_LEN:UInt8 = 2;
//adj
var SYS_CFG_TYPE_ADJ_TMP:UInt8 = 0xd
var SYS_CFG_TYPE_ADJ_DO:UInt8 = 0xa
var SYS_CFG_ADJ_TYPE_ADDR:UInt8 = SYS_CFG_TYPE_ADDR+SYS_CFG_TYPE_LEN
var SYS_CFG_ADJ_TYPE_LEN:UInt8 = 1
var SYS_CFG_ADJ_TYPE_OX:UInt8 = 0xa
var SYS_CFG_ADJ_TYPE_OX_ZORE:UInt8 = 0xb
var SYS_CFG_ADJ_TYPE_PH_7:UInt8 = 0xc
var SYS_CFG_ADJ_TYPE_PH_SCALE:UInt8 = 0xd
var SYS_CFG_ADJ_TYPE_TMP:UInt8 = 0xe
var SYS_CFG_ADJ_INFO_ADDR:UInt8 = SYS_CFG_ADJ_TYPE_ADDR+SYS_CFG_ADJ_TYPE_LEN
var SYS_CFG_ADJ_INFO_TYPE_LEN:UInt8 = 1
var SYS_CFG_ADJ_INFO_TMP_LEN:UInt8 = 4
//sync
var SYS_CFG_SYNC_LEN:UInt8 = SYS_CFG_VER_ADDR+SYS_CFG_VER_LEN;
//alarm
var SYS_CFG_ALARM_MSG:UInt8 = SYS_CFG_VER_ADDR+SYS_CFG_VER_LEN;
var SYS_CFG_ALARM_MSG_LEN:UInt8 = 2;
var SYS_CFG_ALARM_DIAL:UInt8 = SYS_CFG_ALARM_MSG+SYS_CFG_ALARM_MSG_LEN;
var SYS_CFG_ALARM_DIAL_LEN:UInt8 = 2;
var SYS_CFG_ALARM_LEN:UInt8 = SYS_CFG_ALARM_DIAL+SYS_CFG_ALARM_DIAL_LEN;
//	SYS_CFG_RSP_FRM
var SYS_CFG_RSP_TYPE_VAR:UInt8 = SYS_CFG_TYPE_VAR;
var SYS_CFG_RSP_TYPE_ADJ:UInt8 = SYS_CFG_TYPE_ADJ;
var SYS_CFG_RSP_TYPE_SYNC:UInt8 = SYS_CFG_TYPE_SYNC;
var SYS_CFG_RSP_TYPE_ADDR:UInt8 = FRAME_LEN_ADDR+FRAME_LEN_LEN;
var SYS_CFG_RSP_TYPE_LEN:UInt8 = 1;

var SYS_CFG_RSP_VER_ADDR:UInt8 =	SYS_CFG_RSP_TYPE_ADDR+SYS_CFG_RSP_TYPE_LEN;
var SYS_CFG_RSP_VER_LEN:UInt8 =	2;
//cfg
var SYS_CFG_RSP_RES_ADDR:UInt8 =	SYS_CFG_RSP_VER_ADDR+SYS_CFG_RSP_VER_LEN;
var SYS_CFG_RSP_RES_LEN:UInt8 =	1;

//sync
var SYS_CFG_RSP_NUM_ADDR:UInt8 =	SYS_CFG_RSP_VER_ADDR+SYS_CFG_RSP_VER_LEN;
var SYS_CFG_RSP_NUM_LEN:UInt8 =	1;
var SYS_CFG_RSP_INFO_ADDR:UInt8 = SYS_CFG_RSP_NUM_ADDR+SYS_CFG_RSP_NUM_LEN;
//adj
var SYS_CFG_RSP_TYPE_ADJ_ADDR:UInt8 = SYS_CFG_RSP_TYPE_ADDR+SYS_CFG_RSP_TYPE_LEN;
var SYS_CFG_RSP_TYPE_ADJ_LEN:UInt8 =	1;
//date
var year1:UInt16 =  0
var month1:UInt16 = 0
var day1:UInt16 = 0


public class user_info_c
{
    var user_name:String?
    var user_pwd:String?
}
var user_info = user_info_c()

public class frame_head_info_c
{
    var dev_id = [UInt8](count: Int(DEV_ID_LEN), repeatedValue: 0)
    
    var  manu_id:UInt8?
    var dev_type:UInt8 = DEV_TYPE_TERM
    var	frame_type:UInt8?
}
var frame_head_info = frame_head_info_c()


class log_rsp
{
    var result:Int?
    var type:UInt8?
    var city_code:UInt?
    var dev_num:UInt8?
    
}
var log_rsp_data = log_rsp();

var HIS_INFO_TYPE_FISH:UInt8 = 0;
var HIS_INFO_TYPE_DAY:UInt8 = 1;
var HIS_INFO_TYPE_TIME:UInt8 = 2;
var HIS_INFO_TYPE_REAL:UInt8 = 3;
var HIS_INFO_TYPE_HOUR:UInt8 = 4;


class his_info_c
{
    var his_type:UInt8 = HIS_INFO_TYPE_TIME
}


var his_info = his_info_c()

class mode_cfg_c
{
    var delay_index:UInt16 = 0
    var manu_stat:UInt8 = 0
    var manu_mode:UInt8 = 0
    var manu_stat_flag:UInt8 = 0
    var op_flag:UInt8 = 0
}

var mode_cfg_info = mode_cfg_c()

var USER_TYPE_NORMAL:UInt8 = 1;
var USER_TYPE_MNG:UInt8 = 2;
var USER_TYPE_SUPER:UInt8 = 3;

public class user_grp_c
{
	var weather = "未知";
    var day_weather:Int = 0;
    var night_weather:Int = 0;
	var tmp="未知";
	var day_tmp:Int?
	var night_tmp:Int?
	var city_name="未知";
	var hour_zone:Int?;
	var city_code="101010100";//peking
	var exit_login_flag:Int = 0;
    
	var user_type:UInt8 = USER_TYPE_NORMAL;
    var created:Bool = false;

	
	 //static public int[] td_weather = new int[8];
	// static public int[] tm_weather = new int[8];
	// static public int[] at_weather = new int[8];
    var data:String?;
	 //static public boolean pIntent_flag = true;
	 //static public String pIntent_title;
}
var user_grp = user_grp_c()

var dev_info_rsp:[dev_info_struct] = [dev_info_struct]()


var send_buf = [UInt8](count: 1024, repeatedValue: 0)

func copy_byte2int(buf_info buf:[UInt8],  buf_addr:Int)->UInt
{
    
    let a:UInt = UInt(buf[buf_addr])<<24
    let b:UInt = UInt(buf[buf_addr+1])<<16
    let c:UInt = UInt(buf[buf_addr+2])<<8
    let d:UInt = UInt(buf[buf_addr+3])
    // b = (int)buf[buf_addr+1]&0xff;
    let data:UInt = (a|b|c|d);
    return data
}

func copy_byte2short(buf_info buf:[UInt8],  buf_addr:Int)->UInt16
{
    
    let a:UInt16 = UInt16(buf[buf_addr])<<8
    let b:UInt16 = UInt16(buf[buf_addr+1])
   // a = (a&0xff)<<8;
   // b = (int)buf[buf_addr+1]&0xff;
    let data:UInt16 = (a|b);
    return data;
}

func copy_int2byte(inout buf_info buf:[UInt8], start buf_addr:Int, data_i data:UInt)
{
    buf[buf_addr] = UInt8((data>>24)&0xff);
    buf[buf_addr+1] = UInt8((data>>16)&0xff);
    buf[buf_addr+2] = UInt8((data>>8)&0xff);
    buf[buf_addr+3] = UInt8(data&0xff);
}

func copy_short2byte(inout buf_info buf:[UInt8], start buf_addr:Int, data_s data:UInt16)
{
    buf[buf_addr] = UInt8((data>>8)&0xff);
    buf[buf_addr+1] = UInt8(data&0xff);

}


func  GetCheckCode(buf_info buf:[UInt8], frame_len len:Int)->UInt16
{
    
    var wCrc:UInt16  = 0xFFFF;
    
    for i in 0 ..< len
    {
        wCrc ^= (UInt16(buf[i]) & 0xff)
        for j in 0..<8
        {
            if ((wCrc & 1)==1)
            {
                wCrc = wCrc >> 1;
                wCrc ^= 0xA001;
            }
            else
            {
                wCrc = wCrc >> 1;
            }
        }
    }
    return wCrc;
}

func CheckCode(buf_info buf:[UInt8], frame_len len:Int)->Bool
{

    var wCrc:UInt16 = 0xFFFF
   
    for i in 0..<(len-2)
    {
        wCrc ^= (UInt16(buf[i]) & 0xff)
        for j in 0..<8
        {
            if ((wCrc & 1)==1)
            {
                wCrc = wCrc >> 1
                wCrc ^= 0xA001;
            }
            else
            {
                wCrc = wCrc >> 1
            }
        }
    }
    var ori_crc:UInt16 = copy_byte2short(buf_info:buf, buf_addr:len-2);
    return (wCrc==ori_crc);
}

func copy_array_cc(inout dst_in dst:[UInt8],src_in  src:[Int8], dst_start dst_start_addr:Int,  src_start src_start_addr:Int, arr_len len:Int)
{
    
    for i in 0..<len
    {
        dst[dst_start_addr+i] = UInt8(src[src_start_addr+i])
    }
}

func copy_array(inout dst_in dst:[UInt8],src_in  src:[UInt8], dst_start dst_start_addr:Int,  src_start src_start_addr:Int, arr_len len:Int)
{
    
    for i in 0..<len
    {
        dst[dst_start_addr+i] = src[src_start_addr+i]
    }
}
func array_equal(dst dst:[UInt8], src src_b:[UInt8], frame_len len:Int)->Bool
{
    for i in 0..<len
    {
        if(dst[i] != src_b[i])
        {
            return false
        }
    }
    return true
}

func get_32bit_to_rtc(sys_date date:sys_date_c, smp_time_in smp_time:UInt)
{
    date.year = ((smp_time >> 26) & 0x3f) + 2010;
    date.mon = (smp_time >> 22) & 0xf;
    date.day = (smp_time >> 17) & 0x1f;
    date.hour = (smp_time >> 12) & 0x1f;
    date.min = (smp_time >> 6) & 0x3f;
    date.sec = smp_time  & 0x3f;

}

func frame_analysis(buf_info buf:[UInt8], frame_len rsp_len:Int)->Int
{
    var addr:Int = 0;
    var len:Int = 0;
    if(CheckCode(buf_info:buf, frame_len: rsp_len) == false)
    {
        return -1;
    }
    
    if((buf[9] == 0x1))
    {
        switch (buf[10]) {
        case USER_LOG_RSP_FRM:
            
            log_rsp_data.result = Int(buf[Int(USER_LOG_RSP_RES_ADDR)]);
            log_rsp_data.type = buf[Int(USER_LOG_RSP_TYPE_ADDR)];
            
            if (log_rsp_data.type == USER_LOG_RSP_TYPE_LOG) || (log_rsp_data.type == USER_LOG_RSP_TYPE_REG)
            {
             
            }
            else
            {
            }
            
            if(log_rsp_data.result != 0)
            {
                return log_rsp_data.result!;
            }
            
            if (buf[Int(USER_LOG_RSP_TYPE_ADDR)] == USER_LOG_RSP_TYPE_LOG)
            {
                addr = Int(USER_LOG_RSP_ID_TYPE_ADDR)
                for i in 0..<buf[Int(USER_LOG_RSP_NUM_ADDR)]
                {
                    dev_info_rsp.append(dev_info_struct())
                                   
                    dev_info_rsp[Int(i)].dev_type = buf[addr];
                    addr += Int(USER_LOG_RSP_ID_TYPE_LEN)
                    copy_array(dst_in: &dev_info_rsp[Int(i)].dev_id, src_in:buf, dst_start:0, src_start:addr, arr_len:Int(USER_LOG_RSP_ID_LEN))
                    addr += Int(USER_LOG_RSP_ID_LEN)
                    copy_array(dst_in: &dev_info_rsp[Int(i)].dev_name, src_in:buf, dst_start:0, src_start:addr ,arr_len:Int(USER_LOG_RSP_DEV_NAME_LEN))
                    addr += Int(USER_LOG_RSP_DEV_NAME_LEN)
                    dev_info_rsp[Int(i)].manu_id=buf[addr]
                    addr += Int(USER_LOG_RSP_MANU_ID_LEN)
                    dev_info_rsp[Int(i)].sys_ver = copy_byte2short(buf_info:buf, buf_addr:addr);
                    addr += Int(USER_LOG_RSP_SYS_VER_LEN)
                    dev_info_rsp[Int(i)].mode_ver = copy_byte2short(buf_info:buf, buf_addr:addr);
                    addr += Int(USER_LOG_RSP_MODE_VER_LEN)
                    
                    var dev_num_stat:Int = 0
                    /*
                    for j in 0..<dev_grp.dev_login_num
                    {
                       if(array_equal(dst:dev_info_rsp[Int(i)].dev_id, src:dev_grp.dev_info[Int(j)].dev_id, frame_len:  Int(DEV_ID_LEN)) == true)
                        {
                            //(log_rsp_data.dev_info[i].sys_ver!=(short)0xffff)&&
                            if(dev_info_rsp[Int(i)].sys_ver != dev_grp.dev_info[j].sys_ver)
                            {
                                if(dev_info_rsp[Int(i)].dev_type != DEV_TYPE_FISH_ONLY_CTRL)
                                {
                                    dev_info_rsp[Int(i)].flag |= dev_grp.DEV_MODE_CFG_SYNC_SYS_FLAG;
                                    //sync
                                    dev_info_rsp[Int(i)].sys_ver = dev_grp.dev_info[j].sys_ver;
                                }
                            }
                            else
                            {
                                dev_info_rsp[Int(i)].flag &= ~dev_grp.DEV_MODE_CFG_SYNC_SYS_FLAG;
                            }
                            //(log_rsp_data.dev_info[i].mode_ver!=(short)0xffff)&&
                            if((dev_info_rsp[Int(i)].mode_ver != dev_grp.dev_info[j].mode_ver))
                            {
                                dev_info_rsp[Int(i)].flag |= dev_grp.DEV_MODE_CFG_SYNC_MODE_FLAG;
                                dev_info_rsp[Int(i)].mode_ver = dev_grp.dev_info[j].mode_ver;
                                //sync
                            }
                            else
                            {
                                dev_info_rsp[Int(i)].flag &= ~dev_grp.DEV_MODE_CFG_SYNC_MODE_FLAG;
                            }
                            //log_rsp_data.dev_info[i].mode_ver = comm_frame.dev.dev_info[j].mode_ver;
                            
                            break;
                        }
                        dev_num_stat+=1
                    }*/
                
                    if(dev_num_stat == dev_grp.dev_login_num)//no this dev, init to 0xffff
                    {
                        if(dev_info_rsp[Int(i)].sys_ver != 0xffff)
                        {
                            dev_info_rsp[Int(i)].flag |= dev_grp.DEV_MODE_CFG_SYNC_SYS_FLAG;
                            dev_info_rsp[Int(i)].sys_ver = 0xffff;
                            //sync
                        }
                        
                        if(dev_info_rsp[Int(i)].mode_ver != 0xffff)
                        {
                            dev_info_rsp[Int(i)].flag |= dev_grp.DEV_MODE_CFG_SYNC_MODE_FLAG;
                            dev_info_rsp[Int(i)].mode_ver = 0xffff;
                            //sync
                        }
                        
                    }
                    
                }
                dev_grp.dev_login_num = Int(buf[Int(USER_LOG_RSP_NUM_ADDR)])
                len = Int(Int(USER_LOG_RSP_ID_TYPE_ADDR) + Int(USER_LOG_RSP_ID_TOL_LEN) * Int(dev_grp.dev_login_num))
                user_grp.user_type =  buf[len]
                len += Int(USER_LOG_RSP_USER_TYPE_LEN)
                if(dev_grp.dev_info.count < dev_info_rsp.count)
                {
                    for i in dev_grp.dev_info.count..<dev_info_rsp.count
                    {
                        dev_grp.dev_info.append(dev_info_struct())
                    }
                }
                
                for i in 0..<dev_grp.dev_login_num
                {
                    dev_grp.dev_info[i].dev_type = dev_info_rsp[i].dev_type;
                    copy_array(dst_in: &dev_grp.dev_info[i].dev_id, src_in:dev_info_rsp[i].dev_id, dst_start:0, src_start:0, arr_len:Int(USER_LOG_RSP_ID_LEN))
                  
                    copy_array(dst_in: &dev_grp.dev_info[i].dev_name, src_in:dev_info_rsp[i].dev_name, dst_start:0, src_start:0, arr_len:Int(USER_LOG_RSP_DEV_NAME_LEN))
                    dev_grp.dev_info[i].manu_id = dev_info_rsp[i].manu_id;
                    dev_grp.dev_info[i].mode_ver = dev_info_rsp[i].mode_ver; //not use sync
                    dev_grp.dev_info[i].sys_ver = dev_info_rsp[i].sys_ver; //not use sync
                    var flag:UInt8 = dev_grp.dev_info[i].flag & dev_grp.DEV_ONLINE_FLAG
                    dev_grp.dev_info[i].flag = dev_info_rsp[i].flag;
                    
                    dev_grp.dev_info[i].flag |= flag;
                    dev_grp.dev_info[i].msg_alarm=copy_byte2short(buf_info:buf, buf_addr:len);
                    len += Int(USER_LOG_RSP_MSG_ALARM_LEN);
                    dev_grp.dev_info[i].dial_alarm=copy_byte2short(buf_info:buf, buf_addr:len);
                    len += Int(USER_LOG_RSP_DIAL_ALARM_LEN);
                }
                
            }
            if (buf[Int(USER_LOG_RSP_TYPE_ADDR)] == USER_LOG_RSP_TYPE_REG)
            {
                
            }
        case REAL_DATA_RSP_FRM:
            copy_array(dst_in: &frame_head_info.dev_id, src_in:send_buf, dst_start:0, src_start:0, arr_len:Int(DEV_ID_LEN))
            // int dev_index = 0;
           // byte[] dev_id = new byte[DEV_ID_LEN];
           // System.arraycopy(buf, DEV_ID_ADDR, dev_id, 0, DEV_ID_LEN);
            
            var dev_index:Int = 0
            for i in 0..<dev_grp.dev_login_num
            {
                if(array_equal(dst:frame_head_info.dev_id, src:dev_grp.dev_info[Int(i)].dev_id, frame_len:  Int(DEV_ID_LEN)) == true)

                {
                    //real_data_rsp_data.sys_ver = comm_frame.dev.dev_info[i].sys_ver;
                    dev_index = i;
                    dev_grp.dev_info[dev_index].real_data_rsp_info.dev_index = UInt(i)
                    dev_grp.dev_info[dev_index].req_flag = 0x1;
                    dev_grp.dev_info[dev_index].real_data_rsp_info.sys_ver = copy_byte2short(buf_info:buf, buf_addr:Int(REAL_DATA_SYS_VER_RSP_ADDR));
                    dev_grp.dev_info[dev_index].real_data_rsp_info.mode_ver = copy_byte2short(buf_info:buf, buf_addr:Int(REAL_DATA_MODE_VER_RSP_ADDR));
                    
                    if((dev_grp.dev_info[dev_index].real_data_rsp_info.mode_ver != dev_grp.dev_info[Int(i)].mode_ver))
                    {
                        dev_grp.dev_info[dev_index].real_data_rsp_info.flag  |= dev_grp.DEV_MODE_CFG_SYNC_MODE_FLAG
                        dev_grp.dev_info[dev_index].real_data_rsp_info.mode_ver = dev_grp.dev_info[i].mode_ver
                       // FullIntent.mode_sync_dev_index = i;
                        //sync
                    }
                    else
                    {
                        dev_grp.dev_info[dev_index].real_data_rsp_info.flag &= ~dev_grp.DEV_MODE_CFG_SYNC_MODE_FLAG;
                    }
                    
                  if((dev_grp.dev_info[dev_index].real_data_rsp_info.sys_ver != dev_grp.dev_info[i].sys_ver))
                    {
                        if(dev_grp.dev_info[dev_index].dev_type != DEV_TYPE_FISH_ONLY_CTRL)
                        {
                            dev_grp.dev_info[dev_index].real_data_rsp_info.flag |= dev_grp.DEV_MODE_CFG_SYNC_SYS_FLAG;
                            dev_grp.dev_info[dev_index].real_data_rsp_info.sys_ver = dev_grp.dev_info[i].sys_ver;
                           // FullIntent.sys_sync_dev_index = i;
                        }
                        //sync
                    }
                    else
                    {
                        dev_grp.dev_info[dev_index].real_data_rsp_info.flag &= ~dev_grp.DEV_MODE_CFG_SYNC_SYS_FLAG;
                    }
                    break
                    
                }
            }
            dev_grp.dev_info[dev_index].manu_id = buf[Int(MANU_ID_ADDR)]&0xf
            
            
            //14725836914
            addr = Int(REAL_DATA_VAR_RSP_ADDR)
            dev_grp.dev_info[dev_index].sys_var.var_num = copy_byte2short(buf_info:buf, buf_addr:Int(REAL_DATA_NUM_RSP_ADDR))
            
            dev_grp.dev_info[dev_index].smp_time = copy_byte2int(buf_info:buf, buf_addr:Int(REAL_DATA_RSP_TIME_ADDR))
            get_32bit_to_rtc(sys_date:dev_grp.dev_info[dev_index].sys_date, smp_time_in: dev_grp.dev_info[dev_index].smp_time!)
            //Log.e(""+dev_index, ""+i);
           
             
           /*
             comm_frame.dev.dev_info[dev_index].cur_time = System.currentTimeMillis();
            comm_frame.dev.dev_info[dev_index].dev_cur_time = System.currentTimeMillis();
            //Log.e("comm_frame","comm_frame dev_cur_time"+comm_frame.dev.dev_info[dev_index].dev_cur_time);
            //Log.e("comm_frame","comm_frame  cur_time_long  !!!!!!! "+(Math.abs(System.currentTimeMillis()-comm_frame.dev.dev_info[dev_index].dev_cur_time)/1000));
            //Log.e("comm_frame","comm_frame last_time_long  !!!!!!! "+(Math.abs(System.currentTimeMillis()-comm_frame.dev.dev_info[dev_index].last_time)/1000));
            comm_frame.dev.dev_info[dev_index].last_time = get_last_time(dev_index);
            //Log.e("comm_frame","comm_frame last_time"+comm_frame.dev.dev_info[dev_index].last_time);
            comm_frame.dev.dev_info[dev_index].cal_num = 0;
            comm_frame.dev.dev_info[dev_index].send_num = 0;
            if(((Math.abs(comm_frame.dev.dev_info[dev_index].cur_time-comm_frame.dev.dev_info[dev_index].last_time)/1000)>(720))
                &&(comm_frame.dev.dev_info[dev_index].last_time != -1))
            {
                comm_frame.dev.dev_info[dev_index].last_time = comm_frame.dev.dev_info[dev_index].last_time;
                //Log.e("comm_frame","comm_frame last_time  ~~~~~~if~~~~~`` "+comm_frame.dev.dev_info[dev_index].last_time);
            }
           */
            for i in 0..<dev_grp.dev_info[dev_index].sys_var.var_num
            {
                switch (buf[addr])
                {
                case REAL_DATA_TYPE_WTMP:
                    dev_grp.dev_info[dev_index].sys_var.var_type[Int(i)] = REAL_DATA_TYPE_WTMP;
                    addr += 1 //
                    dev_grp.dev_info[dev_index].sys_var.water_tmp = Int(copy_byte2int(buf_info:buf, buf_addr:addr))
                   /* int index = comm_frame.dev.dev_info[dev_index].var.cur_wtmp_index;
                    comm_frame.dev.dev_info[dev_index].var.water_tmp_array[index] = comm_frame.dev.dev_info[dev_index].var.water_tmp;
                    comm_frame.dev.dev_info[dev_index].var.cur_wtmp_index++;
                    if(comm_frame.dev.dev_info[dev_index].var.cur_wtmp_index >= dev.DEV_VAR_ARRAY_LEN)
                    {
                        comm_frame.dev.dev_info[dev_index].var.cur_wtmp_index = 0;
                    }*/
                    addr += Int(REAL_DATA_TYPE_WTMP_LEN)
                    
                case REAL_DATA_TYPE_DO:
                    dev_grp.dev_info[dev_index].sys_var.var_type[Int(i)] = REAL_DATA_TYPE_DO;
                    addr += 1 //
                    dev_grp.dev_info[dev_index].sys_var.oxygen = Int(copy_byte2int(buf_info:buf, buf_addr:addr));
                    addr += Int(REAL_DATA_TYPE_DO_LEN)
                    
                case REAL_DATA_TYPE_ATMP:
                    dev_grp.dev_info[dev_index].sys_var.var_type[Int(i)] = REAL_DATA_TYPE_ATMP;
                    addr += 1 //
                    dev_grp.dev_info[dev_index].sys_var.air_tmp = Int(copy_byte2int(buf_info:buf, buf_addr:addr));
                    addr += Int(REAL_DATA_TYPE_ATMP_LEN)
                    
                case REAL_DATA_TYPE_STAT:
                    dev_grp.dev_info[dev_index].sys_var.var_type[Int(i)] = REAL_DATA_TYPE_STAT;
                    addr += 1 //
                    dev_grp.dev_info[dev_index].sys_var.motor_stat = buf[addr];
                    addr += Int(REAL_DATA_TYPE_STAT_LEN)
                    
                case REAL_DATA_TYPE_AWET:
                    dev_grp.dev_info[dev_index].sys_var.var_type[Int(i)] = REAL_DATA_TYPE_AWET;
                    addr += 1 //
                    dev_grp.dev_info[dev_index].sys_var.air_wet = Int(copy_byte2int(buf_info:buf, buf_addr:addr));
                    addr += Int(REAL_DATA_TYPE_AWET_LEN)
                   
                case REAL_DATA_TYPE_SWET:
                    dev_grp.dev_info[dev_index].sys_var.var_type[Int(i)] = REAL_DATA_TYPE_SWET;
                    addr += 1 //
                    dev_grp.dev_info[dev_index].sys_var.soil_wet = Int(copy_byte2short(buf_info:buf, buf_addr:addr))
                    addr += Int(REAL_DATA_TYPE_SWET_LEN)
                    
                case REAL_DATA_TYPE_STMP:
                    dev_grp.dev_info[dev_index].sys_var.var_type[Int(i)] = REAL_DATA_TYPE_STMP;
                    addr += 1 //
                    dev_grp.dev_info[dev_index].sys_var.soil_tmp = Int(copy_byte2short(buf_info:buf, buf_addr:addr))
                    addr += Int(REAL_DATA_TYPE_STMP_LEN)
                    
                case REAL_DATA_TYPE_CO2:
                    dev_grp.dev_info[dev_index].sys_var.var_type[Int(i)] = REAL_DATA_TYPE_CO2;
                    addr += 1 //
                    dev_grp.dev_info[dev_index].sys_var.co2 = Int(copy_byte2short(buf_info:buf, buf_addr:addr))
                    addr += Int(REAL_DATA_TYPE_STMP_LEN)
                   
                case REAL_DATA_TYPE_STAT_FLAG:
                    dev_grp.dev_info[dev_index].sys_var.var_type[Int(i)] = REAL_DATA_TYPE_STAT_FLAG;
                    addr += 1 //
                    dev_grp.dev_info[dev_index].sys_var.motor_stat_flag = buf[addr];
                    addr += Int(REAL_DATA_TYPE_STAT_FLAG_LEN)
                    
                case REAL_DATA_TYPE_PH:
                    dev_grp.dev_info[dev_index].sys_var.var_type[Int(i)] = REAL_DATA_TYPE_PH;
                    addr += 1 //
                    dev_grp.dev_info[dev_index].sys_var.water_ph = Int(copy_byte2short(buf_info:buf, buf_addr:addr))
                    addr += Int(REAL_DATA_TYPE_PH_LEN)
                   
                    /*		case REAL_DATA_TYPE_FALSE:
                     addr += 1
                     break;*/
                case REAL_DATA_TYPE_ROLL_STAT:
                    dev_grp.dev_info[dev_index].sys_var.var_type[Int(i)] = REAL_DATA_TYPE_ROLL_STAT;
                    addr += 1 //
                    dev_grp.dev_info[dev_index].sys_var.roll_stat = copy_byte2short(buf_info:buf, buf_addr:addr)
                    addr += Int(REAL_DATA_TYPE_ROLL_STAT_LEN)
                    
                case REAL_DATA_TYPE_OP_FLAG:
                    dev_grp.dev_info[dev_index].sys_var.var_type[Int(i)] = REAL_DATA_TYPE_OP_FLAG;
                    addr += 1 //
                    dev_grp.dev_info[dev_index].sys_var.op_flag = buf[addr];
                    addr += Int(REAL_DATA_TYPE_OP_FLAG_LEN)
                    
                default:
                    var i = 1
                    //接收参数
                }
            }
        case MODE_CFG_RSP_FRM:
            var child_type = buf[Int(MODE_CFG_RSP_TYPE_ADDR)];
            
            
            var dev_index_cur:Int = 0
            copy_array(dst_in: &frame_head_info.dev_id, src_in:send_buf, dst_start:0, src_start:0, arr_len:Int(DEV_ID_LEN))
            
            for i in 0..<dev_grp.dev_login_num
            {
                if(array_equal(dst:frame_head_info.dev_id, src:dev_grp.dev_info[Int(i)].dev_id, frame_len:  Int(DEV_ID_LEN)) == true)
                {
                    //comm_frame.dev.dev_info[i].mode_ver = time_cfg_rsp_data.mode_ver;
                    dev_index_cur = i
                    break
                }
            }
            var res = 0;
            if(child_type == MODE_CFG_RSP_TYPE_CTRL)
            {
                
                
                res = Int(buf[Int(MODE_CFG_RSP_RES_ADDR)])
                
            }
            else if(MODE_CFG_RSP_TYPE_EXIT == child_type)
            {
                
                res = Int(buf[Int(MODE_CFG_RSP_RES_ADDR)])
                
            }
            if(res != 0)
            {
                return res
            }
        case HIS_INFO_RSP_FRM:
            
            var dev_index_cur:Int = 0
            copy_array(dst_in: &frame_head_info.dev_id, src_in:send_buf, dst_start:0, src_start:0, arr_len:Int(DEV_ID_LEN))
            
            for i in 0..<dev_grp.dev_login_num
            {
                if(array_equal(dst:frame_head_info.dev_id, src:dev_grp.dev_info[Int(i)].dev_id, frame_len:  Int(DEV_ID_LEN)) == true)
                {
                    //comm_frame.dev.dev_info[i].mode_ver = time_cfg_rsp_data.mode_ver;
                    dev_index_cur = i
                    break
                }
            }
            

            var his_type:UInt8 =  buf[Int(HIS_INFO_RSP_DAY_TYPE_ADDR)]
            if(his_type == HIS_INFO_TYPE_TIME)
            {
                
                len = Int(HIS_INFO_RSP_INFO_FISH_ADDR)
                for i in 0..<HIS_INFO_HOUR_NUM
                {
                    dev_grp.dev_info[dev_index_cur].his_info_item.append(his_info_item_class())
                    dev_grp.dev_info[dev_index_cur].his_info_item[i].valid = buf[len];
                    if (dev_grp.dev_info[dev_index_cur].his_info_item[i].valid == 1) {
                        dev_grp.dev_info[dev_index_cur].his_data_num += 1
                    }
                    len += Int(HIS_INFO_RSP_INFO_VALID_LEN)
                    if((dev_grp.dev_info[dev_index_cur].dev_type != DEV_TYPE_BARN)&&(dev_grp.dev_info[dev_index_cur].dev_type != DEV_TYPE_BARN_TMP)&&(dev_grp.dev_info[dev_index_cur].dev_type != DEV_TYPE_BARN_CO2))
                    {
                        dev_grp.dev_info[dev_index_cur].his_info_item[i].tmp = copy_byte2short(buf_info:buf, buf_addr:len)
                        len += Int(HIS_INFO_RSP_INFO_TMP_LEN)
                        dev_grp.dev_info[dev_index_cur].his_info_item[i].ox = copy_byte2short(buf_info:buf, buf_addr:len)
                        len += Int(HIS_INFO_RSP_INFO_OX_LEN)
                        if(dev_grp.dev_info[dev_index_cur].dev_type == DEV_TYPE_FISH_PH)
                        {
                            dev_grp.dev_info[dev_index_cur].his_info_item[i].ph = copy_byte2short(buf_info:buf, buf_addr:len)
                            len += Int(HIS_INFO_RSP_INFO_PH_LEN)
                            dev_grp.dev_info[dev_index_cur].his_info_item[i].am = copy_byte2short(buf_info:buf, buf_addr:len)
                            len += Int(HIS_INFO_RSP_INFO_AM_LEN)
                        }
                    }
                    else if(dev_grp.dev_info[dev_index_cur].dev_type == DEV_TYPE_BARN_CO2)
                    {
                        dev_grp.dev_info[dev_index_cur].his_info_item[i].tmp_air  = copy_byte2short(buf_info:buf, buf_addr:len)
                        len += Int(HIS_INFO_RSP_INFO_TMP_LEN)
                        dev_grp.dev_info[dev_index_cur].his_info_item[i].wet_air  = copy_byte2short(buf_info:buf, buf_addr:len)
                        len += Int(HIS_INFO_RSP_INFO_WET_LEN)
                        dev_grp.dev_info[dev_index_cur].his_info_item[i].soil_tmp  = copy_byte2short(buf_info:buf, buf_addr:len)
                        len += Int(HIS_INFO_RSP_INFO_TMP_LEN)
                        dev_grp.dev_info[dev_index_cur].his_info_item[i].soil_wet  = copy_byte2short(buf_info:buf, buf_addr:len)
                        len += Int(HIS_INFO_RSP_INFO_WET_LEN)
                        dev_grp.dev_info[dev_index_cur].his_info_item[i].co2  = copy_byte2short(buf_info:buf, buf_addr:len)
                        len += Int(HIS_INFO_RSP_INFO_CO2_LEN)
                        dev_grp.dev_info[dev_index_cur].his_info_item[i].lt  = copy_byte2short(buf_info:buf, buf_addr:len)
                        len += Int(HIS_INFO_RSP_INFO_LT_LEN)
                    }
                    else
                    {
                        dev_grp.dev_info[dev_index_cur].his_info_item[i].tmp_air  = copy_byte2short(buf_info:buf, buf_addr:len)
                        len += Int(HIS_INFO_RSP_INFO_TMP_LEN)
                        dev_grp.dev_info[dev_index_cur].his_info_item[i].wet_air  = copy_byte2short(buf_info:buf, buf_addr:len)
                        len += Int(HIS_INFO_RSP_INFO_WET_LEN)
                    }
                    dev_grp.dev_info[dev_index_cur].his_info_item[i].stat = buf[len];
                    len += Int(HIS_INFO_RSP_INFO_STAT_LEN)
                }
                
            }
        default:
            return -2
        }
    }
    return 0
}


func get_sys_info(inout buf_info buf:[UInt8], start start_len:Int,dev_idx dev_index:Int)->UInt16
{
    var len = start_len
    buf[Int(SYS_CFG_NUM_ADDR)] = dev_grp.dev_info[dev_index].sys_cfg_var.sys_var_num
    
    
    for i in 0..<buf[Int(SYS_CFG_NUM_ADDR)]
    {
        switch(dev_grp.dev_info[dev_index].sys_cfg_var.sys_var_type[Int(i)])
        {
        case SYS_CFG_INFO_TYPE_DO_MAX:
            buf[len] = SYS_CFG_INFO_TYPE_DO_MAX
            len +=  Int(SYS_CFG_INFO_TYPE_LEN)
            copy_short2byte(buf_info: &buf, start:len, data_s:dev_grp.dev_info[dev_index].sys_cfg_var.do_max)
            len += Int(SYS_CFG_INFO_DO_LEN)
            break;
        case SYS_CFG_INFO_TYPE_DO_MIN:
            buf[len] = SYS_CFG_INFO_TYPE_DO_MIN;
            len +=  Int(SYS_CFG_INFO_TYPE_LEN)
            copy_short2byte(buf_info: &buf, start:len, data_s:dev_grp.dev_info[dev_index].sys_cfg_var.do_min);
            len += Int(SYS_CFG_INFO_DO_LEN)
            break;
        case SYS_CFG_INFO_TYPE_DO_UP:
            buf[len] = SYS_CFG_INFO_TYPE_DO_UP;
            len +=  Int(SYS_CFG_INFO_TYPE_LEN)
            copy_short2byte(buf_info: &buf, start:len, data_s:dev_grp.dev_info[dev_index].sys_cfg_var.do_up);
            len += Int(SYS_CFG_INFO_DO_LEN )
            break;
        case SYS_CFG_INFO_TYPE_SALT:
            buf[len] = SYS_CFG_INFO_TYPE_SALT;
            len +=  Int(SYS_CFG_INFO_TYPE_LEN)
            copy_short2byte(buf_info: &buf, start:len, data_s:dev_grp.dev_info[dev_index].sys_cfg_var.salt_cfg);
            len += Int(SYS_CFG_INFO_SALT_LEN)
            break;
        case SYS_CFG_INFO_TYPE_TMP_AIR_MAX:
            buf[len] = SYS_CFG_INFO_TYPE_TMP_AIR_MAX;
            len +=  Int(SYS_CFG_INFO_TYPE_LEN)
            copy_short2byte(buf_info: &buf, start:len, data_s:dev_grp.dev_info[dev_index].sys_cfg_var.tmp_air_max);
            len += Int(SYS_CFG_INFO_TMP_LEN)
            break;
        case SYS_CFG_INFO_TYPE_TMP_AIR_MIN:
            buf[len] = SYS_CFG_INFO_TYPE_TMP_AIR_MIN;
            len +=  Int(SYS_CFG_INFO_TYPE_LEN)
            copy_short2byte(buf_info: &buf, start:len, data_s:dev_grp.dev_info[dev_index].sys_cfg_var.tmp_air_min);
            len += Int(SYS_CFG_INFO_TMP_LEN)
            break;
        case SYS_CFG_INFO_TYPE_WET_AIR_MAX:
            buf[len] = SYS_CFG_INFO_TYPE_WET_AIR_MAX;
            len +=  Int(SYS_CFG_INFO_TYPE_LEN)
            copy_short2byte(buf_info: &buf, start:len, data_s:dev_grp.dev_info[dev_index].sys_cfg_var.wet_air_max);
            len += Int(SYS_CFG_INFO_WET_LEN)
            break;
        case SYS_CFG_INFO_TYPE_WET_AIR_MIN:
            buf[len] = SYS_CFG_INFO_TYPE_WET_AIR_MIN;
            len +=  Int(SYS_CFG_INFO_TYPE_LEN)
            copy_short2byte(buf_info: &buf, start:len, data_s:dev_grp.dev_info[dev_index].sys_cfg_var.wet_air_min);
            len += Int(SYS_CFG_INFO_WET_LEN)
            break;
        case SYS_CFG_INFO_TYPE_DO_MIN1:
            buf[len] = SYS_CFG_INFO_TYPE_DO_MIN1;
            len +=  Int(SYS_CFG_INFO_TYPE_LEN)
            copy_short2byte(buf_info: &buf, start:len, data_s:dev_grp.dev_info[dev_index].sys_cfg_var.do_min1);
            len += Int(SYS_CFG_INFO_DO_LEN)
            break;
        case SYS_CFG_INFO_TYPE_DO_MIN2:
            buf[len] = SYS_CFG_INFO_TYPE_DO_MIN2;
            len +=  Int(SYS_CFG_INFO_TYPE_LEN)
            copy_short2byte(buf_info: &buf, start:len, data_s:dev_grp.dev_info[dev_index].sys_cfg_var.do_min2);
            len += Int(SYS_CFG_INFO_DO_LEN)
            break;
        case SYS_CFG_INFO_TYPE_DO_MIN3:
            buf[len] = SYS_CFG_INFO_TYPE_DO_MIN3;
            len +=  Int(SYS_CFG_INFO_TYPE_LEN)
            copy_short2byte(buf_info: &buf, start:len, data_s:dev_grp.dev_info[dev_index].sys_cfg_var.do_min3);
            len += Int(SYS_CFG_INFO_DO_LEN)
            break;
        case SYS_CFG_INFO_TYPE_DO_MIN4:
            buf[len] = SYS_CFG_INFO_TYPE_DO_MIN4;
            len +=  Int(SYS_CFG_INFO_TYPE_LEN)
            copy_short2byte(buf_info: &buf, start:len, data_s:dev_grp.dev_info[dev_index].sys_cfg_var.do_min4);
            len += Int(SYS_CFG_INFO_DO_LEN)
            break;
        case SYS_CFG_INFO_TYPE_WT_TMP_MIN:
            buf[len] = SYS_CFG_INFO_TYPE_WT_TMP_MIN;
            len +=  Int(SYS_CFG_INFO_TYPE_LEN)
            copy_short2byte(buf_info: &buf, start:len, data_s:dev_grp.dev_info[dev_index].sys_cfg_var.tmp_wt_min);
            len += Int(SYS_CFG_INFO_TMP_LEN)
            break;
        case SYS_CFG_INFO_TYPE_WT_TMP_MAX:
            buf[len] = SYS_CFG_INFO_TYPE_WT_TMP_MAX;
            len +=  Int(SYS_CFG_INFO_TYPE_LEN)
            copy_short2byte(buf_info: &buf, start:len, data_s:dev_grp.dev_info[dev_index].sys_cfg_var.tmp_wt_max);
            len += Int(SYS_CFG_INFO_TMP_LEN)
            break;
        case SYS_CFG_INFO_TYPE_TMP_AIR_MAX1:
            buf[len] = SYS_CFG_INFO_TYPE_TMP_AIR_MAX1;
            len +=  Int(SYS_CFG_INFO_TYPE_LEN)
            copy_short2byte(buf_info: &buf, start:len, data_s:dev_grp.dev_info[dev_index].sys_cfg_var.tmp_air_max1);
            len += Int(SYS_CFG_INFO_TMP_LEN)
            break;
        case SYS_CFG_INFO_TYPE_TMP_AIR_MAX2:
            buf[len] = SYS_CFG_INFO_TYPE_TMP_AIR_MAX2;
            len +=  Int(SYS_CFG_INFO_TYPE_LEN)
            copy_short2byte(buf_info: &buf, start:len, data_s:dev_grp.dev_info[dev_index].sys_cfg_var.tmp_air_max2);
            len += Int(SYS_CFG_INFO_TMP_LEN)
            break;
        case SYS_CFG_INFO_TYPE_TMP_AIR_MAX3:
            buf[len] = SYS_CFG_INFO_TYPE_TMP_AIR_MAX3;
            len +=  Int(SYS_CFG_INFO_TYPE_LEN)
            copy_short2byte(buf_info: &buf, start:len, data_s:dev_grp.dev_info[dev_index].sys_cfg_var.tmp_air_max3);
            len += Int(SYS_CFG_INFO_TMP_LEN)
            break;
        case SYS_CFG_INFO_TYPE_TMP_AIR_MAX4:
            buf[len] = SYS_CFG_INFO_TYPE_TMP_AIR_MAX4;
            len +=  Int(SYS_CFG_INFO_TYPE_LEN)
            copy_short2byte(buf_info: &buf, start:len, data_s:dev_grp.dev_info[dev_index].sys_cfg_var.tmp_air_max4);
            len += Int(SYS_CFG_INFO_TMP_LEN)
            break;
        case SYS_CFG_INFO_TYPE_TMP_AIR_NORM:
            buf[len] = SYS_CFG_INFO_TYPE_TMP_AIR_NORM;
            len +=  Int(SYS_CFG_INFO_TYPE_LEN)
            copy_short2byte(buf_info: &buf, start:len, data_s:dev_grp.dev_info[dev_index].sys_cfg_var.tmp_air_normal);
            len += Int(SYS_CFG_INFO_TMP_LEN)
        case SYS_CFG_INFO_TYPE_TMP_SOIL_MIN:
            buf[len] = SYS_CFG_INFO_TYPE_TMP_SOIL_MIN;
            len +=  Int(SYS_CFG_INFO_TYPE_LEN)
            copy_short2byte(buf_info: &buf, start:len, data_s:dev_grp.dev_info[dev_index].sys_cfg_var.tmp_soil_min);
            len += Int(SYS_CFG_INFO_TMP_LEN)
            break;
        case SYS_CFG_INFO_TYPE_TMP_SOIL_MAX:
            buf[len] = SYS_CFG_INFO_TYPE_TMP_SOIL_MAX;
            len +=  Int(SYS_CFG_INFO_TYPE_LEN)
            copy_short2byte(buf_info: &buf, start:len, data_s:dev_grp.dev_info[dev_index].sys_cfg_var.tmp_soil_max);
            len += Int(SYS_CFG_INFO_TMP_LEN)
            break;
        case SYS_CFG_INFO_TYPE_WET_SOIL_MIN:
            buf[len] = SYS_CFG_INFO_TYPE_WET_SOIL_MIN;
            len +=  Int(SYS_CFG_INFO_TYPE_LEN)
            copy_short2byte(buf_info: &buf, start:len, data_s:dev_grp.dev_info[dev_index].sys_cfg_var.wet_soil_min);
            len += Int(SYS_CFG_INFO_WET_LEN)
            break;
        case SYS_CFG_INFO_TYPE_WET_SOIL_MAX:
            buf[len] = SYS_CFG_INFO_TYPE_WET_SOIL_MAX;
            len +=  Int(SYS_CFG_INFO_TYPE_LEN)
            copy_short2byte(buf_info: &buf, start:len, data_s:dev_grp.dev_info[dev_index].sys_cfg_var.wet_soil_max);
            len += Int(SYS_CFG_INFO_WET_LEN)
            break;
        default:
             return 0
        }
    }
    
    return UInt16(len)
}

func  frame_make(dev_type:UInt8, frame_type:UInt8, child_type:UInt8, dev_index:Int ) ->Int
{
    var frame_len:UInt16 = 0
    var len:Int = 0
    
    copy_array(dst_in: &send_buf, src_in:frame_head_info.dev_id, dst_start:0, src_start:0, arr_len:Int(DEV_ID_LEN))
    send_buf[Int(MANU_ID_ADDR)] = frame_head_info.manu_id ?? 1
    send_buf[Int(DEV_TYPE_ADDR)] = frame_head_info.dev_type ?? 0
    switch frame_type
    {
    case USER_LOG_FRM:
        if(child_type == USER_LOG_TYPE_LOG)
        {
            //frame_head_info.frame_type = frame_type;
            send_buf[Int(FRM_TYPE_ADDR)] = frame_type
            send_buf[Int(USER_LOG_TYPE_ADDR)] = child_type;
            
            var arr_str = user_info.user_name?.cStringUsingEncoding(NSUTF8StringEncoding)
            copy_array_cc(dst_in: &send_buf, src_in:arr_str!, dst_start:Int(USER_LOG_NAME_ADDR) , src_start:0, arr_len:arr_str!.count)
            
            
            arr_str = user_info.user_pwd?.cStringUsingEncoding(NSUTF8StringEncoding)
            copy_array_cc(dst_in: &send_buf, src_in:arr_str!, dst_start:Int(USER_LOG_PWD_ADDR) , src_start:0, arr_len:arr_str!.count)
            //System.arraycopy(frame_log_info.passwd, 0, buf, USER_LOG_PWD_ADDR, USER_LOG_PWD_LEN);
            //buf[USER_LOG_DEV_NUM_ADDR] = (byte)dev.dev_login_num;
            len =  Int(USER_LOG_PWD_ADDR +  USER_LOG_PWD_LEN);
        }
            
        
        frame_len = UInt16(len - Int(FRAME_HEAD_LEN))
        send_buf[Int(FRAME_LEN_ADDR)] =  UInt8(frame_len>>8)
        send_buf[Int(FRAME_LEN_ADDR+1)] =  UInt8(frame_len&0xff)
            
    case REAL_DATA_FRM:
            let  city_code:UInt  = 1//user_grp.city_code;
            copy_int2byte(buf_info:&send_buf, start:Int(REAL_DATA_CITY_CODE_ADDR), data_i:city_code);
            frame_len = UInt16(REAL_DATA_LEN - REAL_DATA_CITY_CODE_ADDR);
         
            send_buf[Int(FRM_TYPE_ADDR)] = frame_type;
            send_buf[Int(FRAME_LEN_ADDR)] =  UInt8(frame_len>>8)
            send_buf[Int(FRAME_LEN_ADDR+1)] =  UInt8(frame_len&0xff)
            len = Int(REAL_DATA_LEN)
    case SYS_CFG_FRM:
        if(child_type == SYS_CFG_TYPE_VAR)
        {
            frame_len = UInt16(SYS_CFG_INFO_ADDR)
            send_buf[Int(SYS_CFG_TYPE_ADDR)] = SYS_CFG_TYPE_VAR
            frame_len = get_sys_info(buf_info:&send_buf, start:Int(frame_len), dev_idx:Int(dev_index));
            copy_short2byte(buf_info:&send_buf, start: Int(SYS_CFG_VER_ADDR), data_s: dev_grp.dev_info[Int(dev_index)].sys_ver)
        }
        else if(child_type == SYS_CFG_TYPE_ADJ)
        {
            frame_len = UInt16(SYS_CFG_ADJ_INFO_ADDR)
            send_buf[Int(SYS_CFG_TYPE_ADDR)] = SYS_CFG_TYPE_ADJ
            if(dev_grp.dev_info[Int(dev_index)].sys_adj_type == SYS_CFG_ADJ_TYPE_TMP)
            {
                send_buf[Int(SYS_CFG_ADJ_TYPE_ADDR)] = SYS_CFG_ADJ_TYPE_TMP;
                send_buf[Int(SYS_CFG_ADJ_INFO_ADDR)] = 0x1;
                frame_len += UInt16(SYS_CFG_ADJ_INFO_TYPE_LEN)
                
                //putFloat(buf, comm_frame.dev.dev_info[dev_index].sys_adj_tmp ,frame_head_info.frame_len);
                //frame_head_info.frame_len += SYS_CFG_ADJ_INFO_TMP_LEN;
            }
            else if(dev_grp.dev_info[dev_index].sys_adj_type == SYS_CFG_ADJ_TYPE_OX)
            {
                send_buf[Int(SYS_CFG_ADJ_TYPE_ADDR)] = SYS_CFG_ADJ_TYPE_OX;
                
            }
            else if(dev_grp.dev_info[dev_index].sys_adj_type == SYS_CFG_ADJ_TYPE_OX_ZORE)
            {
                send_buf[Int(SYS_CFG_ADJ_TYPE_ADDR)] = SYS_CFG_ADJ_TYPE_OX_ZORE;
            }
            else if(dev_grp.dev_info[dev_index].sys_adj_type == SYS_CFG_ADJ_TYPE_PH_7)
            {
                send_buf[Int(SYS_CFG_ADJ_TYPE_ADDR)] = SYS_CFG_ADJ_TYPE_PH_7;
                
            }
            else if(dev_grp.dev_info[dev_index].sys_adj_type == SYS_CFG_ADJ_TYPE_PH_SCALE)
            {
                send_buf[Int(SYS_CFG_ADJ_TYPE_ADDR)] = SYS_CFG_ADJ_TYPE_PH_SCALE
                
            }
        }
  
        send_buf[Int(FRM_TYPE_ADDR)] = frame_type;
        frame_len -= UInt16(FRAME_HEAD_LEN);
        send_buf[Int(FRAME_LEN_ADDR)] =  UInt8(frame_len>>8)
        send_buf[Int(FRAME_LEN_ADDR+1)] =  UInt8(frame_len&0xff)
        
        send_buf[Int(SYS_CFG_TYPE_ADDR)] = child_type;
        
        len = Int(frame_len)+Int(FRAME_HEAD_LEN)
    case MODE_CFG_FRM:
        if(child_type == MODE_CFG_TYPE_TIME)
        {
          //  frame_head_info.frame_len = MODE_CFG_INFO_ADDR;
           // frame_head_info.frame_len = get_time_cfg(buf, frame_head_info.frame_len);
        }
        else if(child_type == MODE_CFG_TYPE_SYNC)
        {
            frame_len = UInt16(MODE_CFG_SYNC_LEN)
        }
        else if(child_type == MODE_CFG_TYPE_CTRL)
        {
            send_buf[Int(MODE_CFG_STAT_ADDR)] =  1//mode_cfg_info.manu_stat;
            var data_s = UInt16 (mode_cfg_info.delay_index * 15);
            copy_short2byte(buf_info:&send_buf, start: Int(MODE_CFG_DELAY_ADDR), data_s: data_s)
            send_buf[Int(MODE_CFG_STAT_FLAG_ADDR)] =  0x5//mode_cfg_info.manu_stat_flag
            frame_len = UInt16(MODE_CFG_STAT_FLAG_ADDR) + UInt16(MODE_CFG_STAT_FLAG_LEN)
        }
        else if(child_type == MODE_CFG_TYPE_EXIT)
        {
            send_buf[Int(MODE_CFG_MODE_ADDR)] = mode_cfg_info.manu_stat;
            frame_len = UInt16(MODE_CFG_MODE_ADDR) + UInt16(MODE_CFG_MODE_LEN)
        }
        else if(child_type == MODE_CFG_TYPE_OP)
        {
            send_buf[Int(MODE_CFG_MODE_ADDR)] = mode_cfg_info.op_flag;
            frame_len = UInt16(MODE_CFG_MODE_ADDR) + UInt16(MODE_CFG_MODE_LEN)
        }
        
        frame_len -= UInt16(FRAME_HEAD_LEN)
        send_buf[Int(FRM_TYPE_ADDR)] = frame_type;
        send_buf[Int(FRAME_LEN_ADDR)] =  UInt8(frame_len>>8)
        send_buf[Int(FRAME_LEN_ADDR+1)] =  UInt8(frame_len&0xff)
        copy_short2byte(buf_info:&send_buf, start: Int(MODE_CFG_VER_ADDR), data_s: dev_grp.dev_info[dev_index].mode_ver)

        send_buf[Int(MODE_CFG_TYPE_ADDR)] = child_type;
        
        len = Int(frame_len) + Int(FRAME_HEAD_LEN)
    
    case HIS_INFO_FRM:
        
        send_buf[Int(FRM_TYPE_ADDR)] = frame_type
        
        if(dev_grp.dev_info[dev_index].dev_type == DEV_TYPE_FISH_ONLY_CTRL)
        {
            his_info.his_type = HIS_INFO_TYPE_FISH;
        }
       
        send_buf[Int(HIS_INFO_DAY_TYPE_ADDR)] = his_info.his_type;
        frame_len += UInt16(HIS_INFO_DAY_TYPE_LEN)
        if(his_info.his_type == HIS_INFO_TYPE_FISH)
        {
            send_buf[Int(HIS_INFO_DATE_TYPE_ADDR)] = 0//comm_frame.his_date_type;//今天值
        }
     /*   else if(comm_frame.his_type == HIS_INFO_TYPE_DAY)
        {
            Calendar c = Calendar.getInstance();
            comm_frame.his_date_barn=(short)( ((c.get(Calendar.YEAR)-2010)<<9)|
                (c.get(Calendar.MONTH)<<5)|
                (c.get(Calendar.DATE)));
            copy_short2byte(buf, HIS_INFO_DATE_TYPE_ADDR, comm_frame.his_date_barn);
        }
        else if(comm_frame.his_type == HIS_INFO_TYPE_HOUR)
        {
            send_buf[HIS_INFO_DATE_TYPE_ADDR] = comm_frame.his_date_type;//今天值
        }*/
        else if(his_info.his_type == HIS_INFO_TYPE_TIME)
        {
            //Calendar c = Calendar.getInstance();
            //c.add(Calendar.DAY_OF_MONTH, -comm_frame.his_date_index);
            if (year1==0)&&(month1==0)&&(day1==0)
            {
                let date = NSDate()
                let calendar = NSCalendar.currentCalendar()
                let components = calendar.components([.Day , .Month , .Year], fromDate: date)
                
                year1 =  UInt16(components.year)
                month1 = UInt16(components.month)-1
                day1 = UInt16(components.day)
            }
            var his_date:UInt16 =  ((year1-2010)<<9)|(month1<<5)|day1
            copy_short2byte(buf_info:&send_buf, start: Int(HIS_INFO_DATE_TYPE_ADDR), data_s:his_date);
        }
        
        frame_len += UInt16(HIS_INFO_DATE_TYPE_LEN)
        send_buf[Int(FRAME_LEN_ADDR)] =  UInt8(frame_len>>8)
        send_buf[Int(FRAME_LEN_ADDR+1)] =  UInt8(frame_len&0xff)
        len = Int(frame_len) + Int(FRAME_HEAD_LEN)
    default:
        send_buf.append(0x76)
        
    }
    let crc_data:UInt16 = GetCheckCode(buf_info:send_buf, frame_len:len)
    send_buf[len] = UInt8(crc_data>>8);
    len += 1;
    send_buf[len] = UInt8(crc_data&0xff);
    len += 1;
    return len
}
/*
class comm_send:UIViewController,GCDAsyncUdpSocketDelegate{
    
 

    func send_frame(frame_len: Int)
    {
        //send login reqsend_buf.append(0x86)
        var address = "192.168.2.101"
        // var address = "114.215.180.76"
        var port:UInt16 = 23458
        var socket:GCDAsyncUdpSocket! = nil
        //    var socketReceive:GCDAsyncUdpSocket! = nil
        var error : NSError?
        
        
        
        //  var send_buf = UInt8[](count: 1024, repeatedValue: 0)
        // var send_buf = Array<UInt8>()
        // send_buf.append(0x86)
        //send_buf.append(0x99)
        // send_buf.append(0x24)
        
        
        
        // var message = NSData(bytes: send_buf as [UInt8], length: send_buf.count)
        var message = NSData(bytes: send_buf , length: frame_len)
        socket = GCDAsyncUdpSocket(delegate: self, delegateQueue: dispatch_get_main_queue())
        socket.sendData(message, toHost: address, port: port, withTimeout: 10000, tag: 0)
        do {
            //    try socket.enableBroadcast(true)
            try socket.beginReceiving()
        } catch {
            print(error)
        }
    }
        func udpSocket(sock: GCDAsyncUdpSocket!, didReceiveData data: NSData!, fromAddress address: NSData!,  withFilterContext filterContext: AnyObject!)
    {
        let count = data.length / sizeof(UInt8)
        
        // create an array of Uint8
        var array = [UInt8](count: count, repeatedValue: 0)
        data.getBytes(&array, length:count * sizeof(UInt8))
        print("incoming message: \(data)");
    }
 
}
*/