library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	
library altera;
	use altera.altera_syn_attributes.all;
	
entity dir_medianas is

generic(
		 N_Gbits : natural := 3
		);
		
port(				N_G : in  std_logic_vector(N_Gbits - 1 downto 0);
					N_I : in  std_logic_vector(N_Gbits - 1 downto 0);
				 H_med : in  std_logic;
			direccion : out std_logic_vector(N_Gbits - 1 downto 0)
		);
		
end entity;

architecture uno of dir_medianas is

	SIGNAL   	 N_G_2 : std_logic_vector(N_Gbits - 1 downto 0);
	SIGNAL   	 N_I_2 : std_logic_vector(N_Gbits - 1 downto 0);
	SIGNAL dir_N_G_int : std_logic_vector(N_Gbits - 1 downto 0);
	SIGNAL dir_N_I_int : std_logic_vector(N_Gbits - 1 downto 0);

begin

	N_G_2 <= '0' & N_G(N_Gbits - 1 downto 1);
	N_I_2 <= '0' & N_I(N_Gbits - 1 downto 1);
	
	dir_N_I_int <= N_I_2;
	dir_N_G_int <= std_logic_vector(unsigned(N_I) + unsigned(N_G_2));
	
	direccion <= dir_N_I_int when H_med = '0' else
					 dir_N_G_int;
	
end uno;