
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity controller_rom2 is
generic
	(
		ADDR_WIDTH : integer := 15 -- Specify your actual ROM size to save LEs and unnecessary block RAM usage.
	);
port (
	clk : in std_logic;
	reset_n : in std_logic := '1';
	addr : in std_logic_vector(ADDR_WIDTH-1 downto 0);
	q : out std_logic_vector(31 downto 0);
	-- Allow writes - defaults supplied to simplify projects that don't need to write.
	d : in std_logic_vector(31 downto 0) := X"00000000";
	we : in std_logic := '0';
	bytesel : in std_logic_vector(3 downto 0) := "1111"
);
end entity;

architecture rtl of controller_rom2 is

	signal addr1 : integer range 0 to 2**ADDR_WIDTH-1;

	--  build up 2D array to hold the memory
	type word_t is array (0 to 3) of std_logic_vector(7 downto 0);
	type ram_t is array (0 to 2 ** ADDR_WIDTH - 1) of word_t;

	signal ram : ram_t:=
	(

     0 => (x"f9",x"ea",x"49",x"72"),
     1 => (x"4f",x"26",x"26",x"87"),
     2 => (x"ff",x"4a",x"71",x"1e"),
     3 => (x"ff",x"c3",x"48",x"d4"),
     4 => (x"48",x"d0",x"ff",x"78"),
     5 => (x"ff",x"78",x"e1",x"c0"),
     6 => (x"78",x"c1",x"48",x"d4"),
     7 => (x"31",x"c4",x"49",x"72"),
     8 => (x"d0",x"ff",x"78",x"71"),
     9 => (x"78",x"e0",x"c0",x"48"),
    10 => (x"c2",x"1e",x"4f",x"26"),
    11 => (x"49",x"bf",x"fd",x"cc"),
    12 => (x"c2",x"87",x"c8",x"e7"),
    13 => (x"e8",x"48",x"e5",x"df"),
    14 => (x"df",x"c2",x"78",x"bf"),
    15 => (x"bf",x"ec",x"48",x"e1"),
    16 => (x"e5",x"df",x"c2",x"78"),
    17 => (x"c3",x"49",x"4a",x"bf"),
    18 => (x"b7",x"c8",x"99",x"ff"),
    19 => (x"71",x"48",x"72",x"2a"),
    20 => (x"ed",x"df",x"c2",x"b0"),
    21 => (x"0e",x"4f",x"26",x"58"),
    22 => (x"5d",x"5c",x"5b",x"5e"),
    23 => (x"ff",x"4b",x"71",x"0e"),
    24 => (x"df",x"c2",x"87",x"c8"),
    25 => (x"50",x"c0",x"48",x"e0"),
    26 => (x"ee",x"e6",x"49",x"73"),
    27 => (x"4c",x"49",x"70",x"87"),
    28 => (x"ee",x"cb",x"9c",x"c2"),
    29 => (x"87",x"cd",x"cb",x"49"),
    30 => (x"c2",x"4d",x"49",x"70"),
    31 => (x"bf",x"97",x"e0",x"df"),
    32 => (x"87",x"e2",x"c1",x"05"),
    33 => (x"c2",x"49",x"66",x"d0"),
    34 => (x"99",x"bf",x"e9",x"df"),
    35 => (x"d4",x"87",x"d6",x"05"),
    36 => (x"df",x"c2",x"49",x"66"),
    37 => (x"05",x"99",x"bf",x"e1"),
    38 => (x"49",x"73",x"87",x"cb"),
    39 => (x"70",x"87",x"fc",x"e5"),
    40 => (x"c1",x"c1",x"02",x"98"),
    41 => (x"fe",x"4c",x"c1",x"87"),
    42 => (x"49",x"75",x"87",x"c0"),
    43 => (x"70",x"87",x"e2",x"ca"),
    44 => (x"87",x"c6",x"02",x"98"),
    45 => (x"48",x"e0",x"df",x"c2"),
    46 => (x"df",x"c2",x"50",x"c1"),
    47 => (x"05",x"bf",x"97",x"e0"),
    48 => (x"c2",x"87",x"e3",x"c0"),
    49 => (x"49",x"bf",x"e9",x"df"),
    50 => (x"05",x"99",x"66",x"d0"),
    51 => (x"c2",x"87",x"d6",x"ff"),
    52 => (x"49",x"bf",x"e1",x"df"),
    53 => (x"05",x"99",x"66",x"d4"),
    54 => (x"73",x"87",x"ca",x"ff"),
    55 => (x"87",x"fb",x"e4",x"49"),
    56 => (x"fe",x"05",x"98",x"70"),
    57 => (x"48",x"74",x"87",x"ff"),
    58 => (x"0e",x"87",x"fa",x"fa"),
    59 => (x"5d",x"5c",x"5b",x"5e"),
    60 => (x"c0",x"86",x"f8",x"0e"),
    61 => (x"bf",x"ec",x"4c",x"4d"),
    62 => (x"48",x"a6",x"c4",x"7e"),
    63 => (x"bf",x"ed",x"df",x"c2"),
    64 => (x"c0",x"1e",x"c1",x"78"),
    65 => (x"fd",x"49",x"c7",x"1e"),
    66 => (x"86",x"c8",x"87",x"cd"),
    67 => (x"cd",x"02",x"98",x"70"),
    68 => (x"fa",x"49",x"ff",x"87"),
    69 => (x"da",x"c1",x"87",x"ea"),
    70 => (x"87",x"ff",x"e3",x"49"),
    71 => (x"df",x"c2",x"4d",x"c1"),
    72 => (x"02",x"bf",x"97",x"e0"),
    73 => (x"cc",x"c2",x"87",x"cf"),
    74 => (x"c1",x"49",x"bf",x"f5"),
    75 => (x"f9",x"cc",x"c2",x"b9"),
    76 => (x"d3",x"fb",x"71",x"59"),
    77 => (x"e5",x"df",x"c2",x"87"),
    78 => (x"cc",x"c2",x"4b",x"bf"),
    79 => (x"c0",x"05",x"bf",x"fd"),
    80 => (x"fd",x"c3",x"87",x"e9"),
    81 => (x"87",x"d3",x"e3",x"49"),
    82 => (x"e3",x"49",x"fa",x"c3"),
    83 => (x"49",x"73",x"87",x"cd"),
    84 => (x"71",x"99",x"ff",x"c3"),
    85 => (x"fa",x"49",x"c0",x"1e"),
    86 => (x"49",x"73",x"87",x"e0"),
    87 => (x"71",x"29",x"b7",x"c8"),
    88 => (x"fa",x"49",x"c1",x"1e"),
    89 => (x"86",x"c8",x"87",x"d4"),
    90 => (x"c2",x"87",x"f4",x"c5"),
    91 => (x"4b",x"bf",x"e9",x"df"),
    92 => (x"87",x"dd",x"02",x"9b"),
    93 => (x"bf",x"f9",x"cc",x"c2"),
    94 => (x"87",x"d5",x"c7",x"49"),
    95 => (x"c4",x"05",x"98",x"70"),
    96 => (x"d2",x"4b",x"c0",x"87"),
    97 => (x"49",x"e0",x"c2",x"87"),
    98 => (x"c2",x"87",x"fa",x"c6"),
    99 => (x"c6",x"58",x"fd",x"cc"),
   100 => (x"f9",x"cc",x"c2",x"87"),
   101 => (x"73",x"78",x"c0",x"48"),
   102 => (x"05",x"99",x"c2",x"49"),
   103 => (x"eb",x"c3",x"87",x"cd"),
   104 => (x"87",x"f7",x"e1",x"49"),
   105 => (x"99",x"c2",x"49",x"70"),
   106 => (x"fb",x"87",x"c2",x"02"),
   107 => (x"c1",x"49",x"73",x"4c"),
   108 => (x"87",x"cd",x"05",x"99"),
   109 => (x"e1",x"49",x"f4",x"c3"),
   110 => (x"49",x"70",x"87",x"e1"),
   111 => (x"c2",x"02",x"99",x"c2"),
   112 => (x"73",x"4c",x"fa",x"87"),
   113 => (x"05",x"99",x"c8",x"49"),
   114 => (x"f5",x"c3",x"87",x"cd"),
   115 => (x"87",x"cb",x"e1",x"49"),
   116 => (x"99",x"c2",x"49",x"70"),
   117 => (x"c2",x"87",x"d5",x"02"),
   118 => (x"02",x"bf",x"f1",x"df"),
   119 => (x"c1",x"48",x"87",x"ca"),
   120 => (x"f5",x"df",x"c2",x"88"),
   121 => (x"87",x"c2",x"c0",x"58"),
   122 => (x"4d",x"c1",x"4c",x"ff"),
   123 => (x"99",x"c4",x"49",x"73"),
   124 => (x"c3",x"87",x"cd",x"05"),
   125 => (x"e2",x"e0",x"49",x"f2"),
   126 => (x"c2",x"49",x"70",x"87"),
   127 => (x"87",x"dc",x"02",x"99"),
   128 => (x"bf",x"f1",x"df",x"c2"),
   129 => (x"b7",x"c7",x"48",x"7e"),
   130 => (x"cb",x"c0",x"03",x"a8"),
   131 => (x"c1",x"48",x"6e",x"87"),
   132 => (x"f5",x"df",x"c2",x"80"),
   133 => (x"87",x"c2",x"c0",x"58"),
   134 => (x"4d",x"c1",x"4c",x"fe"),
   135 => (x"ff",x"49",x"fd",x"c3"),
   136 => (x"70",x"87",x"f8",x"df"),
   137 => (x"02",x"99",x"c2",x"49"),
   138 => (x"df",x"c2",x"87",x"d5"),
   139 => (x"c0",x"02",x"bf",x"f1"),
   140 => (x"df",x"c2",x"87",x"c9"),
   141 => (x"78",x"c0",x"48",x"f1"),
   142 => (x"fd",x"87",x"c2",x"c0"),
   143 => (x"c3",x"4d",x"c1",x"4c"),
   144 => (x"df",x"ff",x"49",x"fa"),
   145 => (x"49",x"70",x"87",x"d5"),
   146 => (x"c0",x"02",x"99",x"c2"),
   147 => (x"df",x"c2",x"87",x"d9"),
   148 => (x"c7",x"48",x"bf",x"f1"),
   149 => (x"c0",x"03",x"a8",x"b7"),
   150 => (x"df",x"c2",x"87",x"c9"),
   151 => (x"78",x"c7",x"48",x"f1"),
   152 => (x"fc",x"87",x"c2",x"c0"),
   153 => (x"c0",x"4d",x"c1",x"4c"),
   154 => (x"c0",x"03",x"ac",x"b7"),
   155 => (x"66",x"c4",x"87",x"d3"),
   156 => (x"80",x"d8",x"c1",x"48"),
   157 => (x"bf",x"6e",x"7e",x"70"),
   158 => (x"87",x"c5",x"c0",x"02"),
   159 => (x"73",x"49",x"74",x"4b"),
   160 => (x"c3",x"1e",x"c0",x"0f"),
   161 => (x"da",x"c1",x"1e",x"f0"),
   162 => (x"87",x"cb",x"f7",x"49"),
   163 => (x"98",x"70",x"86",x"c8"),
   164 => (x"87",x"d8",x"c0",x"02"),
   165 => (x"bf",x"f1",x"df",x"c2"),
   166 => (x"cb",x"49",x"6e",x"7e"),
   167 => (x"4a",x"66",x"c4",x"91"),
   168 => (x"02",x"6a",x"82",x"71"),
   169 => (x"4b",x"87",x"c5",x"c0"),
   170 => (x"0f",x"73",x"49",x"6e"),
   171 => (x"c0",x"02",x"9d",x"75"),
   172 => (x"df",x"c2",x"87",x"c8"),
   173 => (x"f2",x"49",x"bf",x"f1"),
   174 => (x"cd",x"c2",x"87",x"e1"),
   175 => (x"c0",x"02",x"bf",x"c1"),
   176 => (x"c2",x"49",x"87",x"dd"),
   177 => (x"98",x"70",x"87",x"cb"),
   178 => (x"87",x"d3",x"c0",x"02"),
   179 => (x"bf",x"f1",x"df",x"c2"),
   180 => (x"87",x"c7",x"f2",x"49"),
   181 => (x"e7",x"f3",x"49",x"c0"),
   182 => (x"c1",x"cd",x"c2",x"87"),
   183 => (x"f8",x"78",x"c0",x"48"),
   184 => (x"87",x"c1",x"f3",x"8e"),
   185 => (x"5c",x"5b",x"5e",x"0e"),
   186 => (x"71",x"1e",x"0e",x"5d"),
   187 => (x"ed",x"df",x"c2",x"4c"),
   188 => (x"cd",x"c1",x"49",x"bf"),
   189 => (x"d1",x"c1",x"4d",x"a1"),
   190 => (x"74",x"7e",x"69",x"81"),
   191 => (x"87",x"cf",x"02",x"9c"),
   192 => (x"74",x"4b",x"a5",x"c4"),
   193 => (x"ed",x"df",x"c2",x"7b"),
   194 => (x"e0",x"f2",x"49",x"bf"),
   195 => (x"74",x"7b",x"6e",x"87"),
   196 => (x"87",x"c4",x"05",x"9c"),
   197 => (x"87",x"c2",x"4b",x"c0"),
   198 => (x"49",x"73",x"4b",x"c1"),
   199 => (x"d4",x"87",x"e1",x"f2"),
   200 => (x"87",x"c7",x"02",x"66"),
   201 => (x"70",x"87",x"de",x"49"),
   202 => (x"c0",x"87",x"c2",x"4a"),
   203 => (x"c5",x"cd",x"c2",x"4a"),
   204 => (x"f0",x"f1",x"26",x"5a"),
   205 => (x"00",x"00",x"00",x"87"),
   206 => (x"00",x"00",x"00",x"00"),
   207 => (x"00",x"00",x"00",x"00"),
   208 => (x"00",x"00",x"00",x"00"),
   209 => (x"4a",x"71",x"1e",x"00"),
   210 => (x"49",x"bf",x"c8",x"ff"),
   211 => (x"26",x"48",x"a1",x"72"),
   212 => (x"c8",x"ff",x"1e",x"4f"),
   213 => (x"c0",x"fe",x"89",x"bf"),
   214 => (x"c0",x"c0",x"c0",x"c0"),
   215 => (x"87",x"c4",x"01",x"a9"),
   216 => (x"87",x"c2",x"4a",x"c0"),
   217 => (x"48",x"72",x"4a",x"c1"),
   218 => (x"48",x"72",x"4f",x"26"),
		others => (others => x"00")
	);
	signal q1_local : word_t;

	-- Altera Quartus attributes
	attribute ramstyle: string;
	attribute ramstyle of ram: signal is "no_rw_check";

begin  -- rtl

	addr1 <= to_integer(unsigned(addr(ADDR_WIDTH-1 downto 0)));

	-- Reorganize the read data from the RAM to match the output
	q(7 downto 0) <= q1_local(3);
	q(15 downto 8) <= q1_local(2);
	q(23 downto 16) <= q1_local(1);
	q(31 downto 24) <= q1_local(0);

	process(clk)
	begin
		if(rising_edge(clk)) then 
			if(we = '1') then
				-- edit this code if using other than four bytes per word
				if (bytesel(3) = '1') then
					ram(addr1)(3) <= d(7 downto 0);
				end if;
				if (bytesel(2) = '1') then
					ram(addr1)(2) <= d(15 downto 8);
				end if;
				if (bytesel(1) = '1') then
					ram(addr1)(1) <= d(23 downto 16);
				end if;
				if (bytesel(0) = '1') then
					ram(addr1)(0) <= d(31 downto 24);
				end if;
			end if;
			q1_local <= ram(addr1);
		end if;
	end process;
  
end rtl;

