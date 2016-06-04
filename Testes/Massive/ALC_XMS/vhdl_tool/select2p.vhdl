library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY select2p IS
  PORT (
    INPUT  : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    STATE  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    RSTATE : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    RESET  : IN  STD_LOGIC;
    IN_DELAY  : IN  STD_LOGIC;
    OUT_DELAY : OUT STD_LOGIC
  );
END ENTITY select2p;

ARCHITECTURE ALC_XMS OF select2p IS

COMPONENT FGC_Block IS
  PORT (
    INPUT  : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC
  );
END COMPONENT;

COMPONENT NSTATE_Block IS
  PORT (
    INPUT  : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END COMPONENT;

COMPONENT OUT_Block IS
  PORT (
    INPUT  : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT D_Latch IS
  Port (
    EN : in  STD_LOGIC;
    D  : in  STD_LOGIC;
    Q  : out STD_LOGIC
  );
END COMPONENT;

  SIGNAL SSTATE : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL SNSTATE: STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL SLSTATE: STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL SSOUT  : STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL SOUT   : STD_LOGIC_VECTOR(1 DOWNTO 0);

BEGIN
B1: FGC_Block    PORT MAP(INPUT & SSTATE, OUT_DELAY);
B2: NSTATE_Block PORT MAP(INPUT & SSTATE, SNSTATE);
B3: OUT_Block    PORT MAP(INPUT & SSTATE, SOUT);
STT0: D_Latch    PORT MAP(IN_DELAY OR RESET, SLSTATE(0), SSTATE(0));
STT1: D_Latch    PORT MAP(IN_DELAY OR RESET, SLSTATE(1), SSTATE(1));
STT2: D_Latch    PORT MAP(IN_DELAY OR RESET, SLSTATE(2), SSTATE(2));
STT3: D_Latch    PORT MAP(IN_DELAY OR RESET, SLSTATE(3), SSTATE(3));
OUT0: D_Latch    PORT MAP(SSOUT(0) XOR SOUT(0), SOUT(0), SSOUT(0));
OUT1: D_Latch    PORT MAP(SSOUT(1) XOR SOUT(1), SOUT(1), SSOUT(1));
 
  PROCESS(INPUT, RSTATE, RESET, IN_DELAY)
  BEGIN
    OUTPUT <= SSOUT;
    IF (RESET = '1') THEN
      SLSTATE <= RSTATE;
    ELSE
      SLSTATE <= SNSTATE;
    END IF;
    STATE <= SSTATE;
  END PROCESS;
END ALC_XMS;
