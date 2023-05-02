library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	
entity A_estimado is

generic(
			N_Gbits : NATURAL := 3;
			  Nelem : NATURAL := 8
			);

port(
		N_G : in  std_logic_vector(N_Gbits - 1 downto 0);
		N_I : out std_logic_vector(N_Gbits - 1 downto 0)
		);

end entity;

architecture uno of A_estimado is

begin
	
	N_I <= std_logic_vector(Nelem - unsigned(N_G));

end uno;