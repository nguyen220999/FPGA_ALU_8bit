----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:15:24 04/16/2021 
-- Design Name: 
-- Module Name:    compare_8high - Behavioral 
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

entity compare_8bit is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           result : buffer  STD_LOGIC_VECTOR (3 downto 0));
end compare_8bit;

architecture Behavioral of compare_8bit is
SIGNAL X: STD_LOGIC_VECTOR(7 downto 0);
COMPONENT compare_4bit IS
	PORT ( A1 : in  STD_LOGIC_VECTOR (3 downto 0);
          B1 : in  STD_LOGIC_VECTOR (3 downto 0);
          C1 : buffer  STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT;

begin
	CO4_0: compare_4bit 
		PORT MAP (A1=>A(7 downto 4),B1=> B(7 downto 4),C1=>X(7 downto 4));
	CO4_1: compare_4bit 
		PORT MAP (A1=>A(3 downto 0),B1=> B(3 downto 0),C1=>X(3 downto 0));
	
	result(3)<= X(7) AND X(3); --I1=I2
	result(2)<= result(1) NOR result(3);
	result(1) <= X(5) or (X(7) and X(1)); --I1<I2
	result(0)<='0';
	
	
end Behavioral;

