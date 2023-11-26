// Code your design here
module my_hashmap;
  
initial begin
  
  int aa[int]; //hashmap
  int rand_idx, element, count=0, idx=1;
  
  // create aa{int:int}
  repeat(10) begin
    aa[idx] = idx;
    idx = idx << 1;
    end
  
  // get random
  //element = 4; // 1->2->4->8->[16]->...
  element = $urandom_range(aa.size()-1);
  
  foreach (aa[i]) begin
    if (count++ == element) begin //search 第n個 element
      rand_idx = i;
      break;
    end
  end

  $display("%0d element aa[%0d]=%0d", element, rand_idx, aa[rand_idx]);
  
end

endmodule