----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:49:33 04/19/2021 
-- Design Name: 
-- Module Name:    multiplier_4bit - Behavioral 
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

entity multiplier_4bit is
    Port ( I1 : in  STD_LOGIC_VECTOR (3 downto 0);
           I2 : in  STD_LOGIC_VECTOR (3 downto 0);
           X1 : out  STD_LOGIC_VECTOR (7 downto 0));
end multiplier_4bit;

architecture Behavioral of multiplier_4bit is

COMPONENT adder_4bit IS
	PORT (I11 : in  STD_LOGIC_VECTOR (3 downto 0);
         I22 : in  STD_LOGIC_VECTOR (3 downto 0);
         X : out  STD_LOGIC_VECTOR (3 downto 0);
         Y : out  STD_LOGIC);
END COMPONENT;

SIGNAL buff0: STD_LOGIC_VECTOR ( 8 downto 0);
SIGNAL buff1: STD_LOGIC_VECTOR ( 8 downto 0);
SIGNAL buff2: STD_LOGIC_VECTOR ( 8 downto 0);	
		  
begin
		buff0(3) <= I2(0) AND I1(3);
		buff0(2) <= I2(0) AND I1(2);
		buff0(1) <= I2(0) AND I1(1);
		buff0(0) <= I2(0) AND I1(0);
		

		
		buff0(8) <= I2(1) AND I1(3);
		buff0(7) <= I2(1) AND I1(2);
		buff0(6) <= I2(1) AND I1(1);
		buff0(5) <= I2(1) AND I1(0);
		buff0(4) <= '0';
		
		FA0: adder_4bit 
			PORT MAP( I11 => buff0(8 downto 5), I22=> buff0( 4 downto 1), X =>buff1(3 downto 0), Y=>buff1(4));
		
		
		buff1(8) <= I2(2) AND I1(3);
		buff1(7) <= I2(2) AND I1(2);
		buff1(6) <= I2(2) AND I1(1);
		buff1(5) <= I2(2) AND I1(0);

		FA1: adder_4bit 
			PORT MAP( I11 => buff1(8 downto 5), I22=> buff1( 4 downto 1), X =>buff2(3 downto 0), Y=>buff2(4));
		
		
		buff2(8) <= I2(3) AND I1(3);
		buff2(7) <= I2(3) AND I1(2);
		buff2(6) <= I2(3) AND I1(1);
		buff2(5) <= I2(3) AND I1(0);
		
		FA2: adder_4bit 
			PORT MAP( I11 => buff2(8 downto 5), I22=> buff2( 4 downto 1), X =>X1(6 downto 3), Y=>X1(7));
		
		X1(2) <= buff2(0);
		X1(1) <= buff1(0);
		X1(0) <= buff0(0);
		
			

end Behavioral;

