// Code your design here

/* 引數的多型: 能緩解覆寫func的限制 */

//ex8.34
class IntStack;
local int stack[100];
local int top;

function void push(int i);
  stack[++top] = i;
endfunction:push

function int pop();
  return stack[top--];
endfunction
endclass:IntStack

//ex8.35
class Stack #(type T=int);
local T stack[100];
local int top;

function void push(T i);
  stack[++top] = i;
endfunction:push

function T pop();
  return stack[top--];
endfunction
endclass:Stack

//ex8.36
program automatic test;
initial begin
  Stack #(real) rStack;

  rStack = new();
  for (int i=0; i<5; i++)
    rStack.push(i*20);

  for (int i=0; i<5; i++)
    $display("%f", rStack.pop());
end
endprogram

/*
  80.000000
  60.000000
  40.000000
  20.000000
  0.000000
*/