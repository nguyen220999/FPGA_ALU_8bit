----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:00:39 04/16/2021 
-- Design Name: 
-- Module Name:    ALU_8bit - Behavioral 
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

entity ALU_8bit is
    Port ( INPUT1 : in  STD_LOGIC_VECTOR (7 downto 0);
           INPUT2 : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL : in  STD_LOGIC_VECTOR (2 downto 0);
			  OUTPUT: out  STD_LOGIC_VECTOR (15 downto 0);
           CARRY : out  STD_LOGIC  );
end ALU_8bit;

architecture Behavioral of ALU_8bit is

component subtract_8bit is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0);
			  X : out STD_LOGIC);
end component;

component adder_8bit is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0);
			  X : out STD_LOGIC);
end component;

component compare_8bit is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           result : buffer  STD_LOGIC_VECTOR (3 downto 0));
end component;

COMPONENT multiplier_8bit is
    Port ( A1 : in  STD_LOGIC_VECTOR (7 downto 0);
           B1 : in  STD_LOGIC_VECTOR (7 downto 0);
           multi : out  STD_LOGIC_VECTOR (15 downto 0));
end COMPONENT;

signal OUTPUT1, OUTPUT2, OUTPUT5, OUTPUT6, OUTPUT7 : STD_LOGIC_VECTOR (7 downto 0);
signal CARRY1, CARRY2 : STD_LOGIC;
SIGNAL OUTPUT4: STD_LOGIC_VECTOR (15 downto 0);
SIGNAL OUTPUT3: STD_LOGIC_VECTOR (3 downto 0);


begin

	subtract: subtract_8bit
		PORT MAP(A => INPUT1, B=> INPUT2, Y => OUTPUT1, X => CARRY1);
	adder: adder_8bit
		PORT MAP( A => INPUT1, B=> INPUT2, Y => OUTPUT2, X => CARRY2 );
	
	compare: compare_8bit
		PORT MAP( A => INPUT1, B=> INPUT2, result => OUTPUT3 );
		
	multiplier: multiplier_8bit
		PORT MAP( A1=> INPUT1,B1 => INPUT2, multi => OUTPUT4 );
	
	output5 <= INPUT1 AND INPUT2;
	OUTPUT6 <= INPUT1 OR INPUT2;
	OUTPUT7 <= INPUT1 XOR INPUT2;
	
	PROCESS(SEL, OUTPUT1, OUTPUT2, OUTPUT3, OUTPUT4, OUTPUT5, OUTPUT6, OUTPUT7 )
	BEGIN
		CASE SEL IS 
				WHEN "000" => OUTPUT <= "00000000" & OUTPUT1;
				WHEN "001" => OUTPUT <= "00000000" & OUTPUT2;
				WHEN "010" => OUTPUT <= "000000000000" & OUTPUT3;
				WHEN "011" => OUTPUT <=  OUTPUT4;
				WHEN "100" => OUTPUT <= "00000000" & OUTPUT5;
				WHEN "101" => OUTPUT <= "00000000" & OUTPUT6;
				WHEN "110" => OUTPUT <= "00000000" & OUTPUT7;
				WHEN OTHERS => OUTPUT <= "0000000000000000";
				
		END CASE;
	END PROCESS;
	CARRY <= CARRY1 XOR CARRY2;
end Behavioral;

