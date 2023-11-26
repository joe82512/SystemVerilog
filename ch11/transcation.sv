`ifndef TRANSCATION__SV //避免重載
`define TRANSCATION__SV

`include "definitions.sv"

//==================== class ===================
virtual class BaseTr;
    static int count; //靜態變數
    int id;

    function new();
        id = count++;
    endfunction

    pure virtual function bit compare(input BaseTr to);
    pure virtual function BaseTr copy(input BaseTr to = null);
    pure virtual function void display(input string prefix="");
endclass:BaseTr

typedef class NNI_cell;
typedef class UNI_cell;

class UNI_cell extends BaseTr;
    //physical field
    rand bit        [ 3:0] GFC;
    rand bit        [ 7:0] VPI;
    rand bit        [15:0] VCI;
    rand bit               CLP;
    rand bit        [ 2:0] PT;
         bit        [ 7:0] HEC;
    rand bit [0:47] [ 7:0] Payload;
    //data field
    static bit [7:0] syndrome[0:255];
    static bit syndrome_not_generated = 1;

    extern function new();
    extern function void post_randomize();
    extern virtual function bit compare(input BaseTr to);
    extern virtual function void display(input string prefix="");
    extern virtual function void copy_data(input UNI_cell copy);
    extern virtual function BaseTr copy(input BaseTr to=null);
    extern virtual function void pack(output ATMCellType to);
    extern virtual function void unpack(input ATMCellType from);
    extern function NNI_cell to_NNI();
    extern function void generate_syndrome();
    extern function bit[7:0] hec (bit[31:0] hdr);
endclass:UNI_cell

//NNI與UNI類似, 除了GFC跟轉換to_NNI()
 class NNI_cell extends BaseTr;
    //physical field
    rand bit        [11:0] VPI; //GFC+VPI
    rand bit        [15:0] VCI;
    rand bit               CLP;
    rand bit        [ 2:0] PT;
         bit        [ 7:0] HEC;
    rand bit [0:47] [ 7:0] Payload;
    //data field
    static bit [7:0] syndrome[0:255];
    static bit syndrome_not_generated = 1;

    extern function new();
    extern function void post_randomize();
    extern virtual function bit compare(input BaseTr to);
    extern virtual function void display(input string prefix="");
    extern virtual function void copy_data(input NNI_cell copy);
    extern virtual function BaseTr copy(input BaseTr to=null);
    extern virtual function void pack(output ATMCellType to);
    extern virtual function void unpack(input ATMCellType from);
    // extern function NNI_cell to_NNI();
    extern function void generate_syndrome();
    extern function bit [7:0] hec (bit [31:0] hdr);
endclass:NNI_cell


//==================== function ====================
//=== UNI_cell ===
//建構子
function UNI_cell::new();
    if (syndrome_not_generated)
        generate_syndrome();
endfunction:new

//確定數據後計算HEC
function void UNI_cell::post_randomize();
    HEC = hec({GFC, VPI, VCI, CLP, PT});
endfunction:post_randomize

//和其他cell比較, 並返回不匹配的field
function bit UNI_cell::compare(input BaseTr to);
    UNI_cell other;
    $cast(other, to);
    if (this.GFC != other.GFC)         return 0;
    if (this.VPI != other.VPI)         return 0;
    if (this.VCI != other.VCI)         return 0;
    if (this.CLP != other.CLP)         return 0;
    if (this.PT  != other.PT)          return 0;
    if (this.HEC != other.HEC)         return 0;
    if (this.Payload != other.Payload) return 0;
                                       return 1;
endfunction:compare

//輸出cell各field的內容
function void UNI_cell::display(input string prefix);
    ATMCellType p;

    $display("%sUNI id:%0d GFC=%x, VPI=%x, VCI=%x, CLP=%b, PT=%x, HEC=%x, Payload[0]=%x",
	        prefix, id, GFC, VPI, VCI, CLP, PT, HEC, Payload[0]);
    this.pack(p);
    $write("%s", prefix);
    foreach (p.Mem[i])
        $write("%x ", p.Mem[i]);
    $display;
endfunction:display

//複製 data field
function void UNI_cell::copy_data(input UNI_cell copy);
    copy.GFC     = this.GFC;
    copy.VPI     = this.VPI;
    copy.VCI     = this.VCI;
    copy.CLP     = this.CLP;
    copy.PT      = this.PT;
    copy.HEC     = this.HEC;
    copy.Payload = this.Payload;
endfunction:copy_data

//複製 object
function BaseTr UNI_cell::copy(input BaseTr to);
    UNI_cell dst;
    if (to==null) dst = new();
    else          $cast(dst, to);
    copy_data(dst);
    return dst;
endfunction:copy

//打包, object->uni
function void UNI_cell::pack(output ATMCellType to);
    to.uni.GFC     = this.GFC;
    to.uni.VPI     = this.VPI;
    to.uni.VCI     = this.VCI;
    to.uni.CLP     = this.CLP;
    to.uni.PT      = this.PT;
    to.uni.HEC     = this.HEC;
    to.uni.Payload = this.Payload;
endfunction:pack

//解包, uni->object
function void UNI_cell::unpack(input ATMCellType from);
    this.GFC     = from.uni.GFC;
    this.VPI     = from.uni.VPI;
    this.VCI     = from.uni.VCI;
    this.CLP     = from.uni.CLP;
    this.PT      = from.uni.PT;
    this.HEC     = from.uni.HEC;
    this.Payload = from.uni.Payload;
endfunction:unpack

//UNI 轉 NNI
function NNI_cell UNI_cell::to_NNI();
    NNI_cell copy;
    copy = new();
    copy.VPI     = this.VPI;   // UNI[7:0], NNI[11:0]
    copy.VCI     = this.VCI;
    copy.CLP     = this.CLP;
    copy.PT      = this.PT;
    copy.HEC     = this.HEC;
    copy.Payload = this.Payload;
    return copy;
endfunction : to_NNI

//產生矩陣syndrome, 用於計算 HEC
function void UNI_cell::generate_syndrome();
    bit [7:0] sndrm;
    for (int i=0; i<256; i=i+1) begin
        sndrm = i;
        repeat(8) begin
            if (sndrm[7] === 1'b1) sndrm = (sndrm << 1) ^ 8'h07;
            else                   sndrm = sndrm << 1;
        end
        syndrome[i] = sndrm;
    end
    syndrome_not_generated = 0;
endfunction:generate_syndrome

//計算 HEC
function bit [7:0] UNI_cell::hec (bit [31:0] hdr);
    hec = 8'h00;
    repeat(4) begin
        hec = syndrome[hec ^ hdr[31:24]];
        hdr = hdr << 8;
    end
    hec = hec ^ 8'h55;
endfunction:hec


//=== NNI_cell ===
function NNI_cell::new();
    if (syndrome_not_generated)
        generate_syndrome();
endfunction:new

function void NNI_cell::post_randomize();
    HEC = hec({VPI, VCI, CLP, PT}); //無GFC
endfunction:post_randomize

function bit NNI_cell::compare(input BaseTr to);
    NNI_cell other;
    $cast(other, to);
    if (this.VPI != other.VPI)         return 0;
    if (this.VCI != other.VCI)         return 0;
    if (this.CLP != other.CLP)         return 0;
    if (this.PT  != other.PT)          return 0;
    if (this.HEC != other.HEC)         return 0;
    if (this.Payload != other.Payload) return 0;
                                       return 1;
endfunction:compare

function void NNI_cell::display(input string prefix);
    ATMCellType p;

    $display("%sNNI id:%0d VPI=%x, VCI=%x, CLP=%b, PT=%x, HEC=%x, Payload[0]=%x",
            prefix, id, VPI, VCI, CLP, PT, HEC, Payload[0]);
    this.pack(p);
    $write("%s", prefix);
    foreach (p.Mem[i])
        $write("%x ", p.Mem[i]);
    $display;
endfunction:display

function void NNI_cell::copy_data(input NNI_cell copy);
    copy.VPI     = this.VPI;
    copy.VCI     = this.VCI;
    copy.CLP     = this.CLP;
    copy.PT      = this.PT;
    copy.HEC     = this.HEC;
    copy.Payload = this.Payload;
endfunction : copy_data

function BaseTr NNI_cell::copy(input BaseTr to);
   NNI_cell dst;
   if (to == null) dst = new();
   else            $cast(dst, to);
   copy_data(dst);
   return dst;
endfunction:copy

function void NNI_cell::pack(output ATMCellType to);
   to.nni.VPI     = this.VPI;
   to.nni.VCI     = this.VCI;
   to.nni.CLP     = this.CLP;
   to.nni.PT      = this.PT;
   to.nni.HEC     = this.HEC;
   to.nni.Payload = this.Payload;
endfunction:pack

function void NNI_cell::unpack(input ATMCellType from);
   this.VPI     = from.nni.VPI;
   this.VCI     = from.nni.VCI;
   this.CLP     = from.nni.CLP;
   this.PT      = from.nni.PT;
   this.HEC     = from.nni.HEC;
   this.Payload = from.nni.Payload;
endfunction:unpack

function void NNI_cell::generate_syndrome();
    bit [7:0] sndrm;
    for (int i=0; i<256; i=i+1) begin
        sndrm = i;
        repeat(8) begin
            if (sndrm[7] === 1'b1) sndrm = (sndrm << 1) ^ 8'h07;
            else                   sndrm = sndrm << 1;
        end
        syndrome[i] = sndrm;
    end
    syndrome_not_generated = 0;
endfunction:generate_syndrome

function bit [7:0] NNI_cell::hec (bit [31:0] hdr);
    hec = 8'h00;
    repeat (4) begin
        hec = syndrome[hec ^ hdr[31:24]];
        hdr = hdr << 8;
    end
    hec = hec ^ 8'h55;
endfunction:hec

`endif //TRANSCATION__SV