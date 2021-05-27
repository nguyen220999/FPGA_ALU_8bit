----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:55:13 04/17/2021 
-- Design Name: 
-- Module Name:    compare_1bit - Behavioral 
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

entity compare_1bit is
    Port ( I1 : in  STD_LOGIC;
           I2 : in  STD_LOGIC;
           RE : out  STD_LOGIC_VECTOR (2 downto 0));
end compare_1bit;

architecture Behavioral of compare_1bit is

begin
	RE(0)<= I2 AND (NOT I1);
	RE(1)<= (I2 AND (NOT I1)) NOR(I1 AND (NOT I2));
	RE(2)<=I1 AND (NOT I2); --A>B
end Behavioral;

