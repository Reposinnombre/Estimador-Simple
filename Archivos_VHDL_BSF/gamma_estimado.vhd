library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	
entity gamma_estimado is

generic( Nbits : NATURAL := 32;
		 N_Gbits : natural := 3
		);
		
port(			 		 N_I : in std_logic_vector(N_Gbits - 1 downto 0);
				 mediana_I : in  std_logic_vector(Nbits - 1 downto 0);
			    mediana_G : in  std_logic_vector(Nbits - 1 downto 0);
		   H_funcion : in  std_logic;
cociente_verdadero : out std_logic_vector(Nbits - 1 downto 0);
	gamma_invertido : out std_logic_vector(Nbits + N_Gbits - 1 downto 0)
		);
		
end entity;

architecture uno of gamma_estimado is
	
	SIGNAL     CEROS_DER : std_logic_vector(Nbits/2 - 1 downto 0);
	SIGNAL     CEROS_IZQ : std_logic_vector(Nbits/2 - 1 downto 0);
	SIGNAL  cociente_I_G : std_logic_vector(2*Nbits - 1 downto 0);
	
begin

	CEROS_DER <= (OTHERS => '0');
	
	cociente_I_G <= std_logic_vector(UNSIGNED(CEROS_IZQ & mediana_I & CEROS_DER)/UNSIGNED(mediana_G)) when H_funcion = '1' else
						 (OTHERS => '0');
						 
	cociente_verdadero <= cociente_I_G(Nbits - 1 downto 0);

	gamma_invertido <= std_logic_vector(UNSIGNED(N_I)*(UNSIGNED(cociente_verdadero) - 2**(Nbits/2)));
						 
end uno;