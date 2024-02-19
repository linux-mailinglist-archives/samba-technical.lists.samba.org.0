Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 31ACB85A955
	for <lists+samba-technical@lfdr.de>; Mon, 19 Feb 2024 17:53:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=Ll++2Kg74H53VOiBTvpLL+Ol1+cdsXEwClizPpY/r10=; b=C1b0xlYOG47eK8cFvBlpQCJwGs
	cXNYdcILt3CVPWrjRfJr41mCOTOQAmVHWwSMNGWIZqWbKzjT3HbpWULY1qim3TT64f2+bcQBPtpoO
	o8/XiD8HwcBBGPNRXxc80i0XwGkcV4Qzp4BZn7eKNZegwYGZe06j3vKrFNT8DiQFBkptzpK/DF5R2
	C/c38g+0qRfkg8wtP9MHZYRAsvsv61QmIbkQhL7U6RAqb80lZti8POKi1+ta5tuhSgbV80mloGfh+
	NAaE4YoA+r59EB8ZbdDSrUm+qYWJEmsdq9Yz2gOaEl3Pw5G8iVd6OLQSiH3DK7Nqm/Oa5THNdZWNo
	DzlQGBVQ==;
Received: from ip6-localhost ([::1]:28132 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rc6t6-008vWr-Ue; Mon, 19 Feb 2024 16:53:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26318) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rc6t3-008vWk-0m
 for samba-technical@lists.samba.org; Mon, 19 Feb 2024 16:53:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=Ll++2Kg74H53VOiBTvpLL+Ol1+cdsXEwClizPpY/r10=; b=G6q4adJUyJsiSxiABzNxGA3xeU
 /NNz9WOhmPxkqvkhGitiVA8siS40UpKstaxkMlGdsx0PTOAGnuTWUwOQw55mgxwVjPawugbDtb1Ge
 sEFVdtbHOmTRZvHg6+QGtWHFIIsM4NIji3MofcM4wxfHpIoUIy3HCXhCp2yVQLO+pWmJHmMzOaUWF
 QQfD+FjOj+DXa3fk7TjxlM3K6twqfKgmwZCPmRb+dlI6DW/3oFKsbiLx1N0ad5kXSryTm7aLUe8sc
 tqwpK75hqe38Z5CspjQmqGZlZqkAuX8x/OvEz5ca9SxgT+XXtKAffU+T2UEybJMVcziKcDUNa8yv2
 cTLYz9Mw5CNFgwLta0bVEiXPFlW0jXC5+aAjKMR4PJ2ZMFszVhreop7b5yB/PlnyxyYrWAW8QV/pU
 oMZLmFJKKVGUpfIxZ5zAxwK+eroGK8sc32ppXC4+W/AQDLtxQ+9kpXTxCrOQLoCMpZ8NFvtBCP8pD
 un2DjYiFJFVlnCSwB62HppNE;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rc6t2-00Dolq-0x; Mon, 19 Feb 2024 16:53:00 +0000
To: samba-technical@lists.samba.org, dmulder@samba.org
Subject: [MS-GPOL] 3.2.5.1.4 Site Search
Date: Mon, 19 Feb 2024 17:52:59 +0100
Message-ID: <4365205.UPlyArG6xL@magrathea>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

"[MS-GPOL] 3.2.5.1.4 Site Search" wants to know the site of the client.

Details:

https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-gpol/
c2ce6870-c863-40b0-94c1-73cf53b6e634

In order to do that, it does a netr_DsRGetSiteName() on the local machine to 
the local rpc_server. If you sniff the network traffic, on the DC you can see 
that the clients rpc_server does a CLAP query:

bin/ldbsearch --use-kerberos=no -H ldap://win-dc01.earth.milkyway.site -
UAdministrator%Secret007! -b '' --scope=base 
'(&(DnsDomain=EARTH.MILKYWAY.SITE.)(Host=SAMBA1))(NtVer=0x20000016)' Netlogon
# record 1
dn: 
Netlogon:: EwBcAFwAVwBJAE4ALQBEAEMAMAAxAAAAAABFAEEAUgBUAEgAAABsfosaQV2fQrJLMfR
 xuNCLAAAAAAAAAAAAAAAAAAAAAAVlYXJ0aAhtaWxreXdheQRzaXRlAMBGCFdJTi1EQzAxwEYKOKjA
 ffMDAAMAAAD/////

# returned 1 records
# 1 entries
# 0 referrals

I think this is actually the same as:


$ wbinfo --dsgetdcname=earth.milkyway.site
\\WIN-DC01.earth.milkyway.site
\\192.168.56.10
1
1a8b7e6c-5d41-429f-b24b-31f471b8d08b
earth.milkyway.site
earth.milkyway.site
0xe003f3fd
Default-First-Site-Name
Default-First-Site-Name


As samba-gpupdate is written in Python, the question is how to do a 
dsgetdcname() from Python? Could someone give some pointers?




Thanks


	Andreas


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



