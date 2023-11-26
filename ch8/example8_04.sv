// Code your design here

/*
  new()的繼承
  (1)不能有virtual
  (2)super必須在第一行
*/

class Base1;
  int vars; //var 在VCS是關鍵字,誤用
  function new(int vars); // Constructor with an argument
    this.vars = vars;
  endfunction
endclass

class Extended extends Base1;
  function new(int vars);
    super.new(vars); // Must be first line of new !!!
    // ...
  endfunction
endclass