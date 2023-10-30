Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 359B37DC00E
	for <lists+samba-technical@lfdr.de>; Mon, 30 Oct 2023 19:44:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=f7URw9O548zimAKNgOflvRC3t4ls/NMGXThgIll1Exg=; b=5S/DmMMb6/x2WXgaHiFXMP7p4+
	Qp/uSZzcdbk7lFjyRJ19+xjfD6TTAmhA+BgLq8LhTNO45a6U/QIRCK7pMFX2CjtRRz6+ZIohRh1FN
	3HjWgcyFMc6gtBh3I9RBXUXf7SpVnQdc4EjKIFj+T0d/deCvIn5R7kKH9f0Hn6Qg7FwxdJu/Z1B9E
	mdKcbGND5BU+oyuP80qbOXnqrD8qRh69/zv6lmeI6WLBC5z154BrO+FDB4eaL4AUA6qxT4m0exhpp
	OEgjyjzXWkAXe2LyB/p4Kk+qbnzlNFU4U28YTYyMHG7FQB7EVghEgNU6KCz2fxdnwEi0t8u4SDd5f
	LNYOS2uQ==;
Received: from ip6-localhost ([::1]:26208 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qxXFS-003bn6-Tg; Mon, 30 Oct 2023 18:44:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21628) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qxXFP-003bmx-0H
 for samba-technical@lists.samba.org; Mon, 30 Oct 2023 18:44:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=f7URw9O548zimAKNgOflvRC3t4ls/NMGXThgIll1Exg=; b=ftk54k4de9b0zTe4urcQU9feB7
 sgxpLqjZWqRrqUf7EYHQk0g1FACjQrG5cDWGIrZfYzSd05lSjQSICN/DBDNsu7GpwedAVLuDWhEXa
 HmPMsXmwLQYWSk504gzQatDSfr+bFHRcVGDP1qKrQCpzoa/6gZN81/KUMhLjCBR65d6AV8+28gBWE
 rdNfTnYvnGk8h0N+bC/Ke2YZRn79oCd1ZW5GKosA3B8FJkmlrPZwK7gQ59RK3p4waGF+PyoJEYEXY
 u87+OSSptRJ1iX6ETgzleACvfxPn3KxygY8HCgmmyDr86LdeCzShs11tD2yqofsFqknaYrJ1aN9dR
 GAMdV2o4/S+3gTmUiOgjQehMCy0Lq4Pi9TVR3vyXVXj2eLxTeAZPL91AycilVH/cYsp5cWiYNILuC
 uy9AW0qyxjK76gVkoMIq7epIkOo8gcoc2GszvQoEdM1BiMS9tRj09vjDvmeKKILJi93ffrrbu4dO3
 +fTJWP8QQWlZ7H+WbAzba/LT;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qxXFM-003N5S-0c; Mon, 30 Oct 2023 18:44:20 +0000
Date: Mon, 30 Oct 2023 11:44:17 -0700
To: Tom Talpey <tom@talpey.com>
Subject: Re: [SMB3 POSIX] POSIX client creates a file, set the ARCHIVE bit or
 not
Message-ID: <ZT/5gcK9KdCcXXYt@jeremy-HP-Z840-Workstation>
References: <3b2fa1bd-2eae-482a-a9d9-543ebb921046@samba.org>
 <ZT/ZoUmdarteCey4@jeremy-HP-Z840-Workstation>
 <18abc825-a35d-441b-9476-32c6c368275f@samba.org>
 <ZT/tY0fVsAaaqpZE@jeremy-HP-Z840-Workstation>
 <a92a20ea-5e03-4f0c-9129-db4c62043dd1@samba.org>
 <2c4005f6-e5f0-43b1-bc96-0d497e547934@talpey.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <2c4005f6-e5f0-43b1-bc96-0d497e547934@talpey.com>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Volker Lendecke <vl@samba.org>, Stefan Metzmacher <metze@samba.org>,
 Steven French <Steven.French@microsoft.com>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Oct 30, 2023 at 02:25:05PM -0400, Tom Talpey via samba-technical wrote:
>On 10/30/2023 2:13 PM, Ralph Boehme wrote:
>>On 10/30/23 18:52, Jeremy Allison wrote:
>>>Yep, sounds good to me !
>>
>>ok. Noticed we need the tweak at a slightly different place, but 
>>anyway, working on it while at it.
>>
>
>Is this really worth it? It seems odd to set a Windows-only attribute
>from a Posix system, just because it's there. I guess it's mostly
>harmless though.

Lots of backup utils use the ARCHIVE bit to tell them
what to back up.

