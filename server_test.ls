/PROG  SERVER_TEST
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Sock Stream XYZWPR";
PROG_SIZE	= 617;
CREATE		= DATE 24-08-04  TIME 16:42:34;
MODIFIED	= DATE 24-08-04  TIME 19:05:18;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 5;
MEMORY_SIZE	= 977;
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
   1:  RUN POSE_SERVER ;
   2:J P[1] 10% FINE    ;
   3:J P[2] 10% FINE    ;
   4:L P[3] 100mm/sec FINE    ;
   5:J P[1] 10% FINE    ;
/POS
P[1]{
   GP1:
	UF : 8, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   500.000  mm,	Y =     -.000  mm,	Z =   500.000  mm,
	W =   180.000 deg,	P =      .000 deg,	R =      .000 deg
};
P[2]{
   GP1:
	UF : 8, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   500.000  mm,	Y =     -.000  mm,	Z =   298.011  mm,
	W =   180.000 deg,	P =     -.000 deg,	R =      .000 deg
};
P[3]{
   GP1:
	UF : 8, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   934.287  mm,	Y =     -.000  mm,	Z =   298.012  mm,
	W =   180.000 deg,	P =     -.000 deg,	R =      .000 deg
};
/END
