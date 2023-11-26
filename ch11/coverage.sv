`ifndef COVERAGE__SV //避免重載
`define COVERAGE__SV

class Coverage;
    bit [1:0] src;
    bit [NumTx-1:0] fwd;

    covergroup CG_Forward;
        coverpoint src {
            bins src[] = {[0:3]};
            option.weight = 0;
        }
        coverpoint fwd {
            bins fwd[] = {[1:15]}; //忽略 fwd=0
            option.weight = 0;
        }
        cross src, fwd;
    endgroup:CG_Forward

    function new;
        CG_Forward = new; //實例化covergroup
    endfunction:new

    //sample input data
    function void sample(input bit [1:0] src,
                        input bit [NumTx-1:0] fwd);
        $display("@%0t: Coverage: src=%d. FWD=%b", $time, src, fwd);
        this.src = src;
        this.fwd = fwd;
        CG_Forward.sample(); //covergroup.sample()
    endfunction:sample

endclass:Coverage

`endif //COVERAGE__SV