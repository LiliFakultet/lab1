-------------------------------------------------------------------------------
--  Odsek za racunarsku tehniku i medjuracunarske komunikacije
--  Autor: LPRS2  <lprs2@rt-rk.com>                                           
--                                                                             
--  Ime modula: timer_counter                                                          
--                                                                             
--  Opis:                                                               
--                                                                             
--    Modul odogvaran za indikaciju o proteku sekunde
--                                                                             
-------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY clk_counter IS GENERIC(
                              -- maksimalna vrednost broja do kojeg brojac broji
                              max_cnt : STD_LOGIC_VECTOR(25 DOWNTO 0) := "10111110101111000010000000" -- 50 000 000
                             );
                      PORT   (
                               clk_i     : IN  STD_LOGIC; -- ulazni takt
                               rst_i     : IN  STD_LOGIC; -- reset signal
                               cnt_en_i  : IN  STD_LOGIC; -- signal dozvole brojanja
                               cnt_rst_i : IN  STD_LOGIC; -- signal resetovanja brojaca (clear signal)
                               one_sec_o : OUT STD_LOGIC  -- izlaz koji predstavlja proteklu jednu sekundu vremena
                             );
END clk_counter;

ARCHITECTURE rtl OF clk_counter IS

SIGNAL   counter_r : STD_LOGIC_VECTOR(25 DOWNTO 0);
SIGNAL	one_sec   : STD_LOGIC;

BEGIN

	process (clk_i) begin
		if (rising_edge(clk_i)) then
			if (rst_i = '1') then
				counter_r <= (others => '0');
				one_sec <= '0';
			else
				if (cnt_rst_i = '1') then
					counter_r <= (others => '0');
					one_sec <= '0';
				elsif (cnt_en_i = '1') then
					if (counter_r = max_cnt - 1) then
						counter_r <= (others => '0');
						one_sec <= '1';
					else
						counter_r <= counter_r + '1';
						one_sec <= '0';
					end if;
				end if;
			end if;
		end if;
	end process;
	
	one_sec_o <= one_sec;

-- DODATI:
-- brojac koji kada izbroji dovoljan broj taktova generise SIGNAL one_sec_o koji
-- predstavlja jednu proteklu sekundu, brojac se nulira nakon toga


END rtl;