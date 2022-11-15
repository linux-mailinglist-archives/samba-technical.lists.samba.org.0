Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B2562A307
	for <lists+samba-technical@lfdr.de>; Tue, 15 Nov 2022 21:34:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=C/5rj0c6cUWCcRCkNIePXqn7ynBxPQMQmO8wwmlntv8=; b=QVj/jozHIJ2Nn3A+OstXO2g/K0
	gL+UxibeebybT5xGnqqlydbacZURNZOzxi3tFuJTPcw94XvxFuGgerA2xVVJt8BUjtgQkVdy5qsbm
	vq/8XPjkg53056cQes4845ytmMUrxjW46j1DkWMmxP74yvADAZVhFEO6jkdhvifYH7trvXzv8XaQA
	wUyC5IB4LbPibjVk7PrIQwZ9Nc3BIb3Nht0uIi5OrzuvUFdfjRF/RTiKeEp/kiSiq//4OEld+pggx
	PDctFxHn4cyoKoRVnQE70xM6X3jx+xsFQkDY7DITQxdKlqDnGoSivUgzPnl8dTcYPZU1clIaj+iJT
	o+Q2fFyg==;
Received: from ip6-localhost ([::1]:53508 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ov2cn-00E1Sx-QG; Tue, 15 Nov 2022 20:33:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42612) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ov2ch-00E1Sn-Q3
 for samba-technical@lists.samba.org; Tue, 15 Nov 2022 20:33:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=C/5rj0c6cUWCcRCkNIePXqn7ynBxPQMQmO8wwmlntv8=; b=opWf5F7MGhrp7i6ZHPeOxgZyaK
 T4JuyVzgZdp5pPTc7CyO8D0t5sJZWFjIXak8oBi7700wFbWS6Xr0nSoOiu4pHDLVp3MKk3928xi0N
 /k0+vc43mEsDel3CY+Ot7Sdy7n6Mk0Grda4ncuD+335eD2tgJunDYSvmDYAFSBnNWf6YiT6kky5UM
 we/kbQukSUhQ7vZLOJX65TBhQx5YrIKEHCmkS+KeuRomRRZyqeFgcYZN33tB9V75hYNG7aCqDW6Wu
 FyVg3BpZri3Yqf5yS6euWcS1zZPsU2psExMdxmh2/7/rTWayGxexF7nArd8u92maENrZRuEHS20G/
 PlW28NG5SW5wgkvHnU+Mfjib77xgoMizDBz80FTLmtAg++ERenztnpElhjo2S04BWbZqEgZFScOe9
 JfHHhirihHrBpogOBJQ26WU54PzfYhrqgyh1ArK2JTbJXXeGSmnhWfgwvG9Khl5bYUhE67v8sOTcz
 UsIcdJAlIATcDgY7+ZJ9iIIs;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ov2cf-008lTh-RT; Tue, 15 Nov 2022 20:33:35 +0000
Date: Tue, 15 Nov 2022 12:33:31 -0800
To: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: failing tests in the testsuite on debian
Message-ID: <Y3P3m2FJToHADDcF@jeremy-acer>
References: <4197c161-ef1e-3710-f50e-7631ddaf5f3f@msgid.tls.msk.ru>
 <de87d255-95d0-ac34-1544-fa0aac441f4b@msgid.tls.msk.ru>
 <66781199-ab84-1c05-3224-ed65cb9b12bc@msgid.tls.msk.ru>
 <Y3PPjghJzwYBPlAN@jeremy-acer>
 <1f00b2cd-2368-b6a5-ef70-b917dd42794c@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1f00b2cd-2368-b6a5-ef70-b917dd42794c@msgid.tls.msk.ru>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Nov 15, 2022 at 10:52:08PM +0300, Michael Tokarev wrote:
>Thank you very much Jeremy for stepping in!
>
>15.11.2022 20:42, Jeremy Allison via samba-technical wrote:
>>On Tue, Nov 15, 2022 at 06:12:44PM +0300, Michael Tokarev via samba-technical wrote:
>
>>>Certain tests do continue to fail though, and I still don't see how
>>>to address this.
>>
>>Which tests. Specific tests sometimes are expected
>>to fail.
>
>Here's my current knownfail.d list for the --quick test run:
>
>^samba3.smb2.session\ enc.(reauth.|bind.|bind_negative.*|bind_invalid_auth|encryption-aes-.*)\(nt4_dc\)
>^samba4.ntvfs.cifs.ntlm.base.unlink.unlink\(rpc_proxy\)
>^samba4.rpc.echo\ against\ rpc\ proxy\ with\ domain\ creds\(rpc_proxy\)
>
>I found no way to exclude certain tests (but the previous email from Ralph
>gives some clues).  None of the above tests seems to have reasons for failure.
>
>I'm pasting the output from the failing tests below.
>
>
>[35(230)/370 at 58s] samba3.smb2.session enc(nt4_dc)
>UNEXPECTED(failure): samba3.smb2.session enc.reauth1(nt4_dc)
>REASON: Exception: Exception: ../../source4/torture/smb2/session.c:247: (&io1)->out.file_attr was 128 (0x80), expected 32 (0x20): out.file_attr incorrect
>UNEXPECTED(failure): samba3.smb2.session enc.reauth2(nt4_dc)
>REASON: Exception: Exception: ../../source4/torture/smb2/session.c:323: (&io1)->out.file_attr was 128 (0x80), expected 32 (0x20): out.file_attr incorrect
>...(many of them)...
>
>this is ATTRIBUTE_ARCHIVE vs ATTRIBUTE_NORMAL. The test is
>expecting the newly created files to have "a" attribute but
>apparently there's none. Just a thought here - maybe it has
>something to do with this user being unable to create extended
>attributes, or maybe tmpfs (where I run the whole thing) does
>not support it.

Yes, the DOS attributes are stored in an EA.

Tests that create EA's should be run against a share
using vfs objects including vfs_xattr_tdb so they
don't depend on the underlying filesystem for EA
support.

I see the bug. The definition of [tmpenc]
has:

vfs objects = dirsort

It should be:

vfs objects = dirsort xattr_tdb

as you're running it against a filesystem
(tmpfs) that doesn't support EAs.

