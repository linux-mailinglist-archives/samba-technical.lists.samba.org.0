Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 87836383CD8
	for <lists+samba-technical@lfdr.de>; Mon, 17 May 2021 21:02:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=saTjAbQPi6SVQYIvHnycH3RANjy5EP/Tyy4CP08tvao=; b=a3HXrAGuMaD/6JoWUxKninDzPL
	/Q29ukOFdTat2NBRF1FeG0dfs1Cg2K7QH+oW3+Ofr88BgZWjMgf5+uSKomK7wAjDm0vHDPny8GSTy
	EtCvEC9HFDMrtx8aR/7zNFgUNDEMCamIOMHV1gkIT87qyAbkeHYcDLk1T6j60qLifDJZ6InU6FFLD
	oE+acLP/A2Zjqz689hl8fXyZeObOrG4WbiSc5xkv8MIJtPTq5faQuOaCMvElIqu1dvNyYRKuJuUU8
	GO8YaWfqjR6NGGhsY1ZOeK+QkEP3D/SjyppZZpJ7cfdpziRtMHWXfLz/FUlI3sfzPUU86nmOsp7EN
	mE7ckaRg==;
Received: from ip6-localhost ([::1]:31528 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1liiUa-000zBV-KF; Mon, 17 May 2021 19:01:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53318) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1liiUV-000zBJ-DK
 for samba-technical@lists.samba.org; Mon, 17 May 2021 19:01:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=saTjAbQPi6SVQYIvHnycH3RANjy5EP/Tyy4CP08tvao=; b=SfEKBjrVbSocDQ567NlH64GsKf
 B3xC5NnzQ46zDUiHWvJV/j8AuN8kVaiF1cjjeZvFp2NG33VsA+/Ha9gGIg+ES1+VuGAUs+OY+9DFR
 P/MN94F4jmQk2uWRT1fn7grGISXo5p90uhi+24/GJIJRTwUZ8Jv4k92geow4AfWIF+W1ikjw8EZAf
 nf241WiGl3L3IGUfa/J3sixcbMFGeU2concX7QF9SEJnSI7U0bsrbiLjNcWsr5WE4xxaxBlb+qFCI
 vMwzt9ByMVAyLRpCfLa0KpCmpbBuoScjzy9kjgdt6nEvpZSicC71QtmmkKmRQuiiuuWvEQJ5TfOv4
 R1s2Y0Y7RWXrsXG+SBglT/ErT8EB8N2kwteKbLN86tJCsmmycPBFdfNyrr2W5lacgujQtGkK0uUNQ
 i2Wt8r3Jl0bnLsPd58IXRNmauH7nVwPi5cKmXBOyRuLgvY5FhXADIj3oDbyLGpexTZM1xuCUuAxkO
 u8MOiVl2cTyjiaNVm70mqFaO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1liiUT-0007QM-Vq; Mon, 17 May 2021 19:01:22 +0000
Message-ID: <97407ae87bceb340ed01e5a60f0417810d8ec3f6.camel@samba.org>
Subject: Re: Offline logon flapping in autobuild?
To: Andreas Schneider <asn@samba.org>
Date: Tue, 18 May 2021 07:01:14 +1200
In-Reply-To: <1949061.8nGXxLBRy0@magrathea>
References: <516bd798642997a15016d81f9ae6e17e9250f677.camel@samba.org>
 <1949061.8nGXxLBRy0@magrathea>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2021-05-17 at 10:38 +0200, Andreas Schneider wrote:
> On Thursday, 13 May 2021 10:17:48 CEST Andrew Bartlett wrote:
> > My most recent autobuild, with (I hope) unrelated changes, fails
> > with:
> > 
> > [141(1068)/143 at 6m5s]
> > samba.blackbox.offline_logon(ad_member_offline_logon)
> > ERROR:
> > Testsuite[samba.blackbox.offline_logon(ad_member_offline_logon)]
> > REASON: unable to set up environment ad_member_offline_logon -
> > exiting
> > could not obtain winbind interface details:
> > WBC_ERR_WINBIND_NOT_AVAILABLE
> > could not obtain winbind domain name!
> > failed to call wbcPingDc: WBC_ERR_WINBIND_NOT_AVAILABLE

I got the same failure again re-pushing today.

> It doesn't really have to do something with the offline logon.
> winbindd did 
> not start and was failing, the error why it didn't start would be
> the 
> interesing one. However for this we need the logs

I tried a --nocleanup build on sn-devel-184 for samba-admem-mit but
this passed this time, so I'm trying another with all the jobs.

Hopefully I'll get some information.

Is anyone else having trouble?

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


