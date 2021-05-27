----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:52:31 04/18/2021 
-- Design Name: 
-- Module Name:    multiplier_8bit - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplier_8bit is
    Port ( A1 : in  STD_LOGIC_VECTOR (7 downto 0);
           B1 : in  STD_LOGIC_VECTOR (7 downto 0);
           multi : out  STD_LOGIC_VECTOR (15 downto 0));
end multiplier_8bit;

architecture Behavioral of multiplier_8bit is

COMPONENT adder_8bit IS
	PORT ( A : in  STD_LOGIC_VECTOR (7 downto 0);
          B : in  STD_LOGIC_VECTOR (7 downto 0);
          Y : out STD_LOGIC_VECTOR (7 downto 0);
			 X : out STD_LOGIC);
END COMPONENT;

COMPONENT multiplier_4bit IS
	PORT (I1 : in  STD_LOGIC_VECTOR (3 downto 0);
         I2 : in  STD_LOGIC_VECTOR (3 downto 0);
         X1 : out  STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;
			
		 
SIGNAL buf0: STD_LOGIC_VECTOR(7 downto 0);
SIGNAL buf1: STD_LOGIC_VECTOR(7 downto 0);
SIGNAL buf2: STD_LOGIC_VECTOR(7 downto 0);
SIGNAL buf3: STD_LOGIC_VECTOR(7 downto 0);

SIGNAL buf0_1: STD_LOGIC_VECTOR(7 downto 0);
SIGNAL buf1_1: STD_LOGIC_VECTOR(7 downto 0);
SIGNAL buf0_2: STD_LOGIC_VECTOR(7 downto 0);
SIGNAL buf1_2: STD_LOGIC_VECTOR(7 downto 0); -- buf 1 tang 2

SIGNAL CARRY: STD_LOGIC_VECTOR(2 downto 0);

begin
	M4_0: multiplier_4bit
		PORT MAP(I1=> A1(3 downto 0), I2 => B1(3 downto 0), X1 => buf0);
		
	M4_1: multiplier_4bit
		PORT MAP(I1=> A1(7 downto 4), I2 => B1(3 downto 0), X1 => buf1);
		
	M4_2: multiplier_4bit
		PORT MAP(I1=> A1(3 downto 0), I2 => B1(7 downto 4), X1 => buf2);
		
	M4_3: multiplier_4bit
		PORT MAP(I1=> A1(7 downto 4), I2 => B1(7 downto 4), X1 => buf3);
		
	A8_0: adder_8bit
		PORT MAP( A=>buf1 ,B=> buf2,Y=>buf0_1, X=>CARRY(0) );
		
	buf1_1 <= buf0(7 downto 4) &"0000";
	
	A8_1: adder_8bit
		PORT MAP( A=>buf0_1 ,B=> buf1_1,Y=>buf0_2, X=>CARRY(1) );
	
	buf1_2 <= CARRY(0) & buf0_2(7 downto 4) & "000";
	
	A8_2: adder_8bit
		PORT MAP( A=>buf3 ,B=> buf1_2,Y=>multi(15 downto 8), X=>CARRY(2) );
	
	
	multi(7 downto 4) <= buf0_2( 3 downto 0);
	multi(3 downto 0) <= buf0(3 downto 0);
	
	
		

end Behavioral;

