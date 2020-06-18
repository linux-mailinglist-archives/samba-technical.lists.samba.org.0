Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2851D1FE9CD
	for <lists+samba-technical@lfdr.de>; Thu, 18 Jun 2020 06:12:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=29usftuVxenFFzuovsw4IgrHqFgcKU+pkVQqFM3EjBs=; b=y3Z3w2ue1dlv5lnR5eeno0/cML
	TGwEEtN3IN7V4bxxIJgCpnjD8CZjUIPv/4tBPjR5Fn9vfOLtcoTqTKNNLPio11Tbvn+LXDlEuxj7C
	MkVhXJ2FiMOJnNCFLztR0SX2iM5krmrWUuP1yx8IuQ0Q69H7b4TmUw4aEej3wctIwwApFaPhIo49L
	WIXedSeDrdUE3njGrdjtZ3MEng5d7ami3zKzHa6DNlsH/bOgchBQGO4C0rKJ9++p9D29OSdhZmGlz
	LjnV+EbKEU4oRKb3BbyFqtvbqmOdTRD8txqhjcBbtu/J6uGUqEXaO+wWnrdjxraaaa+ONIpzJ5OuD
	oS/tqzSA==;
Received: from localhost ([::1]:33252 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jlltp-0018FW-U5; Thu, 18 Jun 2020 04:11:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29962) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jlltd-0018F7-N4; Thu, 18 Jun 2020 04:11:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=29usftuVxenFFzuovsw4IgrHqFgcKU+pkVQqFM3EjBs=; b=OZhUe4Xc+leA5y5F1Fwuh7wnW/
 jTTMIdSCn0oSzgCeWZhUPIRpTJ+MJ4KcC6NkeT1VzJ6e8/8R+/L9OLIzkPr9yDRgv5Z6/xp/8+jT8
 haKPTleZySOAYLKnbZSycvnFozomvCTha+5nSCc+yCtEUmp0kGm9LMN7VcE8VUNZYLLeUD9No20Ly
 UHWRc3DzYO2ivimdrziINeWFWWoze1TkgsBY/JCljD3MgPUACAWOP/GpNvdNRpLEQURPUHrGZPXM+
 XePIauyhlL207ylTvJh+uNoKyymdlDh9a41afaCWXaZbO2l+VseYnoJtpynrXRiIGNIFYTwlDflWx
 9rqWtJcKSNYmQE7PrPF9CCxetfpNRWlZvl6G0ct33Wpwt7ywfi5DL6VH4YA5LWGDBgF3CBTNVUmz/
 Ls7gSL1DLWAPql1f2lWkupX1MlwpRyPFm9X1gh4H/jpzNcoEqSB0mAM5DwKZ34hJL/Xcgw3TbqiEw
 XcVAvvKCqlsNbi54cMzWHU4q;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jlltc-0002B5-GS; Thu, 18 Jun 2020 04:11:25 +0000
Message-ID: <247468aa185782ba94b0751c82b912426517c5dd.camel@samba.org>
Subject: GnuTLS for samba-4.12.x on RHEL7 / CentOS 7:  encourage or discourage?
To: =?ISO-8859-1?Q?S=E9rgio?= Basto <sergio@serjux.com>, Rommel Rodriguez
 Toirac <rommelrt@nauta.cu>, Lista samba4 <samba@lists.samba.org>
Date: Thu, 18 Jun 2020 16:11:18 +1200
In-Reply-To: <aa4be4c0b8e46decc96097e93d24dc8a935b0476.camel@serjux.com>
References: <655709E5-BFC6-45A4-BE0A-4A885F74377B@nauta.cu>
 <dd600dcf420658c8724f8b532c50635a9ac61887.camel@serjux.com>
 <3b5a35a9e210725e17821c7d1c08a3f98d2e3276.camel@samba.org>
 <aa4be4c0b8e46decc96097e93d24dc8a935b0476.camel@serjux.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2020-06-18 at 04:46 +0100, Sérgio Basto via samba wrote:
> On Thu, 2020-06-18 at 14:43 +1200, Andrew Bartlett via samba wrote:
> > If we could get an even more modern version then we can consider
> > removing even more duplicate in-house cryptography. 
> 
> Thank you , glad to help .
> 
> You mean do compat-gnutls36 packages ? IIRC, already when I tried to
> build gnutls-3.5, I found that we need to update and build many more
> package dependencies ...

Thanks for that extra information.  I wondered what the issue was.

Now, the big question I wanted to ask you is this:

It is one thing to give us a really big helping hand for development,
but I wondered how comfortable are you with being the repository for a
security-sensitive package being used significant number of production
Samba sites?

Do you have the resources to ensure that if GnuTLS issues a security
advisory impacting GnuTLS 3.4 that you backport the patches?  I notice
a number of issues here:  https://www.gnutls.org/security-new.html

Or should we instead strongly discourage the use of Samba 4.12,
particularly as an AD DC (because the LDAP server exposes TLS, which
seems to be a more likely target), on RHEL7 / CentOS 7?

(We would instead suggest that an upgrade to RHEL8 / CentOS 8 instead).

Thanks!

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




