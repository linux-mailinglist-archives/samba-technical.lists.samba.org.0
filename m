Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 177EB85B453
	for <lists+samba-technical@lfdr.de>; Tue, 20 Feb 2024 09:01:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=kohJAc8EpTgu6cPCbSaO4A7HZLmu4hS+/2u/GkQHrhQ=; b=cg6zW2AkRco8MFEpQhDS6rjoHS
	XAakUAiMRMes+4kRzpXLGOder4DRSik0A9InTEvlB3tVJHXQiY56UYdqLa89kSAyNn5EP84YMJMCs
	15eU1gtVD5E8Zw/K6V67x4uEOp/VSKfNPy/tHjE2k8vGe+0OmC9Oxla6qyfQ+31PStnpoN5ww5Q6u
	OxEEblWDPsYiGhl+nVW6EnxAovQivfyhwK5YMi12Ebo8ucKQFldv3kEWZBFyEuY7Q7JB3z0Ida+PT
	skC0QGDVJq660IcQ86g8jJfRKG/gpzsIfb1nSMKUqYBEDaoEWfs4NriRs8IEx/v2NXmcYVt7GMInq
	Y6lmuvcg==;
Received: from ip6-localhost ([::1]:59896 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rcL3w-008ydh-LO; Tue, 20 Feb 2024 08:01:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54532) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rcL3s-008yda-7K
 for samba-technical@lists.samba.org; Tue, 20 Feb 2024 08:01:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=kohJAc8EpTgu6cPCbSaO4A7HZLmu4hS+/2u/GkQHrhQ=; b=tNM1zSP7wcliVMUaBVYDduAQBe
 6JBwyYzSWdiyd92oDxZ9qbGWQAgmgyBFrFxroVhCgQC4/Qai1zuIkao7mes1f9UbmWKsbkiHqL//7
 +l7nx/8ZVIA8aGuzyn76gdkHPtxCPOriWVx1zB/yc7pCHwKo8LBNFStXMnPxkYSPIvHegxVuVg0k5
 4vsCBrjXs616W6+1FU3TOvBT0duzN/0ZBje/rplkafhfY+YA+XLMuSFXlyOn3Eys3GhQd1RRaV73e
 qNDkZ4pAfvQRMMeGrf5p7Fr3gBWcBDgt/jnxy0ioI9nX+O339UJXaOSsQQh06uxrEgL8OXlFULBN3
 venIF8nGUNaiVAUnAhvqxrwU9+IQ0lplWxe80p5TIoBybPi+R+OmBhDJ0qofd1Y1paXRbjEQklpW3
 smnPlSMVoBnPRwNVq/IBhZGuIqdH8dkQQVx+e1RS6nHGU/cR+uvXu4TPRxuFbkNFFADxkeBOuSYom
 BRbQcsxW0htMnLgk4NHjCVNu;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rcL3j-00Dv8U-1h for samba-technical@lists.samba.org;
 Tue, 20 Feb 2024 08:00:59 +0000
Date: Tue, 20 Feb 2024 08:00:57 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: Re: [MS-GPOL] 3.2.5.1.4 Site Search
Message-ID: <20240220080057.5b10136d@devstation.samdom.example.com>
In-Reply-To: <2627406.vYhyI6sBWr@magrathea>
References: <4365205.UPlyArG6xL@magrathea>
 <20240219174708.4990e0c1@devstation.samdom.example.com>
 <2627406.vYhyI6sBWr@magrathea>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 20 Feb 2024 08:22:45 +0100
Andreas Schneider <asn@samba.org> wrote:

> On Monday, 19 February 2024 18:47:08 CET Rowland Penny via
> samba-technical wrote:
> > On Mon, 19 Feb 2024 17:52:59 +0100
> > Andreas Schneider via samba-technical
> > <samba-technical@lists.samba.org>
> > 
> > wrote:
> > > Hi,
> > > 
> > > "[MS-GPOL] 3.2.5.1.4 Site Search" wants to know the site of the
> > > client.
> > > 
> > > Details:
> > > 
> > > https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-gpol/
> > > c2ce6870-c863-40b0-94c1-73cf53b6e634
> > > 
> > > In order to do that, it does a netr_DsRGetSiteName() on the local
> > > machine to the local rpc_server. If you sniff the network
> > > traffic, on the DC you can see that the clients rpc_server does a
> > > CLAP query:
> > > 
> > > bin/ldbsearch --use-kerberos=no -H
> > > ldap://win-dc01.earth.milkyway.site - UAdministrator%Secret007!
> > > -b '' --scope=base
> > > '(&(DnsDomain=EARTH.MILKYWAY.SITE.)(Host=SAMBA1))(NtVer=0x20000016)'
> > > Netlogon # record 1 dn:
> > > Netlogon::
> > > EwBcAFwAVwBJAE4ALQBEAEMAMAAxAAAAAABFAEEAUgBUAEgAAABsfosaQV2fQrJLMfR
> > > xuNCLAAAAAAAAAAAAAAAAAAAAAAVlYXJ0aAhtaWxreXdheQRzaXRlAMBGCFdJTi1EQzAxwEYKO
> > > KjA ffMDAAMAAAD/////
> > 
> > Have you tried adding '--show-binary' to your ldbsearch to see if
> > you get the result in a readable form ?
> 
> I need the result in python and there ndr_unpack on the data doesn't
> work:

I meant it to check if the base64 encoded result was actually the same
as the wbinfo result, you could be going down a blind alley.

Rowland


