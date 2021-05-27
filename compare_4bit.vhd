----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:51:12 04/17/2021 
-- Design Name: 
-- Module Name:    compare_4bit - Behavioral 
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

entity compare_4bit is
    Port ( A1 : in  STD_LOGIC_VECTOR (3 downto 0);
           B1 : in  STD_LOGIC_VECTOR (3 downto 0);
           C1 : buffer  STD_LOGIC_VECTOR (3 downto 0));
end compare_4bit;

architecture Behavioral of compare_4bit is

SIGNAL RES0: STD_LOGIC_VECTOR(2 downto 0);
SIGNAL RES1: STD_LOGIC_VECTOR(2 downto 0);
SIGNAL RES2: STD_LOGIC_VECTOR(2 downto 0);
SIGNAL RES3: STD_LOGIC_VECTOR(2 downto 0);

COMPONENT compare_1bit is
	PORT( I1: in STD_LOGIC;
			I2: in STD_LOGIC;
			RE: out STD_LOGIC_VECTOR(2 downto 0));
END COMPONENT;
begin
	CO0: compare_1bit
		PORT MAP(I1=>A1(0), I2=>B1(0),RE=>RES0);
	CO1: compare_1bit
		PORT MAP(I1=>A1(1), I2=>B1(1),RE=>RES1);
	CO2: compare_1bit
		PORT MAP(I1=>A1(2), I2=>B1(2),RE=>RES2);
	CO3: compare_1bit
		PORT MAP(I1=>A1(3), I2=>B1(3),RE=>RES3);
		
	C1(3)<= RES0(1) AND RES1(1) AND RES2(1) AND RES3(1); --A=B
	C1(2)<= RES3(2) OR (RES3(1) AND RES2(2)) OR (RES3(1) AND RES2(1) AND RES1(2)) OR (RES3(1) AND RES2(1) AND RES1(1) AND RES0(2));  --A>B
	C1(1)<= C1(3) NOR C1(2); --A<B
	C1(0) <='0';
end Behavioral;

