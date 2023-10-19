{{ config( alias = alias('nft_curated', legacy_model=True), tags=['static', 'legacy']) }}

SELECT LOWER(contract_address) AS contract_address, name, symbol
FROM (VALUES
        ('0x08804C13D21Da41D2F1D6334B80F3241Ca72D2b7', 'ARB ID Transferable', 'ARBID'),
        ('0x41a10e0b2C8068ad99919B795468769e46709384', 'Trader Joe`s Arbitrum Adventure', 'Arbitrum Adventure'),
        ('0xfE8c1ac365bA6780AEc5a985D989b327C27670A1', 'LEGION', 'LGN'),
        ('0xC36442b4a4522E871399CD717aBDD847Ab11FE88', 'Uniswap V3 Positions NFT-V1', 'UNI-V3-POS'),
        ('0xfca313e2be55957AC628a6193A60D38aDC2da64E', 'ETH Atlantic Straddle 4', 'ETH-ATLANTIC-STRADDLE-4'),
        ('0xfAe39eC09730CA0F14262A636D2d7C5539353752', 'Arbitrum Odyssey NFT', 'Arbitrum'),
        ('0xaa4CD05cf4755075c415Ab05bCEA5cf9bF3971B2', 'Quest3NFT', 'Quest3'),
        ('0x573a3AB0Fb40a11C7048d908f72Eaac0e21b71A1', 'Arbdropnaut', 'ADN'),
        ('0x0B6f1eA63e959bFfe87eAf56a4ac7B9Fddfb6AbF', 'Aboard Exchange NFT', 'Aboard Exchange'),
        ('0x2B1c7b41f6A8F2b2bc45C3233a5d5FB3cD6dC9A8', 'KyberSwap v2 NFT Positions Manager', 'KS2-NPM'),
        ('0x04985958E1BB86e7e154869Ab4086B001c285188', 'Enter Neo Camelino', 'ENC'),
        ('0x6b2641bb98CA944F8806652626F7513FcdC13816', 'ReadON Archive', 'RRA'),
        ('0x0Dc96f38980144ebFfe745706DFeE92622dba829', 'DPX Atlantic Straddle', 'DPX-ATLANTIC-STRADDLE-2'),
        ('0x20bdAE1413659f47416f769a4B27044946bc9923', 'Mean Finance - DCA Position', 'MF-DCA-P'),
        ('0x5847a350a388454a76f34Ceb6eb386Bf652DD0DD', 'rDPX Atlantic Straddle 4', 'rDPX-ATLANTIC-STRADDLE-4'),
        ('0xAA80F845a352B1ee4e740d853A44a390BE605674', 'BudXFestivalHead', 'FHP'),
        ('0xF319A470e6d3b720824f520A8d72E8aD06B4317B', 'Camelot staking position NFT', 'spNFT'),
        ('0xe9515eedC71bdfa0E50C5b88C8bF248b61B659FB', 'L&E Campaign NFT', 'L&E Campaign NFT'),
        ('0x0aF85A5624D24E2C6e7Af3c0a0b102a28E36CeA3', 'Battlefly', 'Battlefly'),
        ('0x9623BF7f03281a9dd7a8b56dB9451748eDd40cc5', 'Vela AMA - Official NFT', 'VELA'),
        ('0x53bD6b734F50AC058091077249A40f5351629d05', 'The Optopi Collection', 'OPT'),
        ('0xb4fB3D6751c59e550790c6CF09Fa4cD61bEb0d26', 'prePO 40K Twitter Followers', 'prePO'),
        ('0x17DaCAD7975960833f374622fad08b90Ed67D1B5', 'Smol Bodies', 'SmolBodies'),
        ('0x7480224eC2B98f28cEe3740c80940A2F489BF352', 'EllerianHeroes', 'EllerianHeroes'),
        ('0x6325439389E0797Ab35752B4F43a14C004f22A9c', 'Smol Brain', 'SmolBrain'),
        ('0x00000000016c35e3613AD3Ed484Aa48f161b67FD', 'Smithonia Weapons', ' SMITHWEP'),
        ('0x6B86936967A328b327a6b8deaFdA9884F5006832', ' Neander Smol', 'NeanderSmol'),
        ('0x747910B74D2651A06563C3182838EAE4120F4277', 'AdventurerOfTheVoid', 'AoV'),
        ('0x642FfAb2752Df3BCE97083709F36080fb1482c80', 'Government Toucans', 'TOUCAN'),
        ('0x17f4BAa9D35Ee54fFbCb2608e20786473c7aa49f', 'Blueberry Club', 'GBC'),
        ('0x9D3eBe1CBc34614b414Bbb6d83F9b0875B8365EE', 'MechaPunkx', 'MECHAPUNKX'),
        ('0x611747CC4576aAb44f602a65dF3557150C214493', 'LilPudgys', 'LP'),
        ('0x537581D9E92B4Fa13977e673daff3819067463f6', 'Arbigans GALXE', 'ARBIGANSGALXE'),
        ('0x321F00f417Ee8860dBA55814E4DF8eDD8c041034', 'Vela x Arbitrum AMA - Official NFT', 'Vela Exchange'),
        ('0xE3b822eF027bdbdeE19c460D13F7D48F681C561b', 'NestedNFT', 'NESTED'),
        ('0x5e84c1A06E6AD1a8ED66Bc48dBe5eB06BF2Fe4aA', 'The Lost Donkeys', 'TLD'),
        ('0x5E5F2712b5BB1D707C25Abc327C8179f54F09Fe6', 'Arbitrum USDC', 'prePO'),
        ('0x09CAE384C6626102ABE47Ff50588A1dBe8432174', 'Toadz', 'TDZ'),
        ('0xF5747b5E554370D228B0112d108885115f6D40F6', 'Lost Barn', 'LOST_BARN'),
        ('0xdf67af354dC36feF1Bb67CFe12961B785043DD03', 'Hoodlife Club', 'HLC'),
        ('0x8762DbD391Fd90b29eccBB628CD54bD92F5Fc1f3', 'MagicRefinery', 'MAGIC_REFINERY'),
        ('0xe08449560c951D41D31155FaF69864141E1ffA2b', 'Hello LandX', 'HELLO_LANDX'),
        ('0x619F1f68a9a3cF939327801012E12f95B0312bB9', 'Bro Kwon`s Booty', 'Bro Kwon`s Booty'),
        ('0xAEbFb9431964c2c661faC9e99Be0C230D20C0C95', 'Battlefly Items', 'Battlefly ITEM'),
        ('0xfF3aFb7d847AeD8f2540f7b5042F693242e01ebD', 'SuperPositions', 'SP'),
        ('0x5e01c1889085B528EefF5e1bEe64Bfe94f454703', 'SamuRiseItems', 'SAMURISE_ITEMS')
  ) AS temp_table (contract_address, name, symbol)
