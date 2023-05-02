library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
--	use work.array_type.all;
	
entity prueba_ord is

generic(
		Nbits : NATURAL := 32;
		Nelem : Natural := 512
);

port(	 clk,rst,hab : in  std_logic;
			  dato_in : in  std_logic_vector(Nbits - 1 downto 0);
			 --in_array : in  bubble;
		--sorted_array : out bubble;
					  Q : out std_logic_vector(Nbits - 1 downto 0)
		);

end entity prueba_ord;

architecture uno of prueba_ord is

	----------------------------- TIPOS DE DATOS ---------------------------------
	------------------------------------------------------------------------------
	type bubble is array (0 to Nelem - 1) of std_logic_vector(Nbits - 1 downto 0);
	------------------------------------------------------------------------------
	------------------------------------------------------------------------------
	
	----------- SEÑALES ---------
	-----------------------------
	signal sorted_array : bubble;
	-----------------------------
	-----------------------------
	
begin

	process(all)
		variable 	aux : std_logic_vector(Nbits - 1 downto 0);
		variable var_in : bubble;
		variable      n : std_logic;
		variable flag : std_logic := '0';
	begin
		var_in := sorted_array;
		if rst = '0' then
			n := '0';
		elsif rising_edge(clk) then
			if hab = '1' then
				if n = '0' then
					if flag = '1' then
						var_in := sorted_array;
					end if;
					for i in 0 to (Nelem/2 - 1) loop
						if unsigned(var_in(2*i)) >= unsigned(var_in(2*i+1)) then
										 aux := var_in(2*i);
							  var_in(2*i) := var_in(2*i+1);
							var_in(2*i+1) := aux;
						else
							  var_in(2*i) := var_in(2*i);
							var_in(2*i+1) := var_in(2*i+1);
						end if;
					end loop;
					n := '1';
					sorted_array <= var_in;
				else
					var_in := sorted_array;
					if unsigned(var_in(0)) >= unsigned(var_in(Nelem - 1)) then
								aux := var_in(0);
						var_in(0) := var_in(Nelem - 1);
						var_in(Nelem - 1) := aux;
					else
						var_in(0) := var_in(0);
						var_in(Nelem - 1) := var_in(Nelem - 1);
					end if;
					for i in 0 to (Nelem/2 -2) loop
						if unsigned(var_in(2*i+1)) >= unsigned(var_in(2*i+2)) then
										 aux := var_in(2*i+1);
							var_in(2*i+1) := var_in(2*i+2);
							var_in(2*i+2) := aux;
						else
							var_in(2*i+1) := var_in(2*i+1);
							var_in(2*i+2) := var_in(2*i+2);
						end if;
					end loop;
					n := '0';
					sorted_array <= var_in;
					flag := '1';
				end if;
			else
				for i in 0 to Nelem - 1 loop
					if i = 0 then
						sorted_array(0) <= dato_in;
					else
						sorted_array(i) <= sorted_array(i-1);
					end if;
				end loop;
			end if;
		end if;			
	end process;
	
	Q <= sorted_array(Nelem - 1);
	
end architecture uno;