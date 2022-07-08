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

     0 => x"f9ea4972",
     1 => x"4f262687",
     2 => x"ff4a711e",
     3 => x"ffc348d4",
     4 => x"48d0ff78",
     5 => x"ff78e1c0",
     6 => x"78c148d4",
     7 => x"31c44972",
     8 => x"d0ff7871",
     9 => x"78e0c048",
    10 => x"c21e4f26",
    11 => x"49bffdcc",
    12 => x"c287c8e7",
    13 => x"e848e5df",
    14 => x"dfc278bf",
    15 => x"bfec48e1",
    16 => x"e5dfc278",
    17 => x"c3494abf",
    18 => x"b7c899ff",
    19 => x"7148722a",
    20 => x"eddfc2b0",
    21 => x"0e4f2658",
    22 => x"5d5c5b5e",
    23 => x"ff4b710e",
    24 => x"dfc287c8",
    25 => x"50c048e0",
    26 => x"eee64973",
    27 => x"4c497087",
    28 => x"eecb9cc2",
    29 => x"87cdcb49",
    30 => x"c24d4970",
    31 => x"bf97e0df",
    32 => x"87e2c105",
    33 => x"c24966d0",
    34 => x"99bfe9df",
    35 => x"d487d605",
    36 => x"dfc24966",
    37 => x"0599bfe1",
    38 => x"497387cb",
    39 => x"7087fce5",
    40 => x"c1c10298",
    41 => x"fe4cc187",
    42 => x"497587c0",
    43 => x"7087e2ca",
    44 => x"87c60298",
    45 => x"48e0dfc2",
    46 => x"dfc250c1",
    47 => x"05bf97e0",
    48 => x"c287e3c0",
    49 => x"49bfe9df",
    50 => x"059966d0",
    51 => x"c287d6ff",
    52 => x"49bfe1df",
    53 => x"059966d4",
    54 => x"7387caff",
    55 => x"87fbe449",
    56 => x"fe059870",
    57 => x"487487ff",
    58 => x"0e87fafa",
    59 => x"5d5c5b5e",
    60 => x"c086f80e",
    61 => x"bfec4c4d",
    62 => x"48a6c47e",
    63 => x"bfeddfc2",
    64 => x"c01ec178",
    65 => x"fd49c71e",
    66 => x"86c887cd",
    67 => x"cd029870",
    68 => x"fa49ff87",
    69 => x"dac187ea",
    70 => x"87ffe349",
    71 => x"dfc24dc1",
    72 => x"02bf97e0",
    73 => x"ccc287cf",
    74 => x"c149bff5",
    75 => x"f9ccc2b9",
    76 => x"d3fb7159",
    77 => x"e5dfc287",
    78 => x"ccc24bbf",
    79 => x"c005bffd",
    80 => x"fdc387e9",
    81 => x"87d3e349",
    82 => x"e349fac3",
    83 => x"497387cd",
    84 => x"7199ffc3",
    85 => x"fa49c01e",
    86 => x"497387e0",
    87 => x"7129b7c8",
    88 => x"fa49c11e",
    89 => x"86c887d4",
    90 => x"c287f4c5",
    91 => x"4bbfe9df",
    92 => x"87dd029b",
    93 => x"bff9ccc2",
    94 => x"87d5c749",
    95 => x"c4059870",
    96 => x"d24bc087",
    97 => x"49e0c287",
    98 => x"c287fac6",
    99 => x"c658fdcc",
   100 => x"f9ccc287",
   101 => x"7378c048",
   102 => x"0599c249",
   103 => x"ebc387cd",
   104 => x"87f7e149",
   105 => x"99c24970",
   106 => x"fb87c202",
   107 => x"c149734c",
   108 => x"87cd0599",
   109 => x"e149f4c3",
   110 => x"497087e1",
   111 => x"c20299c2",
   112 => x"734cfa87",
   113 => x"0599c849",
   114 => x"f5c387cd",
   115 => x"87cbe149",
   116 => x"99c24970",
   117 => x"c287d502",
   118 => x"02bff1df",
   119 => x"c14887ca",
   120 => x"f5dfc288",
   121 => x"87c2c058",
   122 => x"4dc14cff",
   123 => x"99c44973",
   124 => x"c387cd05",
   125 => x"e2e049f2",
   126 => x"c2497087",
   127 => x"87dc0299",
   128 => x"bff1dfc2",
   129 => x"b7c7487e",
   130 => x"cbc003a8",
   131 => x"c1486e87",
   132 => x"f5dfc280",
   133 => x"87c2c058",
   134 => x"4dc14cfe",
   135 => x"ff49fdc3",
   136 => x"7087f8df",
   137 => x"0299c249",
   138 => x"dfc287d5",
   139 => x"c002bff1",
   140 => x"dfc287c9",
   141 => x"78c048f1",
   142 => x"fd87c2c0",
   143 => x"c34dc14c",
   144 => x"dfff49fa",
   145 => x"497087d5",
   146 => x"c00299c2",
   147 => x"dfc287d9",
   148 => x"c748bff1",
   149 => x"c003a8b7",
   150 => x"dfc287c9",
   151 => x"78c748f1",
   152 => x"fc87c2c0",
   153 => x"c04dc14c",
   154 => x"c003acb7",
   155 => x"66c487d3",
   156 => x"80d8c148",
   157 => x"bf6e7e70",
   158 => x"87c5c002",
   159 => x"7349744b",
   160 => x"c31ec00f",
   161 => x"dac11ef0",
   162 => x"87cbf749",
   163 => x"987086c8",
   164 => x"87d8c002",
   165 => x"bff1dfc2",
   166 => x"cb496e7e",
   167 => x"4a66c491",
   168 => x"026a8271",
   169 => x"4b87c5c0",
   170 => x"0f73496e",
   171 => x"c0029d75",
   172 => x"dfc287c8",
   173 => x"f249bff1",
   174 => x"cdc287e1",
   175 => x"c002bfc1",
   176 => x"c24987dd",
   177 => x"987087cb",
   178 => x"87d3c002",
   179 => x"bff1dfc2",
   180 => x"87c7f249",
   181 => x"e7f349c0",
   182 => x"c1cdc287",
   183 => x"f878c048",
   184 => x"87c1f38e",
   185 => x"5c5b5e0e",
   186 => x"711e0e5d",
   187 => x"eddfc24c",
   188 => x"cdc149bf",
   189 => x"d1c14da1",
   190 => x"747e6981",
   191 => x"87cf029c",
   192 => x"744ba5c4",
   193 => x"eddfc27b",
   194 => x"e0f249bf",
   195 => x"747b6e87",
   196 => x"87c4059c",
   197 => x"87c24bc0",
   198 => x"49734bc1",
   199 => x"d487e1f2",
   200 => x"87c70266",
   201 => x"7087de49",
   202 => x"c087c24a",
   203 => x"c5cdc24a",
   204 => x"f0f1265a",
   205 => x"00000087",
   206 => x"00000000",
   207 => x"00000000",
   208 => x"00000000",
   209 => x"4a711e00",
   210 => x"49bfc8ff",
   211 => x"2648a172",
   212 => x"c8ff1e4f",
   213 => x"c0fe89bf",
   214 => x"c0c0c0c0",
   215 => x"87c401a9",
   216 => x"87c24ac0",
   217 => x"48724ac1",
   218 => x"48724f26",
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
