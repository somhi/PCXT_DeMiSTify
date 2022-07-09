
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

     0 => (x"c7",x"ff",x"04",x"ab"),
     1 => (x"4d",x"26",x"26",x"87"),
     2 => (x"4b",x"26",x"4c",x"26"),
     3 => (x"71",x"1e",x"4f",x"26"),
     4 => (x"d1",x"e1",x"c2",x"4a"),
     5 => (x"d1",x"e1",x"c2",x"5a"),
     6 => (x"49",x"78",x"c7",x"48"),
     7 => (x"26",x"87",x"dd",x"fe"),
     8 => (x"1e",x"73",x"1e",x"4f"),
     9 => (x"b7",x"c0",x"4a",x"71"),
    10 => (x"87",x"d3",x"03",x"aa"),
    11 => (x"bf",x"df",x"ce",x"c2"),
    12 => (x"c1",x"87",x"c4",x"05"),
    13 => (x"c0",x"87",x"c2",x"4b"),
    14 => (x"e3",x"ce",x"c2",x"4b"),
    15 => (x"c2",x"87",x"c4",x"5b"),
    16 => (x"c2",x"5a",x"e3",x"ce"),
    17 => (x"4a",x"bf",x"df",x"ce"),
    18 => (x"c0",x"c1",x"9a",x"c1"),
    19 => (x"e8",x"ec",x"49",x"a2"),
    20 => (x"c2",x"48",x"fc",x"87"),
    21 => (x"78",x"bf",x"df",x"ce"),
    22 => (x"1e",x"87",x"ef",x"fe"),
    23 => (x"66",x"c4",x"4a",x"71"),
    24 => (x"ea",x"49",x"72",x"1e"),
    25 => (x"26",x"26",x"87",x"ee"),
    26 => (x"4a",x"71",x"1e",x"4f"),
    27 => (x"c3",x"48",x"d4",x"ff"),
    28 => (x"d0",x"ff",x"78",x"ff"),
    29 => (x"78",x"e1",x"c0",x"48"),
    30 => (x"c1",x"48",x"d4",x"ff"),
    31 => (x"c4",x"49",x"72",x"78"),
    32 => (x"ff",x"78",x"71",x"31"),
    33 => (x"e0",x"c0",x"48",x"d0"),
    34 => (x"1e",x"4f",x"26",x"78"),
    35 => (x"bf",x"df",x"ce",x"c2"),
    36 => (x"87",x"e0",x"e6",x"49"),
    37 => (x"48",x"c5",x"e1",x"c2"),
    38 => (x"c2",x"78",x"bf",x"e8"),
    39 => (x"ec",x"48",x"c1",x"e1"),
    40 => (x"e1",x"c2",x"78",x"bf"),
    41 => (x"49",x"4a",x"bf",x"c5"),
    42 => (x"c8",x"99",x"ff",x"c3"),
    43 => (x"48",x"72",x"2a",x"b7"),
    44 => (x"e1",x"c2",x"b0",x"71"),
    45 => (x"4f",x"26",x"58",x"cd"),
    46 => (x"5c",x"5b",x"5e",x"0e"),
    47 => (x"4b",x"71",x"0e",x"5d"),
    48 => (x"c2",x"87",x"c8",x"ff"),
    49 => (x"c0",x"48",x"c0",x"e1"),
    50 => (x"e6",x"49",x"73",x"50"),
    51 => (x"49",x"70",x"87",x"c6"),
    52 => (x"cb",x"9c",x"c2",x"4c"),
    53 => (x"ce",x"cb",x"49",x"ee"),
    54 => (x"4d",x"49",x"70",x"87"),
    55 => (x"97",x"c0",x"e1",x"c2"),
    56 => (x"e2",x"c1",x"05",x"bf"),
    57 => (x"49",x"66",x"d0",x"87"),
    58 => (x"bf",x"c9",x"e1",x"c2"),
    59 => (x"87",x"d6",x"05",x"99"),
    60 => (x"c2",x"49",x"66",x"d4"),
    61 => (x"99",x"bf",x"c1",x"e1"),
    62 => (x"73",x"87",x"cb",x"05"),
    63 => (x"87",x"d4",x"e5",x"49"),
    64 => (x"c1",x"02",x"98",x"70"),
    65 => (x"4c",x"c1",x"87",x"c1"),
    66 => (x"75",x"87",x"c0",x"fe"),
    67 => (x"87",x"e3",x"ca",x"49"),
    68 => (x"c6",x"02",x"98",x"70"),
    69 => (x"c0",x"e1",x"c2",x"87"),
    70 => (x"c2",x"50",x"c1",x"48"),
    71 => (x"bf",x"97",x"c0",x"e1"),
    72 => (x"87",x"e3",x"c0",x"05"),
    73 => (x"bf",x"c9",x"e1",x"c2"),
    74 => (x"99",x"66",x"d0",x"49"),
    75 => (x"87",x"d6",x"ff",x"05"),
    76 => (x"bf",x"c1",x"e1",x"c2"),
    77 => (x"99",x"66",x"d4",x"49"),
    78 => (x"87",x"ca",x"ff",x"05"),
    79 => (x"d3",x"e4",x"49",x"73"),
    80 => (x"05",x"98",x"70",x"87"),
    81 => (x"74",x"87",x"ff",x"fe"),
    82 => (x"87",x"fa",x"fa",x"48"),
    83 => (x"5c",x"5b",x"5e",x"0e"),
    84 => (x"86",x"f8",x"0e",x"5d"),
    85 => (x"ec",x"4c",x"4d",x"c0"),
    86 => (x"a6",x"c4",x"7e",x"bf"),
    87 => (x"cd",x"e1",x"c2",x"48"),
    88 => (x"1e",x"c1",x"78",x"bf"),
    89 => (x"49",x"c7",x"1e",x"c0"),
    90 => (x"c8",x"87",x"cd",x"fd"),
    91 => (x"02",x"98",x"70",x"86"),
    92 => (x"49",x"ff",x"87",x"cd"),
    93 => (x"c1",x"87",x"ea",x"fa"),
    94 => (x"d7",x"e3",x"49",x"da"),
    95 => (x"c2",x"4d",x"c1",x"87"),
    96 => (x"bf",x"97",x"c0",x"e1"),
    97 => (x"c2",x"87",x"cf",x"02"),
    98 => (x"49",x"bf",x"d7",x"ce"),
    99 => (x"ce",x"c2",x"b9",x"c1"),
   100 => (x"fb",x"71",x"59",x"db"),
   101 => (x"e1",x"c2",x"87",x"d3"),
   102 => (x"c2",x"4b",x"bf",x"c5"),
   103 => (x"05",x"bf",x"df",x"ce"),
   104 => (x"c3",x"87",x"e9",x"c0"),
   105 => (x"eb",x"e2",x"49",x"fd"),
   106 => (x"49",x"fa",x"c3",x"87"),
   107 => (x"73",x"87",x"e5",x"e2"),
   108 => (x"99",x"ff",x"c3",x"49"),
   109 => (x"49",x"c0",x"1e",x"71"),
   110 => (x"73",x"87",x"e0",x"fa"),
   111 => (x"29",x"b7",x"c8",x"49"),
   112 => (x"49",x"c1",x"1e",x"71"),
   113 => (x"c8",x"87",x"d4",x"fa"),
   114 => (x"87",x"f5",x"c5",x"86"),
   115 => (x"bf",x"c9",x"e1",x"c2"),
   116 => (x"dd",x"02",x"9b",x"4b"),
   117 => (x"db",x"ce",x"c2",x"87"),
   118 => (x"d6",x"c7",x"49",x"bf"),
   119 => (x"05",x"98",x"70",x"87"),
   120 => (x"4b",x"c0",x"87",x"c4"),
   121 => (x"e0",x"c2",x"87",x"d2"),
   122 => (x"87",x"fb",x"c6",x"49"),
   123 => (x"58",x"df",x"ce",x"c2"),
   124 => (x"ce",x"c2",x"87",x"c6"),
   125 => (x"78",x"c0",x"48",x"db"),
   126 => (x"99",x"c2",x"49",x"73"),
   127 => (x"c3",x"87",x"cd",x"05"),
   128 => (x"cf",x"e1",x"49",x"eb"),
   129 => (x"c2",x"49",x"70",x"87"),
   130 => (x"87",x"c2",x"02",x"99"),
   131 => (x"49",x"73",x"4c",x"fb"),
   132 => (x"cd",x"05",x"99",x"c1"),
   133 => (x"49",x"f4",x"c3",x"87"),
   134 => (x"70",x"87",x"f9",x"e0"),
   135 => (x"02",x"99",x"c2",x"49"),
   136 => (x"4c",x"fa",x"87",x"c2"),
   137 => (x"99",x"c8",x"49",x"73"),
   138 => (x"c3",x"87",x"cd",x"05"),
   139 => (x"e3",x"e0",x"49",x"f5"),
   140 => (x"c2",x"49",x"70",x"87"),
   141 => (x"87",x"d5",x"02",x"99"),
   142 => (x"bf",x"d1",x"e1",x"c2"),
   143 => (x"48",x"87",x"ca",x"02"),
   144 => (x"e1",x"c2",x"88",x"c1"),
   145 => (x"c2",x"c0",x"58",x"d5"),
   146 => (x"c1",x"4c",x"ff",x"87"),
   147 => (x"c4",x"49",x"73",x"4d"),
   148 => (x"87",x"ce",x"05",x"99"),
   149 => (x"ff",x"49",x"f2",x"c3"),
   150 => (x"70",x"87",x"f9",x"df"),
   151 => (x"02",x"99",x"c2",x"49"),
   152 => (x"e1",x"c2",x"87",x"dc"),
   153 => (x"48",x"7e",x"bf",x"d1"),
   154 => (x"03",x"a8",x"b7",x"c7"),
   155 => (x"6e",x"87",x"cb",x"c0"),
   156 => (x"c2",x"80",x"c1",x"48"),
   157 => (x"c0",x"58",x"d5",x"e1"),
   158 => (x"4c",x"fe",x"87",x"c2"),
   159 => (x"fd",x"c3",x"4d",x"c1"),
   160 => (x"cf",x"df",x"ff",x"49"),
   161 => (x"c2",x"49",x"70",x"87"),
   162 => (x"87",x"d5",x"02",x"99"),
   163 => (x"bf",x"d1",x"e1",x"c2"),
   164 => (x"87",x"c9",x"c0",x"02"),
   165 => (x"48",x"d1",x"e1",x"c2"),
   166 => (x"c2",x"c0",x"78",x"c0"),
   167 => (x"c1",x"4c",x"fd",x"87"),
   168 => (x"49",x"fa",x"c3",x"4d"),
   169 => (x"87",x"ec",x"de",x"ff"),
   170 => (x"99",x"c2",x"49",x"70"),
   171 => (x"87",x"d9",x"c0",x"02"),
   172 => (x"bf",x"d1",x"e1",x"c2"),
   173 => (x"a8",x"b7",x"c7",x"48"),
   174 => (x"87",x"c9",x"c0",x"03"),
   175 => (x"48",x"d1",x"e1",x"c2"),
   176 => (x"c2",x"c0",x"78",x"c7"),
   177 => (x"c1",x"4c",x"fc",x"87"),
   178 => (x"ac",x"b7",x"c0",x"4d"),
   179 => (x"87",x"d3",x"c0",x"03"),
   180 => (x"c1",x"48",x"66",x"c4"),
   181 => (x"7e",x"70",x"80",x"d8"),
   182 => (x"c0",x"02",x"bf",x"6e"),
   183 => (x"74",x"4b",x"87",x"c5"),
   184 => (x"c0",x"0f",x"73",x"49"),
   185 => (x"1e",x"f0",x"c3",x"1e"),
   186 => (x"f7",x"49",x"da",x"c1"),
   187 => (x"86",x"c8",x"87",x"ca"),
   188 => (x"c0",x"02",x"98",x"70"),
   189 => (x"e1",x"c2",x"87",x"d8"),
   190 => (x"6e",x"7e",x"bf",x"d1"),
   191 => (x"c4",x"91",x"cb",x"49"),
   192 => (x"82",x"71",x"4a",x"66"),
   193 => (x"c5",x"c0",x"02",x"6a"),
   194 => (x"49",x"6e",x"4b",x"87"),
   195 => (x"9d",x"75",x"0f",x"73"),
   196 => (x"87",x"c8",x"c0",x"02"),
   197 => (x"bf",x"d1",x"e1",x"c2"),
   198 => (x"87",x"e0",x"f2",x"49"),
   199 => (x"bf",x"e3",x"ce",x"c2"),
   200 => (x"87",x"dd",x"c0",x"02"),
   201 => (x"87",x"cb",x"c2",x"49"),
   202 => (x"c0",x"02",x"98",x"70"),
   203 => (x"e1",x"c2",x"87",x"d3"),
   204 => (x"f2",x"49",x"bf",x"d1"),
   205 => (x"49",x"c0",x"87",x"c6"),
   206 => (x"c2",x"87",x"e6",x"f3"),
   207 => (x"c0",x"48",x"e3",x"ce"),
   208 => (x"f3",x"8e",x"f8",x"78"),
   209 => (x"5e",x"0e",x"87",x"c0"),
   210 => (x"0e",x"5d",x"5c",x"5b"),
   211 => (x"c2",x"4c",x"71",x"1e"),
   212 => (x"49",x"bf",x"cd",x"e1"),
   213 => (x"4d",x"a1",x"cd",x"c1"),
   214 => (x"69",x"81",x"d1",x"c1"),
   215 => (x"02",x"9c",x"74",x"7e"),
   216 => (x"a5",x"c4",x"87",x"cf"),
   217 => (x"c2",x"7b",x"74",x"4b"),
   218 => (x"49",x"bf",x"cd",x"e1"),
   219 => (x"6e",x"87",x"df",x"f2"),
   220 => (x"05",x"9c",x"74",x"7b"),
   221 => (x"4b",x"c0",x"87",x"c4"),
   222 => (x"4b",x"c1",x"87",x"c2"),
   223 => (x"e0",x"f2",x"49",x"73"),
   224 => (x"02",x"66",x"d4",x"87"),
   225 => (x"de",x"49",x"87",x"c7"),
   226 => (x"c2",x"4a",x"70",x"87"),
   227 => (x"c2",x"4a",x"c0",x"87"),
   228 => (x"26",x"5a",x"e7",x"ce"),
   229 => (x"00",x"87",x"ef",x"f1"),
   230 => (x"00",x"00",x"00",x"00"),
   231 => (x"00",x"00",x"00",x"00"),
   232 => (x"00",x"00",x"00",x"00"),
   233 => (x"1e",x"00",x"00",x"00"),
   234 => (x"c8",x"ff",x"4a",x"71"),
   235 => (x"a1",x"72",x"49",x"bf"),
   236 => (x"1e",x"4f",x"26",x"48"),
   237 => (x"89",x"bf",x"c8",x"ff"),
   238 => (x"c0",x"c0",x"c0",x"fe"),
   239 => (x"01",x"a9",x"c0",x"c0"),
   240 => (x"4a",x"c0",x"87",x"c4"),
   241 => (x"4a",x"c1",x"87",x"c2"),
   242 => (x"4f",x"26",x"48",x"72"),
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

