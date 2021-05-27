----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:52:09 04/19/2021 
-- Design Name: 
-- Module Name:    adder_4bit - Behavioral 
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

entity adder_4bit is
    Port ( I11 : in  STD_LOGIC_VECTOR (3 downto 0);
           I22 : in  STD_LOGIC_VECTOR (3 downto 0);
           X : out  STD_LOGIC_VECTOR (3 downto 0);
           Y : out  STD_LOGIC);
end adder_4bit;

architecture Behavioral of adder_4bit is

COMPONENT full_adder IS
	PORT( I1 : in  STD_LOGIC;
           I2 : in  STD_LOGIC;
           Z : in  STD_LOGIC;
           S : out  STD_LOGIC;
           C : out  STD_LOGIC);
END COMPONENT;
SIGNAL SIG: STD_LOGIC_VECTOR (3 downto 0);

begin
	
	FA0: full_adder 
		PORT MAP(I1=> I11(0), I2 => I22(0), Z => '0', C=> SIG(0), S=> X(0));  
	FA1: full_adder 
		PORT MAP(I1=> I11(1), I2 => I22(1), Z => SIG(0), C=> SIG(1), S=> X(1));  
	FA2: full_adder 
		PORT MAP(I1=> I11(2), I2 => I22(2), Z => SIG(1), C=> SIG(2), S=> X(2)); 
	FA3: full_adder 
		PORT MAP(I1=> I11(3), I2 => I22(3), Z => SIG(2), C=> SIG(3), S=> X(3));
	Y <= SIG(3);
end Behavioral;

