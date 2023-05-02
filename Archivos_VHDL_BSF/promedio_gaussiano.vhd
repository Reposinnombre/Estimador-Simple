library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	
library altera;
	use altera.altera_syn_attributes.all;
	
entity promedio_gaussiano is

generic(   
			Nbits : natural := 8;
		 N_Gbits : natural := 3
		);
		
port(		  clk : in  std_logic;
			  rst : in  std_logic;
		 guardar : in  std_logic;
			  N_G : in  std_logic_vector(N_Gbits - 1 downto 0);
		    dato : in  std_logic_vector(Nbits - 1 downto 0);
			 suma : out std_logic_vector(Nbits - 1 downto 0);
	      sigma : out std_logic_vector(Nbits - 1 downto 0)
		);

end entity;

architecture uno of promedio_gaussiano is
	
	-------------------- SEÑALES -----------------------
	----------------------------------------------------
	signal  prom : unsigned(Nbits - 1 downto 0);
	signal   Sum : unsigned(Nbits-1 downto 0);
	signal S_reg : unsigned(Nbits-1 downto 0);
	
	
begin
	
	---------------- SUMADOR -----------------------
	------------------------------------------------
	Sum <= unsigned(dato) + S_reg;

	------------- REGISTRO DE SUMADOR --------------
	------------------------------------------------
	process(all)
	begin
		if rst = '0' then
			S_reg <= (OTHERS => '0');
		elsif rising_edge(clk) then
			if guardar = '1' then
				S_reg <= S_reg;
			else
				S_reg <= Sum;
			end if;
		end if;
	end process;

	---------------------------------- PROMEDIO ------------------------------------------
	--------------------------------------------------------------------------------------
	prom <=  (OTHERS => '0') when unsigned(N_G) = 0 else
				S_reg/unsigned(N_G);
	--------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------
	sigma <= std_logic_vector(prom); 
	
	suma <= std_logic_vector(S_reg);
	
end architecture;