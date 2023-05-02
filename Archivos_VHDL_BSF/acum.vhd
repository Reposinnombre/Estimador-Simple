library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	use ieee.math_real.all;
	
library altera;
	use altera.altera_syn_attributes.all;
	
entity acum is

generic(   Nbits : natural := 8; -- 13 bits para la parte entera y 14 bits para la parte decimal
	 CORRIMIENTOS : NATURAL := 3
			--ADDRES_WIDTH : natural := 9
		);
		
port(		  clk : in  std_logic;
			  rst : in  std_logic;
		 guardar : in  std_logic;
		    dato : in  std_logic_vector(Nbits - 1 downto 0);
	       alfa : out std_logic_vector(Nbits - 1 downto 0); -- revisar width
			    S : out std_logic_vector(Nbits - 1 downto 0)
--cnt_master_ext : out std_logic_vector(ADDRES_WIDTH-1 downto 0);
--    latch_prom : out std_logic;
--			q_ext : out std_logic_vector(Nbits-1 downto 0);
--		comp_ext : out std_logic
		);

end entity;

architecture uno of acum is
	
	SIGNAL CEROS_IZQ : std_logic_vector(CORRIMIENTOS - 1 downto 0);
	
	-------------------- SEÑALES -----------------------
	----------------------------------------------------
	SIGNAL     prom : std_logic_vector(Nbits-1 downto 0);
	signal      Sum : unsigned(Nbits-1 downto 0);
	signal    S_reg : unsigned(Nbits-1 downto 0);
	
--	signal cnt_master : unsigned(3 downto 0);
	
--	signal q : std_logic_vector(Nbits-1 downto 0); -- Señal de salida del registro del sumador	

	--------------- CREACION DE MEMORIA RAM -------------------------------
--	----------------------------------------------------------------------
--	subtype word_t is std_logic_vector(Nbits-1 downto 0);
--   type ram_type is array (2**ADDRES_WIDTH-1 downto 0) of word_t;
--	
--	function init_rom
--		return ram_type is 
--		variable tmp : ram_type := (others => (others => '0'));
--	begin 
--		for addr_pos in 0 to 2**ADDRES_WIDTH - 1 loop 
--			-- Initialize each address with the address itself
--			tmp(addr_pos) := std_logic_vector(to_unsigned(addr_pos, Nbits));
--		end loop;
--		return tmp;
--	end init_rom;	
--	
--	signal  my_ram : ram_type := init_rom;
--	-----------------------------------------------------------------------
--	-----------------------------------------------------------------------
--	-----------------------------------------------------------------------
	
begin
	
	---------------- SUMADOR -----------------------
	------------------------------------------------
	Sum <= unsigned(dato) + S_reg;

	
	------------- REGISTRO DE SUMADOR --------------
	------------------------------------------------
--	S_reg <= (others => '0') when rst = '0' else
--							 S_reg when guardar = '1' else
--				            Sum when rising_edge(clk);
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
	-- ***************************************** --
	S <= std_logic_vector(S_reg);

	---------------------------------- PROMEDIO ------------------------------------------
	--------------------------------------------------------------------------------------
--	prom <= std_logic_vector(S_reg(Nbits-1 downto CORRIMIENTOS)) when (cnt_master = DIVISOR + 1) else
--			  (OTHERS => '0');
	CEROS_IZQ <= (OTHERS => '0');
	prom <= CEROS_IZQ & std_logic_vector(S_reg(Nbits-1 downto CORRIMIENTOS));
	--------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------
	alfa <= prom;
	
	
--	-- Latch de salida del valor de promedio
--	prom_latch <= (others => '0') when rst = '0' else
--					             prom when rising_edge(clk) and (cnt_master = "1001");  --(rst_int = '1');
--									 
--	-- Contador Modulo 1024 (0 a 1023)
--	cnt_master <= (others => '0') when rst = '0' else
--					  (others => '0') when cnt_master = "1010" else -- Resetear contador +3 o +4
--					   cnt_master + 1 when rising_edge(clk);
--	
--	latch_prom <= '1' when cnt_master = "1001" else
--					  '0';
--	
--	cnt_master_ext(3 downto 0) <= std_logic_vector(cnt_master);
--	cnt_master_ext(ADDRES_WIDTH-1 downto 4) <= (OTHERS => '0');
	
	
	----------------------- SALIDA DE LA MEMORIA ROM ----------------------------
--	-----------------------------------------------------------------------------
--	q <= my_ram(to_integer(cnt_master(3 downto 0)));
--	q_ext <= q;
--	-----------------------------------------------------------------------------
--	-----------------------------------------------------------------------------
--	
--	comp_int <= '0' when q < prom_latch else
--			  '1';
--	comp_ext <= '0' when rst = '0' else
--				  comp_int when rising_edge(clk);
	
end architecture;