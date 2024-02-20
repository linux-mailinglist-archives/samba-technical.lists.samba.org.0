Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DD485BDAC
	for <lists+samba-technical@lfdr.de>; Tue, 20 Feb 2024 14:52:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=K8pbw9AY/3xYvLyJSglk839r/Dfxupj6GweozJW2VWA=; b=n5RlmjrM3FworfEDGKMCLjRuiL
	gU3Q9gJxh1hhar73g4c+GbWFqkvsuIBJUHJQuyy1pRzpwnRG4keqav7rAGQ1jhCgLgPy9lSWqcuWL
	tovSJeg9zmtTaHDWQEweqrAMa7MWouH+c0679yYwxRdgsFgL0JfEwVA7PBGNSXr1u5Y6RwJJjO2/M
	1jCQF+Ythy5ofyPlrXbGNDjje16O44++oXacLOmz3nVB5KQjoheOro1/FW249yET9g3PpoJHjyFWV
	KfsHXflyw2x9R2MCArSsGOncQ/8kn+mzbAfMu5p6Nmxy82LtaqSo8H45ydf2TXFzHD0PBIBpDLnee
	ZMlh4gxA==;
Received: from ip6-localhost ([::1]:51688 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rcQXb-008zuS-Oc; Tue, 20 Feb 2024 13:52:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61228) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rcQXX-008zuL-6e
 for samba-technical@lists.samba.org; Tue, 20 Feb 2024 13:52:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=K8pbw9AY/3xYvLyJSglk839r/Dfxupj6GweozJW2VWA=; b=E5w+sYrjs4rAwo3pXqAqtqmTCv
 3tqn8ljWx04Wv8RVMW9Cluv0y7ZdrnSa7jR1A2FUUyYKmDo6iS91RZNHZeVIPVziA8sAjLT1kZX/j
 Yb+8RB4YFOJnwhrpOZPoeAhe7ndqFESWZmViSAOHQptMZdXDa3igKa1aCPlBxVSZ1z8sQMF/EPo6l
 4aQL1pVy0Utel6+IKdNV6IOMdNfnrBBQ2ZxkQIEnbxYRnXywBVY2w+QK0jGGSJPj+Kuwa35Yt7MEZ
 9EUc+O5NiHXCeQClQeQw2H3chZVyEw9z+9zUn+Vo39Jln2XOD+0MCEuADrr0ectrvvR1e4eYI3hBC
 atiPGdwLE+RnSY9zp/1LfgvvMvLRbrnjR3/JV/6+MGPbQUQM1r42pug/x+1LNXtdHMnA2rh3utW7T
 O1SA2LSkFlenPsIgPtwijs7858ncrIKTVCFdhD/hEnONBQBv6qOpZjkAZt0QjIaqrSE1IyzV4N9DZ
 gVAH/za/4nRn2zrqcezZBCDY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rcQXV-00DyDA-2j; Tue, 20 Feb 2024 13:52:05 +0000
To: samba-technical@lists.samba.org, dmulder@samba.org
Subject: Re: [MS-GPOL] 3.2.5.1.4 Site Search
Date: Tue, 20 Feb 2024 14:52:05 +0100
Message-ID: <3472529.sQuhbGJ8Bu@magrathea>
In-Reply-To: <4365205.UPlyArG6xL@magrathea>
References: <4365205.UPlyArG6xL@magrathea>
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
Cc: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Monday, 19 February 2024 17:52:59 CET Andreas Schneider via samba-technical 
wrote:
> Hi,
> 
> "[MS-GPOL] 3.2.5.1.4 Site Search" wants to know the site of the client.
> 
> Details:
> 
> https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-gpol/
> c2ce6870-c863-40b0-94c1-73cf53b6e634
> 
> In order to do that, it does a netr_DsRGetSiteName() on the local machine to
> the local rpc_server. If you sniff the network traffic, on the DC you can
> see that the clients rpc_server does a CLAP query:
> 
> bin/ldbsearch --use-kerberos=no -H ldap://win-dc01.earth.milkyway.site -
> UAdministrator%Secret007! -b '' --scope=base
> '(&(DnsDomain=EARTH.MILKYWAY.SITE.)(Host=SAMBA1))(NtVer=0x20000016)'
> Netlogon # record 1
> dn:
> Netlogon::
> EwBcAFwAVwBJAE4ALQBEAEMAMAAxAAAAAABFAEEAUgBUAEgAAABsfosaQV2fQrJLMfR
> xuNCLAAAAAAAAAAAAAAAAAAAAAAVlYXJ0aAhtaWxreXdheQRzaXRlAMBGCFdJTi1EQzAxwEYKOK
> jA ffMDAAMAAAD/////
> 
> # returned 1 records
> # 1 entries
> # 0 referrals
> 
> I think this is actually the same as:
> 
> 
> $ wbinfo --dsgetdcname=earth.milkyway.site
> \\WIN-DC01.earth.milkyway.site
> \\192.168.56.10
> 1
> 1a8b7e6c-5d41-429f-b24b-31f471b8d08b
> earth.milkyway.site
> earth.milkyway.site
> 0xe003f3fd
> Default-First-Site-Name
> Default-First-Site-Name
> 
> 
> As samba-gpupdate is written in Python, the question is how to do a
> dsgetdcname() from Python? Could someone give some pointers?
> 

librpc/ndr/ndr_nbt.c has ndr_pull_netlogon_samlogon_response()

However there is no unpack function available in 

bin/default/librpc/gen_ndr/py_nbt.c for that. I can find the union etc. but 
the unpack seems to be missing. How do I get that?


Best regards


	Andreas


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



