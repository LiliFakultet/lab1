----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:22:08 02/28/2019 
-- Design Name: 
-- Module Name:    clk_counter - Behavioral 
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

entity clk_counter is
    Port ( clk_i : in  STD_LOGIC;
           rst_i : in  STD_LOGIC;
           cnt_en_i : in  STD_LOGIC;
           cnt_rst_i : in  STD_LOGIC;
           one_sec_o : out  STD_LOGIC);
end clk_counter;

architecture Behavioral of clk_counter is

begin


end Behavioral;

