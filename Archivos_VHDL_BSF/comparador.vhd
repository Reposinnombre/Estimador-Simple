library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	
entity comparador is

generic(
			Nbits : Natural := 4
		);

port(
		 clk : in  std_logic;
		 rst : in  std_logic;
		  Hc : in  std_logic;
		prom : in  std_logic_vector(Nbits - 1 downto 0);
		dato : in  std_logic_vector(Nbits - 1 downto 0);
		   S : out std_logic_vector(Nbits - 1 downto 0);
     menor : out std_logic 
);

end entity;

architecture uno of comparador is
	
	------------------------ SEÑALES -----------------------
	--------------------------------------------------------
	signal     S_int : std_logic_vector(Nbits - 1 downto 0);
	signal menor_int : std_logic;
	--------------------------------------------------------
	--------------------------------------------------------
	
begin

	S_int <= dato when unsigned(dato) < unsigned(prom) else
		      (OTHERS => '0');
		  
	menor_int <= '1' when unsigned(dato) < unsigned(prom) else
				    '0';
					 
	S <= (OTHERS => '0') when Hc = '0' else
		  S_int when rising_edge(clk);
		  
	menor <= '0' when rst = '0' else
				menor_int when rising_edge(clk);

end uno;