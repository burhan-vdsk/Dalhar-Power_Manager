unit DalharPowerManager;
{
Source files:
  DalharPowerManager.pas (12/03/2010 0:25:04)}

interface

uses
  Dialogs,
  StdCtrls,
  Forms {
    A:Application},
  Controls,
  Graphics,
  Classes {
    T:TComponent, A:.TComponent, A:TComponent.DefineProperties,
    A:TComponent.Loaded, A:TComponent.Notification, A:TComponent.ReadState,
    A:TComponent.SetName, A:TComponent.UpdateRegistry,
    A:TComponent.ValidateRename, A:TComponent.WriteState,
    A:TComponent.QueryInterface, A:TComponent.BeforeDestruction,
    A:TComponent.SafeCallException, A:TPersistent.AssignTo,
    A:TPersistent.Assign, A:RegisterComponents, A:TComponent.Create,
    A:TComponent.Destroy},
  Printers,
  Variants,
  CommDlg,
  SysUtils {
    A:Win32Platform},
  Messages {
    A:WM_SYSCOMMAND},
  Windows {
    T:TOKEN_PRIVILEGES, A:VER_PLATFORM_WIN32_NT, A:OpenProcessToken,
    A:GetCurrentProcess, A:TOKEN_ADJUST_PRIVILEGES, A:TOKEN_QUERY,
    A:LookupPrivilegeValue, A:SE_PRIVILEGE_ENABLED,
    A:AdjustTokenPrivileges, A:AdjustTokenPrivileges, A:ExitWindowsEx,
    A:EWX_SHUTDOWN, A:EWX_FORCE, A:EWX_REBOOT, A:EWX_LOGOFF, A:SendMessage,
    A:SC_MONITORPOWER, A:EWX_POWEROFF},
  SysInit,
  System {
    T:AnsiString, T:Boolean, T:String, A:TObject.AfterConstruction,
    A:TObject.Dispatch, A:TObject.DefaultHandler, A:TObject.NewInstance,
    A:TObject.FreeInstance, A:@ClassCreate, A:@LStrAsg,
    A:@AfterConstruction, A:@BeforeDestruction, A:@ClassDestroy,
    A:@LStrAddRef, A:@LStrClr, A:@HandleFinally, T:Cardinal, T:PAnsiChar,
    A:False, A:True};

const
  MaxCustomColors = $10;

type
  TPowerAction = (paShutdown, paRestart, paLog_Off, paMonitor_Power,
    paPower_Off);

  TVDPowerManager = class(TComponent) 
  private
    FAbout: AnsiString;
    FAuthor: AnsiString;
    FForce: Boolean;
    FPowerAction: TPowerAction;
    FVersion: AnsiString;
    procedure About_Box;
    procedure Set_About (InTxtAbout: AnsiString);
    procedure PowerManager (Action: TPowerAction; Force: Boolean);
  public
    constructor Create (AOwner: TComponent); override{; virtual @44};
    destructor Destroy; override{; virtual @-4};
    procedure ExecutePower;
  published
    property About:AnsiString read FAbout write TVDPowerManager.Set_About;
    property Author:AnsiString read FAuthor
      write TVDPowerManager.Set_About;
    property Force:Boolean read FForce write FForce;
    property PowerAction:TPowerAction read FPowerAction write FPowerAction;
    property Version:AnsiString read FVersion
      write TVDPowerManager.Set_About;
  end;

procedure Register;

procedure Finalization;

procedure DalharPowerManager;

implementation

var
  _DV_2: -$80000000..$7FFFFFFF;

procedure Register;
begin
  00: Q      [51                  | PUSH ECX
  01: °....  |A1(00 00 00 00      | MOV EAX,DWORD PTR [_DV_TVDPowerManager{#$5F}]
  06: â.$    |89 04 24            | MOV DWORD PTR [ESP],EAX
  09: ã‘     |8B D4               | MOV EDX,ESP
  0B: 3…     |33 C9               | XOR ECX,ECX
  0D: ∏$...  |B8(24 00 00 00      | MOV EAX,'VD Power' {Register{#$62}+36}
  12: Ë....  |E8(00 00 00 00      | CALL RegisterComponents{#$18}
  17: Z      |5A                  | POP EDX
  18: √      |C3                  | RET NEAR
  19: ..     |00 00               | ADD BYTE PTR [EAX],AL
  1B: .ˇ     |00 FF               | ADD BH,BH
  1D: ˇˇ     |FF FF               | ? EDI
  1F: ˇ.     |FF 08               | DEC DWORD PTR [EAX]
  21: ..     |00 00               | ADD BYTE PTR [EAX],AL
  23: .VD    |00 56 44            | ADD BYTE PTR [ESI+68],DL
  26:  Po    |20 50 6F            | AND BYTE PTR [EAX+111],DL
  29: we     |77 65               | JA +101; (0x90)
  2B: r.     |72 00               | JB ; (0x2D)
  2D: ..     |00 00               | ADD BYTE PTR [EAX],AL
  2F: .      |00                  | ?
end;

constructor TVDPowerManager.Create (AOwner: TComponent);
begin
  000: S      [53                  | PUSH EBX
  001: V      |56                  | PUSH ESI
  002: Ñ“     |84 D2               | TEST DL,DL
  004: t.     |74 08               | JE +8; (0xE)
  006: Éƒ    |83 C4 F0            | ADD ESP,-16
  009: Ë....  |E8(00 00 00 00      | CALL @ClassCreate{#$3F}
  00E: ã⁄     |8B DA               | MOV EBX,EDX
  010: ã     |8B F0               | MOV ESI,EAX
  012: 3“     |33 D2               | XOR EDX,EDX
  014: ã∆     |8B C6               | MOV EAX,ESI
  016: Ë....  |E8(00 00 00 00      | CALL TComponent.Create{#$19}
  01B: çF0    |8D 46 30            | LEA EAX,DWORD PTR [ESI+48]
  01E: ∫d...  |BA(64 00 00 00      | MOV EDX,'Send your comment and suggestion about our products to E-Mail : mb_von_dalhar@yahoo.com, Phone : 062-0888-2492-625, 062-081-326-140-144' {TVDPowerManager.Create{#$63}+100}
  023: Ë....  |E8(00 00 00 00      | CALL @LStrAsg{#$40}
  028: çF4    |8D 46 34            | LEA EAX,DWORD PTR [ESI+52]
  02B: ∫Ù...  |BA(F4 00 00 00      | MOV EDX,'M. Burhanuddin Von Dalhar' {TVDPowerManager.Create{#$63}+244}
  030: Ë....  |E8(00 00 00 00      | CALL @LStrAsg{#$40}
  035: çF<    |8D 46 3C            | LEA EAX,DWORD PTR [ESI+60]
  038: ∫....  |BA(18 01 00 00      | MOV EDX,'1.0  (09/09/2006) by Dalhar Progress System Technology' {TVDPowerManager.Create{#$63}+280}
  03D: Ë....  |E8(00 00 00 00      | CALL @LStrAsg{#$40}
  042: ã∆     |8B C6               | MOV EAX,ESI
  044: Ñ€     |84 DB               | TEST BL,BL
  046: t.     |74 0F               | JE +15; (0x57)
  048: Ë....  |E8(00 00 00 00      | CALL @AfterConstruction{#$41}
  04D: dè.....|64 8F 05 00 00 00 00| POP WORD PTR FS:[$00000000]
  054: Éƒ.    |83 C4 0C            | ADD ESP,12
  057: ã∆     |8B C6               | MOV EAX,ESI
  059: ^      |5E                  | POP ESI
  05A: [      |5B                  | POP EBX
  05B: √      |C3                  | RET NEAR
  05C: ˇˇ     |FF FF               | ? EDI
  05E: ˇˇ     |FF FF               | ? EDI
  060: á.     |87 00               | XCHG EAX,DWORD PTR [EAX]
  062: ..     |00 00               | ADD BYTE PTR [EAX],AL
  064: S      |53                  | PUSH EBX
  065: en     |65 6E               | OUTSB 
  067: d yo   |64 20 79 6F         | AND BYTE PTR FS:[ECX+111],BH
  06B: ur     |75 72               | JNE +114; (0xDF)
  06D:  co    |20 63 6F            | AND BYTE PTR [EBX+111],AH
  070: m      |6D                  | INSD 
  071: m      |6D                  | INSD 
  072: en     |65 6E               | OUTSB 
  074: t      |74 20               | JE +32; (0x96)
  076: a      |61                  | POPAD 
  077: n      |6E                  | OUTSB 
  078: d su   |64 20 73 75         | AND BYTE PTR FS:[EBX+117],DH
  07C: ggest  |67 67 65 73 74      | JNB +116; (0xF5)
  081: ion abo|69 6F 6E 20 61 62 6F| IMUL DWORD PTR [EDI+110],$6F626120
  088: ut     |75 74               | JNE +116; (0xFE)
  08A:  ou    |20 6F 75            | AND BYTE PTR [EDI+117],CH
  08D: r      |72 20               | JB +32; (0xAF)
  08F: pr     |70 72               | JO +114; (0x103)
  091: o      |6F                  | OUTSD 
  092: duc    |64 75 63            | JNE +99; (0xF8)
  095: ts     |74 73               | JE +115; (0x10A)
  097:  to    |20 74 6F 20         | AND BYTE PTR [EDI+2*EBP+32],DH
  09B: E      |45                  | INC EBP
  09C: -Mail  |2D 4D 61 69 6C      | SUB EAX,$6C69614D
  0A1:  :     |20 3A               | AND BYTE PTR [EDX],BH
  0A3:  mb    |20 6D 62            | AND BYTE PTR [EBP+98],CH
  0A6: _      |5F                  | POP EDI
  0A7: vo     |76 6F               | JBE +111; (0x118)
  0A9: n      |6E                  | OUTSB 
  0AA: _      |5F                  | POP EDI
  0AB: da     |64 61               | POPAD 
  0AD: l      |6C                  | INSB 
  0AE: har@y  |68 61 72 40 79      | PUSH $79407261
  0B3: a      |61                  | POPAD 
  0B4: hoo.c  |68 6F 6F 2E 63      | PUSH $632E6F6F
  0B9: o      |6F                  | OUTSD 
  0BA: m      |6D                  | INSD 
  0BB: ,      |2C 20               | SUB AL,$20
  0BD: P      |50                  | PUSH EAX
  0BE: hone   |68 6F 6E 65 20      | PUSH $20656E6F
  0C3: :      |3A 20               | CMP AH,BYTE PTR [EAX]
  0C5: 06     |30 36               | XOR BYTE PTR [ESI],DH
  0C7: 2-0888 |32 2D 30 38 38 38   | XOR CH,BYTE PTR [$38383830]
  0CD: -2492  |2D 32 34 39 32      | SUB EAX,$32393432
  0D2: -625,  |2D 36 32 35 2C      | SUB EAX,$2C353236
  0D7:  0     |20 30               | AND BYTE PTR [EAX],DH
  0D9: 62-081-|36 32 2D 30 38 31 2D| XOR CH,BYTE PTR SS:[$2D313830]
  0E0: 32     |33 32               | XOR ESI,DWORD PTR [EDX]
  0E2: 6-140- |36 2D 31 34 30 2D   | SUB EAX,$2D303431
  0E8: 144    |31 34 34            | XOR DWORD PTR [ESP+ESI],ESI
  0EB: .ˇ     |00 FF               | ADD BH,BH
  0ED: ˇˇ     |FF FF               | ? EDI
  0EF: ˇ.     |FF 19               | CALL DWORD PTR [ECX],FAR
  0F1: ..     |00 00               | ADD BYTE PTR [EAX],AL
  0F3: .M.    |00 4D 2E            | ADD BYTE PTR [EBP+46],CL
  0F6:  Bu    |20 42 75            | AND BYTE PTR [EDX+117],AL
  0F9: rh     |72 68               | JB +104; (0x163)
  0FB: a      |61                  | POPAD 
  0FC: n      |6E                  | OUTSB 
  0FD: ud     |75 64               | JNE +100; (0x163)
  0FF: din Von |64 69 6E 20 56 6F 6E 20| IMUL DWORD PTR FS:[ESI+32],$206E6F56
  107: D      |44                  | INC ESP
  108: a      |61                  | POPAD 
  109: l      |6C                  | INSB 
  10A: har..  |68 61 72 00 00      | PUSH $00007261
  10F: .ˇ     |00 FF               | ADD BH,BH
  111: ˇˇ     |FF FF               | ? EDI
  113: ˇ6     |FF 36               | PUSH DWORD PTR [ESI]
  115: ..     |00 00               | ADD BYTE PTR [EAX],AL
  117: .1     |00 31               | ADD BYTE PTR [ECX],DH
  119: .0     |2E 30 20            | XOR BYTE PTR CS:[EAX],AH
  11C:  (     |20 28               | AND BYTE PTR [EAX],CH
  11E: 09     |30 39               | XOR BYTE PTR [ECX],BH
  120: /      |2F                  | DAS 
  121: 09     |30 39               | XOR BYTE PTR [ECX],BH
  123: /      |2F                  | DAS 
  124: 20     |32 30               | XOR DH,BYTE PTR [EAX]
  126: 06     |30 36               | XOR BYTE PTR [ESI],DH
  128: )      |29 20               | SUB DWORD PTR [EAX],ESP
  12A: by     |62 79 20            | BOUND EDI,DWORD PTR [ECX+32]
  12D: D      |44                  | INC ESP
  12E: a      |61                  | POPAD 
  12F: l      |6C                  | INSB 
  130: har P  |68 61 72 20 50      | PUSH $50207261
  135: ro     |72 6F               | JB +111; (0x1A6)
  137: gre    |67 72 65            | JB +101; (0x19F)
  13A: ss     |73 73               | JNB +115; (0x1AF)
  13C:  Sy    |20 53 79            | AND BYTE PTR [EBX+121],DL
  13F: st     |73 74               | JNB +116; (0x1B5)
  141: em     |65 6D               | INSD 
  143:  Tec   |20 54 65 63         | AND BYTE PTR [EBP+99],DL
  147: hnolo  |68 6E 6F 6C 6F      | PUSH $6F6C6F6E
  14C: gy.    |67 79 00            | JNS ; (0x14F)
  14F: .      |00                  | ?
end;

destructor TVDPowerManager.Destroy;
begin
  00: S      [53                  | PUSH EBX
  01: V      |56                  | PUSH ESI
  02: Ë....  |E8(00 00 00 00      | CALL @BeforeDestruction{#$42}
  07: ã⁄     |8B DA               | MOV EBX,EDX
  09: ã     |8B F0               | MOV ESI,EAX
  0B: ã”     |8B D3               | MOV EDX,EBX
  0D: Ä‚¸    |80 E2 FC            | AND DL,$FC
  10: ã∆     |8B C6               | MOV EAX,ESI
  12: Ë....  |E8(00 00 00 00      | CALL TComponent.Destroy{#$1A}
  17: Ñ€     |84 DB               | TEST BL,BL
  19: ~.     |7E 07               | JLE +7; (0x22)
  1B: ã∆     |8B C6               | MOV EAX,ESI
  1D: Ë....  |E8(00 00 00 00      | CALL @ClassDestroy{#$43}
  22: ^      |5E                  | POP ESI
  23: [      |5B                  | POP EBX
  24: √      |C3                  | RET NEAR
end;

procedure TVDPowerManager.Set_About (InTxtAbout: AnsiString);
begin
  00: U      [55                  | PUSH EBP
  01: ãÏ     |8B EC               | MOV EBP,ESP
  03: Q      |51                  | PUSH ECX
  04: S      |53                  | PUSH EBX
  05: âU¸    |89 55 FC            | MOV DWORD PTR [EBP-4{InTxtAbout}],EDX
  08: ãÿ     |8B D8               | MOV EBX,EAX
  0A: ãE¸    |8B 45 FC            | MOV EAX,DWORD PTR [EBP-4{InTxtAbout}]
  0D: Ë....  |E8(00 00 00 00      | CALL @LStrAddRef{#$44}
  12: 3¿     |33 C0               | XOR EAX,EAX
  14: U      |55                  | PUSH EBP
  15: hH...  |68(48 00 00 00      | PUSH TVDPowerManager.Set_About{#$6A}+72
  1A: dˇ0    |64 FF 30            | PUSH DWORD PTR FS:[EAX]
  1D: dâ     |64 89 20            | MOV DWORD PTR FS:[EAX],ESP
  20: çC0    |8D 43 30            | LEA EAX,DWORD PTR [EBX+48]
  23: ãU¸    |8B 55 FC            | MOV EDX,DWORD PTR [EBP-4{InTxtAbout}]
  26: Ë....  |E8(00 00 00 00      | CALL @LStrAsg{#$40}
  2B: ã√     |8B C3               | MOV EAX,EBX
  2D: Ë....  |E8(00 00 00 00      | CALL TVDPowerManager.About_Box{#$6D}
  32: 3¿     |33 C0               | XOR EAX,EAX
  34: Z      |5A                  | POP EDX
  35: Y      |59                  | POP ECX
  36: Y      |59                  | POP ECX
  37: dâ.    |64 89 10            | MOV DWORD PTR FS:[EAX],EDX
  3A: hO...  |68(4F 00 00 00      | PUSH TVDPowerManager.Set_About{#$6A}+79
  3F: çE¸    |8D 45 FC            | LEA EAX,DWORD PTR [EBP-4{InTxtAbout}]
  42: Ë....  |E8(00 00 00 00      | CALL @LStrClr{#$45}
  47: √      |C3                  | RET NEAR
  48: È....  |E9(00 00 00 00      | JMP @HandleFinally{#$46}
  4D: Î     |EB F0               | JMP -16; (0x3F)
  4F: [      |5B                  | POP EBX
  50: Y      |59                  | POP ECX
  51: ]      |5D                  | POP EBP
  52: √      |C3                  | RET NEAR
end;

procedure TVDPowerManager.About_Box;
begin
  000: S      [53                  | PUSH EBX
  001: ãÿ     |8B D8               | MOV EBX,EAX
  003: çC0    |8D 43 30            | LEA EAX,DWORD PTR [EBX+48]
  006: ∫4...  |BA(34 00 00 00      | MOV EDX,'Send your comment and suggestion about our products to E-Mail : mb_von_dalhar@yahoo.com, Phone : 062-0888-2492-625, 062-081-326-140-144' {TVDPowerManager.About_Box{#$6D}+52}
  00B: Ë....  |E8(00 00 00 00      | CALL @LStrAsg{#$40}
  010: çC4    |8D 43 34            | LEA EAX,DWORD PTR [EBX+52]
  013: ∫ƒ...  |BA(C4 00 00 00      | MOV EDX,'M. Burhanuddin Von Dalhar' {TVDPowerManager.About_Box{#$6D}+196}
  018: Ë....  |E8(00 00 00 00      | CALL @LStrAsg{#$40}
  01D: çC<    |8D 43 3C            | LEA EAX,DWORD PTR [EBX+60]
  020: ∫Ë...  |BA(E8 00 00 00      | MOV EDX,'1.0  (05/07/2006) by Dalhar Progress System Technology' {TVDPowerManager.About_Box{#$6D}+232}
  025: Ë....  |E8(00 00 00 00      | CALL @LStrAsg{#$40}
  02A: [      |5B                  | POP EBX
  02B: √      |C3                  | RET NEAR
  02C: ˇˇ     |FF FF               | ? EDI
  02E: ˇˇ     |FF FF               | ? EDI
  030: á.     |87 00               | XCHG EAX,DWORD PTR [EAX]
  032: ..     |00 00               | ADD BYTE PTR [EAX],AL
  034: S      |53                  | PUSH EBX
  035: en     |65 6E               | OUTSB 
  037: d yo   |64 20 79 6F         | AND BYTE PTR FS:[ECX+111],BH
  03B: ur     |75 72               | JNE +114; (0xAF)
  03D:  co    |20 63 6F            | AND BYTE PTR [EBX+111],AH
  040: m      |6D                  | INSD 
  041: m      |6D                  | INSD 
  042: en     |65 6E               | OUTSB 
  044: t      |74 20               | JE +32; (0x66)
  046: a      |61                  | POPAD 
  047: n      |6E                  | OUTSB 
  048: d su   |64 20 73 75         | AND BYTE PTR FS:[EBX+117],DH
  04C: ggest  |67 67 65 73 74      | JNB +116; (0xC5)
  051: ion abo|69 6F 6E 20 61 62 6F| IMUL DWORD PTR [EDI+110],$6F626120
  058: ut     |75 74               | JNE +116; (0xCE)
  05A:  ou    |20 6F 75            | AND BYTE PTR [EDI+117],CH
  05D: r      |72 20               | JB +32; (0x7F)
  05F: pr     |70 72               | JO +114; (0xD3)
  061: o      |6F                  | OUTSD 
  062: duc    |64 75 63            | JNE +99; (0xC8)
  065: ts     |74 73               | JE +115; (0xDA)
  067:  to    |20 74 6F 20         | AND BYTE PTR [EDI+2*EBP+32],DH
  06B: E      |45                  | INC EBP
  06C: -Mail  |2D 4D 61 69 6C      | SUB EAX,$6C69614D
  071:  :     |20 3A               | AND BYTE PTR [EDX],BH
  073:  mb    |20 6D 62            | AND BYTE PTR [EBP+98],CH
  076: _      |5F                  | POP EDI
  077: vo     |76 6F               | JBE +111; (0xE8)
  079: n      |6E                  | OUTSB 
  07A: _      |5F                  | POP EDI
  07B: da     |64 61               | POPAD 
  07D: l      |6C                  | INSB 
  07E: har@y  |68 61 72 40 79      | PUSH $79407261
  083: a      |61                  | POPAD 
  084: hoo.c  |68 6F 6F 2E 63      | PUSH $632E6F6F
  089: o      |6F                  | OUTSD 
  08A: m      |6D                  | INSD 
  08B: ,      |2C 20               | SUB AL,$20
  08D: P      |50                  | PUSH EAX
  08E: hone   |68 6F 6E 65 20      | PUSH $20656E6F
  093: :      |3A 20               | CMP AH,BYTE PTR [EAX]
  095: 06     |30 36               | XOR BYTE PTR [ESI],DH
  097: 2-0888 |32 2D 30 38 38 38   | XOR CH,BYTE PTR [$38383830]
  09D: -2492  |2D 32 34 39 32      | SUB EAX,$32393432
  0A2: -625,  |2D 36 32 35 2C      | SUB EAX,$2C353236
  0A7:  0     |20 30               | AND BYTE PTR [EAX],DH
  0A9: 62-081-|36 32 2D 30 38 31 2D| XOR CH,BYTE PTR SS:[$2D313830]
  0B0: 32     |33 32               | XOR ESI,DWORD PTR [EDX]
  0B2: 6-140- |36 2D 31 34 30 2D   | SUB EAX,$2D303431
  0B8: 144    |31 34 34            | XOR DWORD PTR [ESP+ESI],ESI
  0BB: .ˇ     |00 FF               | ADD BH,BH
  0BD: ˇˇ     |FF FF               | ? EDI
  0BF: ˇ.     |FF 19               | CALL DWORD PTR [ECX],FAR
  0C1: ..     |00 00               | ADD BYTE PTR [EAX],AL
  0C3: .M.    |00 4D 2E            | ADD BYTE PTR [EBP+46],CL
  0C6:  Bu    |20 42 75            | AND BYTE PTR [EDX+117],AL
  0C9: rh     |72 68               | JB +104; (0x133)
  0CB: a      |61                  | POPAD 
  0CC: n      |6E                  | OUTSB 
  0CD: ud     |75 64               | JNE +100; (0x133)
  0CF: din Von |64 69 6E 20 56 6F 6E 20| IMUL DWORD PTR FS:[ESI+32],$206E6F56
  0D7: D      |44                  | INC ESP
  0D8: a      |61                  | POPAD 
  0D9: l      |6C                  | INSB 
  0DA: har..  |68 61 72 00 00      | PUSH $00007261
  0DF: .ˇ     |00 FF               | ADD BH,BH
  0E1: ˇˇ     |FF FF               | ? EDI
  0E3: ˇ6     |FF 36               | PUSH DWORD PTR [ESI]
  0E5: ..     |00 00               | ADD BYTE PTR [EAX],AL
  0E7: .1     |00 31               | ADD BYTE PTR [ECX],DH
  0E9: .0     |2E 30 20            | XOR BYTE PTR CS:[EAX],AH
  0EC:  (     |20 28               | AND BYTE PTR [EAX],CH
  0EE: 05/07/ |30 35 2F 30 37 2F   | XOR BYTE PTR [$2F37302F],DH
  0F4: 20     |32 30               | XOR DH,BYTE PTR [EAX]
  0F6: 06     |30 36               | XOR BYTE PTR [ESI],DH
  0F8: )      |29 20               | SUB DWORD PTR [EAX],ESP
  0FA: by     |62 79 20            | BOUND EDI,DWORD PTR [ECX+32]
  0FD: D      |44                  | INC ESP
  0FE: a      |61                  | POPAD 
  0FF: l      |6C                  | INSB 
  100: har P  |68 61 72 20 50      | PUSH $50207261
  105: ro     |72 6F               | JB +111; (0x176)
  107: gre    |67 72 65            | JB +101; (0x16F)
  10A: ss     |73 73               | JNB +115; (0x17F)
  10C:  Sy    |20 53 79            | AND BYTE PTR [EBX+121],DL
  10F: st     |73 74               | JNB +116; (0x185)
  111: em     |65 6D               | INSD 
  113:  Tec   |20 54 65 63         | AND BYTE PTR [EBP+99],DL
  117: hnolo  |68 6E 6F 6C 6F      | PUSH $6F6C6F6E
  11C: gy.    |67 79 00            | JNS ; (0x11F)
  11F: .      |00                  | ?
end;

procedure TVDPowerManager.ExecutePower;
begin
  0: äH8    [8A 48 38            | MOV CL,BYTE PTR [EAX+56]
  3: äP9    |8A 50 39            | MOV DL,BYTE PTR [EAX+57]
  6: Ë....  |E8(00 00 00 00      | CALL TVDPowerManager.PowerManager{#$71}
  B: √      |C3                  | RET NEAR
end;

procedure TVDPowerManager.PowerManager (Action: TPowerAction;
  Force: Boolean);
var
  rl: Cardinal;
  hToken: Cardinal;
  tkp: TOKEN_PRIVILEGES;
begin
  000: S      [53                  | PUSH EBX
  001: Éƒ‰    |83 C4 E4            | ADD ESP{Force},-28
  004: à.$    |88 0C 24            | MOV BYTE PTR [ESP{Force}],CL
  007: ã⁄     |8B DA               | MOV EBX,EDX
  009: °....  |A1(00 00 00 00      | MOV EAX,DWORD PTR [Win32Platform{#$1F}]
  00E: É8.    |83 38 02            | CMP DWORD PTR [EAX],2
  011: .Ö-... |0F 85 2D 01 00 00   | JNE +301; (0x144)
  017: çD$.   |8D 44 24 08         | LEA EAX,DWORD PTR [ESP+8{hToken}]
  01B: P      |50                  | PUSH EAX
  01C: j(     |6A 28               | PUSH $28
  01E: Ë....  |E8(00 00 00 00      | CALL GetCurrentProcess{#$26}
  023: P      |50                  | PUSH EAX
  024: Ë....  |E8(00 00 00 00      | CALL OpenProcessToken{#$25}
  029: çD$.   |8D 44 24 10         | LEA EAX,DWORD PTR [ESP+16{tkp.Privileges[$00].Luid}]
  02D: P      |50                  | PUSH EAX
  02E: hL...  |68(4C 01 00 00      | PUSH 'SeShutdownPrivilege' {TVDPowerManager.PowerManager{#$71}+332}
  033: j.     |6A 00               | PUSH $00
  035: Ë....  |E8(00 00 00 00      | CALL LookupPrivilegeValue{#$29}
  03A: «D$.....|C7 44 24 18 02 00 00 00| MOV DWORD PTR [ESP+24{tkp.Privileges[$00].Attributes}],$00000002
  042: «D$.....|C7 44 24 0C 01 00 00 00| MOV DWORD PTR [ESP+12{tkp.PrivilegeCount}],$00000001
  04A: çD$.   |8D 44 24 04         | LEA EAX,DWORD PTR [ESP+4{rl}]
  04E: P      |50                  | PUSH EAX
  04F: j.     |6A 00               | PUSH $00
  051: j.     |6A 00               | PUSH $00
  053: çD$.   |8D 44 24 18         | LEA EAX,DWORD PTR [ESP+24{tkp.Privileges[$00].Attributes}]
  057: P      |50                  | PUSH EAX
  058: j.     |6A 00               | PUSH $00
  05A: ãD$.   |8B 44 24 1C         | MOV EAX,DWORD PTR [ESP+28]
  05E: P      |50                  | PUSH EAX
  05F: Ë....  |E8(00 00 00 00      | CALL AdjustTokenPrivileges{#$2C}
  064: Ñ€     |84 DB               | TEST BL,BL
  066: u.     |75 11               | JNE +17; (0x79)
  068: Ä<$.   |80 3C 24 00         | CMP BYTE PTR [ESP{Force}],$00
  06C: u.     |75 0B               | JNE +11; (0x79)
  06E: j.     |6A 00               | PUSH $00
  070: j.     |6A 01               | PUSH $01
  072: Ë....  |E8(00 00 00 00      | CALL ExitWindowsEx{#$2D}
  077: Î.     |EB 13               | JMP +19; (0x8C)
  079: Ñ€     |84 DB               | TEST BL,BL
  07B: u.     |75 0F               | JNE +15; (0x8C)
  07D: Ä<$.   |80 3C 24 01         | CMP BYTE PTR [ESP{Force}],$01
  081: u.     |75 09               | JNE +9; (0x8C)
  083: j.     |6A 00               | PUSH $00
  085: j.     |6A 05               | PUSH $05
  087: Ë....  |E8(00 00 00 00      | CALL ExitWindowsEx{#$2D}
  08C: Ä˚.    |80 FB 01            | CMP BL,$01
  08F: u.     |75 11               | JNE +17; (0xA2)
  091: Ä<$.   |80 3C 24 00         | CMP BYTE PTR [ESP{Force}],$00
  095: u.     |75 0B               | JNE +11; (0xA2)
  097: j.     |6A 00               | PUSH $00
  099: j.     |6A 02               | PUSH $02
  09B: Ë....  |E8(00 00 00 00      | CALL ExitWindowsEx{#$2D}
  0A0: Î.     |EB 14               | JMP +20; (0xB6)
  0A2: Ä˚.    |80 FB 01            | CMP BL,$01
  0A5: u.     |75 0F               | JNE +15; (0xB6)
  0A7: Ä<$.   |80 3C 24 01         | CMP BYTE PTR [ESP{Force}],$01
  0AB: u.     |75 09               | JNE +9; (0xB6)
  0AD: j.     |6A 00               | PUSH $00
  0AF: j.     |6A 06               | PUSH $06
  0B1: Ë....  |E8(00 00 00 00      | CALL ExitWindowsEx{#$2D}
  0B6: Ä˚.    |80 FB 02            | CMP BL,$02
  0B9: u.     |75 11               | JNE +17; (0xCC)
  0BB: Ä<$.   |80 3C 24 00         | CMP BYTE PTR [ESP{Force}],$00
  0BF: u.     |75 0B               | JNE +11; (0xCC)
  0C1: j.     |6A 00               | PUSH $00
  0C3: j.     |6A 00               | PUSH $00
  0C5: Ë....  |E8(00 00 00 00      | CALL ExitWindowsEx{#$2D}
  0CA: Î.     |EB 14               | JMP +20; (0xE0)
  0CC: Ä˚.    |80 FB 02            | CMP BL,$02
  0CF: u.     |75 0F               | JNE +15; (0xE0)
  0D1: Ä<$.   |80 3C 24 01         | CMP BYTE PTR [ESP{Force}],$01
  0D5: u.     |75 09               | JNE +9; (0xE0)
  0D7: j.     |6A 00               | PUSH $00
  0D9: j.     |6A 04               | PUSH $04
  0DB: Ë....  |E8(00 00 00 00      | CALL ExitWindowsEx{#$2D}
  0E0: Ä˚.    |80 FB 03            | CMP BL,$03
  0E3: u$     |75 24               | JNE +36; (0x109)
  0E5: Ä<$.   |80 3C 24 01         | CMP BYTE PTR [ESP{Force}],$01
  0E9: u.     |75 1E               | JNE +30; (0x109)
  0EB: j.     |6A 02               | PUSH $02
  0ED: hpÒ..  |68 70 F1 00 00      | PUSH $0000F170
  0F2: h....  |68 12 01 00 00      | PUSH $00000112
  0F7: °....  |A1(00 00 00 00      | MOV EAX,DWORD PTR [Application{#$5}]
  0FC: ã.     |8B 00               | MOV EAX,DWORD PTR [EAX]
  0FE: ã@0    |8B 40 30            | MOV EAX,DWORD PTR [EAX+48]
  101: P      |50                  | PUSH EAX
  102: Ë....  |E8(00 00 00 00      | CALL SendMessage{#$32}
  107: Î'     |EB 27               | JMP +39; (0x130)
  109: Ä˚.    |80 FB 03            | CMP BL,$03
  10C: u"     |75 22               | JNE +34; (0x130)
  10E: Ä<$.   |80 3C 24 01         | CMP BYTE PTR [ESP{Force}],$01
  112: u.     |75 1C               | JNE +28; (0x130)
  114: j.     |6A 00               | PUSH $00
  116: hpÒ..  |68 70 F1 00 00      | PUSH $0000F170
  11B: h....  |68 12 01 00 00      | PUSH $00000112
  120: °....  |A1(00 00 00 00      | MOV EAX,DWORD PTR [Application{#$5}]
  125: ã.     |8B 00               | MOV EAX,DWORD PTR [EAX]
  127: ã@0    |8B 40 30            | MOV EAX,DWORD PTR [EAX+48]
  12A: P      |50                  | PUSH EAX
  12B: Ë....  |E8(00 00 00 00      | CALL SendMessage{#$32}
  130: Ä˚.    |80 FB 04            | CMP BL,$04
  133: u.     |75 0F               | JNE +15; (0x144)
  135: Ä<$.   |80 3C 24 01         | CMP BYTE PTR [ESP{Force}],$01
  139: u.     |75 09               | JNE +9; (0x144)
  13B: j.     |6A 00               | PUSH $00
  13D: j.     |6A 0D               | PUSH $0D
  13F: Ë....  |E8(00 00 00 00      | CALL ExitWindowsEx{#$2D}
  144: Éƒ.    |83 C4 1C            | ADD ESP{Force},28
  147: [      |5B                  | POP EBX
  148: √      |C3                  | RET NEAR
  149: ..     |00 00               | ADD BYTE PTR [EAX],AL
  14B: .Se    |00 53 65            | ADD BYTE PTR [EBX+101],DL
  14E: S      |53                  | PUSH EBX
  14F: hutdo  |68 75 74 64 6F      | PUSH $6F647475
  154: wn     |77 6E               | JA +110; (0x1C4)
  156: P      |50                  | PUSH EAX
  157: ri     |72 69               | JB +105; (0x1C2)
  159: vi     |76 69               | JBE +105; (0x1C4)
  15B: l      |6C                  | INSB 
  15C: e      |65                  | ?
  15D: g      |67                  | ?
  15E: e      |65                  | ?
  15F: .      |00                  | ?
end;

procedure Finalization;
begin
  00: U      [55                  | PUSH EBP
  01: ãÏ     |8B EC               | MOV EBP,ESP
  03: 3¿     |33 C0               | XOR EAX,EAX
  05: U      |55                  | PUSH EBP
  06: h%...  |68(25 00 00 00      | PUSH Finalization{#$78}+37
  0B: dˇ0    |64 FF 30            | PUSH DWORD PTR FS:[EAX]
  0E: dâ     |64 89 20            | MOV DWORD PTR FS:[EAX],ESP
  11: ˇ..... |FF 05(00 00 00 00   | INC DWORD PTR [_DV_2{#$61}]
  17: 3¿     |33 C0               | XOR EAX,EAX
  19: Z      |5A                  | POP EDX
  1A: Y      |59                  | POP ECX
  1B: Y      |59                  | POP ECX
  1C: dâ.    |64 89 10            | MOV DWORD PTR FS:[EAX],EDX
  1F: h,...  |68(2C 00 00 00      | PUSH Finalization{#$78}+44
  24: √      |C3                  | RET NEAR
  25: È....  |E9(00 00 00 00      | JMP @HandleFinally{#$46}
  2A: Î¯     |EB F8               | JMP -8; (0x24)
  2C: ]      |5D                  | POP EBP
  2D: √      |C3                  | RET NEAR
end;

procedure DalharPowerManager;
begin
  0: É-.....[83 2D(00 00 00 00 01| SUB DWORD PTR [_DV_2{#$61}],1
  7: √      |C3(                 | RET NEAR
end;

end.


