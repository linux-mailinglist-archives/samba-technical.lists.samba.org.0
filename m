Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB59348468
	for <lists+samba-technical@lfdr.de>; Wed, 24 Mar 2021 23:14:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=m/Op+nhQ7KsebdFSLu/4DMA950F3058vbNcU4JvwBBs=; b=pqCIuRCMEw2GQqjUo+s1p6tOsw
	BqoGI1EZU/khMoH3i8KYvd9MavMwsbv8tNt8XA/FVNbSVnEY74dTIuSCf8biGuN1rs37YNQQSHZMW
	sSto4FTARLtRYFe4Xa3SYSzJPdmvHi40KV445Dxr+cXMphsPXgTiuE1sd5SUsoyzn02ZFt+5DgYWO
	gPz/thtsCh8iNMIyuXaUv5aHSSa3MH6Ir/3DBX7Jucrt3agjtcdXSjfnMJKgypPqa9ZixP0wEgewk
	o6ERP+yoDA7lmxjHf8LkUVyYRLKWORjpwefQaZlnJIkrIYNZvxkp+/LkOYz8u7Fs03Ro5hCUZPf86
	Nia17CUw==;
Received: from ip6-localhost ([::1]:60728 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lPBkp-006fgK-PE; Wed, 24 Mar 2021 22:13:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60082) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lPBkk-006fgD-Jx
 for samba-technical@lists.samba.org; Wed, 24 Mar 2021 22:13:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=m/Op+nhQ7KsebdFSLu/4DMA950F3058vbNcU4JvwBBs=; b=dYrCrTpDUshOlbXSL17K+5DyAD
 F+Gsla0gebAfKOnkiYSZuVwJIV/1jmn1iJ7c3fdbhFU4CEK6luU0vGIPngW0YxUD3NFEu0QVlhwr7
 T6b9sVvKgQTouJt6WtpU+soEpf+Bw/qJnxSSt3Y1LBZOlPBeCM7KhZ6ISJOYalGFSPKrWjIFMfSqZ
 x5t56HkXm0abkIhN0JUzi3qrtZ2MORlYk0bBQCPkhFciZH0eoiQ1zARucPBrN8zWyxjfogQUtXFmz
 tVEiCdpvrR7bkp6HlKeVyrpTBerVYmmc2DtfdNWmCSQlsYOpcgiYxtdsy8+TpfmzU+NcjSg1k5wGF
 P3kKBRe6Fmza4KcH13PgofREDcLPzI/GdGf5ef0K9AlyWQLMyThPEHFz7JToRF3bHoEoQOM+UZ7CO
 YkU2P7idAUZ2mICcUrio4LChjRPMDtzb1/6T0vmbsRgrOMXT8/gOPOe6tkRRg58+ePZRJe+7+IaEx
 uKS8nCfsc/pnFvofM8Mnx/IZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lPBkj-0000km-3L; Wed, 24 Mar 2021 22:13:25 +0000
Message-ID: <bc9db9815c3b9d12b2d12ee98dba9b38fb37f83d.camel@samba.org>
Subject: Re: Other things to drop (was: Re: Drop NIS support)
To: Jeremy Allison <jra@samba.org>, Andreas Schneider <asn@samba.org>
Date: Thu, 25 Mar 2021 11:13:20 +1300
In-Reply-To: <c0ab22d7832cc8c9d7e1abb7ef729161f46814ee.camel@samba.org>
References: <4045140.l1vqqZ3lm0@magrathea>
 <20210324161244.GB818616@jeremy-acer>
 <c0ab22d7832cc8c9d7e1abb7ef729161f46814ee.camel@samba.org>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2021-03-25 at 09:13 +1300, Andrew Bartlett via samba-technical
wrote:
> On Wed, 2021-03-24 at 09:12 -0700, Jeremy Allison via samba-technical
> wrote:
> > On Wed, Mar 24, 2021 at 05:10:15PM +0100, Andreas Schneider via
> > samba-technical wrote:
> > > Hi,
> > > 
> > > could we drop NIS support for Samba 4.15?
> > > 
> > > This means getting rid of lib/replace/system/nis.h and yp_*() ...
> > 
> > +1 from me. Let's see if anyone else is still
> > using it.
> > 
> > So the current list for 4.15 will be Tru64, HPUX, NIS.
> > 
> > Any more for any more ?
> 
> How about some more of our compilation options?
> 
> Could we merge --with-dnsupdate into --with-ads?
> 

> On one we can probably agree with, --with-ntvfs-fileserver should
> just
> be a side-effect of other options like --enable-selftest, it should
> not
> be an option on it's own. 

https://gitlab.com/samba-team/samba/-/merge_requests/1863

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions






