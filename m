Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DD4445168
	for <lists+samba-technical@lfdr.de>; Thu,  4 Nov 2021 11:04:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=kEyQSHj/TfcSakeBIGcgC0t4ROf3Zoyz3/YRFAboR2Y=; b=r8d0BQmGLIkGbt9DjD7CPLkbNX
	wyR+h902cjk6SRgst1S9cTwwMJbsLM3JT8BdaFiKAhled3GmujFfejPeMmsC78FKKCsuU/d9obNvZ
	xb4V8CEW2IZEKK6kFQT5c3Jr1sJEg+xzbgBON3pKRdb+4w4IfhD7uYUYnFdgmnopfmcZtAizPK5po
	O+Dn6n17s/sZIHw+zCdEBMiMHSuRVMaiiEUke33e/3+BW4Tcl/UBjNRQjpcKD4cwdrhejnk/tVIXb
	Hi0OXXdCCEKiOxBGfo7qLaUtbczMDnwbgib2+4BRn6ZdrwimpenIjBYHgPq6nAW68GjyIrKp+6knl
	+TrbPzsg==;
Received: from ip6-localhost ([::1]:62300 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1miZc6-006yyQ-8V; Thu, 04 Nov 2021 10:04:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57400) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1miZbr-006yqc-EW; Thu, 04 Nov 2021 10:04:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=kEyQSHj/TfcSakeBIGcgC0t4ROf3Zoyz3/YRFAboR2Y=; b=Zic3Z3/5ohgIJmF//WvlX424Ft
 Un3bXz/HbvhxWCV0mVb7ToA5L/iK5/HFFLG35tvXwdYbKFuyzSJ/fN78j+8psIJa9qe/vY7kHs3DV
 JnGIqGowXwntY32OK6cGulXBFiF+fV86CcQiCvjZtrH61sgK4+N2XfWFz/hNRMJQSYlQyqDMiRBI2
 qWVnqD2t8oDasReluOZ9zkMtIXBtrxeRDvccaglXVGxkzlgelZOUO3XBg6K+0m3suRs5OoRLw6CGI
 39dkZJmTofA6jtmJM1VQyO1wvFLAOQQREWgHP99oeGRwJ3B34+bsIKrhQDJjZ61QA52ZYagpFjpDJ
 wv82TbOpY0FrwvCqvK/2Rqc/xx2sRNN6rzUNMG4nceF8L3Ex2umkYVua8ig+gcNee4DFrhjJl21ez
 jlI3ibqFOHdmLovt4V3fLMiYrLosccHGqcMaUGfHB4ywHARm7lFq/1HgJYIPPoNqoqH50LC3pQ5Xu
 urYfLMo03NH7KMWjLFfyWiO1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1miZbp-0057J2-OK; Thu, 04 Nov 2021 10:04:38 +0000
Message-ID: <4a84d9609ae918b8d2a2c128cf378d34a76bd11e.camel@samba.org>
Subject: Re: [Samba] Upcoming Samba security release
To: Rowland Penny <rpenny@samba.org>
Date: Thu, 04 Nov 2021 23:04:31 +1300
In-Reply-To: <354ffafda30af28036a6cf4f16059086e3051b68.camel@samba.org>
References: <654d3e50d01a29a8e67a3a188e2b3e10aa4f3f1b.camel@samba.org>
 <354ffafda30af28036a6cf4f16059086e3051b68.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
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
Cc: samba@lists.samba.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2021-11-04 at 10:02 +0000, Rowland Penny wrote:
> On Thu, 2021-11-04 at 22:55 +1300, Andrew Bartlett via samba wrote:
> > Hi,
> > 
> > this is a heads-up that there will be Samba security updates
> > on Tuesday, November 9. Please make sure that your Samba servers
> > will be updated immediately after the release!
> > 
> > Impacted components:
> > 
> > * AD DC (CVSS 8.8, high)
> > * AD Domain member (CVSS 8.1, high)
> > * File server (CVSS 4.8 medium)
> 
> Is an AD Domain member what I call a Unix domain member ? Which can
> be
> used as a fileserver ? If so, what is a 'File server' ?

Any file server use case, eg running smbd, but given the higher scores
for AD DC and AD Domain member, we mean a standalone file server.

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


