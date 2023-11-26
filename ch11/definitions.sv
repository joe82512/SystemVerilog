`ifndef _INCL_DEFINITIONS //避免重載
`define _INCL_DEFINITIONS

//cell config
typedef struct packed {
    bit [`TxPorts-1:0] FWD;
    bit [11:0] VPI;
} CellCfgType;

//UNI cell -> ATMCellType
typedef struct packed {
    bit        [ 3:0] GFC;
    bit        [ 7:0] VPI;
    bit        [15:0] VCI;
    bit               CLP;
    bit        [ 2:0] PT;
    bit        [ 7:0] HEC;
    bit [0:47] [ 7:0] Payload;
} uniType;

//NNI cell -> ATMCellType
typedef struct packed {
    bit        [11:0] VPI; //GFC+VCI
    bit        [15:0] VCI;
    bit               CLP;
    bit        [ 2:0] PT;
    bit        [ 7:0] HEC;
    bit [0:47] [ 7:0] Payload;
} nniType;

//ATM cell
typedef union packed {
    uniType uni;
    nniType nni;
    bit [0:52] [7:0] Mem;
} ATMCellType;

`endif // _INCL_DEFINITIONS