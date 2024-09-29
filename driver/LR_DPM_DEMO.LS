/PROG  LR_DPM_DEMO
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1094;
CREATE		= DATE 24-09-14  TIME 15:04:56;
MODIFIED	= DATE 24-09-28  TIME 19:59:08;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 30;
MEMORY_SIZE	= 1354;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,*,*,*,*;
CONTROL_CODE	= 00000000 00000000;
/MN
   1:  F[2]=(OFF) ;
   2:  F[3]=(OFF) ;
   3:  F[4]=(OFF) ;
   4:  F[5]=(OFF) ;
   5:  PR[7,1]=0    ;
   6:  PR[7,2]=0    ;
   7:  PR[7,3]=0    ;
   8:  PR[7,4]=0    ;
   9:  PR[7,5]=0    ;
  10:  PR[7,6]=0    ;
  11:J PR[6] 100% FINE    ;
  12:  RUN VS_CLIENT ;
  13:  WAIT (F[2]=ON)    ;
  14:  !LOCAL REFERENCING ;
  15:J P[1] 100% FINE    ;
  16:  F[3]=(ON) ;
  17:  WAIT (F[3]=OFF)    ;
  18:J P[2] 100% FINE    ;
  19:  F[3]=(ON) ;
  20:  WAIT (F[3]=OFF)    ;
  21:J P[3] 100% FINE    ;
  22:  F[3]=(ON) ;
  23:  WAIT (F[3]=OFF)    ;
  24:  WAIT (F[4]=ON)    ;
  25:J PR[6] 100% FINE Offset,PR[7]    ;
  26:  F[5]=(ON) ;
  27:  Track DPM[1] ;
  28:L P[4] 10mm/sec FINE Offset,PR[7]    ;
  29:  Track End ;
  30:  F[5]=(OFF) ;
/POS
P[1]{
   GP1:
	UF : 8, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =   712.956  mm,	Y =      .000  mm,	Z =   703.315  mm,
	W =     -.000 deg,	P =   -88.036 deg,	R =  -180.000 deg
};
P[2]{
   GP1:
	UF : 8, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =   794.868  mm,	Y =  -622.273  mm,	Z =   779.892  mm,
	W =      .000 deg,	P =   -88.036 deg,	R =   180.000 deg
};
P[3]{
   GP1:
	UF : 8, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =   745.713  mm,	Y =  -326.209  mm,	Z =   354.014  mm,
	W =      .000 deg,	P =   -88.036 deg,	R =   179.999 deg
};
P[4]{
   GP1:
	UF : 8, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   299.711  mm,	Y =     -.000  mm,	Z =   300.000  mm,
	W =   180.000 deg,	P =     -.000 deg,	R =     -.000 deg
};
/END
