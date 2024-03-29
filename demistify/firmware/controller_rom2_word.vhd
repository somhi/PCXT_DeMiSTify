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

     0 => x"bff5e1c3",
     1 => x"f5e1c349",
     2 => x"78a1c148",
     3 => x"a9b7c0c4",
     4 => x"ff87e504",
     5 => x"78c848d0",
     6 => x"48c1e2c3",
     7 => x"4f2678c0",
     8 => x"00000000",
     9 => x"00000000",
    10 => x"5f000000",
    11 => x"0000005f",
    12 => x"00030300",
    13 => x"00000303",
    14 => x"147f7f14",
    15 => x"00147f7f",
    16 => x"6b2e2400",
    17 => x"00123a6b",
    18 => x"18366a4c",
    19 => x"0032566c",
    20 => x"594f7e30",
    21 => x"40683a77",
    22 => x"07040000",
    23 => x"00000003",
    24 => x"3e1c0000",
    25 => x"00004163",
    26 => x"63410000",
    27 => x"00001c3e",
    28 => x"1c3e2a08",
    29 => x"082a3e1c",
    30 => x"3e080800",
    31 => x"0008083e",
    32 => x"e0800000",
    33 => x"00000060",
    34 => x"08080800",
    35 => x"00080808",
    36 => x"60000000",
    37 => x"00000060",
    38 => x"18306040",
    39 => x"0103060c",
    40 => x"597f3e00",
    41 => x"003e7f4d",
    42 => x"7f060400",
    43 => x"0000007f",
    44 => x"71634200",
    45 => x"00464f59",
    46 => x"49632200",
    47 => x"00367f49",
    48 => x"13161c18",
    49 => x"00107f7f",
    50 => x"45672700",
    51 => x"00397d45",
    52 => x"4b7e3c00",
    53 => x"00307949",
    54 => x"71010100",
    55 => x"00070f79",
    56 => x"497f3600",
    57 => x"00367f49",
    58 => x"494f0600",
    59 => x"001e3f69",
    60 => x"66000000",
    61 => x"00000066",
    62 => x"e6800000",
    63 => x"00000066",
    64 => x"14080800",
    65 => x"00222214",
    66 => x"14141400",
    67 => x"00141414",
    68 => x"14222200",
    69 => x"00080814",
    70 => x"51030200",
    71 => x"00060f59",
    72 => x"5d417f3e",
    73 => x"001e1f55",
    74 => x"097f7e00",
    75 => x"007e7f09",
    76 => x"497f7f00",
    77 => x"00367f49",
    78 => x"633e1c00",
    79 => x"00414141",
    80 => x"417f7f00",
    81 => x"001c3e63",
    82 => x"497f7f00",
    83 => x"00414149",
    84 => x"097f7f00",
    85 => x"00010109",
    86 => x"417f3e00",
    87 => x"007a7b49",
    88 => x"087f7f00",
    89 => x"007f7f08",
    90 => x"7f410000",
    91 => x"0000417f",
    92 => x"40602000",
    93 => x"003f7f40",
    94 => x"1c087f7f",
    95 => x"00416336",
    96 => x"407f7f00",
    97 => x"00404040",
    98 => x"0c067f7f",
    99 => x"007f7f06",
   100 => x"0c067f7f",
   101 => x"007f7f18",
   102 => x"417f3e00",
   103 => x"003e7f41",
   104 => x"097f7f00",
   105 => x"00060f09",
   106 => x"61417f3e",
   107 => x"00407e7f",
   108 => x"097f7f00",
   109 => x"00667f19",
   110 => x"4d6f2600",
   111 => x"00327b59",
   112 => x"7f010100",
   113 => x"0001017f",
   114 => x"407f3f00",
   115 => x"003f7f40",
   116 => x"703f0f00",
   117 => x"000f3f70",
   118 => x"18307f7f",
   119 => x"007f7f30",
   120 => x"1c366341",
   121 => x"4163361c",
   122 => x"7c060301",
   123 => x"0103067c",
   124 => x"4d597161",
   125 => x"00414347",
   126 => x"7f7f0000",
   127 => x"00004141",
   128 => x"0c060301",
   129 => x"40603018",
   130 => x"41410000",
   131 => x"00007f7f",
   132 => x"03060c08",
   133 => x"00080c06",
   134 => x"80808080",
   135 => x"00808080",
   136 => x"03000000",
   137 => x"00000407",
   138 => x"54742000",
   139 => x"00787c54",
   140 => x"447f7f00",
   141 => x"00387c44",
   142 => x"447c3800",
   143 => x"00004444",
   144 => x"447c3800",
   145 => x"007f7f44",
   146 => x"547c3800",
   147 => x"00185c54",
   148 => x"7f7e0400",
   149 => x"00000505",
   150 => x"a4bc1800",
   151 => x"007cfca4",
   152 => x"047f7f00",
   153 => x"00787c04",
   154 => x"3d000000",
   155 => x"0000407d",
   156 => x"80808000",
   157 => x"00007dfd",
   158 => x"107f7f00",
   159 => x"00446c38",
   160 => x"3f000000",
   161 => x"0000407f",
   162 => x"180c7c7c",
   163 => x"00787c0c",
   164 => x"047c7c00",
   165 => x"00787c04",
   166 => x"447c3800",
   167 => x"00387c44",
   168 => x"24fcfc00",
   169 => x"00183c24",
   170 => x"243c1800",
   171 => x"00fcfc24",
   172 => x"047c7c00",
   173 => x"00080c04",
   174 => x"545c4800",
   175 => x"00207454",
   176 => x"7f3f0400",
   177 => x"00004444",
   178 => x"407c3c00",
   179 => x"007c7c40",
   180 => x"603c1c00",
   181 => x"001c3c60",
   182 => x"30607c3c",
   183 => x"003c7c60",
   184 => x"10386c44",
   185 => x"00446c38",
   186 => x"e0bc1c00",
   187 => x"001c3c60",
   188 => x"74644400",
   189 => x"00444c5c",
   190 => x"3e080800",
   191 => x"00414177",
   192 => x"7f000000",
   193 => x"0000007f",
   194 => x"77414100",
   195 => x"0008083e",
   196 => x"03010102",
   197 => x"00010202",
   198 => x"7f7f7f7f",
   199 => x"007f7f7f",
   200 => x"1c1c0808",
   201 => x"7f7f3e3e",
   202 => x"3e3e7f7f",
   203 => x"08081c1c",
   204 => x"7c181000",
   205 => x"0010187c",
   206 => x"7c301000",
   207 => x"0010307c",
   208 => x"60603010",
   209 => x"00061e78",
   210 => x"183c6642",
   211 => x"0042663c",
   212 => x"c26a3878",
   213 => x"00386cc6",
   214 => x"60000060",
   215 => x"00600000",
   216 => x"5c5b5e0e",
   217 => x"711e0e5d",
   218 => x"d2e2c34c",
   219 => x"4bc04dbf",
   220 => x"ab741ec0",
   221 => x"c487c702",
   222 => x"78c048a6",
   223 => x"a6c487c5",
   224 => x"c478c148",
   225 => x"49731e66",
   226 => x"c887dfee",
   227 => x"49e0c086",
   228 => x"c487efef",
   229 => x"496a4aa5",
   230 => x"f187f0f0",
   231 => x"85cb87c6",
   232 => x"b7c883c1",
   233 => x"c7ff04ab",
   234 => x"4d262687",
   235 => x"4b264c26",
   236 => x"711e4f26",
   237 => x"d6e2c34a",
   238 => x"d6e2c35a",
   239 => x"4978c748",
   240 => x"2687ddfe",
   241 => x"1e731e4f",
   242 => x"b7c04a71",
   243 => x"87d303aa",
   244 => x"bfe7ddc2",
   245 => x"c187c405",
   246 => x"c087c24b",
   247 => x"ebddc24b",
   248 => x"c287c45b",
   249 => x"c25aebdd",
   250 => x"4abfe7dd",
   251 => x"c0c19ac1",
   252 => x"e8ec49a2",
   253 => x"c248fc87",
   254 => x"78bfe7dd",
   255 => x"1e87effe",
   256 => x"66c44a71",
   257 => x"e549721e",
   258 => x"262687f2",
   259 => x"ddc21e4f",
   260 => x"e249bfe7",
   261 => x"e2c387e1",
   262 => x"bfe848ca",
   263 => x"c6e2c378",
   264 => x"78bfec48",
   265 => x"bfcae2c3",
   266 => x"ffc3494a",
   267 => x"2ab7c899",
   268 => x"b0714872",
   269 => x"58d2e2c3",
   270 => x"5e0e4f26",
   271 => x"0e5d5c5b",
   272 => x"c8ff4b71",
   273 => x"c5e2c387",
   274 => x"7350c048",
   275 => x"87c7e249",
   276 => x"c24c4970",
   277 => x"49eecb9c",
   278 => x"7087d4cc",
   279 => x"e2c34d49",
   280 => x"05bf97c5",
   281 => x"d087e2c1",
   282 => x"e2c34966",
   283 => x"0599bfce",
   284 => x"66d487d6",
   285 => x"c6e2c349",
   286 => x"cb0599bf",
   287 => x"e1497387",
   288 => x"987087d5",
   289 => x"87c1c102",
   290 => x"c0fe4cc1",
   291 => x"cb497587",
   292 => x"987087e9",
   293 => x"c387c602",
   294 => x"c148c5e2",
   295 => x"c5e2c350",
   296 => x"c005bf97",
   297 => x"e2c387e3",
   298 => x"d049bfce",
   299 => x"ff059966",
   300 => x"e2c387d6",
   301 => x"d449bfc6",
   302 => x"ff059966",
   303 => x"497387ca",
   304 => x"7087d4e0",
   305 => x"fffe0598",
   306 => x"fb487487",
   307 => x"5e0e87dc",
   308 => x"0e5d5c5b",
   309 => x"4dc086f4",
   310 => x"7ebfec4c",
   311 => x"c348a6c4",
   312 => x"78bfd2e2",
   313 => x"1ec01ec1",
   314 => x"cdfd49c7",
   315 => x"7086c887",
   316 => x"87ce0298",
   317 => x"ccfb49ff",
   318 => x"49dac187",
   319 => x"87d7dfff",
   320 => x"e2c34dc1",
   321 => x"02bf97c5",
   322 => x"f8c087c4",
   323 => x"e2c387c8",
   324 => x"c24bbfca",
   325 => x"05bfe7dd",
   326 => x"c487dcc1",
   327 => x"c0c848a6",
   328 => x"ddc278c0",
   329 => x"976e7ed3",
   330 => x"486e49bf",
   331 => x"7e7080c1",
   332 => x"e2deff71",
   333 => x"02987087",
   334 => x"66c487c3",
   335 => x"4866c4b3",
   336 => x"c828b7c1",
   337 => x"987058a6",
   338 => x"87daff05",
   339 => x"ff49fdc3",
   340 => x"c387c4de",
   341 => x"ddff49fa",
   342 => x"497387fd",
   343 => x"7199ffc3",
   344 => x"fa49c01e",
   345 => x"497387d9",
   346 => x"7129b7c8",
   347 => x"fa49c11e",
   348 => x"86c887cd",
   349 => x"c387c5c6",
   350 => x"4bbfcee2",
   351 => x"87dd029b",
   352 => x"bfe3ddc2",
   353 => x"87f3c749",
   354 => x"c4059870",
   355 => x"d24bc087",
   356 => x"49e0c287",
   357 => x"c287d8c7",
   358 => x"c658e7dd",
   359 => x"e3ddc287",
   360 => x"7378c048",
   361 => x"0599c249",
   362 => x"ebc387cf",
   363 => x"e6dcff49",
   364 => x"c2497087",
   365 => x"c2c00299",
   366 => x"734cfb87",
   367 => x"0599c149",
   368 => x"f4c387cf",
   369 => x"cedcff49",
   370 => x"c2497087",
   371 => x"c2c00299",
   372 => x"734cfa87",
   373 => x"0599c849",
   374 => x"f5c387ce",
   375 => x"f6dbff49",
   376 => x"c2497087",
   377 => x"87d60299",
   378 => x"bfd6e2c3",
   379 => x"87cac002",
   380 => x"c388c148",
   381 => x"c058dae2",
   382 => x"4cff87c2",
   383 => x"49734dc1",
   384 => x"c00599c4",
   385 => x"f2c387ce",
   386 => x"cadbff49",
   387 => x"c2497087",
   388 => x"87dc0299",
   389 => x"bfd6e2c3",
   390 => x"b7c7487e",
   391 => x"cbc003a8",
   392 => x"c1486e87",
   393 => x"dae2c380",
   394 => x"87c2c058",
   395 => x"4dc14cfe",
   396 => x"ff49fdc3",
   397 => x"7087e0da",
   398 => x"0299c249",
   399 => x"c387d5c0",
   400 => x"02bfd6e2",
   401 => x"c387c9c0",
   402 => x"c048d6e2",
   403 => x"87c2c078",
   404 => x"4dc14cfd",
   405 => x"ff49fac3",
   406 => x"7087fcd9",
   407 => x"0299c249",
   408 => x"c387d9c0",
   409 => x"48bfd6e2",
   410 => x"03a8b7c7",
   411 => x"c387c9c0",
   412 => x"c748d6e2",
   413 => x"87c2c078",
   414 => x"4dc14cfc",
   415 => x"03acb7c0",
   416 => x"c487d1c0",
   417 => x"d8c14a66",
   418 => x"c0026a82",
   419 => x"4b6a87c6",
   420 => x"0f734974",
   421 => x"f0c31ec0",
   422 => x"49dac11e",
   423 => x"c887dbf6",
   424 => x"02987086",
   425 => x"c887e2c0",
   426 => x"e2c348a6",
   427 => x"c878bfd6",
   428 => x"91cb4966",
   429 => x"714866c4",
   430 => x"6e7e7080",
   431 => x"c8c002bf",
   432 => x"4bbf6e87",
   433 => x"734966c8",
   434 => x"029d750f",
   435 => x"c387c8c0",
   436 => x"49bfd6e2",
   437 => x"c287c9f2",
   438 => x"02bfebdd",
   439 => x"4987ddc0",
   440 => x"7087d8c2",
   441 => x"d3c00298",
   442 => x"d6e2c387",
   443 => x"eff149bf",
   444 => x"f349c087",
   445 => x"ddc287cf",
   446 => x"78c048eb",
   447 => x"e9f28ef4",
   448 => x"5b5e0e87",
   449 => x"1e0e5d5c",
   450 => x"e2c34c71",
   451 => x"c149bfd2",
   452 => x"c14da1cd",
   453 => x"7e6981d1",
   454 => x"cf029c74",
   455 => x"4ba5c487",
   456 => x"e2c37b74",
   457 => x"f249bfd2",
   458 => x"7b6e87c8",
   459 => x"c4059c74",
   460 => x"c24bc087",
   461 => x"734bc187",
   462 => x"87c9f249",
   463 => x"c80266d4",
   464 => x"eac04987",
   465 => x"c24a7087",
   466 => x"c24ac087",
   467 => x"265aefdd",
   468 => x"5887d7f1",
   469 => x"1d141112",
   470 => x"5a231c1b",
   471 => x"f5949159",
   472 => x"00f4ebf2",
   473 => x"00000000",
   474 => x"00000000",
   475 => x"1e000000",
   476 => x"c8ff4a71",
   477 => x"a17249bf",
   478 => x"1e4f2648",
   479 => x"89bfc8ff",
   480 => x"c0c0c0fe",
   481 => x"01a9c0c0",
   482 => x"4ac087c4",
   483 => x"4ac187c2",
   484 => x"4f264872",
   485 => x"4ad4ff1e",
   486 => x"c848d0ff",
   487 => x"f0c378c5",
   488 => x"c07a717a",
   489 => x"7a7a7a7a",
   490 => x"4f2678c4",
   491 => x"4ad4ff1e",
   492 => x"c848d0ff",
   493 => x"7ac078c5",
   494 => x"7ac0496a",
   495 => x"7a7a7a7a",
   496 => x"487178c4",
   497 => x"5e0e4f26",
   498 => x"0e5d5c5b",
   499 => x"a6cc86e4",
   500 => x"66ecc059",
   501 => x"58a6dc48",
   502 => x"e8c24d70",
   503 => x"dae2c395",
   504 => x"a5d8c285",
   505 => x"48a6c47e",
   506 => x"78a5dcc2",
   507 => x"4cbf66c4",
   508 => x"c294bf6e",
   509 => x"946d85e0",
   510 => x"c04b66c8",
   511 => x"49c0c84a",
   512 => x"87c1e3fd",
   513 => x"c14866c8",
   514 => x"c8789fc0",
   515 => x"81c24966",
   516 => x"799fbf6e",
   517 => x"c64966c8",
   518 => x"bf66c481",
   519 => x"66c8799f",
   520 => x"6d81cc49",
   521 => x"66c8799f",
   522 => x"d080d448",
   523 => x"e3c258a6",
   524 => x"66cc48ff",
   525 => x"4aa1d449",
   526 => x"aa714120",
   527 => x"c887f905",
   528 => x"eec04866",
   529 => x"58a6d480",
   530 => x"48d4e4c2",
   531 => x"c84966d0",
   532 => x"41204aa1",
   533 => x"f905aa71",
   534 => x"4866c887",
   535 => x"d880f6c0",
   536 => x"e4c258a6",
   537 => x"66d448dd",
   538 => x"a1e8c049",
   539 => x"7141204a",
   540 => x"87f905aa",
   541 => x"c04a66d8",
   542 => x"66d482f1",
   543 => x"7281cb49",
   544 => x"4966c851",
   545 => x"c881dec1",
   546 => x"799fd0c0",
   547 => x"c14966c8",
   548 => x"c0c881e2",
   549 => x"66c8799f",
   550 => x"81eac149",
   551 => x"c8799fc1",
   552 => x"ecc14966",
   553 => x"9fbf6e81",
   554 => x"4966c879",
   555 => x"c481eec1",
   556 => x"799fbf66",
   557 => x"c14966c8",
   558 => x"9f6d81f0",
   559 => x"cf4b7479",
   560 => x"739bffff",
   561 => x"4966c84a",
   562 => x"7281f2c1",
   563 => x"4a74799f",
   564 => x"ffcf2ad0",
   565 => x"4c729aff",
   566 => x"c14966c8",
   567 => x"9f7481f4",
   568 => x"66c87379",
   569 => x"81f8c149",
   570 => x"72799f73",
   571 => x"c14966c8",
   572 => x"9f7281fa",
   573 => x"268ee479",
   574 => x"264c264d",
   575 => x"694f264b",
   576 => x"6953544d",
   577 => x"696e694d",
   578 => x"7267484d",
   579 => x"6c646661",
   580 => x"00652069",
   581 => x"3030312e",
   582 => x"20202020",
   583 => x"69446500",
   584 => x"6653544d",
   585 => x"20792069",
   586 => x"20202020",
   587 => x"20202020",
   588 => x"20202020",
   589 => x"20202020",
   590 => x"20202020",
   591 => x"20202020",
   592 => x"20202020",
   593 => x"731e0020",
   594 => x"d44b711e",
   595 => x"87d40266",
   596 => x"d84966c8",
   597 => x"c84a7331",
   598 => x"49a17232",
   599 => x"718166cc",
   600 => x"87e3c048",
   601 => x"c24966d0",
   602 => x"e2c391e8",
   603 => x"dcc281da",
   604 => x"4a6a4aa1",
   605 => x"66c89273",
   606 => x"81e0c282",
   607 => x"91724969",
   608 => x"c18166cc",
   609 => x"fd487189",
   610 => x"711e87f1",
   611 => x"49d4ff4a",
   612 => x"c848d0ff",
   613 => x"d0c278c5",
   614 => x"7979c079",
   615 => x"79797979",
   616 => x"79727979",
   617 => x"66c479c0",
   618 => x"c879c079",
   619 => x"79c07966",
   620 => x"c07966cc",
   621 => x"7966d079",
   622 => x"66d479c0",
   623 => x"2678c479",
   624 => x"4a711e4f",
   625 => x"9749a2c6",
   626 => x"f0c34969",
   627 => x"c01e7199",
   628 => x"1ec11e1e",
   629 => x"fe491ec0",
   630 => x"d0c287f0",
   631 => x"87f4f649",
   632 => x"4f268eec",
   633 => x"1e1ec01e",
   634 => x"c11e1e1e",
   635 => x"87dafe49",
   636 => x"f649d0c2",
   637 => x"8eec87de",
   638 => x"711e4f26",
   639 => x"48d0ff4a",
   640 => x"ff78c5c8",
   641 => x"e0c248d4",
   642 => x"7878c078",
   643 => x"c8787878",
   644 => x"49721ec0",
   645 => x"87dfdcfd",
   646 => x"c448d0ff",
   647 => x"4f262678",
   648 => x"5c5b5e0e",
   649 => x"86f80e5d",
   650 => x"a2c24a71",
   651 => x"7b97c14b",
   652 => x"c14ca2c3",
   653 => x"49a27c97",
   654 => x"a2c451c0",
   655 => x"7d97c04d",
   656 => x"6e7ea2c5",
   657 => x"c450c048",
   658 => x"a2c648a6",
   659 => x"4866c478",
   660 => x"66d850c0",
   661 => x"c6d1c31e",
   662 => x"87eaf549",
   663 => x"bf9766c8",
   664 => x"66c81e49",
   665 => x"1e49bf97",
   666 => x"141e4915",
   667 => x"49131e49",
   668 => x"fc49c01e",
   669 => x"49c887d4",
   670 => x"c387d9f4",
   671 => x"fd49c6d1",
   672 => x"49d087f8",
   673 => x"e087cdf4",
   674 => x"87ebf98e",
   675 => x"c64a711e",
   676 => x"699749a2",
   677 => x"a2c51e49",
   678 => x"49699749",
   679 => x"49a2c41e",
   680 => x"1e496997",
   681 => x"9749a2c3",
   682 => x"c21e4969",
   683 => x"699749a2",
   684 => x"49c01e49",
   685 => x"c287d3fb",
   686 => x"d7f349d0",
   687 => x"268eec87",
   688 => x"1e731e4f",
   689 => x"a2c24a71",
   690 => x"d04b1149",
   691 => x"c806abb7",
   692 => x"49d1c287",
   693 => x"d587fdf2",
   694 => x"4966c887",
   695 => x"c391e8c2",
   696 => x"c281dae2",
   697 => x"797381e4",
   698 => x"f249d0c2",
   699 => x"caf887e6",
   700 => x"1e731e87",
   701 => x"a3c64b71",
   702 => x"49699749",
   703 => x"49a3c51e",
   704 => x"1e496997",
   705 => x"9749a3c4",
   706 => x"c31e4969",
   707 => x"699749a3",
   708 => x"a3c21e49",
   709 => x"49699749",
   710 => x"4aa3c11e",
   711 => x"e9f94912",
   712 => x"49d0c287",
   713 => x"ec87edf1",
   714 => x"87cff78e",
   715 => x"5c5b5e0e",
   716 => x"711e0e5d",
   717 => x"c2496e7e",
   718 => x"7997c181",
   719 => x"83c34b6e",
   720 => x"6e7b97c1",
   721 => x"c082c14a",
   722 => x"4c6e7a97",
   723 => x"97c084c4",
   724 => x"c54d6e7c",
   725 => x"6e55c085",
   726 => x"9785c64d",
   727 => x"c01e4d6d",
   728 => x"4c6c971e",
   729 => x"4b6b971e",
   730 => x"4969971e",
   731 => x"f849121e",
   732 => x"d0c287d8",
   733 => x"87dcf049",
   734 => x"faf58ee8",
   735 => x"5b5e0e87",
   736 => x"ff0e5d5c",
   737 => x"4c7186dc",
   738 => x"1149a4c3",
   739 => x"4aa4c44d",
   740 => x"9749a4c5",
   741 => x"31c84969",
   742 => x"484a6a97",
   743 => x"a6d4b071",
   744 => x"7ea4c658",
   745 => x"49bf976e",
   746 => x"d898cf48",
   747 => x"487158a6",
   748 => x"dc98c0c1",
   749 => x"ec4858a6",
   750 => x"78a4c280",
   751 => x"bf9766c4",
   752 => x"c3059b4b",
   753 => x"4bc0c487",
   754 => x"c01e66d8",
   755 => x"751e66f8",
   756 => x"66e0c01e",
   757 => x"66e0c01e",
   758 => x"87eaf549",
   759 => x"497086d0",
   760 => x"59a6e0c0",
   761 => x"c5029b73",
   762 => x"f8c087fb",
   763 => x"87c50266",
   764 => x"c55ba6d0",
   765 => x"48a6cc87",
   766 => x"66cc78c1",
   767 => x"66f8c04c",
   768 => x"c087de02",
   769 => x"c24966f4",
   770 => x"e2c391e8",
   771 => x"e4c281da",
   772 => x"48a6c881",
   773 => x"66cc7869",
   774 => x"b766c848",
   775 => x"87c106a8",
   776 => x"66fcc04c",
   777 => x"c887d905",
   778 => x"87e8ed49",
   779 => x"7087fded",
   780 => x"0599c449",
   781 => x"f3ed87ca",
   782 => x"c4497087",
   783 => x"87f60299",
   784 => x"88c14874",
   785 => x"7058a6d0",
   786 => x"029c744a",
   787 => x"c187d4c1",
   788 => x"c2c102ab",
   789 => x"66f4c087",
   790 => x"91e8c249",
   791 => x"48dae2c3",
   792 => x"a6cc8071",
   793 => x"4966c858",
   794 => x"6981e0c2",
   795 => x"e4c005ad",
   796 => x"d44dc187",
   797 => x"80c14866",
   798 => x"c858a6d8",
   799 => x"dcc24966",
   800 => x"05a86981",
   801 => x"a6d487d1",
   802 => x"d078c048",
   803 => x"80c14866",
   804 => x"c258a6d4",
   805 => x"c185c187",
   806 => x"c149728b",
   807 => x"0599718a",
   808 => x"d887ecfe",
   809 => x"87d90266",
   810 => x"66dc4974",
   811 => x"c34a7181",
   812 => x"4d729aff",
   813 => x"b7c84a71",
   814 => x"5aa6d42a",
   815 => x"a629b7d8",
   816 => x"bf976e59",
   817 => x"99f0c349",
   818 => x"71b166d4",
   819 => x"4966d41e",
   820 => x"7129b7c8",
   821 => x"1e66d81e",
   822 => x"66d41e75",
   823 => x"1e49bf97",
   824 => x"e5f249c0",
   825 => x"c086d487",
   826 => x"c10566fc",
   827 => x"49d087f1",
   828 => x"c087e1ea",
   829 => x"c24966f4",
   830 => x"e2c391e8",
   831 => x"807148da",
   832 => x"c858a6cc",
   833 => x"81c84966",
   834 => x"cdc10269",
   835 => x"4966dc87",
   836 => x"1e7131c9",
   837 => x"fd4966cc",
   838 => x"c487e5f8",
   839 => x"a6e0c086",
   840 => x"7866cc48",
   841 => x"c0029c74",
   842 => x"1ec087f5",
   843 => x"fd4966cc",
   844 => x"c187dbf2",
   845 => x"4966d01e",
   846 => x"87f1f0fd",
   847 => x"66dc86c8",
   848 => x"c080c148",
   849 => x"c058a6e0",
   850 => x"484966e0",
   851 => x"e4c088c1",
   852 => x"997158a6",
   853 => x"87d2ff05",
   854 => x"49c987c5",
   855 => x"7387f5e8",
   856 => x"c5fa059b",
   857 => x"66fcc087",
   858 => x"d087c502",
   859 => x"87e4e849",
   860 => x"ee8edcff",
   861 => x"5e0e87c1",
   862 => x"0e5d5c5b",
   863 => x"4c7186e0",
   864 => x"1149a4c3",
   865 => x"58a6d448",
   866 => x"c54aa4c4",
   867 => x"699749a4",
   868 => x"9731c849",
   869 => x"71484a6a",
   870 => x"58a6d8b0",
   871 => x"6e7ea4c6",
   872 => x"4d49bf97",
   873 => x"48719dcf",
   874 => x"dc98c0c1",
   875 => x"ec4858a6",
   876 => x"78a4c280",
   877 => x"bf9766c4",
   878 => x"1e66d84b",
   879 => x"1e66f4c0",
   880 => x"751e66d8",
   881 => x"66e4c01e",
   882 => x"87faed49",
   883 => x"497086d0",
   884 => x"59a6e0c0",
   885 => x"c3059b73",
   886 => x"4bc0c487",
   887 => x"f3e649c4",
   888 => x"4966dc87",
   889 => x"1e7131c9",
   890 => x"4966f4c0",
   891 => x"c391e8c2",
   892 => x"7148dae2",
   893 => x"58a6d480",
   894 => x"fd4966d0",
   895 => x"c487c1f5",
   896 => x"029b7386",
   897 => x"c087dfc4",
   898 => x"c40266f4",
   899 => x"c24a7387",
   900 => x"724ac187",
   901 => x"66f4c04c",
   902 => x"cc87d302",
   903 => x"e4c24966",
   904 => x"48a6c881",
   905 => x"66c87869",
   906 => x"c106aab7",
   907 => x"9c744c87",
   908 => x"87d5c202",
   909 => x"7087f5e5",
   910 => x"0599c849",
   911 => x"ebe587ca",
   912 => x"c8497087",
   913 => x"87f60299",
   914 => x"c848d0ff",
   915 => x"d4ff78c5",
   916 => x"78f0c248",
   917 => x"787878c0",
   918 => x"c0c87878",
   919 => x"c6d1c31e",
   920 => x"e8cbfd49",
   921 => x"48d0ff87",
   922 => x"d1c378c4",
   923 => x"66d41ec6",
   924 => x"dceefd49",
   925 => x"d81ec187",
   926 => x"ebfd4966",
   927 => x"86cc87ef",
   928 => x"c14866dc",
   929 => x"a6e0c080",
   930 => x"02abc158",
   931 => x"cc87f3c0",
   932 => x"e0c24966",
   933 => x"4866d081",
   934 => x"dd05a869",
   935 => x"48a6d087",
   936 => x"cc8578c1",
   937 => x"dcc24966",
   938 => x"05ad6981",
   939 => x"4dc087d4",
   940 => x"c14866d4",
   941 => x"58a6d880",
   942 => x"66d087c8",
   943 => x"d480c148",
   944 => x"8bc158a6",
   945 => x"ebfd058c",
   946 => x"0266d887",
   947 => x"66dc87da",
   948 => x"99ffc349",
   949 => x"dc59a6d4",
   950 => x"b7c84966",
   951 => x"59a6d829",
   952 => x"d84966dc",
   953 => x"4d7129b7",
   954 => x"49bf976e",
   955 => x"7599f0c3",
   956 => x"d81e71b1",
   957 => x"b7c84966",
   958 => x"dc1e7129",
   959 => x"66dc1e66",
   960 => x"9766d41e",
   961 => x"c01e49bf",
   962 => x"87fee949",
   963 => x"9b7386d4",
   964 => x"d087c702",
   965 => x"87fce149",
   966 => x"d0c287c6",
   967 => x"87f4e149",
   968 => x"fb059b73",
   969 => x"8ee087e1",
   970 => x"0e87cce7",
   971 => x"5d5c5b5e",
   972 => x"7186f80e",
   973 => x"49a4c84c",
   974 => x"2ac94a69",
   975 => x"c3029a72",
   976 => x"1e7287ca",
   977 => x"4ad14972",
   978 => x"87c6c6fd",
   979 => x"99714a26",
   980 => x"87c4c205",
   981 => x"c0c0c4c1",
   982 => x"fbc101aa",
   983 => x"cc7ed187",
   984 => x"01aac0f0",
   985 => x"4dc487c5",
   986 => x"7287ccc1",
   987 => x"c649721e",
   988 => x"ddc5fd4a",
   989 => x"714a2687",
   990 => x"87cc0599",
   991 => x"aac0e0d9",
   992 => x"c687c501",
   993 => x"87efc04d",
   994 => x"1e724bc5",
   995 => x"4a734972",
   996 => x"87fec4fd",
   997 => x"99714a26",
   998 => x"7387cb05",
   999 => x"c0d0c449",
  1000 => x"06aa7191",
  1001 => x"abc587cf",
  1002 => x"c187c205",
  1003 => x"d083c183",
  1004 => x"d5ff04ab",
  1005 => x"724d7387",
  1006 => x"7549721e",
  1007 => x"d1c4fd4a",
  1008 => x"26497087",
  1009 => x"721e714a",
  1010 => x"fd4ad11e",
  1011 => x"2687c3c4",
  1012 => x"c849264a",
  1013 => x"87db58a6",
  1014 => x"d07effc0",
  1015 => x"c449724d",
  1016 => x"721e7129",
  1017 => x"4affc01e",
  1018 => x"87e6c3fd",
  1019 => x"49264a26",
  1020 => x"c258a6c8",
  1021 => x"c449a4d8",
  1022 => x"dcc27966",
  1023 => x"797549a4",
  1024 => x"49a4e0c2",
  1025 => x"e4c2796e",
  1026 => x"79c149a4",
  1027 => x"e6e38ef8",
  1028 => x"49c01e87",
  1029 => x"bfe2e2c3",
  1030 => x"c187c202",
  1031 => x"cae5c349",
  1032 => x"87c202bf",
  1033 => x"d0ffb1c2",
  1034 => x"78c5c848",
  1035 => x"c348d4ff",
  1036 => x"787178fa",
  1037 => x"c448d0ff",
  1038 => x"1e4f2678",
  1039 => x"4a711e73",
  1040 => x"4966cc1e",
  1041 => x"c391e8c2",
  1042 => x"714bdae2",
  1043 => x"fd497383",
  1044 => x"c487eee1",
  1045 => x"02987086",
  1046 => x"497387cb",
  1047 => x"87f3eafd",
  1048 => x"c6fb4973",
  1049 => x"87e9fe87",
  1050 => x"0e87d0e2",
  1051 => x"5d5c5b5e",
  1052 => x"ff86f40e",
  1053 => x"7087f5dc",
  1054 => x"0299c449",
  1055 => x"ff87ecc5",
  1056 => x"c5c848d0",
  1057 => x"48d4ff78",
  1058 => x"c078c0c2",
  1059 => x"78787878",
  1060 => x"d4ff4d78",
  1061 => x"7678c048",
  1062 => x"ff49a54a",
  1063 => x"7997bfd4",
  1064 => x"c048d4ff",
  1065 => x"c1516878",
  1066 => x"adb7c885",
  1067 => x"ff87e304",
  1068 => x"78c448d0",
  1069 => x"486697c6",
  1070 => x"7058a6cc",
  1071 => x"c49bd04b",
  1072 => x"49732bb7",
  1073 => x"c391e8c2",
  1074 => x"c881dae2",
  1075 => x"ca056981",
  1076 => x"49d1c287",
  1077 => x"87fcdaff",
  1078 => x"c787d0c4",
  1079 => x"494c6697",
  1080 => x"d099f0c3",
  1081 => x"87cc05a9",
  1082 => x"49721e73",
  1083 => x"c487d2e3",
  1084 => x"87f7c386",
  1085 => x"05acd0c2",
  1086 => x"497287c8",
  1087 => x"c387e5e3",
  1088 => x"ecc387e9",
  1089 => x"87ce05ac",
  1090 => x"1e731ec0",
  1091 => x"cfe44972",
  1092 => x"c386c887",
  1093 => x"d1c287d5",
  1094 => x"87cc05ac",
  1095 => x"49721e73",
  1096 => x"c487e9e5",
  1097 => x"87c3c386",
  1098 => x"05acc6c3",
  1099 => x"1e7387cc",
  1100 => x"cce64972",
  1101 => x"c286c487",
  1102 => x"e0c087f1",
  1103 => x"87cf05ac",
  1104 => x"731e1ec0",
  1105 => x"e849721e",
  1106 => x"86cc87f3",
  1107 => x"c387dcc2",
  1108 => x"d005acc4",
  1109 => x"c11ec087",
  1110 => x"721e731e",
  1111 => x"87dde849",
  1112 => x"c6c286cc",
  1113 => x"acf0c087",
  1114 => x"c087ce05",
  1115 => x"721e731e",
  1116 => x"87c2f049",
  1117 => x"f2c186c8",
  1118 => x"acc5c387",
  1119 => x"c187ce05",
  1120 => x"721e731e",
  1121 => x"87eeef49",
  1122 => x"dec186c8",
  1123 => x"05acc887",
  1124 => x"1e7387cc",
  1125 => x"d3e64972",
  1126 => x"c186c487",
  1127 => x"c0c187cd",
  1128 => x"87d005ac",
  1129 => x"1ec01ec1",
  1130 => x"49721e73",
  1131 => x"cc87cee7",
  1132 => x"87f7c086",
  1133 => x"cc059c74",
  1134 => x"721e7387",
  1135 => x"87f1e449",
  1136 => x"e6c086c4",
  1137 => x"1e66c887",
  1138 => x"496697c9",
  1139 => x"6697cc1e",
  1140 => x"97cf1e49",
  1141 => x"d21e4966",
  1142 => x"1e496697",
  1143 => x"deff49c4",
  1144 => x"86d487e8",
  1145 => x"ff49d1c2",
  1146 => x"f487e9d6",
  1147 => x"c6dcff8e",
  1148 => x"5b5e0e87",
  1149 => x"1e0e5d5c",
  1150 => x"d4ff7e71",
  1151 => x"c31e6e4b",
  1152 => x"fd49eae7",
  1153 => x"c487fada",
  1154 => x"9d4d7086",
  1155 => x"87c3c302",
  1156 => x"bff2e7c3",
  1157 => x"fd496e4c",
  1158 => x"ff87ddf6",
  1159 => x"c5c848d0",
  1160 => x"7bd6c178",
  1161 => x"7b154ac0",
  1162 => x"e0c082c1",
  1163 => x"f504aab7",
  1164 => x"48d0ff87",
  1165 => x"c5c878c4",
  1166 => x"7bd3c178",
  1167 => x"78c47bc1",
  1168 => x"c1029c74",
  1169 => x"d1c387fc",
  1170 => x"c0c87ec6",
  1171 => x"b7c08c4d",
  1172 => x"87c603ac",
  1173 => x"4da4c0c8",
  1174 => x"ddc34cc0",
  1175 => x"49bf97f7",
  1176 => x"d20299d0",
  1177 => x"c31ec087",
  1178 => x"fd49eae7",
  1179 => x"c487dfdd",
  1180 => x"4a497086",
  1181 => x"c387efc0",
  1182 => x"c31ec6d1",
  1183 => x"fd49eae7",
  1184 => x"c487cbdd",
  1185 => x"4a497086",
  1186 => x"c848d0ff",
  1187 => x"d4c178c5",
  1188 => x"bf976e7b",
  1189 => x"c1486e7b",
  1190 => x"c17e7080",
  1191 => x"f0ff058d",
  1192 => x"48d0ff87",
  1193 => x"9a7278c4",
  1194 => x"c087c505",
  1195 => x"87e5c048",
  1196 => x"e7c31ec1",
  1197 => x"dafd49ea",
  1198 => x"86c487f3",
  1199 => x"fe059c74",
  1200 => x"d0ff87c4",
  1201 => x"78c5c848",
  1202 => x"c07bd3c1",
  1203 => x"c178c47b",
  1204 => x"c087c248",
  1205 => x"4d262648",
  1206 => x"4b264c26",
  1207 => x"5e0e4f26",
  1208 => x"710e5c5b",
  1209 => x"0266cc4b",
  1210 => x"c04c87d8",
  1211 => x"d8028cf0",
  1212 => x"c14a7487",
  1213 => x"87d1028a",
  1214 => x"87cd028a",
  1215 => x"87c9028a",
  1216 => x"497387d0",
  1217 => x"c987eafb",
  1218 => x"731e7487",
  1219 => x"87ebf449",
  1220 => x"c3ff86c4",
  1221 => x"c31e0087",
  1222 => x"49bfe4cd",
  1223 => x"cdc3b9c1",
  1224 => x"d4ff59e8",
  1225 => x"78ffc348",
  1226 => x"c848d0ff",
  1227 => x"d4ff78e1",
  1228 => x"c478c148",
  1229 => x"ff787131",
  1230 => x"e0c048d0",
  1231 => x"1e4f2678",
  1232 => x"1ed8cdc3",
  1233 => x"49eae7c3",
  1234 => x"87f5d5fd",
  1235 => x"987086c4",
  1236 => x"ff87c302",
  1237 => x"4f2687c0",
  1238 => x"484b3531",
  1239 => x"2020205a",
  1240 => x"00474643",
  1241 => x"00000000",
  1242 => x"ede1c31e",
  1243 => x"b0c148bf",
  1244 => x"58f1e1c3",
  1245 => x"87d1e9fe",
  1246 => x"48d5ccc3",
  1247 => x"cfc350c2",
  1248 => x"f949bfd1",
  1249 => x"ccc387eb",
  1250 => x"50c148d5",
  1251 => x"bfcdcfc3",
  1252 => x"87ddf949",
  1253 => x"48d5ccc3",
  1254 => x"cfc350c3",
  1255 => x"f949bfd5",
  1256 => x"f0c087cf",
  1257 => x"d9cfc31e",
  1258 => x"f1fc49bf",
  1259 => x"1ef1c087",
  1260 => x"bfddcfc3",
  1261 => x"87e6fc49",
  1262 => x"bfede1c3",
  1263 => x"c398fe48",
  1264 => x"fe58f1e1",
  1265 => x"c087c2e8",
  1266 => x"268ef848",
  1267 => x"0033e14f",
  1268 => x"0033ed00",
  1269 => x"0033f900",
  1270 => x"00340500",
  1271 => x"00341100",
  1272 => x"58435000",
  1273 => x"20202054",
  1274 => x"4d4f5220",
  1275 => x"4e415400",
  1276 => x"20205944",
  1277 => x"4d4f5220",
  1278 => x"49545800",
  1279 => x"20204544",
  1280 => x"4d4f5220",
  1281 => x"58435000",
  1282 => x"20203154",
  1283 => x"44485620",
  1284 => x"58435000",
  1285 => x"20203254",
  1286 => x"44485620",
  1287 => x"44485600",
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
