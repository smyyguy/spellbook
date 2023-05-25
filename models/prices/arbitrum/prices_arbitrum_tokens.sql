{{ config(
        schema='prices_arbitrum',
        alias ='tokens',
        materialized='table',
        file_format = 'delta',
        tags=['static']
        )
}}
SELECT
    TRIM(token_id) as token_id
    , LOWER(TRIM(blockchain)) as blockchain
    , TRIM(symbol) as symbol
    , LOWER(TRIM(contract_address)) as contract_address
    , decimals
FROM
(
    VALUES

    ("0xbtc-0xbitcoin","arbitrum","0xBTC","0x7cb16cb78ea464ad35c8a50abf95dff3c9e09d5d",8),
    ("aave-new","arbitrum","AAVE","0xba5ddd1f9d7f570dc94a51479a000e3bce967196",18),
    ("ageur-ageur","arbitrum","agEUR","0xfa5ed56a203466cbbc2430a43c66b9d8723528e7",18),
    ("ach-alchemy","arbitrum","ALCH","0x0e15258734300290a651fdbae8deb039a8e7a2fa",18),
    ("apex-apexit-finance","arbitrum","APEX","0x61a1ff55c5216b636a294a07d77c6f4df10d3b56",18),
    ("ata-automata","arbitrum","ATA","0xac9ac2c17cdfed4abc80a53c5553388575714d03",18),
    ("axlusdc-axelar-usd-coin","arbitrum","axlUSDC","0xeb466342c4d449bc9f53a865d5cb90586f405215",6),
    ("axlusdt-axelar-usd-tether","arbitrum","axlUSDT","0x7f5373ae26c3e8ffc4c77b7255df7ec1a9af52a6",6),
    ("axlatom-axelar-wrapped-atom","arbitrum","axlATOM","0x06bee9e7238a331b68d83df3b5b9b16d5dba83ff",6),
    ("badger-badger","arbitrum","BADGER","0xbfa641051ba0a0ad1b0acf549a89536a0d76472e",18),
    ("bal-balancer","arbitrum","BAL","0x040d1edc9569d4bab2d15287dc5a4f10f56a56b8",18),
    ("bond-barnbridge","arbitrum","BOND","0x0d81e50bc677fa67341c44d7eaa9228dee64a4e1",18),
    ("cnfi-connect-financial","arbitrum","CNFI","0x6f5401c53e2769c858665621d22ddbf53d8d27c5",18),
    ("comp-compoundd","arbitrum","COMP","0x354a6da3fcde098f8389cad84b0182725c6c91de",18),
    ("coti-coti","arbitrum","COTI","0x6fe14d3cc2f7bddffba5cdb3bbe7467dd81ea101",18),
    ("crv-curve-dao-token","arbitrum","CRV","0x11cdb42b0eb46d95f990bedd4695a6e3fa034978",18),
    ("ctsi-cartesi","arbitrum","CTSI","0x319f865b287fcc10b30d8ce6144e8b6d1b476999",18),
    ("dai-dai", "arbitrum", "DAI", "0xda10009cbd5d07dd0cecc66161fc93d7c9000da1", 18),
    ("dbl-dengbingl","arbitrum","DBL","0xd3f1da62cafb7e7bc6531ff1cef6f414291f03d3",18),
    ("dia-dia","arbitrum","DIA","0x39f91452a6e9994762876e1edd87be28a46d5c99",18),
    ("dodo-dodo","arbitrum","DODO","0x69eb4fa4a2fbd498c257c57ea8b7655a2559a581",18),
    ("dpx-dopex","arbitrum","DPX","0x6c2c06790b3e3e3c38e12ee22f8183b37a13ee55",18),
    ("dvf-rhinofi","arbitrum","DVF","0xa7aa2921618e3d63da433829d448b58c9445a4c3",18),
    ("eurs-stasis-eurs","arbitrum","EURS","0xd22a58f79e9481d1a88e00c343885a588b34b68b",2),
    ("frax-frax","arbitrum","FRAX","0x17fc002b466eec40dae837fc4be5c67993ddbd6f",18),
    ("fuse-fuse-network","arbitrum","FUSE","0xbdef0e9ef12e689f366fe494a7a7d0dad25d9286",18),
    ("fxs-frax-share","arbitrum","FXS","0x9d2f299715d94d8a7e6f5eaa8e654e8c74a988a7",18),
    ("gmx-gmx","arbitrum","GMX","0xfc5a1a6eb076a2c7ad06ed22c90d7e710e35ad0a",18),
    ("gno-gnosis","arbitrum","GNO","0xa0b862f60edef4452f25b4160f177db44deb6cf1",18),
    ("grt-the-graph","arbitrum","GRT","0x23a941036ae778ac51ab04cea08ed6e2fe103614",18),
    ("hop-hop-protocol","arbitrum","HOP","0xfd3713b309f843daa51c27022c249c5a9a5e311c",18),
    ("jones-jones-dao","arbitrum","JONES","0x10393c20975cf177a3513071bc110f7962cd67da",18),
    ("knc-kyber-network","arbitrum","KNC","0xe4dddfe67e7164b0fe14e218d80dc4c08edc01cb",18),
    ("krom-kromatikafinance","arbitrum","KROM","0x55ff62567f09906a85183b866df84bf599a4bf70",18),
    ("l2dao-layer2dao","arbitrum","L2DAO","0x2cab3abfc1670d1a452df502e216a66883cdf079",18),
    ("ldo-lido-dao","arbitrum","LDO","0x13ad51ed4f1b7e9dc168d8a00cb3f4ddd85efa60",18),
    ("link-chainlink","arbitrum","LINK","0xf97f4df75117a78c1a5a0dbb814af92458539fb4",18),
    ("lpt-livepeer","arbitrum","LPT","0x289ba1701c2f088cf0faf8b3705246331cb8a839",18),
    ("lrc-loopring","arbitrum","LRC","0x46d0ce7de6247b0a95f67b43b589b4041bae7fbe",18),
    ("luna-terra","arbitrum","LUNC","0x1a4da80967373fd929961e976b4b53ceec063a15",6),
    ("magic-magic-arbitrum", "arbitrum", "MAGIC", "0x539bde0d7dbd336b79148aa742883198bbf60342", 18),
    ("math-math","arbitrum","MATH","0x99f40b01ba9c469193b360f72740e416b17ac332",18),
    ("mcb-mcdex-token","arbitrum","MCB","0x4e352cf164e64adcbad318c3a1e222e9eba4ce42",18),
    ("mim-magic-internet-money","arbitrum","MIM","0xfea7a6a0b346362bf88a9e4a88416b77a57d6c2a",18),
    ("multi-multichain","arbitrum","MULTI","0x9fb9a33956351cf4fa040f65a13b835a3c8764e3",18),
    ("myc-mycelium","arbitrum","MYC","0xc74fe4c715510ec2f8c61d70d397b32043f55abe",18),
    ("perp-perpetual-protocol","arbitrum","PERP","0x753d224bcf9aafacd81558c32341416df61d3dac",18),
    ("rai-rai-reflex-index","arbitrum","RAI","0xaef5bbcbfa438519a5ea80b4c7181b4e78d419f2",18),
    ("rdpx-dopex-rebate-token","arbitrum","RDPX","0x32eb7902d4134bf98a28b963d26de779af92a212",18),
    ("rgt-rari-governance-token","arbitrum","RGT","0xef888bca6ab6b1d26dbec977c455388ecd794794",18),
    ("route-router-protocol","arbitrum","ROUTE","0x5298060a95205be6dd4abc21910a4bb23d6dcd8b",18),
    ("rpl-rocket-pool","arbitrum","RPL","0xb766039cc6db368759c1e56b79affe831d0cc507",18),
    ("reth-rocket-pool-eth","arbitrum","rETH","0xec70dcb4a1efa46b8f2d97c310c9c4790ba5ffa8",18),
    ("sdt-stake-dao","arbitrum","SDT","0x7ba4a00d54a07461d9db2aef539e91409943adc9",18),
    ("spa-sperax","arbitrum","SPA","0x5575552988a3a80504bbaeb1311674fcfd40ad4b",18),
    ("spell-spell-token","arbitrum","SPELL","0x3e6648c5a70a150a88bce65f4ad4d506fe15d2af",18),
    ("stg-stargatetoken","arbitrum","STG","0x6694340fc020c5e6b96567843da2df01b2ce1eb6",18),
    ("susd-susd","arbitrum","sUSD","0xa970af1a584579b618be4d69ad6f73459d112f95",18),
    ("sushi-sushi","arbitrum","SUSHI","0xd4d42f0b6def4ce0383636770ef773390d85c61a",18),
    -- ("swpr-swappery-token","arbitrum","SWPR","0xde903e2712288a1da82942dddf2c20529565ac30",18),
    ("snx-synthetix-network-token","arbitrum","SYN","0x080f6aed32fc474dd5717105dba5ea57268f46eb",18),
    ("tcr-tracer-dao","arbitrum","TCR","0xa72159fc390f0e3c6d415e658264c7c4051e9b87",18),
    ("tusd-trueusd","arbitrum","TUSD","0x4d15a3a2286d883af0aa1b3f21367843fac63e07",18),
    ("ubt-unibright","arbitrum","UBT","0x2ad62674a64e698c24831faf824973c360430140",8),
    ("uma-uma","arbitrum","UMA","0xd693ec944a85eeca4247ec1c3b130dca9b0c3b22",18),
    ("umami-umami-finance","arbitrum","UMAMI","0x1622bf67e6e5747b81866fe0b85178a93c7f86e3",9),
    ("uni-uniswap","arbitrum","UNI","0xfa7f8980b0f1e64a2062791cc3b0871572f1f7f0",18),
    ("usdc-usd-coin", "arbitrum", "USDC", "0xff970a61a04b1ca14834a43f5de4533ebddb5cc8", 6),
    ("usdd-usdd","arbitrum","USDD","0x680447595e8b7b3aa1b43beb9f6098c79ac2ab3f",18),
    ("usdr-usd-reserve","arbitrum","USDR","0xbc60ff90497f99cbf6fb84ce1e31845637033445",18),
    ("usdt-tether", "arbitrum", "USDT", "0xfd086bc7cd5c481dcc9c85ebe478a1c0b69fcbb9", 6),
    ("ust-terrausd","arbitrum","USTC","0x13780e6d5696dd91454f6d3bbc2616687fea43d0",6),
    ("wad-warden","arbitrum","WAD","0x6374d87c5a48c41b309a1ab7b12eeb4fe30d8d8a",18),
    ("wbtc-wrapped-bitcoin", "arbitrum", "WBTC", "0x2f2a2543b76a4166549f7aab2e75bef0aefc5b0f", 8),
    ("weth-weth","arbitrum","WETH","0x82af49447d8a07e3bd95bd0d56f35241523fbab1",18),
    ("wis-experty-wisdom-token","arbitrum","WIS","0xa0459edcad5aac14dc32775d22ff7bd33027cac7",18),
    ("wsteth-wrapped-liquid-staked-ether-20","arbitrum","wstETH","0x5979d7b546e38e414f7e9822514be443a4800529",18),
    ("yfi-yearnfinance","arbitrum","YFI","0x82e3a8f066a6989666b031d916c43672085b1582",18),
    ("zz-zigzag","arbitrum","ZZ","0xada42bb73b42e0472a994218fb3799dfcda21237",18),
    ("ico-axelar","arbitrum","AXL","0x23ee2343b892b1bb63503a4fabc840e0e2c6810f",6),
    ("relay-relay-token","arbitrum","RELAY","0x1426cf37caa89628c4da2864e40cf75e6d66ac6b",18),
    ("arb-arbitrum","arbitrum","ARB","0x912ce59144191c1204e64559fe8253a0e49e6548",18),
    ("agi-auragi","arbitrum","AGI","0xff191514a9baba76bfd19e3943a4d37e8ec9a111",18),
    ("grain-granary","arbitrum","GRAIN","0x80bb30d62a16e1f2084deae84dc293531c3ac3a1",18),
    ("oath-oath","arbitrum","OATH","0xa1150db5105987cec5fd092273d1e3cbb22b378b",18)
) as temp (token_id, blockchain, symbol, contract_address, decimals)
