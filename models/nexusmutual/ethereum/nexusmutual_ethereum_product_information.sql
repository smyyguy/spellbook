{{ config(
    alias ='product_information',
    materialized='table',
    file_format = 'delta',
    tags=['static'],
    unique_key = ['product_contract_address'],
    post_hook='{{ expose_spells(\'["ethereum"]\',
                                "project",
                                "nexusmutual",
                                \'["guyhowlett"]\') }}'
    )
}}

SELECT lower(product_contract_address) as product_contract_address,
       product_name,
       product_type,
       date_added,
       syndicate
FROM (
VALUES
    (0xF5DCe57282A584D2746FaF1593d3121Fcac444dC, 'Compound Sai', 'protocol', '2020-01-01', 'v1'),
    (0x8B3d70d628Ebd30D4A2ea82DB95bA2e906c71633, 'bZx v1', 'protocol', '2020-01-01', 'v1'),
    (0x5504a1d88005236147EC86C62cfb53043bD1276a, 'Unknown', 'protocol', '2020-01-01', 'v1'),
    (0x4Ddc2D193948926D02f9B1fE9e1daa0718270ED5, 'Compound ETH', 'protocol', '2020-01-01', 'v1'),
    (0x080bf510FCbF18b91105470639e9561022937712, '0x v2.1', 'protocol', '2020-01-01', 'v1'),
    (0x16de59092dAE5CcF4A1E6439D611fd0653f0Bd01, 'iearn yDAI v1', 'protocol', '2020-01-01', 'v1'),
    (0xAF350211414C5DC176421Ea05423F0cC494261fB, 'Saturn DAO Token', 'protocol', '2020-01-01', 'v1'),
    (0x5d3a536E4D6DbD6114cc1Ead35777bAB948E3643, 'Compound DAI', 'protocol', '2020-01-01', 'v1'),
    (0x2157A7894439191e520825fe9399aB8655E0f708, 'Uniswap Exchange Template', 'protocol', '2020-01-01', 'v1'),
    (0x9f8F72aA9304c8B593d555F12eF6589cC3A579A2, 'Maker Token', 'protocol', '2020-01-01', 'v1'),
    (0x6e95C8E8557AbC08b46F3c347bA06F8dC012763f, 'Legacy Gnosis MultiSig', 'protocol', '2020-01-01', 'v1'),
    (0xb1CD6e4153B2a390Cf00A6556b0fC1458C4A5533, 'Bancor ETHBNT Token', 'protocol', '2020-01-01', 'v1'),
    (0x29fe7D60DdF151E5b52e5FAB4f1325da6b2bD958, 'Pool Together DAI', 'protocol', '2020-01-01', 'v1'),
    (0x4a57E687b9126435a9B19E4A802113e266AdeBde, 'Flexacoin Token', 'protocol', '2020-01-01', 'v1'),
    (0x519b70055af55A007110B4Ff99b0eA33071c720a, 'dxDAO', 'protocol', '2020-01-01', 'v1'),
    (0x802275979B020F0ec871c5eC1db6e412b72fF20b, 'Nuo', 'protocol', '2020-01-01', 'v1'),
    (0xb7896fce748396EcFC240F5a0d3Cc92ca42D7d84, 'Pool Together SAI', 'protocol', '2020-01-01', 'v1'),
    (0x932773aE4B661029704e731722CF8129e1B32494, 'Pool Together v2', 'protocol', '2020-01-01', 'v1'),
    (0xB1dD690Cc9AF7BB1a906A9B5A94F94191cc553Ce, 'Argent', 'protocol', '2020-01-01', 'v1'),
    (0x2b591e99afE9f32eAA6214f7B7629768c40Eeb39, 'Hex Token', 'protocol', '2020-01-01', 'v1'),
    (0x2C4Bd064b998838076fa341A83d007FC2FA50957, 'Uniswap v1 MKR Pool', 'protocol', '2020-01-01', 'v1'),
    (0x364508A5cA0538d8119D3BF40A284635686C98c4, 'dydx Perpetual', 'protocol', '2020-01-01', 'v1'),
    (0x6B175474E89094C44Da98b954EedeAC495271d0F, 'DAI Token', 'protocol', '2020-01-01', 'v1'),
    (0xD5D2b9e9bcd172D5fC8521AFd2C98Dd239F5b607, 'Unknown', 'protocol', '2020-01-01', 'v1'),
    (0x241e82C79452F51fbfc89Fac6d912e021dB1a3B7, 'DDEX', 'protocol', '2020-01-01', 'v1'),
    (0x12D66f87A04A9E220743712cE6d9bB1B5616B8Fc, 'Tornado Cash', 'protocol', '2020-01-01', 'v1'),
    (0x5d22045DAcEAB03B158031eCB7D9d06Fad24609b, 'Deversifi', 'protocol', '2020-06-20', 'v1'),
    (0x498b3BfaBE9F73db90D252bCD4Fa9548Cd0Fd981, 'Instadapp Registry', 'protocol', '2020-01-01', 'v1'),
    (0x448a5065aeBB8E423F0896E6c5D525C040f59af3, 'Maker SCD', 'protocol', '2020-01-01', 'v1'),
    (0xe80d347DF1209a76DD9d2319d62912ba98C54DDD, 'RenVM', 'protocol', '2020-06-20', 'v1'),
    (0xB27F1DB0a7e473304A5a06E54bdf035F671400C0, '0x v3', 'protocol', '2020-01-01', 'v1'),
    (0x1E0447b19BB6EcFdAe1e4AE1694b0C3659614e4e, 'dydx Margin', 'protocol', '2020-01-01', 'v1'),
    (0x3d9819210A31b4961b30EF54bE2aeD79B9c9Cd3B, 'Compound v2', 'protocol', '2020-01-01', 'v1'),
    (0x34CfAC646f301356fAa8B21e94227e3583Fe3F5F, 'Gnosis Safe', 'protocol', '2020-01-01', 'v1'),
    (0xc0a47dFe034B400B47bDaD5FecDa2621de6c4d95, 'Uniswap v1', 'protocol', '2020-01-01', 'v1'),
    (0x35D1b3F3D7966A1DFe207aa4514C12a259A0492B, 'MakerDAO MCD', 'protocol', '2020-01-01', 'v1'),
    (0x72338b82800400F5488eCa2B5A37270ba3B7A111, 'Paraswap - OLD', 'protocol', '2020-01-01', 'v1'),
    (0xc1D2819CE78f3E15Ee69c6738eB1B400A26e632A, 'Aave v1', 'protocol', '2020-01-01', 'v1'),
    (0x10eC0D497824e342bCB0EDcE00959142aAa766dD, 'Idle Finance - OLD', 'protocol', '2020-01-01', 'v1'),
    (0x3dfd23A6c5E8BbcFc9581d2E864a68feb6a076d3, 'Aave Lending Core', 'protocol', '2020-01-01', 'v1'),
    (0x45F783CCE6B7FF23B2ab2D70e416cdb7D6055f51, 'Curve fi - OLD', 'protocol', '2020-01-01', 'v1'),
    (0x11111254369792b2Ca5d084aB5eEA397cA8fa48B, '1Inch (DEX & Liquidity Pools)', 'protocol', '2020-01-01', 'v1'),
    (0xF92C1ad75005E6436B4EE84e88cB23Ed8A290988, 'Paraswap OLD', 'protocol', '2020-01-01', 'v1'),
    (0xb529964F86fbf99a6aA67f72a27e59fA3fa4FEaC, 'Opyn', 'protocol', '2020-01-01', 'v1'),
    (0x9D25057e62939D3408406975aD75Ffe834DA4cDd, 'Yearn Finance (all vaults)', 'protocol', '2020-01-01', 'v1'),
    (0x77208a6000691E440026bEd1b178EF4661D37426, 'Totle', 'protocol', '2020-01-01', 'v1'),
    (0x12f208476F64De6e6f933E55069Ba9596D818e08, 'Flexa Staking', 'protocol', '2020-01-01', 'v1'),
    (0x78751B12Da02728F467A44eAc40F5cbc16Bd7934, 'Idle v3', 'protocol', '2020-06-20', 'v1'),
    (0x7fC77b5c7614E1533320Ea6DDc2Eb61fa00A9714, 'Curve BTC Pools', 'protocol', '2020-06-20', 'v1'),
    (0x79a8C46DeA5aDa233ABaFFD40F3A0A2B1e5A4F27, 'Curve All Pools (incl staking)', 'protocol', '2020-06-20', 'v1'),
    (0x5B67871C3a857dE81A1ca0f9F7945e5670D986Dc, 'Set Protocol', 'protocol', '2020-01-01', 'v1'),
    (0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f, 'Uniswap v2', 'protocol', '2020-01-01', 'v1'),
    (0x9424B1412450D0f8Fc2255FAf6046b98213B76Bd, 'Balancer v1', 'protocol', '2020-06-20', 'v1'),
    (0xD36132E0c1141B26E62733e018f12Eb38A7b7678, 'Ampleforth Tokengeyser', 'protocol', '2020-06-20', 'v1'),
    (0x86969d29F5fd327E1009bA66072BE22DB6017cC6, 'Paraswap v1', 'protocol', '2020-01-01', 'v1'),
    (0x5f9AE054C7F0489888B1ea46824b4B9618f8A711, 'Melon v1', 'protocol', '2020-06-20', 'v1'),
    (0x1fd169A4f5c59ACf79d0Fd5d91D1201EF1Bce9f1, 'MolochDAO', 'protocol', '2020-01-01', 'v1'),
    (0xAFcE80b19A8cE13DEc0739a1aaB7A028d6845Eb3, 'mStable', 'protocol', '2020-06-20', 'v1'),
    (0xC011a73ee8576Fb46F5E1c5751cA3B9Fe0af2a6F, 'Synthetix', 'protocol', '2020-06-20', 'v1'),
    (0x2a0c0DBEcC7E4D658f48E01e3fA353F44050c208, 'IDEX v1', 'protocol', '2020-01-01', 'v1'),
    (0x9AAb3f75489902f3a48495025729a0AF77d4b11e, 'Kyber (Katalyst)', 'protocol', '2020-07-07', 'v1'),
    (0x1F573D6Fb3F13d689FF844B4cE37794d79a7FF1C, 'Bancor v2', 'protocol', '2020-07-23', 'v1'),
    (0x3e532e6222afe9Bcf02DCB87216802c75D5113aE, 'UMA', 'protocol', '2020-07-30', 'v1'),
    (0x02285AcaafEB533e03A7306C55EC031297df9224, 'dForce Yield Market', 'protocol', '2020-08-13', 'v1'),
    (0x0e2298E3B3390e3b945a5456fBf59eCc3f55DA16, 'Yam Finance v1', 'protocol', '2020-08-13', 'v1'),
    (0x3fE7940616e5Bc47b0775a0dccf6237893353bB4, 'Idle v4', 'protocol', '2020-08-14', 'v1'),
    (0x71CD6666064C3A1354a3B4dca5fA1E2D3ee7D303, 'Mooniswap', 'protocol', '2020-08-25', 'v1'),
    (0xe20A5C79b39bC8C363f0f49ADcFa82C2a01ab64a, 'tBTC Contracts v1', 'protocol', '2020-09-28', 'v1'),
    (0xe9778E69a961e64d3cdBB34CF6778281d34667c2, 'NuCypher Worklock', 'protocol', '2020-09-29', 'v1'),
    (0x4C39b37f5F20a0695BFDC59cf10bd85a6c4B7c30, 'Akropolis Delphi', 'protocol', '2020-10-01', 'v1'),
    (0x3A97247DF274a17C59A3bd12735ea3FcDFb49950, 'DODO Exchange', 'protocol', '2020-10-19', 'v1'),
    (0x26aaD4D82f6c9FA6E34D8c1067429C986A055872, 'CoFix', 'protocol', '2020-10-26', 'v1'),
    (0xCB876f60399897db24058b2d58D0B9f713175eeF, 'Pool Together v3', 'protocol', '2020-10-28', 'v1'),
    (0xa4c8d221d8BB851f83aadd0223a8900A6921A349, 'Set Protocol v2', 'protocol', '2020-10-28', 'v1'),
    (0xB94199866Fe06B535d019C11247D3f921460b91A, 'Yield Protocol', 'protocol', '2020-10-28', 'v1'),
    (0x00000000219ab540356cBB839Cbe05303d7705Fa, 'Eth 2.0 (deposit contract)', 'protocol', '2020-11-06', 'v1'),
    (0x878F15ffC8b894A1BA7647c7176E4C01f74e140b, 'Hegic', 'protocol', '2020-11-09', 'v1'),
    (0xfA5047c9c78B8877af97BDcb85Db743fD7313d4a, 'Keeper DAO', 'protocol', '2020-11-19', 'v1'),
    (0x3d5BC3c8d13dcB8bF317092d84783c2697AE9258, 'CREAM v1', 'protocol', '2020-11-24', 'v1'),
    (0x7a9701453249e84fd0D5AfE5951e9cBe9ed2E90f, 'TrueFi', 'protocol', '2020-11-25', 'v1'),
    (0x67B66C99D3Eb37Fa76Aa3Ed1ff33E8e39F0b9c7A, 'Alpha Homora v1', 'protocol', '2020-11-26', 'v1'),
    (0x7d2768dE32b0b80b7a3454c06BdAc94A69DDc7A9, 'Aave v2', 'protocol', '2020-12-03', 'v1'),
    (0xc2EdaD668740f1aA35E4D8f227fB8E17dcA888Cd, 'SushiSwap v1', 'protocol', '2020-12-09', 'v1'),
    (0xedfC81Bf63527337cD2193925f9C0cF2D537AccA, 'Cover Protocol v1', 'protocol', '2020-12-11', 'v1'),
    (0xA51156F3F1e39d1036Ca4ba4974107A1C1815d1e, 'Perpetual Protocol', 'protocol', '2020-12-17', 'v1'),
    (0x6354E79F21B56C11f48bcD7c451BE456D7102A36, 'BadgerDAO', 'protocol', '2020-12-29', 'v1'),
    (0x9abd0b8868546105F6F48298eaDC1D9c82f7f683, 'Notional Finance v1', 'protocol', '2021-01-18', 'v1'),
    (0xE75D77B1865Ae93c7eaa3040B038D7aA7BC02F70, 'Origin Dollar', 'protocol', '2021-01-22', 'v1'),
    (0x7C06792Af1632E77cb27a558Dc0885338F4Bdf8E, 'Opyn v2', 'protocol', '2021-02-25', 'v1'),
    (0xCC88a9d330da1133Df3A7bD823B95e52511A6962, 'Reflexer', 'protocol', '2021-03-04', 'v1'),
    (0xa4F1671d3Aee73C05b552d57f2d16d3cfcBd0217, 'Vesper', 'protocol', '2021-03-10', 'v1'),
    (0x5D9972dD3Ba5602574ABeA6bF9E1713568D49903, 'Benchmark Protocol', 'protocol', '2021-03-22', 'v1'),
    (0xB17640796e4c27a39AF51887aff3F8DC0daF9567, 'Stake DAO', 'protocol', '2021-03-29', 'v1'),
    (0xA39739EF8b0231DbFA0DcdA07d7e29faAbCf4bb2, 'Liquity', 'protocol', '2021-04-05', 'v1'),
    (0x284D7200a0Dabb05ee6De698da10d00df164f61d, 'Harvest Finance', 'protocol', '2021-04-16', 'v1'),
    (0x1F98431c8aD98523631AE4a59f267346ea31F984, 'Uniswap v3', 'protocol', '2021-05-05', 'v1'),
    (0x4B8d90D68F26DEF303Dcb6CFc9b63A1aAEC15840, 'Barnbridge Smart Yield v1', 'protocol', '2021-06-14', 'v1'),
    (0xF403C135812408BFbE8713b5A23a04b3D48AAE31, 'Convex Finance v1', 'protocol', '2021-06-14', 'v1'),
    (0xc21D353FF4ee73C572425697f4F5aaD2109fe35b, 'Alchemix v1', 'protocol', '2021-06-14', 'v1'),
    (0x99c666810bA4Bf9a4C2318CE60Cb2c279Ee2cF56, 'Homora v2', 'protocol', '2021-06-23', 'v1'),
    (0xBA12222222228d8Ba445958a75a0704d566BF2C8, 'Balancer v2', 'protocol', '2021-08-04', 'v1'),
    (0xA625AB01B08ce023B2a342Dbb12a16f2C8489A8F, 'Alpaca Finance', 'protocol', '2021-08-13', 'v1'),
    (0x08FB62c84909dA3Aa5F59E01763E5FDC62De76e9, 'Gamma Strategies', 'protocol', '2021-08-20', 'v1'),
    (0x8481a6EbAf5c7DABc3F7e09e44A89531fd31F822, 'Goldfinch', 'protocol', '2021-09-24', 'v1'),
    (0xc57D000000000000000000000000000000000001, 'Celsius', 'custodian', '2020-12-02', 'v1'),
    (0xC57D000000000000000000000000000000000002, 'BlockFi', 'custodian', '2020-12-02', 'v1'),
    (0xC57d000000000000000000000000000000000003, 'Nexo', 'custodian', '2020-12-02', 'v1'),
    (0xc57d000000000000000000000000000000000004, 'inLock', 'custodian', '2020-12-02', 'v1'),
    (0xC57D000000000000000000000000000000000005, 'Ledn', 'custodian', '2020-12-02', 'v1'),
    (0xC57d000000000000000000000000000000000006, 'Hodlnaut', 'custodian', '2020-12-02', 'v1'),
    (0xC57d000000000000000000000000000000000007, 'Binance', 'custodian', '2021-01-12', 'v1'),
    (0xc57D000000000000000000000000000000000008, 'Coinbase', 'custodian', '2021-01-12', 'v1'),
    (0xc57d000000000000000000000000000000000009, 'Kraken', 'custodian', '2021-01-12', 'v1'),
    (0xc57d000000000000000000000000000000000010, 'Gemini', 'custodian', '2021-01-12', 'v1'),
    (0xC57d000000000000000000000000000000000011, 'FTX', 'custodian', '2021-05-04', 'v1'),
    (0xC57d000000000000000000000000000000000012, 'Crypto.com', 'custodian', '2021-07-06', 'v1'),
    (0xc57d000000000000000000000000000000000013, 'Yield.app', 'custodian', '2021-07-06', 'v1'),
    (0xefa94DE7a4656D787667C749f7E1223D71E9FD88, 'Pangolin', 'protocol', '2021-10-12', 'v1'),
    (0x0CED6166873038Ac0cc688e7E6d19E2cBE251Bf0, 'Centrifuge Tinlake', 'protocol', '2021-10-12', 'v1'),
    (0x835482FE0532f169024d5E9410199369aAD5C77E, 'Rari Capital', 'protocol', '2021-10-12', 'v1'),
    (0xd96f48665a1410C0cd669A88898ecA36B9Fc2cce, 'Abracadabra', 'protocol', '2021-11-01', 'v1'),
    (0x48D49466CB2EFbF05FaA5fa5E69f2984eDC8d1D7, 'Premia Finance', 'protocol', '2021-11-04', 'v1'),
    (0x0000000000000000000000000000000000000001, 'Anchor', 'protocol', '2021-04-26', 'v1'),
    (0x0000000000000000000000000000000000000002, 'Bunny', 'protocol', '2021-04-26', 'v1'),
    (0x0000000000000000000000000000000000000003, 'Venus', 'protocol', '2021-04-26', 'v1'),
    (0x0000000000000000000000000000000000000004, 'Thorchain', 'protocol', '2021-04-26', 'v1'),
    (0x0000000000000000000000000000000000000005, 'Pancakeswap v1', 'protocol', '2021-04-26', 'v1'),
    (0x0000000000000000000000000000000000000006, 'Yearn yvDAI v2', 'token', '2021-05-25', 'v1'),
    (0x0000000000000000000000000000000000000007, 'Yearn yvUSDC v2', 'token', '2021-05-25', 'v1'),
    (0x0000000000000000000000000000000000000008, 'Yearn ycrvstETH v2', 'token', '2021-05-25', 'v1'),
    (0x0000000000000000000000000000000000000009, 'Curve 3pool LP (3Crv)', 'token', '2021-05-25', 'v1'),
    (0x0000000000000000000000000000000000000010, 'Curve sETH LP (eCrv)', 'token', '2021-05-25', 'v1'),
    (0x0000000000000000000000000000000000000011, 'Idle DAI v4 (idleDAIYield)', 'token', '2021-07-05', 'v1'),
    (0x0000000000000000000000000000000000000012, 'Idle USDT v4 (idleUSDTYield)', 'token', '2021-07-05', 'v1'),
    (0x0000000000000000000000000000000000000013, 'Convex stethCrv (cvxstethCrv)', 'token', '2021-10-28', 'v1'),
    (0x0000000000000000000000000000000000000014, 'Convex 3CRV (cvx3CRV)', 'token', '2021-10-28', 'v1'),
    (0x0000000000000000000000000000000000000015, 'Convex mimCrv (cvxmimCrv)', 'token', '2021-10-28', 'v1'),
    (0xaE7b92C8B14E7bdB523408aE0A6fFbf3f589adD9, 'Popsicle Finance', 'protocol', '2021-11-10', 'v1'),
    (0x1344A36A1B56144C3Bc62E7757377D288fDE0369, 'Notional Finance v2', 'protocol', '2021-11-22', 'v1'),
    (0x575409F8d77c12B05feD8B455815f0e54797381c, 'OlympusDAO', 'protocol', '2021-11-29', 'v1'),
    (0x25751853Eab4D0eB3652B5eB6ecB102A2789644B, 'Ribbon Finance v2', 'protocol', '2021-12-06', 'v1'),
    (0xd89a09084555a7D0ABe7B111b1f78DFEdDd638Be, 'Pool Together v4', 'protocol', '2021-12-09', 'v1'),
    (0x60aE616a2155Ee3d9A68541Ba4544862310933d4, 'Trader Joe', 'protocol', '2021-12-14', 'v1'),
    (0x0000000000000000000000000000000000000016, 'Origin OUSD', 'token', '2022-01-24', 'v1'),
    (0x2BB8de958134AFd7543d4063CaFAD0b7c6de08BC, 'Ondo', 'protocol', '2022-01-28', 'v1'),
    (0x7e6d3b1161DF9c9c7527F68d651B297d2Fdb820B, 'Enzyme v3', 'protocol', '2022-02-16', 'v1'),
    (0x453D4Ba9a2D594314DF88564248497F7D74d6b2C, 'Beefy', 'protocol', '2022-03-04', 'v1'),
    (0xfdA462548Ce04282f4B6D6619823a7C64Fdc0185, 'Angle', 'protocol', '2022-03-08', 'v1'),
    (0x66357dCaCe80431aee0A7507e2E361B7e2402370, 'Platypus', 'protocol', '2022-03-18', 'v1'),
    (0x0000000000000000000000000000000000000017, 'FODL', 'protocol', '2022-03-24', 'v1'),
    (0x5C6374a2ac4EBC38DeA0Fc1F8716e5Ea1AdD94dd, 'Alchemix v2', 'protocol', '2022-03-24', 'v1'),
    (0x0000000000000000000000000000000000000018, 'Bundle: Gelt + mStable + Aave v2', 'protocol', '2022-04-14', 'v1'),
    (0x0000000000000000000000000000000000000019, 'Yeti Finance', 'protocol', '2022-04-28', 'v1'),
    (0x0000000000000000000000000000000000000020, 'Babylon Finance', 'protocol', '2022-05-12', 'v1'),
    (0x0000000000000000000000000000000000000021, 'Vector', 'protocol', '2022-05-12', 'v1'),
    (0x0000000000000000000000000000000000000022, 'Bancor v3', 'protocol', '2022-05-12', 'v1'),
    (0x0000000000000000000000000000000000000023, 'Ease', 'protocol', '2022-05-31', 'v1'),
    (0x0000000000000000000000000000000000000024, 'Iron Bank', 'protocol', '2022-06-08', 'v1'),
    (0x0000000000000000000000000000000000000025, 'Stakewise operated (3 ETH / validator)', 'eth2slashing', '2022-06-08', 'v1'),
    (0x0000000000000000000000000000000000000026, 'Stakewise 3rd party (3 ETH / validator)', 'eth2slashing', '2022-06-08', 'v1'),
    (0x0000000000000000000000000000000000000027, 'Nested', 'protocol', '2022-07-05', 'v1'),
    (0x0000000000000000000000000000000000000028, 'Euler', 'protocol', '2022-08-29', 'v1'),
    (0x3D6bA331e3D9702C5e8A8d254e5d8a285F223aba, 'GMX', 'protocol', '2022-09-01', 'v1'),
    (0x0000000000000000000000000000000000000029, 'Sherlock', 'sherlock', '2022-10-17', 'v1'),
    (0x0000000000000000000000000000000000000030, 'Gearbox V2', 'protocol', '2022-10-31', 'v1'),
    (0x0000000000000000000000000000000000000031, 'Aura', 'protocol', '2022-11-16', 'v1'),
    (0x0000000000000000000000000000000000000032, 'Enzyme v4', 'protocol', '2022-11-16', 'v1')
) temp (product_contract_address, product_name, product_type, date_added, syndicate)
