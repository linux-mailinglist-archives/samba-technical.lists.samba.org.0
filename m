Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9557585B3E0
	for <lists+samba-technical@lfdr.de>; Tue, 20 Feb 2024 08:23:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=LkGvQsMhRrsm/UGq6zgrXTARvZz0lZeEEUv/+hxy9AE=; b=bdzGqYKOfx6mFslrsna35amPKb
	M0B/Ko+QTjqDckgB2Ntc9GfeZqPNshBNrMPFzDHOeQgS+qbOCiHKk9hRxzthGZAeTZMeh3ntcHX8O
	2kNy7BPuIhyIl//xSkLfVD27PamJ5/j52y5iLknRvTSgZWkdKWorYrPr4E2he5x9NapPdCQj/0XPx
	jTqTNL1sWkCTWaH6ffkFBRToh0U3/mB2RzzWDQc942danePnxszYntc2NLKIj9tMJR9ssfM9IRQbQ
	jW0LRb/giRVKUb3HjRGaPakPoIBO7zvw9aoQLtOpUwQN6QcpknDKDq7dl7zhq3QxUrlDUrDhg5ZVs
	dTzxEjoA==;
Received: from ip6-localhost ([::1]:51818 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rcKSx-008yUZ-6n; Tue, 20 Feb 2024 07:22:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12426) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rcKSm-008yUR-Pe
 for samba-technical@lists.samba.org; Tue, 20 Feb 2024 07:22:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=LkGvQsMhRrsm/UGq6zgrXTARvZz0lZeEEUv/+hxy9AE=; b=R9GwPUATLWK2k4X1GkaeCg2fgv
 yhCseDoISMBd7AEeJjWCdQTkA1PTJ82X5nIT2zgT+beqAxXb8y2R7baVFKyMBv+JphOj0r/NKQtIm
 A624JOqzFuepHG7ann3N+oAyOLht0IfDIpslQeU3W6SHk4wNQgLy/yUjE7vE/CMO8TR3IyPjwJJck
 JN8NRYDvf+HZG8mAbMOw8W9SQPQ9StDBlA463FBJ+tB78iS8h4k2f/7wqxama5eh5OQNuX7jHv8Xc
 MrmMwPU+9GXBeiQrz9WPNJIPILv1aYFFztKWxQYbxkEbjireWNJuK/1p957Oqt4vtO9iNHudC3/Lv
 qeHI+xobxBI0BOsfFFmXLSec4HxCO6Kf7iqJ6MleRcTboQ+OWsy3WqYfnwlg4BAMOxhTai7V+6WvG
 +KT61KY3Sr8OVpKDAyScWoT7Pe1Y+I5NezCDv0WE6DIt4R7rvQR0Nmki0qA2jPO2Fy4hbRfZTxHqP
 6b7ti8uwsCDcfyMUusNxCuj+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rcKSk-00DurV-0L; Tue, 20 Feb 2024 07:22:46 +0000
To: samba-technical@lists.samba.org
Subject: Re: [MS-GPOL] 3.2.5.1.4 Site Search
Date: Tue, 20 Feb 2024 08:22:45 +0100
Message-ID: <2627406.vYhyI6sBWr@magrathea>
In-Reply-To: <20240219174708.4990e0c1@devstation.samdom.example.com>
References: <4365205.UPlyArG6xL@magrathea>
 <20240219174708.4990e0c1@devstation.samdom.example.com>
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
Cc: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Monday, 19 February 2024 18:47:08 CET Rowland Penny via samba-technical 
wrote:
> On Mon, 19 Feb 2024 17:52:59 +0100
> Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
> 
> wrote:
> > Hi,
> > 
> > "[MS-GPOL] 3.2.5.1.4 Site Search" wants to know the site of the
> > client.
> > 
> > Details:
> > 
> > https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-gpol/
> > c2ce6870-c863-40b0-94c1-73cf53b6e634
> > 
> > In order to do that, it does a netr_DsRGetSiteName() on the local
> > machine to the local rpc_server. If you sniff the network traffic, on
> > the DC you can see that the clients rpc_server does a CLAP query:
> > 
> > bin/ldbsearch --use-kerberos=no -H
> > ldap://win-dc01.earth.milkyway.site - UAdministrator%Secret007! -b ''
> > --scope=base
> > '(&(DnsDomain=EARTH.MILKYWAY.SITE.)(Host=SAMBA1))(NtVer=0x20000016)'
> > Netlogon # record 1 dn:
> > Netlogon::
> > EwBcAFwAVwBJAE4ALQBEAEMAMAAxAAAAAABFAEEAUgBUAEgAAABsfosaQV2fQrJLMfR
> > xuNCLAAAAAAAAAAAAAAAAAAAAAAVlYXJ0aAhtaWxreXdheQRzaXRlAMBGCFdJTi1EQzAxwEYKO
> > KjA ffMDAAMAAAD/////
> 
> Have you tried adding '--show-binary' to your ldbsearch to see if you
> get the result in a readable form ?

I need the result in python and there ndr_unpack on the data doesn't work:

{'val': <nbt.NETLOGON_SAM_LOGON_RESPONSE talloc based object at 
0x561bae0c4c60>}
 
python doesn't really understand the result.

> Rowland
> 
> > # returned 1 records
> > # 1 entries
> > # 0 referrals
> > 
> > I think this is actually the same as:
> > 
> > 
> > $ wbinfo --dsgetdcname=earth.milkyway.site
> > \\WIN-DC01.earth.milkyway.site
> > \\192.168.56.10
> > 1
> > 1a8b7e6c-5d41-429f-b24b-31f471b8d08b
> > earth.milkyway.site
> > earth.milkyway.site
> > 0xe003f3fd
> > Default-First-Site-Name
> > Default-First-Site-Name
> > 
> > 
> > As samba-gpupdate is written in Python, the question is how to do a
> > dsgetdcname() from Python? Could someone give some pointers?
> > 
> > 
> > 
> > 
> > Thanks
> > 
> > 	Andreas


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



