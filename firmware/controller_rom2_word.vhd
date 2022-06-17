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

     0 => x"87d303aa",
     1 => x"bffdcec2",
     2 => x"c187c405",
     3 => x"c087c24b",
     4 => x"c1cfc24b",
     5 => x"c287c45b",
     6 => x"c25ac1cf",
     7 => x"4abffdce",
     8 => x"c0c19ac1",
     9 => x"e8ec49a2",
    10 => x"c248fc87",
    11 => x"78bffdce",
    12 => x"1e87effe",
    13 => x"66c44a71",
    14 => x"ea49721e",
    15 => x"262687f9",
    16 => x"4a711e4f",
    17 => x"c348d4ff",
    18 => x"d0ff78ff",
    19 => x"78e1c048",
    20 => x"c148d4ff",
    21 => x"c4497278",
    22 => x"ff787131",
    23 => x"e0c048d0",
    24 => x"1e4f2678",
    25 => x"bffdcec2",
    26 => x"87c8e749",
    27 => x"48e5e1c2",
    28 => x"c278bfe8",
    29 => x"ec48e1e1",
    30 => x"e1c278bf",
    31 => x"494abfe5",
    32 => x"c899ffc3",
    33 => x"48722ab7",
    34 => x"e1c2b071",
    35 => x"4f2658ed",
    36 => x"5c5b5e0e",
    37 => x"4b710e5d",
    38 => x"c287c8ff",
    39 => x"c048e0e1",
    40 => x"e6497350",
    41 => x"497087ee",
    42 => x"cb9cc24c",
    43 => x"d4cc49ee",
    44 => x"4d497087",
    45 => x"97e0e1c2",
    46 => x"e2c105bf",
    47 => x"4966d087",
    48 => x"bfe9e1c2",
    49 => x"87d60599",
    50 => x"c24966d4",
    51 => x"99bfe1e1",
    52 => x"7387cb05",
    53 => x"87fce549",
    54 => x"c1029870",
    55 => x"4cc187c1",
    56 => x"7587c0fe",
    57 => x"87e9cb49",
    58 => x"c6029870",
    59 => x"e0e1c287",
    60 => x"c250c148",
    61 => x"bf97e0e1",
    62 => x"87e3c005",
    63 => x"bfe9e1c2",
    64 => x"9966d049",
    65 => x"87d6ff05",
    66 => x"bfe1e1c2",
    67 => x"9966d449",
    68 => x"87caff05",
    69 => x"fbe44973",
    70 => x"05987087",
    71 => x"7487fffe",
    72 => x"87fafa48",
    73 => x"5c5b5e0e",
    74 => x"86f80e5d",
    75 => x"ec4c4dc0",
    76 => x"a6c47ebf",
    77 => x"ede1c248",
    78 => x"1ec178bf",
    79 => x"49c71ec0",
    80 => x"c887cdfd",
    81 => x"02987086",
    82 => x"49ff87cd",
    83 => x"c187eafa",
    84 => x"ffe349da",
    85 => x"c24dc187",
    86 => x"bf97e0e1",
    87 => x"c287cf02",
    88 => x"49bfe5ce",
    89 => x"cec2b9c1",
    90 => x"fb7159e9",
    91 => x"e1c287d3",
    92 => x"c24bbfe5",
    93 => x"05bffdce",
    94 => x"c487d9c1",
    95 => x"c0c848a6",
    96 => x"cec278c0",
    97 => x"976e7ee9",
    98 => x"486e49bf",
    99 => x"7e7080c1",
   100 => x"87c0e371",
   101 => x"c3029870",
   102 => x"b366c487",
   103 => x"c14866c4",
   104 => x"a6c828b7",
   105 => x"05987058",
   106 => x"c387dbff",
   107 => x"e3e249fd",
   108 => x"49fac387",
   109 => x"7387dde2",
   110 => x"99ffc349",
   111 => x"49c01e71",
   112 => x"7387f0f9",
   113 => x"29b7c849",
   114 => x"49c11e71",
   115 => x"c887e4f9",
   116 => x"87fac586",
   117 => x"bfe9e1c2",
   118 => x"dd029b4b",
   119 => x"f9cec287",
   120 => x"ecc749bf",
   121 => x"05987087",
   122 => x"4bc087c4",
   123 => x"e0c287d2",
   124 => x"87d1c749",
   125 => x"58fdcec2",
   126 => x"cec287c6",
   127 => x"78c048f9",
   128 => x"99c24973",
   129 => x"c387ce05",
   130 => x"c7e149eb",
   131 => x"c2497087",
   132 => x"c2c00299",
   133 => x"734cfb87",
   134 => x"0599c149",
   135 => x"f4c387ce",
   136 => x"87f0e049",
   137 => x"99c24970",
   138 => x"87c2c002",
   139 => x"49734cfa",
   140 => x"cd0599c8",
   141 => x"49f5c387",
   142 => x"7087d9e0",
   143 => x"0299c249",
   144 => x"e1c287d6",
   145 => x"c002bff1",
   146 => x"c14887ca",
   147 => x"f5e1c288",
   148 => x"87c2c058",
   149 => x"4dc14cff",
   150 => x"99c44973",
   151 => x"87cec005",
   152 => x"ff49f2c3",
   153 => x"7087eddf",
   154 => x"0299c249",
   155 => x"e1c287dc",
   156 => x"487ebff1",
   157 => x"03a8b7c7",
   158 => x"6e87cbc0",
   159 => x"c280c148",
   160 => x"c058f5e1",
   161 => x"4cfe87c2",
   162 => x"fdc34dc1",
   163 => x"c3dfff49",
   164 => x"c2497087",
   165 => x"d5c00299",
   166 => x"f1e1c287",
   167 => x"c9c002bf",
   168 => x"f1e1c287",
   169 => x"c078c048",
   170 => x"4cfd87c2",
   171 => x"fac34dc1",
   172 => x"dfdeff49",
   173 => x"c2497087",
   174 => x"d9c00299",
   175 => x"f1e1c287",
   176 => x"b7c748bf",
   177 => x"c9c003a8",
   178 => x"f1e1c287",
   179 => x"c078c748",
   180 => x"4cfc87c2",
   181 => x"b7c04dc1",
   182 => x"d3c003ac",
   183 => x"4866c487",
   184 => x"7080d8c1",
   185 => x"02bf6e7e",
   186 => x"4b87c5c0",
   187 => x"0f734974",
   188 => x"f0c31ec0",
   189 => x"49dac11e",
   190 => x"c887d5f6",
   191 => x"02987086",
   192 => x"c287d8c0",
   193 => x"7ebff1e1",
   194 => x"91cb496e",
   195 => x"714a66c4",
   196 => x"c0026a82",
   197 => x"6e4b87c5",
   198 => x"750f7349",
   199 => x"c8c0029d",
   200 => x"f1e1c287",
   201 => x"ebf149bf",
   202 => x"c1cfc287",
   203 => x"ddc002bf",
   204 => x"dcc24987",
   205 => x"02987087",
   206 => x"c287d3c0",
   207 => x"49bff1e1",
   208 => x"c087d1f1",
   209 => x"87f1f249",
   210 => x"48c1cfc2",
   211 => x"8ef878c0",
   212 => x"0e87cbf2",
   213 => x"5d5c5b5e",
   214 => x"4c711e0e",
   215 => x"bfede1c2",
   216 => x"a1cdc149",
   217 => x"81d1c14d",
   218 => x"9c747e69",
   219 => x"c487cf02",
   220 => x"7b744ba5",
   221 => x"bfede1c2",
   222 => x"87eaf149",
   223 => x"9c747b6e",
   224 => x"c087c405",
   225 => x"c187c24b",
   226 => x"f149734b",
   227 => x"66d487eb",
   228 => x"4987c802",
   229 => x"7087eec0",
   230 => x"c087c24a",
   231 => x"c5cfc24a",
   232 => x"f9f0265a",
   233 => x"00000087",
   234 => x"11125800",
   235 => x"1c1b1d14",
   236 => x"91595a23",
   237 => x"ebf2f594",
   238 => x"000000f4",
   239 => x"00000000",
   240 => x"00000000",
   241 => x"4a711e00",
   242 => x"49bfc8ff",
   243 => x"2648a172",
   244 => x"c8ff1e4f",
   245 => x"c0fe89bf",
   246 => x"c0c0c0c0",
   247 => x"87c401a9",
   248 => x"87c24ac0",
   249 => x"48724ac1",
   250 => x"48724f26",
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
