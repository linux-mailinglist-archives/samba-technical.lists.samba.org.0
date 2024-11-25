Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AE19D8D61
	for <lists+samba-technical@lfdr.de>; Mon, 25 Nov 2024 21:25:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=6w3PgWFgbWAfbWeOrczYHpSr6IwDMP5V/SHYBvOC5rk=; b=bLNuoOGJcT5PoF62/e9ZQeEA6O
	CrT9qISCcZVBO9mrFub4YnD85ItaklMIc5bWXbqgPaIC9O2Bs8xpuwAbc+ih6n+i8r78SGoGPoyM4
	XzFfTzHxsxb5tdyYL6SOjB7FhraEbFdwBYn/L9RddrbV1Zg9rDNu3VIRCxKFUZsmyG5ebkjeg0cXQ
	EM+/NaphdLZVO+yUekgUKxKxG1r3kBMIKVTh3N8QKmUJ+Qoe1MrHvyIVi6r4B5pYxBGvSWuhNRQgJ
	jE6nA53skrvV++RK55157Y5lSHvwzPEHDJGSAXU4IeDZxSMtL9BsARAvacqRoN5yNyJkxZaMl6G/x
	XOq5bLtA==;
Received: from ip6-localhost ([::1]:38116 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tFfdZ-000o6a-F9; Mon, 25 Nov 2024 20:24:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11256) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tFfdU-000o6T-TF
 for samba-technical@lists.samba.org; Mon, 25 Nov 2024 20:24:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=6w3PgWFgbWAfbWeOrczYHpSr6IwDMP5V/SHYBvOC5rk=; b=Ayvq3VBkRgnHTls+VLbudvHE5x
 EsUP8YmQLJL1d740b0iu1t4AtysbnJxPcAjD2vPcFgYoxBy6D2Z9cJqdJfa4e0KrHUIixi7tuRReL
 oh899viKx7rwWrPtjy7D6DEK2vgLj7icR56elWwDIQ81v6CY2oDmklPNDdh+wUEtkyjUi1o4OcPl+
 bDA0qXEhuQymG7ViwPBEg7NR4HvAZeA23QF+VRCoZvSCjRpKj8Nd+hHOIHoZ5cAdHLcQK2I/GeRI8
 M4YxHOt3sYE4WNz9GUGGktgZvUNcxQVDvUlhK/x67vAwwyNJXQSEZueifXdolLMIBLxS/2dxQF7ab
 uEiHcJxFPpuaETnWCE8vRbAdh1ZeNF9W4UccErnVoLbl35oAu5jyopwn1sV84iethw+uUwOC8MDpC
 C3sUG0jOco18d0Ed/mndzjWmaoeplvGQ78bhnMs7M76N+X3dIj3cSsDTXIBe/1/JXtQIXSzeEcahi
 xatipOcFiFEPCQbCCRgazFH7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.2:ECDHE_SECP256R1__ECDSA_SHA256__CHACHA20_POLY1305:256) (Exim)
 id 1tFfdT-001QwY-2K for samba-technical@lists.samba.org;
 Mon, 25 Nov 2024 20:24:43 +0000
To: Samba Technical <samba-technical@lists.samba.org>
Subject: Status query: SMB Direct in Samba
Message-ID: <9365ea2b-762f-3523-69e5-a1aba8be1c54@samba.org>
Date: Mon, 25 Nov 2024 14:24:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
From: "Christopher R. Hertel via samba-technical"
 <samba-technical@lists.samba.org>
Reply-To: "Christopher R. Hertel" <crh@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi, all.

I received an inquiry from a commercial vendor regarding SMB Direct in
Samba, so I went digging through the most recent documentation just to see
where things stand.

I know that Multichannel was moved from Experimental to Enabled-by-default
back in 2021 (4.15 release), and that SMB Direct requires Multichannel.  I
also found presentations from 2018 through 2020, all about implementation
plans.  I didn't find a definitive "it works now" statement regarding SMB
Direct, though I see that we detect/support RDMA in the interface code.

I poked through the wiki...

Do we have an authoritative statement about support for SMB Direct and how
it is implemented?  If we do, please hit me with the clue-bat and point me
in the right direction.  I'd like to write it up if it hasn't been done already.

Thanks!

Chris -)-----

