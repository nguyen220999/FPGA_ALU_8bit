----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:24:13 04/15/2021 
-- Design Name: 
-- Module Name:    subtract_8high - Behavioral 
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

entity subtract_8bit is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0);
			  X : out STD_LOGIC);
end subtract_8bit;

architecture Behavioral of subtract_8bit is
COMPONENT full_adder is
	PORT (I1,I2, Z: in STD_LOGIC;
			C,S: out STD_LOGIC);
END COMPONENT;

SIGNAL SIG: STD_LOGIC_VECTOR (7 downto 0);
SIGNAL B_N: STD_LOGIC_VECTOR (7 downto 0);


begin
	
	B_N <= NOT B;
	FA0:full_adder
		PORT MAP (I1=>A(0), I2=>B_N(0), Z => '1', C=> SIG(0), S=> Y(0)); 
	FA1:full_adder
		PORT MAP (I1=>A(1), I2=>B_N(1), Z => SIG(0), C=> SIG(1), S=> Y(1));
	FA2:full_adder
		PORT MAP (I1=>A(2), I2=>B_N(2), Z => SIG(1), C=> SIG(2), S=> Y(2));
	FA3:full_adder
		PORT MAP (I1=>A(3), I2=>B_N(3), Z => SIG(2), C=> SIG(3), S=> Y(3));
	FA4:full_adder
		PORT MAP (I1=>A(4), I2=>B_N(4), Z => SIG(3), C=> SIG(4), S=> Y(4));
	FA5:full_adder
		PORT MAP (I1=>A(5), I2=>B_N(5), Z => SIG(4), C=> SIG(5), S=> Y(5));
	FA6:full_adder
		PORT MAP (I1=>A(6), I2=>B_N(6), Z => SIG(5), C=> SIG(6), S=> Y(6));
	FA7:full_adder
		PORT MAP (I1=>A(7), I2=>B_N(7), Z => SIG(6), C=> SIG(7), S=> Y(7));	
	X <= SIG(7);
		
end Behavioral;

