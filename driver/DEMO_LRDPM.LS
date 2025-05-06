/PROG  DEMO_LRDPM
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1275;
CREATE		= DATE 25-01-31  TIME 13:55:52;
MODIFIED	= DATE 25-02-06  TIME 13:19:40;
FILE_NAME	= TEST_LR_;
VERSION		= 0;
LINE_COUNT	= 34;
MEMORY_SIZE	= 1779;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,*,*,*,*;
CONTROL_CODE	= 00000000 00000000;
LOCAL_REGISTERS	= 0,0,0;
/APPL
/MN
   1:  R[11:ITER]=0    ;
   2:  F[1]=(OFF) ;
   3:  RUN MTSVS_CLIENT ;
   4:  WAIT (F[1]=ON)    ;
   5:  LBL[31] ;
   6:  !F[2]=ON TO SKIP REF ;
   7:  F[2]=(OFF) ;
   8:  F[3]=(OFF) ;
   9:  F[4]=(OFF) ;
  10:  F[5]=(OFF) ;
  11:J PR[3:HOME] 100% FINE    ;
  12:  IF (F[2]=ON),JMP LBL[51] ;
  13:  !LOCAL REFERENCING ;
  14:J P[1] 100% FINE    ;
  15:  F[3]=(ON) ;
  16:  WAIT (F[3]=OFF)    ;
  17:J P[2] 100% FINE    ;
  18:  F[3]=(ON) ;
  19:  WAIT (F[3]=OFF)    ;
  20:J P[3] 100% FINE    ;
  21:  F[3]=(ON) ;
  22:  WAIT (F[3]=OFF)    ;
  23:  WAIT (F[4]=ON)    ;
  24:  LBL[51] ;
  25:  !DYN PATH MODIFICATION ;
  26:J P[4] 100% FINE Offset,PR[6:LR_REF]    ;
  27:  F[5]=(ON) ;
  28:  Track DPM[1] ;
  29:L P[5] 100mm/sec FINE Offset,PR[6:LR_REF]    ;
  30:  Track End ;
  31:  F[5]=(OFF) ;
  32:  R[11:ITER]=R[11:ITER]+1    ;
  33:  IF R[11:ITER]<10,JMP LBL[31] ;
  34:  F[1]=(OFF) ;
/POS
P[1]{
   GP1:
	UF : 8, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =   712.956  mm,	Y =     0.000  mm,	Z =   703.315  mm,
	W =     0.000 deg,	P =   -88.036 deg,	R =  -180.000 deg
};
P[2]{
   GP1:
	UF : 8, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =   794.868  mm,	Y =  -622.273  mm,	Z =   779.892  mm,
	W =     0.000 deg,	P =   -88.036 deg,	R =   180.000 deg
};
P[3]{
   GP1:
	UF : 8, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =   745.713  mm,	Y =  -326.209  mm,	Z =   354.014  mm,
	W =     0.000 deg,	P =   -88.036 deg,	R =   179.999 deg
};
P[4]{
   GP1:
	UF : 8, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =   478.483  mm,	Y =  -205.959  mm,	Z =   456.882  mm,
	W =  -136.443 deg,	P =   -87.019 deg,	R =   -41.540 deg
};
P[5]{
   GP1:
	UF : 8, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =   478.483  mm,	Y =   299.001  mm,	Z =   456.882  mm,
	W =  -136.443 deg,	P =   -87.019 deg,	R =   -41.540 deg
};
/END
