library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY NSTATE_Block IS
  PORT (
    INPUT : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
    OUTPUT: OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END NSTATE_Block;

ARCHITECTURE version OF NSTATE_Block IS
BEGIN
  PROCESS(INPUT)
  BEGIN
     if std_match(INPUT, "00001") then OUTPUT <= "1";
     elsif std_match(INPUT, "00000") then OUTPUT <= "0";
     elsif std_match(INPUT, "00011") then OUTPUT <= "0";
     elsif std_match(INPUT, "00010") then OUTPUT <= "0";
     elsif std_match(INPUT, "00101") then OUTPUT <= "0";
     elsif std_match(INPUT, "00100") then OUTPUT <= "0";
     elsif std_match(INPUT, "01001") then OUTPUT <= "1";
     elsif std_match(INPUT, "10001") then OUTPUT <= "1";
     elsif std_match(INPUT, "10000") then OUTPUT <= "1";
     elsif std_match(INPUT, "10011") then OUTPUT <= "1";
     elsif std_match(INPUT, "10101") then OUTPUT <= "1";
     elsif std_match(INPUT, "10100") then OUTPUT <= "1";
     elsif std_match(INPUT, "11001") then OUTPUT <= "1";
     else OUTPUT <= "-";
    END if;

  END PROCESS;
END version;
