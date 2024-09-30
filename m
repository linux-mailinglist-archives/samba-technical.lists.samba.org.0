Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD8598A67E
	for <lists+samba-technical@lfdr.de>; Mon, 30 Sep 2024 16:00:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=/I8pYKhzE5QEY2TkX7PnqBCxb3sHpvHbgJ/LYPRHoTU=; b=nh1VYQCsxT6d8qnekzrKsMClao
	6keENKSj9qGHPBcTw2v9BVJRwrqmy10rj928xY9uW4t27NrRBBN3IBTlAain19hKp0i1RFCJyXLFK
	Lr70Vy/Y4HvZq76NrdIflQJLSwSgnVdJvIJxvkzB6DIH9LnNG3L72YcQZ3POsZcO438QEcD3dk8Kx
	JMITsM747QnKDAONV38sb8D++CVhrPOfMZiEGxuQKyycnDRSlCzXzyQwCaNN2ftrhAv0G931Oke/P
	aC/XiSCOT507LVyjFuusV8WkVXmMOZzAXeDXu7YgezTMXd85b2HX35oUgzc+EJ+IVzlNOZm/w4Q4D
	0TKMUQ1w==;
Received: from ip6-localhost ([::1]:65166 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1svGwQ-000toY-PK; Mon, 30 Sep 2024 13:59:58 +0000
Received: from mta-65-226.siemens.flowmailer.net ([185.136.65.226]:34019) 
 by hr1.samba.org with esmtps
 (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1svGwM-000toR-IL
 for samba-technical@lists.samba.org; Mon, 30 Sep 2024 13:59:56 +0000
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id
 20240930134940744c6b7ae3e97db224
 for <samba-technical@lists.samba.org>;
 Mon, 30 Sep 2024 15:49:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=innomotics.com; i=michael.osipov@innomotics.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=/I8pYKhzE5QEY2TkX7PnqBCxb3sHpvHbgJ/LYPRHoTU=;
 b=f9GhD5FZYRswwpGmGphlT5jWHIE/6zBuwlZAGW1vy+51XjIrn8XxmGETS820DUKSY79CiW
 f1lSYfPrCmf8AeG50xx+SGq1exjDdEEcLhI1W/psbzOxCEpNzWBBUVH3A+1yDokGxcA1ZECF
 o8TMq1ryYegH50WeolAggmWRujM9xcIn9E7dA4NwG7+YZw3RWa/1vf8i3QIhHlJre5BA0Lpz
 VNiX/bxI5+EMWoCto86I1rqtjbD9lHmrazhI3Q3k4CuRHJIoarbPdU4axkMh8KPFQ//phJ4a
 Vj0mg/Ar8mIUnhyKs2fuyErQ2X9tykGWmGi67bIVWztBjwdfFTHub4uw==;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qkCr5Vapw8zoYuZwPx8QYez0SwS9eNXs03Wsp8GVChK3KjmIYMRVoDlqikvAmeaeZWibNcAk+2eKBZCDJxcExaRv/yAwdDWgcnsP82yEUAS9Gj8V0Jk1e9KXwtitmvLX0rXj+38UBses3U7CRhPap396RaCbXp3Ds8+LnsugEveeNYMWck3i76SVzmmgmlgo6pvJzp+J6U4mnHh4573WbUw9+ifbctb0OsX8eXRpZD3XBZqtJLZQ91gXJTDTbAT+ENs5EQEyxxD+c7p84ZV3xcoZfAEqG/dGFdejSG+MlSB2RpK9x+7X2sgK9KhJswOWnuaV9S/tPo+7FsQo53dyWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/I8pYKhzE5QEY2TkX7PnqBCxb3sHpvHbgJ/LYPRHoTU=;
 b=veAlL1eF/kBkz9p2lvVIy8eUHeCuD0xPNcLUWWb/9UGRJtzKymsfdVy5SBK9NK1HKG6taHNUDe82D4ULJEAI/PhcCQBBTN/qOBE63wloL+9gVpI5J3Ojggt8iuc4a6/qyzJLAg59rUWd/xEd05WcAcvbSZM85N7ArOWQGN6TwrMRB7WDRKIg070hQD12lHTp46RcBK1oL5dBHkJ184hngDPxYv/8H+99DBbIuwg9f2/at5P4TMvdVGpaiZRALDMuC9MlhB9zRPXWT6X71XgBJsvmJxw7QB9dRZKiNTEyHbuYS220zgHAPHqVsEQ7D8S/guIbO9c2ZzsS1VT7ga2C/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Message-ID: <52296fc1-872e-4b82-899b-338d18108300@siemens.com>
Date: Mon, 30 Sep 2024 15:49:37 +0200
To: samba-technical@lists.samba.org
Content-Language: en-US
Subject: Clarification on MS-PAC KERB_VALIDATION_INFO and Samba's
 implementation regarding UserFlags
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAVPR10MB7035:EE_|GVXPR10MB8948:EE_
X-MS-Office365-Filtering-Correlation-Id: 284d2795-8609-4e60-e212-08dce156ba25
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: =?US-ASCII?Q?=093HxemveaaX1wKInLdjAU?=
 =?US-ASCII?Q?q69jSgjwphCuVUXuwyto4?=
 =?US-ASCII?Q?obubAfyBqVySS2a4YRMsjMNuQnQV0qbNqBmLKG9QQI?=
 =?US-ASCII?Q?UjThRbAD5hBUMqfxZuRqeQMm3Hu48t/dWYcnZ0sVby?=
 =?US-ASCII?Q?VaZcRIJ88lCxY8D0mEZp2zkRdt6itZgak+zjJ2Cgz7?=
 =?US-ASCII?Q?r4JhNdBw2ruwmjJYElImnmkK02kM+xdiFPiUQPeftl?=
 =?US-ASCII?Q?H9qcL9NUxS55OKWv6rxKmuGhWgJ3zYzrjGEJ9CxpPB?=
 =?US-ASCII?Q?ZTbIzv96mkRsFQHGJnjbe0ezUS5kdMOtjFgtMX6rKT?=
 =?US-ASCII?Q?XNlJQLJIHD28+T4VWNnuebuE8eUjXG/4TbX9H1Vjkg?=
 =?US-ASCII?Q?JqH8lZGIgYLsa2Q6sUaMIpG1dkYbtYy9skQehKHzej?=
 =?US-ASCII?Q?iXnpppd1OxgmOozIBFWeMU5imz+ulqHVS2nRpg7W6Q?=
 =?US-ASCII?Q?jhXY61Ryh5e84gAr+lCFHKAThQsI7OcvmUXlQJYRZE?=
 =?US-ASCII?Q?oWTFrpFdnfVwIcAhv00ps8V6IW6nhD0fgjl7gHDfXD?=
 =?US-ASCII?Q?OPejX/FZaKf3n16T+V6zBALN4n9rSzgbU3gatBWnxM?=
 =?US-ASCII?Q?9/TZihTiAujlYGdULfm8Ubm6/QccFRLK1s0JOxsSEz?=
 =?US-ASCII?Q?rDZCYf8df6U+VtJe8dIykGj9DRT3O8JRtww4xDoXwc?=
 =?US-ASCII?Q?wJLMPuFdyio3G8glB9cpfJgRlh/Qkw+Fs6B2x3Wueb?=
 =?US-ASCII?Q?lWvo6yveOmfd37q4HCOHbePJ0pmyjIhX6SzhT/jgaa?=
 =?US-ASCII?Q?Yz6BGB/PL5+9DeD9idzi8DUTwBkLcM0CjC6dq1iSiy?=
 =?US-ASCII?Q?quLhPdQYwVpm6VD2L82u0dppd7Tzpz91nEQzFJVc+r?=
 =?US-ASCII?Q?et0Pgj+rJvEXcsmb+xaT4lTK9vFvKbKGEMXohqpaZ2?=
 =?US-ASCII?Q?LdAwI98dHCOTkHcEyYwV42yNGhB6dH8eqI5fmzL4iY?=
 =?US-ASCII?Q?6lcFwWua3On7T31DdPRxNiAVOlM2898Zr4FQZP5O6B?=
 =?US-ASCII?Q?4DrvWewJhKbDFRGNmLvMSOPqoBfyFFoPo8nasBRKZ0?=
 =?US-ASCII?Q?EAxB5F7fnl0pVhlgxzQ92lsLHulvEs7A8saKuTL5d2?=
 =?US-ASCII?Q?dbs3Wbc0ehZPV/rj4vMguANjZQl+GylAAW0Iy7hPPG?=
 =?US-ASCII?Q?XZ3NmoLAy2cfV4A73TSC1b6oHsut939H+6yBnHzT11?=
 =?US-ASCII?Q?mRQptD/ADP/QdhJEcmdzh6dqFP34rbx0gGCVPYC8Us?=
 =?US-ASCII?Q?bQsTGo7Jec5URFHfjSjSnXsbNNUhuhIsxhL/boMYc5?=
 =?US-ASCII?Q?P4Sq+2wsepyCCuOZlQ54ju1V/WjqVKwezpoiaTlGv5?=
 =?US-ASCII?Q?1qy0XEI1xyv0wCd7l+hziV9tvrExzbpXEXN+J8ubcm?=
 =?US-ASCII?Q?+WythF7xirf1I8QNP45NjNXNXN9EKHMKvkz2oWE7sr?=
 =?US-ASCII?Q?P62rfmJy5yRqyF9Ksns9+zWOyqUOrmnbUlOYKhZlNyA?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?US-ASCII?Q?=092V0wHosBYZa?=
 =?US-ASCII?Q?3hHwTQsfVnM4n?= =?US-ASCII?Q?pEQTnvKgjj6bekuW3Ufq9A7tD?=
 =?US-ASCII?Q?VgoR77LQ1i8ebK+3ySPiG+uU7+yH0N/kFQRWwUQVQirZsnEscfl?=
 =?US-ASCII?Q?rxius70PPNw7KACX00jh6XPnksqtf/qPug3anIEc0e2sTpEhzyv?=
 =?US-ASCII?Q?2B2klXZj9DYFGSlhngCWKrnlnZ2gJtlf0Ni+S7yeQzs6fkAMRhV?=
 =?US-ASCII?Q?AEZbnky78FBghjVRZB7VpSjbUdxiXs0L5wpG7L38+wGKkOq268?=
 =?US-ASCII?Q?ivzR+7b+f/Q7bBICRIGwFlk5owTXeW5gB2DNKnO6b5E/Zp6B2Eh?=
 =?US-ASCII?Q?6tt8yKUrhU3r5ZGPdCnjN9i01/OsLK5i/tmPHD1kj6IOMVtka/Q?=
 =?US-ASCII?Q?SVMFX8OUDhG6zNR6noeHpgwg01vb7HoIVBFYnpiX1p8ILvgi0Up?=
 =?US-ASCII?Q?wcOJgUtUtTJ5QAGoLLR3n7guMqA8zyiB3SioFrar9eRa4NQ7O/?=
 =?US-ASCII?Q?BLaUy5cY/mfcCYma2BBA2PJf7+Tc0FKoBNAfBAHbahYQB1YRg3v?=
 =?US-ASCII?Q?h35zl2KtWrP/uC2vxc7NSuqnzEjQ5/D2Mipupm2o1KLByiiwXnt?=
 =?US-ASCII?Q?4KtqXF4iY7xWYB+kAcgvnxxvE7O1RzCfqwssGLYxh327X2iCgZA?=
 =?US-ASCII?Q?MF/ocEmt2twowy0WAJwAhkmKrNqozBMzEK8Hm9rz6GHmv3RZOu?=
 =?US-ASCII?Q?arAKBFt3AeybVd9T3bOh/KJ7afQaH/jFe+G9lxC59SubIcsEjs8?=
 =?US-ASCII?Q?6oTB3YodC2My5XVmqmsBv85JcAlO+eqnx3avptezTg4UTxXkPPP?=
 =?US-ASCII?Q?7vNAINkrYUIdWDEvKbhX4lFDPstJlldNTCqmTu+zr6WiX0gN9BN?=
 =?US-ASCII?Q?GreiP6STqCvhPXviisENhNswkhUaWeb402fCoI63tyoqjnjOoE?=
 =?US-ASCII?Q?GRfSAMj3y4/ygtFma/wRc/lt8XssJtXm/EQaJgS01qDKQIV1FZI?=
 =?US-ASCII?Q?wcFjcWOB7VJ8rko/Eh1OJA6jnmE+4AXQKcR392no81UGCFYiXIY?=
 =?US-ASCII?Q?GOy+UxgCIXHmyCWOgl+d4MCOurCo5mdSHzUgFJPpl/XOW/vP0u9?=
 =?US-ASCII?Q?BOELA2wYB7/o3WgwCaCbgSxbcNrAXDL7VNOl8yNSkWAAGJe+h6?=
 =?US-ASCII?Q?TV9+KkysX6SToMojPbp+oDhO2PODD3y7xFr1vcVkCuAQyx1D8/z?=
 =?US-ASCII?Q?PeK1cQS9ROwH6hfzw83PcTQIcO8yB05ZAa23Jq8V51m10mXnNWM?=
 =?US-ASCII?Q?RzMKmQNOFoPQfmIB2vEji4DWPXGpBL+oXY3iSE+saS1IskK1BN7?=
 =?US-ASCII?Q?9zOdJ6gu8DpYdvRjJI2r1mM7f43vkoxUkaK2nMCSjFn4yDDw29?=
 =?US-ASCII?Q?22SvQcDyAnoCrGQU3Wl8Yln/xQ9jmv+erIP1clL0fl2jCslaQt2?=
 =?US-ASCII?Q?RIpYWGnTJuOAr3lMHU6uF0Ot3CTKk0EaZvJOWshBZg7gDTzImDn?=
 =?US-ASCII?Q?cLp2cW7lXJCfU+cJnE1Z99qx8CLjpTe4l914WvQ/s3WZs03IDdz?=
 =?US-ASCII?Q?1WzNA7+8s1dTYe5UOndvKjyreWcjhPHlcOdGWreLRCZ0RWeheEa?=
 =?US-ASCII?Q?y6uRO3Si0ffnBKqW+sVyxVf4QdxJMUgNzyeuw8jPGC8qjjzfcDM?=
 =?US-ASCII?Q?L0iWi2rAA4G3PcdcoLnmAYDi+jSiq5WmhrXTU53HlJIfT7EFt3g?=
 =?US-ASCII?Q?BRNHoDDveLeaLqfiZfowwX4mE7q/VEslTOCFWgR96SEQzoozw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: x9FjVTdaRioEoORHQzXm0CxOOclpZ9VFY8QuSUFji304SVg5+EHPYfP6AxBuCuBoGdb7rhTLm3Nl16hikw8kwvsb/eeAux2xocVtzrtgakTAs6sbWQ6DpOVhvn+mC0KlcwJOkgVrsKsMcO9D2AEUKioy/qRw84TjSg+S1UhORnH4tlav8J7VkVJiPXmiUYxd8mdT5MHPZgSWSvfzCbDOpLUfLsfTIiGY036uXmnyFvO25Vn4EyoC/zVF064IZNLqaBJsxmgEhctx6UCe8p7Q3hiHnQ/IzVtEkRdles3/2vSJJT438JunnPK9wfmqccRKWRNSkK2taC1u5a9W5jHwC7yyoM1sIVRLP6yYwjs5EgCihAKEuaHfNXnUmNsZ35NuOqnQIH/jy8FzUjAMPEzYA60+qDrESB5GTFV07690Ke7gpdZmCZFKK9Re4YUYwKAOirAIKgxvedRWu62+26TvLgAlT6ecdF5tefK8elDSKmTMXdFW5+vHHHEln7fwQhezDCEuSKM40e6WmaYFsR9voJxRC3rXIEscH/0OTN7X+v3/ZYcK0wbBZ39KdG0F6XUM/kxJEySSdU6TrcTvXSiPiT0RBOCNh7jPpY0J7j13h7VjpRtsuRgFZG5yBmQxw962
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 284d2795-8609-4e60-e212-08dce156ba25
X-MS-Exchange-CrossTenant-AuthSource: PAVPR10MB7035.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZXd81iiOLe5fgwU4DRCX52CPx0ACA9UH7LuKtDIhV7fn6VgjW1yS/7/rhhJ5m/44yIet4EFXo0SUfVos66CSoYifsgo1U5VT3noNDxRI1T0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8948
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-7515:519-21489:flowmailer
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: "Osipov, Michael \(IN IT IN\) via samba-technical"
 <samba-technical@lists.samba.org>
Reply-To: "Osipov, Michael \(IN IT IN\)" <michael.osipov@innomotics.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi folks,

I seek guidance from you experts on the following case whether Samba's 
implementation and your understanding adheres to the specs off MS-PAC:
I have moved a server from one forest to another last weekend while the 
actual users remained in the old forest. The server runs Samba 4.16 ATM, 
but also also custom software written in Java utilizing the MS-PAC from 
the service ticket.

While processing the PAC from one specific user the KERB_VALIDATION_INFO 
failed to be parsed because ExtraSids pointer is set to NULL, but 
UserFlags has flag D set. The domain controller issued that ticket is 
Windows Server 2019 Standard running on 
domainFunctionality/forestFunctionality 6 and 
domainControllerFunctionality 7.
Now re-reading [1] it says that if flags D/H are set the appropriate 
pointers must not be NULL. Something does not add up for me here.

In Samba code the NETLOGON_EXTRA_SIDS [2] is always added regardless 
group_sids_to_info3() may actually not add any extra SIDs [3]. On the 
contrary, this code [4] does set this flag only if any extra SIDs are 
available, so does this test code [5]. Especially according to [5] my 
KERB_VALIDATION_INFO case is expected to fail.

My question is now: How to properly understand the 
ExtraSids/ResourceGroupDomainSid/ResourceGroupIds when those are NULL, 
can the flags still be set? If those are non NULL, the flags MUST be set 
for sure.

I can provide the dump and a parsed view from the dump privately before 
and after the server migration.

My actual fix for the problem is here [6] and the issue for it here [7]

Best regards,

Michael

[1] 
https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-pac/69e86ccc-85e3-41b9-b514-7d969cd0ed73
[2] 
https://github.com/samba-team/samba/blob/f749330ddaba04cdae20570a9e842327715f3594/source3/auth/server_info.c#L613C27-L613C46
[3] 
https://github.com/samba-team/samba/blob/f749330ddaba04cdae20570a9e842327715f3594/source3/auth/server_info.c#L252-L254
[4] 
https://github.com/samba-team/samba/blob/f749330ddaba04cdae20570a9e842327715f3594/auth/auth_sam_reply.c#L399-L404
[5] 
https://github.com/samba-team/samba/blob/f749330ddaba04cdae20570a9e842327715f3594/python/samba/tests/krb5/raw_testcase.py#L4195-L4214
[6] https://github.com/michael-o/tomcatspnegoad/pull/24
[7] https://github.com/michael-o/tomcatspnegoad/issues/23

