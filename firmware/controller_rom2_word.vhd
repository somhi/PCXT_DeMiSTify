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

     0 => x"c7ff04ab",
     1 => x"4d262687",
     2 => x"4b264c26",
     3 => x"711e4f26",
     4 => x"d1e1c24a",
     5 => x"d1e1c25a",
     6 => x"4978c748",
     7 => x"2687ddfe",
     8 => x"1e731e4f",
     9 => x"b7c04a71",
    10 => x"87d303aa",
    11 => x"bfdfcec2",
    12 => x"c187c405",
    13 => x"c087c24b",
    14 => x"e3cec24b",
    15 => x"c287c45b",
    16 => x"c25ae3ce",
    17 => x"4abfdfce",
    18 => x"c0c19ac1",
    19 => x"e8ec49a2",
    20 => x"c248fc87",
    21 => x"78bfdfce",
    22 => x"1e87effe",
    23 => x"66c44a71",
    24 => x"ea49721e",
    25 => x"262687ee",
    26 => x"4a711e4f",
    27 => x"c348d4ff",
    28 => x"d0ff78ff",
    29 => x"78e1c048",
    30 => x"c148d4ff",
    31 => x"c4497278",
    32 => x"ff787131",
    33 => x"e0c048d0",
    34 => x"1e4f2678",
    35 => x"bfdfcec2",
    36 => x"87e0e649",
    37 => x"48c5e1c2",
    38 => x"c278bfe8",
    39 => x"ec48c1e1",
    40 => x"e1c278bf",
    41 => x"494abfc5",
    42 => x"c899ffc3",
    43 => x"48722ab7",
    44 => x"e1c2b071",
    45 => x"4f2658cd",
    46 => x"5c5b5e0e",
    47 => x"4b710e5d",
    48 => x"c287c8ff",
    49 => x"c048c0e1",
    50 => x"e6497350",
    51 => x"497087c6",
    52 => x"cb9cc24c",
    53 => x"cecb49ee",
    54 => x"4d497087",
    55 => x"97c0e1c2",
    56 => x"e2c105bf",
    57 => x"4966d087",
    58 => x"bfc9e1c2",
    59 => x"87d60599",
    60 => x"c24966d4",
    61 => x"99bfc1e1",
    62 => x"7387cb05",
    63 => x"87d4e549",
    64 => x"c1029870",
    65 => x"4cc187c1",
    66 => x"7587c0fe",
    67 => x"87e3ca49",
    68 => x"c6029870",
    69 => x"c0e1c287",
    70 => x"c250c148",
    71 => x"bf97c0e1",
    72 => x"87e3c005",
    73 => x"bfc9e1c2",
    74 => x"9966d049",
    75 => x"87d6ff05",
    76 => x"bfc1e1c2",
    77 => x"9966d449",
    78 => x"87caff05",
    79 => x"d3e44973",
    80 => x"05987087",
    81 => x"7487fffe",
    82 => x"87fafa48",
    83 => x"5c5b5e0e",
    84 => x"86f80e5d",
    85 => x"ec4c4dc0",
    86 => x"a6c47ebf",
    87 => x"cde1c248",
    88 => x"1ec178bf",
    89 => x"49c71ec0",
    90 => x"c887cdfd",
    91 => x"02987086",
    92 => x"49ff87cd",
    93 => x"c187eafa",
    94 => x"d7e349da",
    95 => x"c24dc187",
    96 => x"bf97c0e1",
    97 => x"c287cf02",
    98 => x"49bfd7ce",
    99 => x"cec2b9c1",
   100 => x"fb7159db",
   101 => x"e1c287d3",
   102 => x"c24bbfc5",
   103 => x"05bfdfce",
   104 => x"c387e9c0",
   105 => x"ebe249fd",
   106 => x"49fac387",
   107 => x"7387e5e2",
   108 => x"99ffc349",
   109 => x"49c01e71",
   110 => x"7387e0fa",
   111 => x"29b7c849",
   112 => x"49c11e71",
   113 => x"c887d4fa",
   114 => x"87f5c586",
   115 => x"bfc9e1c2",
   116 => x"dd029b4b",
   117 => x"dbcec287",
   118 => x"d6c749bf",
   119 => x"05987087",
   120 => x"4bc087c4",
   121 => x"e0c287d2",
   122 => x"87fbc649",
   123 => x"58dfcec2",
   124 => x"cec287c6",
   125 => x"78c048db",
   126 => x"99c24973",
   127 => x"c387cd05",
   128 => x"cfe149eb",
   129 => x"c2497087",
   130 => x"87c20299",
   131 => x"49734cfb",
   132 => x"cd0599c1",
   133 => x"49f4c387",
   134 => x"7087f9e0",
   135 => x"0299c249",
   136 => x"4cfa87c2",
   137 => x"99c84973",
   138 => x"c387cd05",
   139 => x"e3e049f5",
   140 => x"c2497087",
   141 => x"87d50299",
   142 => x"bfd1e1c2",
   143 => x"4887ca02",
   144 => x"e1c288c1",
   145 => x"c2c058d5",
   146 => x"c14cff87",
   147 => x"c449734d",
   148 => x"87ce0599",
   149 => x"ff49f2c3",
   150 => x"7087f9df",
   151 => x"0299c249",
   152 => x"e1c287dc",
   153 => x"487ebfd1",
   154 => x"03a8b7c7",
   155 => x"6e87cbc0",
   156 => x"c280c148",
   157 => x"c058d5e1",
   158 => x"4cfe87c2",
   159 => x"fdc34dc1",
   160 => x"cfdfff49",
   161 => x"c2497087",
   162 => x"87d50299",
   163 => x"bfd1e1c2",
   164 => x"87c9c002",
   165 => x"48d1e1c2",
   166 => x"c2c078c0",
   167 => x"c14cfd87",
   168 => x"49fac34d",
   169 => x"87ecdeff",
   170 => x"99c24970",
   171 => x"87d9c002",
   172 => x"bfd1e1c2",
   173 => x"a8b7c748",
   174 => x"87c9c003",
   175 => x"48d1e1c2",
   176 => x"c2c078c7",
   177 => x"c14cfc87",
   178 => x"acb7c04d",
   179 => x"87d3c003",
   180 => x"c14866c4",
   181 => x"7e7080d8",
   182 => x"c002bf6e",
   183 => x"744b87c5",
   184 => x"c00f7349",
   185 => x"1ef0c31e",
   186 => x"f749dac1",
   187 => x"86c887ca",
   188 => x"c0029870",
   189 => x"e1c287d8",
   190 => x"6e7ebfd1",
   191 => x"c491cb49",
   192 => x"82714a66",
   193 => x"c5c0026a",
   194 => x"496e4b87",
   195 => x"9d750f73",
   196 => x"87c8c002",
   197 => x"bfd1e1c2",
   198 => x"87e0f249",
   199 => x"bfe3cec2",
   200 => x"87ddc002",
   201 => x"87cbc249",
   202 => x"c0029870",
   203 => x"e1c287d3",
   204 => x"f249bfd1",
   205 => x"49c087c6",
   206 => x"c287e6f3",
   207 => x"c048e3ce",
   208 => x"f38ef878",
   209 => x"5e0e87c0",
   210 => x"0e5d5c5b",
   211 => x"c24c711e",
   212 => x"49bfcde1",
   213 => x"4da1cdc1",
   214 => x"6981d1c1",
   215 => x"029c747e",
   216 => x"a5c487cf",
   217 => x"c27b744b",
   218 => x"49bfcde1",
   219 => x"6e87dff2",
   220 => x"059c747b",
   221 => x"4bc087c4",
   222 => x"4bc187c2",
   223 => x"e0f24973",
   224 => x"0266d487",
   225 => x"de4987c7",
   226 => x"c24a7087",
   227 => x"c24ac087",
   228 => x"265ae7ce",
   229 => x"0087eff1",
   230 => x"00000000",
   231 => x"00000000",
   232 => x"00000000",
   233 => x"1e000000",
   234 => x"c8ff4a71",
   235 => x"a17249bf",
   236 => x"1e4f2648",
   237 => x"89bfc8ff",
   238 => x"c0c0c0fe",
   239 => x"01a9c0c0",
   240 => x"4ac087c4",
   241 => x"4ac187c2",
   242 => x"4f264872",
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
