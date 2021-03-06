library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY re_setup_SYNC_Block IS
  PORT (
    INPUT : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    OUTPUT: OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
  );
END re_setup_SYNC_Block;

ARCHITECTURE version OF re_setup_SYNC_Block IS
BEGIN
  PROCESS(INPUT)
  BEGIN
     if std_match(INPUT, "1001") then OUTPUT <= "-1-";
     elsif std_match(INPUT, "-000") then OUTPUT <= "--1";
     elsif std_match(INPUT, "11--") then OUTPUT <= "--1";
     elsif std_match(INPUT, "-01-") then OUTPUT <= "1--";
     elsif std_match(INPUT, "-0-1") then OUTPUT <= "1--";
     elsif std_match(INPUT, "0001") then OUTPUT <= "-00";
     elsif std_match(INPUT, "0101") then OUTPUT <= "000";
     elsif std_match(INPUT, "0100") then OUTPUT <= "000";
     elsif std_match(INPUT, "1001") then OUTPUT <= "--0";
     elsif std_match(INPUT, "1000") then OUTPUT <= "00-";
     elsif std_match(INPUT, "1011") then OUTPUT <= "-00";
     elsif std_match(INPUT, "1010") then OUTPUT <= "-00";
     elsif std_match(INPUT, "1101") then OUTPUT <= "00-";
     elsif std_match(INPUT, "1100") then OUTPUT <= "00-";
     elsif std_match(INPUT, "1110") then OUTPUT <= "00-";
     else OUTPUT <= "---";
    END if;

  END PROCESS;
END version;
