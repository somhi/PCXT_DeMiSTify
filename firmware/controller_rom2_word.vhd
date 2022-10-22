library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity controller_rom2 is
generic	(
	ADDR_WIDTH : integer := 8; -- ROM's address width (words, not bytes)
	COL_WIDTH  : integer := 8;  -- Column width (8bit -> byte)
	NB_COL     : integer := 4  -- Number of columns in memory
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

architecture arch of controller_rom2 is

-- type word_t is std_logic_vector(31 downto 0);
type ram_type is array (0 to 2 ** ADDR_WIDTH - 1) of std_logic_vector(NB_COL * COL_WIDTH - 1 downto 0);

signal ram : ram_type :=
(

     0 => x"7f000102",
     1 => x"7f7f7f7f",
     2 => x"08007f7f",
     3 => x"3e1c1c08",
     4 => x"7f7f7f3e",
     5 => x"1c3e3e7f",
     6 => x"0008081c",
     7 => x"7c7c1810",
     8 => x"00001018",
     9 => x"7c7c3010",
    10 => x"10001030",
    11 => x"78606030",
    12 => x"4200061e",
    13 => x"3c183c66",
    14 => x"78004266",
    15 => x"c6c26a38",
    16 => x"6000386c",
    17 => x"00600000",
    18 => x"0e006000",
    19 => x"5d5c5b5e",
    20 => x"4c711e0e",
    21 => x"bfede4c2",
    22 => x"c04bc04d",
    23 => x"02ab741e",
    24 => x"a6c487c7",
    25 => x"c578c048",
    26 => x"48a6c487",
    27 => x"66c478c1",
    28 => x"ee49731e",
    29 => x"86c887df",
    30 => x"ef49e0c0",
    31 => x"a5c487ef",
    32 => x"f0496a4a",
    33 => x"c6f187f0",
    34 => x"c185cb87",
    35 => x"abb7c883",
    36 => x"87c7ff04",
    37 => x"264d2626",
    38 => x"264b264c",
    39 => x"4a711e4f",
    40 => x"5af1e4c2",
    41 => x"48f1e4c2",
    42 => x"fe4978c7",
    43 => x"4f2687dd",
    44 => x"711e731e",
    45 => x"aab7c04a",
    46 => x"c287d303",
    47 => x"05bffbd1",
    48 => x"4bc187c4",
    49 => x"4bc087c2",
    50 => x"5bffd1c2",
    51 => x"d1c287c4",
    52 => x"d1c25aff",
    53 => x"c14abffb",
    54 => x"a2c0c19a",
    55 => x"87e8ec49",
    56 => x"d1c248fc",
    57 => x"fe78bffb",
    58 => x"711e87ef",
    59 => x"1e66c44a",
    60 => x"e2e64972",
    61 => x"4f262687",
    62 => x"ff4a711e",
    63 => x"ffc348d4",
    64 => x"48d0ff78",
    65 => x"ff78e1c0",
    66 => x"78c148d4",
    67 => x"31c44972",
    68 => x"d0ff7871",
    69 => x"78e0c048",
    70 => x"c21e4f26",
    71 => x"49bffbd1",
    72 => x"c287f1e2",
    73 => x"e848e5e4",
    74 => x"e4c278bf",
    75 => x"bfec48e1",
    76 => x"e5e4c278",
    77 => x"c3494abf",
    78 => x"b7c899ff",
    79 => x"7148722a",
    80 => x"ede4c2b0",
    81 => x"0e4f2658",
    82 => x"5d5c5b5e",
    83 => x"ff4b710e",
    84 => x"e4c287c8",
    85 => x"50c048e0",
    86 => x"d7e24973",
    87 => x"4c497087",
    88 => x"eecb9cc2",
    89 => x"87dbcc49",
    90 => x"c24d4970",
    91 => x"bf97e0e4",
    92 => x"87e2c105",
    93 => x"c24966d0",
    94 => x"99bfe9e4",
    95 => x"d487d605",
    96 => x"e4c24966",
    97 => x"0599bfe1",
    98 => x"497387cb",
    99 => x"7087e5e1",
   100 => x"c1c10298",
   101 => x"fe4cc187",
   102 => x"497587c0",
   103 => x"7087f0cb",
   104 => x"87c60298",
   105 => x"48e0e4c2",
   106 => x"e4c250c1",
   107 => x"05bf97e0",
   108 => x"c287e3c0",
   109 => x"49bfe9e4",
   110 => x"059966d0",
   111 => x"c287d6ff",
   112 => x"49bfe1e4",
   113 => x"059966d4",
   114 => x"7387caff",
   115 => x"87e4e049",
   116 => x"fe059870",
   117 => x"487487ff",
   118 => x"0e87fafa",
   119 => x"5d5c5b5e",
   120 => x"c086f80e",
   121 => x"bfec4c4d",
   122 => x"48a6c47e",
   123 => x"bfede4c2",
   124 => x"c01ec178",
   125 => x"fd49c71e",
   126 => x"86c887cd",
   127 => x"ce029870",
   128 => x"fa49ff87",
   129 => x"dac187ea",
   130 => x"e7dfff49",
   131 => x"c24dc187",
   132 => x"bf97e0e4",
   133 => x"c287cf02",
   134 => x"49bfe3d1",
   135 => x"d1c2b9c1",
   136 => x"fb7159e7",
   137 => x"e4c287d2",
   138 => x"c24bbfe5",
   139 => x"05bffbd1",
   140 => x"c487dcc1",
   141 => x"c0c848a6",
   142 => x"d1c278c0",
   143 => x"976e7ee7",
   144 => x"486e49bf",
   145 => x"7e7080c1",
   146 => x"e7deff71",
   147 => x"02987087",
   148 => x"66c487c3",
   149 => x"4866c4b3",
   150 => x"c828b7c1",
   151 => x"987058a6",
   152 => x"87daff05",
   153 => x"ff49fdc3",
   154 => x"c387c9de",
   155 => x"deff49fa",
   156 => x"497387c2",
   157 => x"7199ffc3",
   158 => x"f949c01e",
   159 => x"497387ec",
   160 => x"7129b7c8",
   161 => x"f949c11e",
   162 => x"86c887e0",
   163 => x"c287fdc5",
   164 => x"4bbfe9e4",
   165 => x"87dd029b",
   166 => x"bff7d1c2",
   167 => x"87efc749",
   168 => x"c4059870",
   169 => x"d24bc087",
   170 => x"49e0c287",
   171 => x"c287d4c7",
   172 => x"c658fbd1",
   173 => x"f7d1c287",
   174 => x"7378c048",
   175 => x"0599c249",
   176 => x"ebc387cf",
   177 => x"ebdcff49",
   178 => x"c2497087",
   179 => x"c2c00299",
   180 => x"734cfb87",
   181 => x"0599c149",
   182 => x"f4c387cf",
   183 => x"d3dcff49",
   184 => x"c2497087",
   185 => x"c2c00299",
   186 => x"734cfa87",
   187 => x"0599c849",
   188 => x"f5c387ce",
   189 => x"fbdbff49",
   190 => x"c2497087",
   191 => x"87d60299",
   192 => x"bff1e4c2",
   193 => x"87cac002",
   194 => x"c288c148",
   195 => x"c058f5e4",
   196 => x"4cff87c2",
   197 => x"49734dc1",
   198 => x"c00599c4",
   199 => x"f2c387ce",
   200 => x"cfdbff49",
   201 => x"c2497087",
   202 => x"87dc0299",
   203 => x"bff1e4c2",
   204 => x"b7c7487e",
   205 => x"cbc003a8",
   206 => x"c1486e87",
   207 => x"f5e4c280",
   208 => x"87c2c058",
   209 => x"4dc14cfe",
   210 => x"ff49fdc3",
   211 => x"7087e5da",
   212 => x"0299c249",
   213 => x"c287d5c0",
   214 => x"02bff1e4",
   215 => x"c287c9c0",
   216 => x"c048f1e4",
   217 => x"87c2c078",
   218 => x"4dc14cfd",
   219 => x"ff49fac3",
   220 => x"7087c1da",
   221 => x"0299c249",
   222 => x"c287d9c0",
   223 => x"48bff1e4",
   224 => x"03a8b7c7",
   225 => x"c287c9c0",
   226 => x"c748f1e4",
   227 => x"87c2c078",
   228 => x"4dc14cfc",
   229 => x"03acb7c0",
   230 => x"c487d3c0",
   231 => x"d8c14866",
   232 => x"6e7e7080",
   233 => x"c5c002bf",
   234 => x"49744b87",
   235 => x"1ec00f73",
   236 => x"c11ef0c3",
   237 => x"cef649da",
   238 => x"7086c887",
   239 => x"d8c00298",
   240 => x"f1e4c287",
   241 => x"496e7ebf",
   242 => x"66c491cb",
   243 => x"6a82714a",
   244 => x"87c5c002",
   245 => x"73496e4b",
   246 => x"029d750f",
   247 => x"c287c8c0",
   248 => x"49bff1e4",
   249 => x"c287e4f1",
   250 => x"02bfffd1",
   251 => x"4987ddc0",
   252 => x"7087dcc2",
   253 => x"d3c00298",
   254 => x"f1e4c287",
   255 => x"caf149bf",
   256 => x"f249c087",
   257 => x"d1c287ea",
   258 => x"78c048ff",
   259 => x"c4f28ef8",
   260 => x"5b5e0e87",
   261 => x"1e0e5d5c",
   262 => x"e4c24c71",
   263 => x"c149bfed",
   264 => x"c14da1cd",
   265 => x"7e6981d1",
   266 => x"cf029c74",
   267 => x"4ba5c487",
   268 => x"e4c27b74",
   269 => x"f149bfed",
   270 => x"7b6e87e3",
   271 => x"c4059c74",
   272 => x"c24bc087",
   273 => x"734bc187",
   274 => x"87e4f149",
   275 => x"c80266d4",
   276 => x"eec04987",
   277 => x"c24a7087",
   278 => x"c24ac087",
   279 => x"265ac3d2",
   280 => x"0087f2f0",
   281 => x"58000000",
   282 => x"1d141112",
   283 => x"5a231c1b",
   284 => x"f5949159",
   285 => x"00f4ebf2",
   286 => x"00000000",
   287 => x"00000000",
   288 => x"1e000000",
   289 => x"c8ff4a71",
   290 => x"a17249bf",
   291 => x"1e4f2648",
   292 => x"89bfc8ff",
   293 => x"c0c0c0fe",
   294 => x"01a9c0c0",
   295 => x"4ac087c4",
   296 => x"4ac187c2",
   297 => x"4f264872",
  others => ( x"00000000")
);

-- Xilinx Vivado attributes
attribute ram_style: string;
attribute ram_style of ram: signal is "block";

signal q_local : std_logic_vector((NB_COL * COL_WIDTH)-1 downto 0);

signal wea : std_logic_vector(NB_COL - 1 downto 0);

begin

	output:
	for i in 0 to NB_COL - 1 generate
		q((i + 1) * COL_WIDTH - 1 downto i * COL_WIDTH) <= q_local((i+1) * COL_WIDTH - 1 downto i * COL_WIDTH);
	end generate;
    
    -- Generate write enable signals
    -- The Block ram generator doesn't like it when the compare is done in the if statement it self.
    wea <= bytesel when we = '1' else (others => '0');

    process(clk)
    begin
        if rising_edge(clk) then
            q_local <= ram(to_integer(unsigned(addr)));
            for i in 0 to NB_COL - 1 loop
                if (wea(NB_COL-i-1) = '1') then
                    ram(to_integer(unsigned(addr)))((i + 1) * COL_WIDTH - 1 downto i * COL_WIDTH) <= d((i + 1) * COL_WIDTH - 1 downto i * COL_WIDTH);
                end if;
            end loop;
        end if;
    end process;

end arch;
