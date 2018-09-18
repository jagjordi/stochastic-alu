library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity LFSR  is
        generic
    (
        size : integer :=20;
        feedback : integer := 22;
        seed: integer := 121
    );
    port
    (
        cells : out std_logic_vector(size-1 downto 0);
        clk, rst : in std_logic;
    );
end LFSR;

architecture behaviour of LFSR is
        signal feedback_vector : std_logic_vector(size-1 downto 0);
    
begin
        feedback_vector <= std_logic_vector(to_unsigned(feedback, feedback'size));
    cells <= std_logic_vector(to_unsigned(seed, cells'size));
    
    pr : process(clk, rst)
    begin
        if (rst=1) then
            cells <= std_logic_vector(to_unsigned(seed, cells'size));
        elsif rising_edge(clk) then
            conections: for i in 1 to size-2 loop
                if (feedback_vector(i) = 1) then
                    cells(i-1) <= cells(i) XOR cells(0);
                else
                    cells(i-1) <= cells(i);
                end if;
            end loop;   
            cells(size-1) <= cells(0);
                end if;
        end process;
end behaviour;    
        
