Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F449B46D2
	for <lists+samba-technical@lfdr.de>; Tue, 29 Oct 2024 11:27:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=AMm23hNlcK8F2kSGXOvZImg55xrDCkOUKWOT1SylhqM=; b=ICTlRH+BxDYbplPjVE+hYtzXb2
	S3dlmY7T+zO5owIfVZDYrbBm5qWn2yzTJv5qt+SzA4djBf6C0aGMo0rn60ca9m4TLqYxcKW4hmtRo
	V7fJ41eu6suv4TXPAVBvN8MJiphJUk/Dx0wYfnXtym2cU6tsLBHTENu+gaMwIKy2z3O/Q6bBXhPKm
	I2InLhniiPaFf9djmPcSPKaqP3zy9hKyj4J/FSNCh5D/p6v8tHiKiJD8hPEp8luw5d6i1Vp2YDr2F
	JQjtBWqsbQWahKalgi0Or+5Q7CQOGIk08zcrwNqE0vNj8b3DaJdhVbGLLAXTngJLudNlYhIwZJKXM
	GSwWa2YQ==;
Received: from ip6-localhost ([::1]:44112 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t5jRt-005S7S-KA; Tue, 29 Oct 2024 10:27:41 +0000
Received: from cat-hlzsim-prod-mail21.catalyst.net.nz
 ([103.250.241.204]:33462) by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t5jRk-005S6b-29
 for samba-technical@lists.samba.org; Tue, 29 Oct 2024 10:27:36 +0000
Received: from [192.168.1.219] (unknown [114.23.142.188])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-hlzsim-prod-mail21.catalyst.net.nz (Postfix) with ESMTPSA id D0917C7;
 Tue, 29 Oct 2024 23:27:22 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=catalyst.net.nz;
 s=default; t=1730197642;
 bh=AMm23hNlcK8F2kSGXOvZImg55xrDCkOUKWOT1SylhqM=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=WKuB9cQ2sMDGmHat4lon/GjTLS9bIILQJfpMCXNXPOJ+pTZ1OIVv5WqWO3WisSZqS
 HhQnfQQxvUKU7MLziufS2vlnQyiecyBWcq+HcunsEvqRZtA4k5WEWftaLQNT9O7L41
 +kNnYIibuojyWRyfoghrSZEABCC69K4Jc0WX7/2l66XjquTM/0WW1yu3EyzztXiqsq
 iRomN/QrgS82WyPuampaL1tP8r4SpPPtXDAi26tf6Wx//9TVGoVq02HlsS/g94afQk
 XQfsad4qNdrTD6jJy512B1BluYI7eYv2kL8uiHVK+13TyHY8RYXlL2TBgCLWhhdVyh
 bw6LGUrCkPIpA==
Message-ID: <84bb05ba-823e-40a7-ba6b-d3c7ec6f2af1@catalyst.net.nz>
Date: Tue, 29 Oct 2024 23:27:21 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: authentication policies in Samba 4.21
To: Stefan Kania <stefan@kania-online.de>,
 samba-technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
 <297faa9c-6788-436b-bfb3-8d2107b8596d@catalyst.net.nz>
 <48c2847c-7d05-4e1a-9e85-52b1ba5d0b30@catalyst.net.nz>
 <ef60d0ef-25df-4081-9764-5dbc05bfc655@kania-online.de>
 <1eb80efc-4bb2-4b7c-b339-5b92277e782e@samba.org>
 <49b4b9af-033a-4534-90e3-ac633ff8bfd8@kania-online.de>
 <7bf96a40-7472-47ca-b81c-7e9121c598b4@samba.org>
 <68fe1182-281f-42ea-ac18-b0a2bf49961d@samba.org>
 <afa75a49-2ae4-4e14-9363-d5c31d7ef2a9@kania-online.de>
 <b5f3c39b-43c8-4b43-943d-cd851128173c@kania-online.de>
 <5d10619f-c4ed-4190-a4d1-1cec480ee108@catalyst.net.nz>
 <c420e24b-562d-4592-a9df-d0dddd069e22@kania-online.de>
 <ab589c2f-f13b-4560-bd18-7a1e88634a0d@catalyst.net.nz>
 <1a14a7d4-3d56-4212-9420-0affed9ffd18@kania-online.de>
 <0f4e2d3b-12b2-4dfc-88ef-0b52c12bf6db@catalyst.net.nz>
 <70db5ba2-8cfc-42f4-a493-0228954debdb@kania-online.de>
Content-Language: en-NZ
In-Reply-To: <70db5ba2-8cfc-42f4-a493-0228954debdb@kania-online.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 29/10/24 23:06, Stefan Kania wrote:

> I did ldbsearch --url=/var/lib/samba/private/sam.ldb '(|(CN=stka)(CN=win11*)(CN=WINCLIENT11*))' --cross-ncs to also see
> the computer object and I got:

[...]

> # record 2
> dn: CN=win11-policy,CN=AuthN Policies,CN=AuthN Policy Configuration,CN=Services,CN=Configuration,DC=example,DC=net

[...]

> msDS-UserAllowedToAuthenticateTo:: AQAEgBQAAAAgAAAAAAAAACwAAAABAQAAAAAABRIAAAA
>  BAQAAAAAABRIAAAAEAHgAAQAAAAkDcAAAAQAAAQEAAAAAAAEAAAAAYXJ0ePk2AAAAYQBkADoALwAv
>  AGUAeAB0AC8AQQB1AHQAaABlAG4AdABpAGMAYQB0AGkAbwBuAFMAaQBsAG8AEBQAAAB3AGkAbgAxA
>  DEALQBzAGkAbABvAIAAAAA=

We need this to be "msDS-ComputerAllowedToAuthenticateTo::".

Because the thing you want to control authentication to is a computer.

Douglas


