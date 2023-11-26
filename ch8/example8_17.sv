// Code your design here

/*
  引用類別: 缺點是依賴關係, 必須等kind值確定, vlan_h才能實例化, 才能隨機化
  繼承類別: 缺點是不能跨類別施加約束, 且不支持多繼承
  統一不分層: 缺點是可讀性低, 重用性低
  
  ---> 應該在class中定義典型的行為和約束, 測試時用繼承改寫 !!!
*/

//ex8.17
class Vlan_h;
  rand bit [15:0] vlan;
endclass

class EthMacFrame_composition;
  typedef enum {II, IEEE} kind_e;
  rand kind_e kind;
  rand bit [47:0] da, sa;
  rand bit [15:0] len;
  // ...
  rand Vlan_h vlan_h;
endclass


//ex8.18
class EthMacFrame_inheritance;
  typedef enum {II, IEEE} kind_e;
  rand kind_e kind;
  rand bit [47:0] da, sa;
  rand bit [15:0] len;
  // ...
endclass

class Vlan extends EthMacFrame_inheritance;
  rand bit [15:0] vlan;
endclass


//ex8.19
class eth_mac_frame;
  typedef enum {II, IEEE} kind_e;
  rand kind_e kind;
  rand bit [47:0] da, sa;
  rand bit [15:0] len, vlan;
  rand bit data[]; //vector
  // ...
  constraint eth_mac_frame_II {
    if (kind == II) { //不用begin..end
      data.size() inside {[46:1500]};
      len == data.size();
  	}
  }
  constraint eth_mac_frame_ieee {
    if (kind == IEEE) {
      data.size() inside {[46:1500]};
      len < 1522;
  	}
  }
endclass