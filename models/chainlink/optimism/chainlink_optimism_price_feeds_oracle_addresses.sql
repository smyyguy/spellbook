{{
  config(
    tags=['dunesql'],
    alias=alias('price_feeds_oracle_addresses'),
    post_hook='{{ expose_spells(\'["optimism"]\',
                                "project",
                                "chainlink",
                                \'["msilb7","0xroll","linkpool_ryan"]\') }}'
  )
}}

SELECT
  'optimism' as blockchain,
  feed_name,
  CAST(decimals AS BIGINT) as decimals,
  proxy_address,
  aggregator_address
FROM (values
  ('AAVE / USD',8,0x338ed6787f463394d24813b297401b9f05a8c9d1,0x81cc0c227bf9bfb8088b14755dfca65f7892203b),
  ('BTC / USD',8,0xd702dd976fb76fffc2d3963d037dfdae5b04e593,0x0c1272d2ac652d10d03bb4deb0d31f15ea3eab2b),
  ('CRV / USD',8,0xbD92C6c284271c227a1e0bF1786F468b539f51D9,0x7c56d3650f9acd992b3aa635c04a311c54ad264c),
  ('DAI / USD',8,0x8dBa75e83DA73cc766A7e5a0ee71F656BAb470d6,0xbce7579e241e5d676c2371dc21891489dacda250),
  ('ETH / USD',8,0x13e3Ee699D1909E989722E753853AE30b17e08c5,0x02f5e9e9dcc66ba6392f6904d5fcf8625d9b19c9),
  ('EUR / USD',8,0x3626369857A10CcC6cc3A6e4f5C2f5984a519F20,0xaa75ace4575abbe1d237d991a7461f497a56a8f0),
  ('LINK / USD',8,0xCc232dcFAAE6354cE191Bd574108c1aD03f86450,0x5d101824c693c70a68ffc3cdb0cc394f3a4fb9ec),
  ('MATIC / USD',8,0x0ded608AFc23724f614B76955bbd9dFe7dDdc828,0x1C1df24f0d06415fc3F58b1c1fDadd5fC85d2950),
  ('NEAR / USD',8,0xca6fa4b8CB365C02cd3Ba70544EFffe78f63ac82,0xf9eCc598293bd5Fb4F700AEB5C4Fb63B23CFE8Aa),
  ('ONE / USD',8,0x7CFB4fac1a2FDB1267F8bc17FADc12804AC13CFE,0x663ed3D2aB9F8d5282a94BA4636E346e59bDdEB9),
  ('SAND / USD',8,0xAE33e077a02071E62d342E449Afd9895b016d541,0x5d1345669278128B77AF9662C5D6B5e0b2FFD54A),
  ('SNX / USD',8,0x2FCF37343e916eAEd1f1DdaaF84458a359b53877,0x584f57911b6eedab5503e202f8e193663c9bd3db),
  ('SOL / USD',8,0xC663315f7aF904fbbB0F785c32046dFA03e85270,0x92c9b9c512759f5d04563efa3698fc4fbf735d59),
  ('Total Marketcap USD',8,0x15772F61e4cDC81c7C1c6c454724CE9c7065A6fF,0x530ab34385ca1d134ffd33d267f5a2788d645039),
  ('UNI / USD',8,0x11429eE838cC01071402f21C219870cbAc0a59A0,0x85a48ded8c35d82f8f29844e25dd51a70a23c93d),
  ('USDC / USD',8,0x16a9FA2FDa030272Ce99B29CF780dFA30361E0f3,0xd1cb03cc31caa72d34dba7ebe21897d9580c4af0),
  ('USDT / USD',8,0xECef79E109e997bCA29c1c0897ec9d7b03647F5E,0xac37790ff4abf9483fae2d1f62fc61fe6b8e4789),
  ('sETH / USD',8,0xA969bEB73d918f6100163Cd0fba3C586C269bee1,0x25e1c58040f27ecf20bbd4ca83a09290326896b3),
  ('sBTC / USD',8,0xc326371d4D866C6Ff522E69298e36Fe75797D358,0xad3dfa54004f0f5d296002bb091cac10eb8a4891),
  ('sLINK / USD',8,0x74d6B50283AC1D651f9Afdc33521e4c1E3332b78,0x8ce8c13d816fe6daf12d6fd9e4952e1fc88850af),
  ('FLOW / USD',8,0x2fF1EB7D0ceC35959F0248E9354c3248c6683D9b,0x0542BbBfbc26A86EA92d2b7f6Da07DAf0CA091eD),
  ('FTM / USD',8,0xc19d58652d6BfC6Db6FB3691eDA6Aa7f3379E4E9,0x13f11f2139C10A48eCD7A6A14d804f90b2cFC89A),
  ('BNB / USD',8,0xD38579f7cBD14c22cF1997575eA8eF7bfe62ca2c,0x25dD1949cDb81f5fc38841a8abF342c4EF48dbfd),
  ('STETH / USD',8,0x41878779a388585509657CE5Fb95a80050502186,0x12922291D1FcD0d121B5C88f061047fE18732743),
  ('AVAX / USD',8,0x5087Dc69Fd3907a016BD42B38022F7f024140727,0xa6d25eEBae9c841C44AD01c9176556a4c2189961),
  ('SUSD / USD',8,0x7f99817d87baD03ea21E05112Ca799d715730efe,0x17D582034c038BaEb17A9E2A969d06f550d3586b),
  ('Synthetix Aggregator Debt Ratio',27,0x94A178f2c480D14F8CdDa908D173d7a73F779cb7,0x0D5642c6329adB3246c13D78B429a9FB1965a0d8),
  ('Synthetix Aggregator Issued Synths',18,0x37AAFb2EE35F1250A001202C660B13c301D2130b,0x22f04bc4162d63730dcde051fdfd97b4f55ff63b),
  ('XAG / USD',8,0x290dd71254874f0d4356443607cb8234958DEe49,0xcC341634464b6FD1221e4d517cD7801155ABaC55),
  ('XAU / USD',8,0x8F7bFb42Bf7421c2b34AAD619be4654bFa7B3B8B,0x78F049f6da1aC1dcA50D6D8f184Acf47eB269852),
  ('APE / USD',8,0x89178957E9bD07934d7792fFc0CF39f11c8C2B1F,0x2dd486f1fa76fd1228a9c818c552c6a92f138453),
  ('AXS / USD',8,0x805a61D54bb686e57F02D1EC96A1491C7aF40893,0x7a18889f137b593f4e03c0a698a4360f43d1731c),
  ('LUNA / USD',8,0xab164949E0db4A6B6877E1EB2045Ad3af3cF2259,0x93521aeffa5f7adec85d7bcbe51c22a1513981bd),
  ('OP / USD',8,0x0D276FC14719f9292D5C1eA2198673d1f4269246,0x4f6dfdfd4d68f68b2692e79f9e94796fc8015770),
  ('PERP / USD',8,0xA12CDDd8e986AF9288ab31E58C60e65F2987fB13,0xe18a4e99f019f92cd72e0c7c05599d76a89296cd),
  ('ATOM / USD',8,0xEF89db2eA46B4aD4E333466B6A486b809e613F39,0x81d9a9056e9Af6585010B784Df5853a0fDEf8b11),
  ('DYDX / USD',8,0xee35A95c9a064491531493D8b380bC40A4CCd0Da,0x19BcA7C81f3ed561a49326b78468EaC64D0E8F2a),
  ('FRAX / USD',8,0xc7D132BeCAbE7Dcc4204841F33bae45841e41D9C,0xaB544FDAD5F68f0F8e53284f942D76177635A3D6),
  ('FXS / USD',8,0xB9B16330671067B1b062B9aC2eFd2dB75F03436E,0xc2212835DE6cb9Ef5e26b04E64f7798472Ff2812),
  ('IMX / USD',8,0x26Fce884555FAe5F0E4701cc976FE8D8bB111A38,0x5D860ee3A9F47dfd86d40aec1EF7DDD876356F71),
  ('INR / USD',8,0x5535e67d8f99c8ebe961E1Fc1F6DDAE96FEC82C9,0x28a6B219403c1Dac04172cBb8cC1aB8bF5925830),
  ('LOOKS / USD',8,0xd682c5f1A8eaA2389D6f8Fa43067956C2386a557,0x5D7332Adf81c9E7372779E5F2F255B0A6E222fe1),
  ('RUNE / USD',8,0x372cc5e685115A56F14fa7e4716F1294e04c278A,0x1aafcf49e103a71b31506cb05fb072ed1b5b0414),
  ('WAVES / USD',8,0x776003ECdF644F87a95B05da549b5e646d5F2Ae4,0x503465204d3e093146b1e8762e2b221240e0eda7),
  ('ZIL / USD',8,0x1520874FC216f5F07E03607303Df2Fda6C3Fc203,0x397c2082da7a0962a4fbf14e62e72dbcefb7a7dc),
  ('wstETH / stETH',18,0xe59EBa0D492cA53C6f46015EEa00517F2707dc77,0x6e7a3ceb4797d0fd7b9854b251929ad68849951a),
  ('BAL / USD',8,0x30D9d31C1ac29Bc2c2c312c1bCa9F8b3D60e2376,0x44f690526b76d91072fb0427b0a24b882e612455),
  ('BOND / USD',8,0x8fCfb87fc17CfD5775d234AcFd1753764899Bf20,0x3b06b9b3ead7ec34ae67e2d7f73b128da09c583a),
  ('DOGE / USD',8,0xC6066533917f034Cf610c08e1fe5e9c7eADe0f54,0x8afc1cc622be1cd1644579c9c7ec3fbba6bd02d2)
) a (feed_name, decimals, proxy_address, aggregator_address)

