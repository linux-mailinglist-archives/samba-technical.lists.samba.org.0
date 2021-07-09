Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9329D3C223F
	for <lists+samba-technical@lfdr.de>; Fri,  9 Jul 2021 12:31:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=wKiMRHYvaCdHs6gGAYVBkJTwOxizfJzR8pn2s84MugU=; b=mZDGOtga71csdsTc1G6xDLprDh
	FtneaLquGjhGBV/kEJ8GHtSkPtXD1Z64p4tvLyEU0xaUpxJIB2oW512EJIQrJhKzcH6eS4C2DGrxj
	/z4eRvtENBUO6mxoTxPLDMxG6yvPM/KScnenJlUsvPtMgjLCZin3598C0brPyG7PQgaVFFiNcEZHu
	HaMiYDUv7QE4F2ZL96pCj/H3mnFSutTrxKJ5dWhgbBTI9VzHn0XayVIKqTiVkjs3ti0CRJ5AZStPL
	09aEO6ofW1FqEPMwVoohBeUiYpFJ6uyXksw6rTudmiCv/F6rC0LhDRddN1DbEAkPcVdbEwugRoA5v
	3RB/La+g==;
Received: from ip6-localhost ([::1]:47224 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m1nll-00Cpoh-IX; Fri, 09 Jul 2021 10:30:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20796) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m1nlg-00CpoY-4c
 for samba-technical@lists.samba.org; Fri, 09 Jul 2021 10:30:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=wKiMRHYvaCdHs6gGAYVBkJTwOxizfJzR8pn2s84MugU=; b=c7carzX5f1lS7HF/Bq1316Bz4/
 sgF8JiyUdBR5ChJSpgRyRh2xvm1+53jIED1ahyn1S0LA25mmZHJRxlrxAyI6xVBtixtYUE++kicLo
 lUKpueWTqlbk3/F6KsiQAt1svIYPLGCVDaBhHUayEA2Im9NIWyfleIyyX1ldDs8X0ZoeZ/3kaKLsa
 UsE2iVNKiX36nDsSX6t5W4FXo/7ElObQ1MyF9zd6OqqJoCtYjTsdlCiKLpYr/UezI1ER5bTGxGFUM
 SreUDuPNPSFlGlqNocnxflydOsv0gelLL9l6iw9l3BrCFE57ebLF3gp70hfgEIpq8ZAOl44rnfhhX
 qN3AGY7LQd2XhCTxQF4iglU+h4SnuZGdfHetZl2HuOGawo1+p4XWFJe8Nb66ZdTqZ/It2KYP+Yw6c
 Xd58R+t/1L1W8a8nN8vEzr+0wJNCrGtRuDJfAL1tKpvKy4KOyi6X9lhYpe8Az9JvM8xIC1u0CnWyR
 uaF84I8ISTJReOBe9KdQmFkM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m1nle-0000ed-7p; Fri, 09 Jul 2021 10:29:58 +0000
Message-ID: <a78f79643b03b31afbe505b932df2cc46fb0254d.camel@samba.org>
Subject: Re: Heimdal upgrade, really happening this time
To: Stefan Metzmacher <metze@samba.org>, Upstream Samba Technical Mailing
 list <samba-technical@lists.samba.org>, Isaac Boukris <iboukris@gmail.com>
Date: Fri, 09 Jul 2021 22:29:54 +1200
In-Reply-To: <c328766b-d894-517f-966c-fa5305558633@samba.org>
References: <b2cb195314281883e378c908784ac6f9f841584d.camel@samba.org>
 <26713d5cdcc47d0d9fb017b6a1e546d9501d8efe.camel@samba.org>
 <c328766b-d894-517f-966c-fa5305558633@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.2 (3.40.2-1.fc34) 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2021-07-06 at 10:14 +0200, Stefan Metzmacher via samba-
technical wrote:
> Hi Andrew,
> 
> > > My current draft is up as a MR, and I'll continue to work to upstream
> > > what I can (into Samba/Heimdal).  I do plan to upgrade Heimdal again
> > > (perhaps to align to a release in 2021 if they make one) before I
> > > finally merge the branch.
> > > 
> > > https://gitlab.com/samba-team/samba/-/merge_requests/2014
> 
> Also keep the following in mind when proposing upstream changes:
> - (kdc outdated passwords)
>   https://gitlab.com/samba-team/samba/-/merge_requests/664
> - S4U2Proxy requests with encrypted authorization-data are rejected by a Samba KDC
>   https://bugzilla.samba.org/show_bug.cgi?id=13131
> - The KDC logic arround msDs-supportedEncryptionTypes differs from Windows
>   https://bugzilla.samba.org/show_bug.cgi?id=13135
> - S4U2Proxy tickets from a Samba KDC don't pass PAC verification checks (authtime mismatch)
>   https://bugzilla.samba.org/show_bug.cgi?id=13137
> - PKINIT fixes:
>   https://github.com/metze-samba/heimdal/tree/heimdal-smartcard
> 
> We most likely also need to change some apis in order to generate PAC Ticket checksums
> (Wireshark support is being added by Isaac and me, see https://gitlab.com/wireshark/wireshark/-/merge_requests/3570)
> and also for compound identity PACs when offering FAST.
> "wip: rework PAC and AD-SIGNTICKET for S4U2Proxy support"
> https://github.com/heimdal/heimdal/pull/767
> might also be related here.
> 
> I'll also try to start the discussion about
> GSS_KRB5_CRED_NO_TRANSIT_CHECK_X again, see
> https://github.com/heimdal/heimdal/pull/656
> https://github.com/krb5/krb5/pull/1005
> 
> metze

For the list, some of the discussion is happening on:

https://gitlab.com/samba-team/samba/-/merge_requests/2014
We are really close.  Probably not close enough to drop for 4.15 (we
may have missed something, and last-moment isn't when to drop in
something like this) but quite close, and starting the 4.16 development
cycle would give plenty of time to shake out bugs. 

There are more tests to write, but also at some point we are going to
need to just say 'this is good enough and sort the rest out in master'
as rebasing on both Samba and Heimdal takes time, care and energy. 

To be clear, I won't get in the way if you want to move faster, I've
just been trying to stay as careful as I thought you would be expecting
me to be (if that makes any sense).

I do suggest we should keep a fairly 'dirty' history with the previous
merge points working as much as possible, in case we need to bisect
back on bugs, to at least have some reference points.  Not our usual
practice but for this one case I think worthwhile.

We now have a mostly-working branch of current Heimdal on current
Samba, compiling on all our supported system, which is pretty
impressive.

Andrew Bartlett

-- 
Andrew Bartlett (he/him)        https://samba.org/~abartlet/
Samba Team Member (since 2001)  https://samba.org
Samba Developer, Catalyst IT    https://catalyst.net.nz/services/samba



