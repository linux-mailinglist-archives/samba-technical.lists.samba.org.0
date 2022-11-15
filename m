Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6639762A083
	for <lists+samba-technical@lfdr.de>; Tue, 15 Nov 2022 18:39:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=iGuIXGRTEMJUHG+lMSyyhdeelhQ5nIVCftqtNYmJVyg=; b=EkzuuUgIx8B/CKqG/dzp1d3Q27
	7FpqEdC9hY9mPB0hDTiXabgm8ZTN9rVQCrgoqPUbfrzxagNVhwvL8LolOLAELUZXFhh8bw/VFU+YB
	uDCvbdeIjQeLdxqeD8HTfCEf59qystyFRC+DsS+I8JfTVQLfIQOXNRZN5E2M/x4gVE0Ed69F/ctrW
	K58UIkey8ECZhX+4FZpzAkig/X0GCSxfLo9qvs5rq4RLg0yH41vnGvJAuzgIZnbUjrXYjS+gOGan2
	+W/0sLUTtki066OIRfFREaswht4nLmp1W8u+AC3mSpPaC6C078AERwu5/tmxtFC2x3M2ORUR621BF
	ext7a8jA==;
Received: from ip6-localhost ([::1]:30888 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ouzts-00DvyJ-8m; Tue, 15 Nov 2022 17:39:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53820) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ouztn-00Dvwt-N1
 for samba-technical@lists.samba.org; Tue, 15 Nov 2022 17:39:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=iGuIXGRTEMJUHG+lMSyyhdeelhQ5nIVCftqtNYmJVyg=; b=Dl3FAxtZ+PCxjG2ERoVesZLLFD
 BuTnC0/q5+TOicQsXsBkq+wgR+ocMNVrZ41azF2cSlz09qm82ZATEEjvLUXMT4f9OU9jdm+SaypWv
 7nCeZ5OGVEelUzJs8FywP15jUDFNOmgmmbyN8c3ind/gT4xjJiR8GdUq39nABCQ+re8rPb3EjxdTe
 7O6VGv7c1ArJpR4rcDazifWWlR5kW9HNrj+q+Gw7lG3mLrXuDspRB40zXsMEclP4pu4YlzUwyJnVp
 xy8VGxhKLKlNDaFHm3W0wioOk6ypW0YUyZNdwvJO4sGUGIbY/eIBUpUzX0Wboubv0oXR8Z8DMjSFw
 gfDT5E43u3dhVV3+nQUZf5r+bVenBo7mw7sYZqfqPSlELa15u9oywuh1vrAs9HkEZOxoqtxuGc9P5
 It5OBeTiPWuO2JZQ4ia43zBN3Taa0NIhpERq7l9mnb8cZ+jKReNeBCRwP7bUDqrH1o/9C8uBNKKTG
 gJPUrySjepdGP+pGi3ZZRnKz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ouztm-008kRm-QY; Tue, 15 Nov 2022 17:39:03 +0000
Date: Tue, 15 Nov 2022 09:39:00 -0800
To: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: failing tests in the testsuite on debian
Message-ID: <Y3POtHOlEIpFRqzS@jeremy-acer>
References: <4197c161-ef1e-3710-f50e-7631ddaf5f3f@msgid.tls.msk.ru>
 <de87d255-95d0-ac34-1544-fa0aac441f4b@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <de87d255-95d0-ac34-1544-fa0aac441f4b@msgid.tls.msk.ru>
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

On Tue, Nov 15, 2022 at 04:35:45PM +0300, Michael Tokarev via samba-technical wrote:
>I experimented with the tests some more. Thank you Jeremy for the
>tip about escaping spaces in the knownfail files, - somehow I noticed
>this is the case in other places but didnt' think about using escapes
>in my "knownfails".
>
>But the thing, or a request for help actually, is still here.  I found
>out that samba testsuite is unreliable.
>
>In particular, one can't re-run tests, because on subsequent runs, even
>if you `rm -rf st' in-between, the result will be different, and different
>tests will fail and the ones failed before will succeed, even with the
>--quick test list.
>
>eg, samba3.rpc.schannel_anon_setpw anonymous password set (schannel enforced server-side)(nt4_dc_schannel)
>test will succeed on the first run, but will fail on subsequent runs:
>
> Failed with dcerpc_flags=0x800220
> WARNING!: ../../source4/torture/rpc/schannel.c:796: status was 
>NT_STATUS_CONNECTION_DISCONNECTED, expected NT_STATUS_OK: Failed to 
>connect without schannel
> Failed with dcerpc_flags=0x800220

That's not supposed to happen. I personally always do

rm -rf st

before re-running tests and doing so should always
cause re-creation of the servers.

>On the other hand, samba4.rpc.echo against rpc proxy with domain creds(rpc_proxy)
>fails on the first run (as described in my previous email), but succeeds
>on subsequent runs.
>
>I'm asking for help to make the whole thing runnable as a "quick" check
>that the new samba works fine and there's no obvious build errors.

I'll take a look at all tests that fail unexpectedly
after a rm -rf st, but it's a lower priority than
code reviews and feature fixes.

