
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

     0 => (x"87",x"d3",x"03",x"aa"),
     1 => (x"bf",x"fd",x"ce",x"c2"),
     2 => (x"c1",x"87",x"c4",x"05"),
     3 => (x"c0",x"87",x"c2",x"4b"),
     4 => (x"c1",x"cf",x"c2",x"4b"),
     5 => (x"c2",x"87",x"c4",x"5b"),
     6 => (x"c2",x"5a",x"c1",x"cf"),
     7 => (x"4a",x"bf",x"fd",x"ce"),
     8 => (x"c0",x"c1",x"9a",x"c1"),
     9 => (x"e8",x"ec",x"49",x"a2"),
    10 => (x"c2",x"48",x"fc",x"87"),
    11 => (x"78",x"bf",x"fd",x"ce"),
    12 => (x"1e",x"87",x"ef",x"fe"),
    13 => (x"66",x"c4",x"4a",x"71"),
    14 => (x"ea",x"49",x"72",x"1e"),
    15 => (x"26",x"26",x"87",x"f9"),
    16 => (x"4a",x"71",x"1e",x"4f"),
    17 => (x"c3",x"48",x"d4",x"ff"),
    18 => (x"d0",x"ff",x"78",x"ff"),
    19 => (x"78",x"e1",x"c0",x"48"),
    20 => (x"c1",x"48",x"d4",x"ff"),
    21 => (x"c4",x"49",x"72",x"78"),
    22 => (x"ff",x"78",x"71",x"31"),
    23 => (x"e0",x"c0",x"48",x"d0"),
    24 => (x"1e",x"4f",x"26",x"78"),
    25 => (x"bf",x"fd",x"ce",x"c2"),
    26 => (x"87",x"c8",x"e7",x"49"),
    27 => (x"48",x"e5",x"e1",x"c2"),
    28 => (x"c2",x"78",x"bf",x"e8"),
    29 => (x"ec",x"48",x"e1",x"e1"),
    30 => (x"e1",x"c2",x"78",x"bf"),
    31 => (x"49",x"4a",x"bf",x"e5"),
    32 => (x"c8",x"99",x"ff",x"c3"),
    33 => (x"48",x"72",x"2a",x"b7"),
    34 => (x"e1",x"c2",x"b0",x"71"),
    35 => (x"4f",x"26",x"58",x"ed"),
    36 => (x"5c",x"5b",x"5e",x"0e"),
    37 => (x"4b",x"71",x"0e",x"5d"),
    38 => (x"c2",x"87",x"c8",x"ff"),
    39 => (x"c0",x"48",x"e0",x"e1"),
    40 => (x"e6",x"49",x"73",x"50"),
    41 => (x"49",x"70",x"87",x"ee"),
    42 => (x"cb",x"9c",x"c2",x"4c"),
    43 => (x"d4",x"cc",x"49",x"ee"),
    44 => (x"4d",x"49",x"70",x"87"),
    45 => (x"97",x"e0",x"e1",x"c2"),
    46 => (x"e2",x"c1",x"05",x"bf"),
    47 => (x"49",x"66",x"d0",x"87"),
    48 => (x"bf",x"e9",x"e1",x"c2"),
    49 => (x"87",x"d6",x"05",x"99"),
    50 => (x"c2",x"49",x"66",x"d4"),
    51 => (x"99",x"bf",x"e1",x"e1"),
    52 => (x"73",x"87",x"cb",x"05"),
    53 => (x"87",x"fc",x"e5",x"49"),
    54 => (x"c1",x"02",x"98",x"70"),
    55 => (x"4c",x"c1",x"87",x"c1"),
    56 => (x"75",x"87",x"c0",x"fe"),
    57 => (x"87",x"e9",x"cb",x"49"),
    58 => (x"c6",x"02",x"98",x"70"),
    59 => (x"e0",x"e1",x"c2",x"87"),
    60 => (x"c2",x"50",x"c1",x"48"),
    61 => (x"bf",x"97",x"e0",x"e1"),
    62 => (x"87",x"e3",x"c0",x"05"),
    63 => (x"bf",x"e9",x"e1",x"c2"),
    64 => (x"99",x"66",x"d0",x"49"),
    65 => (x"87",x"d6",x"ff",x"05"),
    66 => (x"bf",x"e1",x"e1",x"c2"),
    67 => (x"99",x"66",x"d4",x"49"),
    68 => (x"87",x"ca",x"ff",x"05"),
    69 => (x"fb",x"e4",x"49",x"73"),
    70 => (x"05",x"98",x"70",x"87"),
    71 => (x"74",x"87",x"ff",x"fe"),
    72 => (x"87",x"fa",x"fa",x"48"),
    73 => (x"5c",x"5b",x"5e",x"0e"),
    74 => (x"86",x"f8",x"0e",x"5d"),
    75 => (x"ec",x"4c",x"4d",x"c0"),
    76 => (x"a6",x"c4",x"7e",x"bf"),
    77 => (x"ed",x"e1",x"c2",x"48"),
    78 => (x"1e",x"c1",x"78",x"bf"),
    79 => (x"49",x"c7",x"1e",x"c0"),
    80 => (x"c8",x"87",x"cd",x"fd"),
    81 => (x"02",x"98",x"70",x"86"),
    82 => (x"49",x"ff",x"87",x"cd"),
    83 => (x"c1",x"87",x"ea",x"fa"),
    84 => (x"ff",x"e3",x"49",x"da"),
    85 => (x"c2",x"4d",x"c1",x"87"),
    86 => (x"bf",x"97",x"e0",x"e1"),
    87 => (x"c2",x"87",x"cf",x"02"),
    88 => (x"49",x"bf",x"e5",x"ce"),
    89 => (x"ce",x"c2",x"b9",x"c1"),
    90 => (x"fb",x"71",x"59",x"e9"),
    91 => (x"e1",x"c2",x"87",x"d3"),
    92 => (x"c2",x"4b",x"bf",x"e5"),
    93 => (x"05",x"bf",x"fd",x"ce"),
    94 => (x"c4",x"87",x"d9",x"c1"),
    95 => (x"c0",x"c8",x"48",x"a6"),
    96 => (x"ce",x"c2",x"78",x"c0"),
    97 => (x"97",x"6e",x"7e",x"e9"),
    98 => (x"48",x"6e",x"49",x"bf"),
    99 => (x"7e",x"70",x"80",x"c1"),
   100 => (x"87",x"c0",x"e3",x"71"),
   101 => (x"c3",x"02",x"98",x"70"),
   102 => (x"b3",x"66",x"c4",x"87"),
   103 => (x"c1",x"48",x"66",x"c4"),
   104 => (x"a6",x"c8",x"28",x"b7"),
   105 => (x"05",x"98",x"70",x"58"),
   106 => (x"c3",x"87",x"db",x"ff"),
   107 => (x"e3",x"e2",x"49",x"fd"),
   108 => (x"49",x"fa",x"c3",x"87"),
   109 => (x"73",x"87",x"dd",x"e2"),
   110 => (x"99",x"ff",x"c3",x"49"),
   111 => (x"49",x"c0",x"1e",x"71"),
   112 => (x"73",x"87",x"f0",x"f9"),
   113 => (x"29",x"b7",x"c8",x"49"),
   114 => (x"49",x"c1",x"1e",x"71"),
   115 => (x"c8",x"87",x"e4",x"f9"),
   116 => (x"87",x"fa",x"c5",x"86"),
   117 => (x"bf",x"e9",x"e1",x"c2"),
   118 => (x"dd",x"02",x"9b",x"4b"),
   119 => (x"f9",x"ce",x"c2",x"87"),
   120 => (x"ec",x"c7",x"49",x"bf"),
   121 => (x"05",x"98",x"70",x"87"),
   122 => (x"4b",x"c0",x"87",x"c4"),
   123 => (x"e0",x"c2",x"87",x"d2"),
   124 => (x"87",x"d1",x"c7",x"49"),
   125 => (x"58",x"fd",x"ce",x"c2"),
   126 => (x"ce",x"c2",x"87",x"c6"),
   127 => (x"78",x"c0",x"48",x"f9"),
   128 => (x"99",x"c2",x"49",x"73"),
   129 => (x"c3",x"87",x"ce",x"05"),
   130 => (x"c7",x"e1",x"49",x"eb"),
   131 => (x"c2",x"49",x"70",x"87"),
   132 => (x"c2",x"c0",x"02",x"99"),
   133 => (x"73",x"4c",x"fb",x"87"),
   134 => (x"05",x"99",x"c1",x"49"),
   135 => (x"f4",x"c3",x"87",x"ce"),
   136 => (x"87",x"f0",x"e0",x"49"),
   137 => (x"99",x"c2",x"49",x"70"),
   138 => (x"87",x"c2",x"c0",x"02"),
   139 => (x"49",x"73",x"4c",x"fa"),
   140 => (x"cd",x"05",x"99",x"c8"),
   141 => (x"49",x"f5",x"c3",x"87"),
   142 => (x"70",x"87",x"d9",x"e0"),
   143 => (x"02",x"99",x"c2",x"49"),
   144 => (x"e1",x"c2",x"87",x"d6"),
   145 => (x"c0",x"02",x"bf",x"f1"),
   146 => (x"c1",x"48",x"87",x"ca"),
   147 => (x"f5",x"e1",x"c2",x"88"),
   148 => (x"87",x"c2",x"c0",x"58"),
   149 => (x"4d",x"c1",x"4c",x"ff"),
   150 => (x"99",x"c4",x"49",x"73"),
   151 => (x"87",x"ce",x"c0",x"05"),
   152 => (x"ff",x"49",x"f2",x"c3"),
   153 => (x"70",x"87",x"ed",x"df"),
   154 => (x"02",x"99",x"c2",x"49"),
   155 => (x"e1",x"c2",x"87",x"dc"),
   156 => (x"48",x"7e",x"bf",x"f1"),
   157 => (x"03",x"a8",x"b7",x"c7"),
   158 => (x"6e",x"87",x"cb",x"c0"),
   159 => (x"c2",x"80",x"c1",x"48"),
   160 => (x"c0",x"58",x"f5",x"e1"),
   161 => (x"4c",x"fe",x"87",x"c2"),
   162 => (x"fd",x"c3",x"4d",x"c1"),
   163 => (x"c3",x"df",x"ff",x"49"),
   164 => (x"c2",x"49",x"70",x"87"),
   165 => (x"d5",x"c0",x"02",x"99"),
   166 => (x"f1",x"e1",x"c2",x"87"),
   167 => (x"c9",x"c0",x"02",x"bf"),
   168 => (x"f1",x"e1",x"c2",x"87"),
   169 => (x"c0",x"78",x"c0",x"48"),
   170 => (x"4c",x"fd",x"87",x"c2"),
   171 => (x"fa",x"c3",x"4d",x"c1"),
   172 => (x"df",x"de",x"ff",x"49"),
   173 => (x"c2",x"49",x"70",x"87"),
   174 => (x"d9",x"c0",x"02",x"99"),
   175 => (x"f1",x"e1",x"c2",x"87"),
   176 => (x"b7",x"c7",x"48",x"bf"),
   177 => (x"c9",x"c0",x"03",x"a8"),
   178 => (x"f1",x"e1",x"c2",x"87"),
   179 => (x"c0",x"78",x"c7",x"48"),
   180 => (x"4c",x"fc",x"87",x"c2"),
   181 => (x"b7",x"c0",x"4d",x"c1"),
   182 => (x"d3",x"c0",x"03",x"ac"),
   183 => (x"48",x"66",x"c4",x"87"),
   184 => (x"70",x"80",x"d8",x"c1"),
   185 => (x"02",x"bf",x"6e",x"7e"),
   186 => (x"4b",x"87",x"c5",x"c0"),
   187 => (x"0f",x"73",x"49",x"74"),
   188 => (x"f0",x"c3",x"1e",x"c0"),
   189 => (x"49",x"da",x"c1",x"1e"),
   190 => (x"c8",x"87",x"d5",x"f6"),
   191 => (x"02",x"98",x"70",x"86"),
   192 => (x"c2",x"87",x"d8",x"c0"),
   193 => (x"7e",x"bf",x"f1",x"e1"),
   194 => (x"91",x"cb",x"49",x"6e"),
   195 => (x"71",x"4a",x"66",x"c4"),
   196 => (x"c0",x"02",x"6a",x"82"),
   197 => (x"6e",x"4b",x"87",x"c5"),
   198 => (x"75",x"0f",x"73",x"49"),
   199 => (x"c8",x"c0",x"02",x"9d"),
   200 => (x"f1",x"e1",x"c2",x"87"),
   201 => (x"eb",x"f1",x"49",x"bf"),
   202 => (x"c1",x"cf",x"c2",x"87"),
   203 => (x"dd",x"c0",x"02",x"bf"),
   204 => (x"dc",x"c2",x"49",x"87"),
   205 => (x"02",x"98",x"70",x"87"),
   206 => (x"c2",x"87",x"d3",x"c0"),
   207 => (x"49",x"bf",x"f1",x"e1"),
   208 => (x"c0",x"87",x"d1",x"f1"),
   209 => (x"87",x"f1",x"f2",x"49"),
   210 => (x"48",x"c1",x"cf",x"c2"),
   211 => (x"8e",x"f8",x"78",x"c0"),
   212 => (x"0e",x"87",x"cb",x"f2"),
   213 => (x"5d",x"5c",x"5b",x"5e"),
   214 => (x"4c",x"71",x"1e",x"0e"),
   215 => (x"bf",x"ed",x"e1",x"c2"),
   216 => (x"a1",x"cd",x"c1",x"49"),
   217 => (x"81",x"d1",x"c1",x"4d"),
   218 => (x"9c",x"74",x"7e",x"69"),
   219 => (x"c4",x"87",x"cf",x"02"),
   220 => (x"7b",x"74",x"4b",x"a5"),
   221 => (x"bf",x"ed",x"e1",x"c2"),
   222 => (x"87",x"ea",x"f1",x"49"),
   223 => (x"9c",x"74",x"7b",x"6e"),
   224 => (x"c0",x"87",x"c4",x"05"),
   225 => (x"c1",x"87",x"c2",x"4b"),
   226 => (x"f1",x"49",x"73",x"4b"),
   227 => (x"66",x"d4",x"87",x"eb"),
   228 => (x"49",x"87",x"c8",x"02"),
   229 => (x"70",x"87",x"ee",x"c0"),
   230 => (x"c0",x"87",x"c2",x"4a"),
   231 => (x"c5",x"cf",x"c2",x"4a"),
   232 => (x"f9",x"f0",x"26",x"5a"),
   233 => (x"00",x"00",x"00",x"87"),
   234 => (x"11",x"12",x"58",x"00"),
   235 => (x"1c",x"1b",x"1d",x"14"),
   236 => (x"91",x"59",x"5a",x"23"),
   237 => (x"eb",x"f2",x"f5",x"94"),
   238 => (x"00",x"00",x"00",x"f4"),
   239 => (x"00",x"00",x"00",x"00"),
   240 => (x"00",x"00",x"00",x"00"),
   241 => (x"4a",x"71",x"1e",x"00"),
   242 => (x"49",x"bf",x"c8",x"ff"),
   243 => (x"26",x"48",x"a1",x"72"),
   244 => (x"c8",x"ff",x"1e",x"4f"),
   245 => (x"c0",x"fe",x"89",x"bf"),
   246 => (x"c0",x"c0",x"c0",x"c0"),
   247 => (x"87",x"c4",x"01",x"a9"),
   248 => (x"87",x"c2",x"4a",x"c0"),
   249 => (x"48",x"72",x"4a",x"c1"),
   250 => (x"48",x"72",x"4f",x"26"),
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

