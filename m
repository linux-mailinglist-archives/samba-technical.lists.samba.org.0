Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B58507B94C
	for <lists+samba-technical@lfdr.de>; Wed, 31 Jul 2019 07:56:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=UZwoylVIRxIGv/2kshYhZklSvN3lrN6c+1x5mN49294=; b=hFu02JIOavTW1z2aO0j+gQLJSn
	d8mhBEt5pf3aGl4II+EI2mEx6wTtEoJ+6gW6YVUjHsqwpw2BAJyGwDfGa31HSFMu++9wM5tTD82+r
	VRxdkksj12Y+EpJL+gStOh5NPXPjmpGZYOFN8Xq5jxW9lknLD6ZnlEGuWKV6bowvhb+/Y0WYgTIEn
	78eMz6O4dN3JM2zeKHxMMA8uLWCu8nDiNDDHErbaojFoON5pxLqUtPPJZbJSDoZYhvi8XPVer6yIH
	7E2wVUb5QymmaEj/ukoDANOznANnWh1hrKe4tUR7jvcWnDS+RBnSAPeZV+rN91JEOuNCBG5BtLbz/
	C3sheM2A==;
Received: from localhost ([::1]:64214 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hshbE-0018BM-80; Wed, 31 Jul 2019 05:56:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22610) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hshb8-0018BF-FT
 for samba-technical@lists.samba.org; Wed, 31 Jul 2019 05:56:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:To:From:CC;
 bh=UZwoylVIRxIGv/2kshYhZklSvN3lrN6c+1x5mN49294=; b=KwgmzDynMMgztTtjyWcwyGpgLJ
 A9rT89b83L+0BbDTy6Dme6MJ6dvZYBzJEJuotse3RLnRhQTU9aaOuK+SF/E+QXeZn6+CPXIEDeU1O
 Hqq3pgEJqjLxEzO5BfiPVP9q1NXlOyweSqI+z/cAYjG86ZvaTGC0dItPU0SHfl4PD5Ss=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hshb6-0002sw-Jy; Wed, 31 Jul 2019 05:56:24 +0000
To: samba-technical@lists.samba.org, Andrew Bartlett <abartlet@samba.org>
Subject: Re: Require GnuTLS 3.4.7 for Samba 4.12 in March 2020?
Date: Wed, 31 Jul 2019 07:56:23 +0200
Message-ID: <11267207.3DhDtICzHl@magrathea.fritz.box>
In-Reply-To: <1564547155.4261.48.camel@samba.org>
References: <1564547155.4261.48.camel@samba.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wednesday, July 31, 2019 6:25:55 AM CEST Andrew Bartlett via samba-
technical wrote:
> I'm reviewing "Use GnuTLS AES ciphers if supported by the installed
> GnuTLS version" for Andreas.
> 
> https://gitlab.com/samba-team/samba/merge_requests/669
> 
> The one thing I really don't like is the #ifdef on HAVE_GNUTLS_AEAD.  I
> would prefer we just chose to rely on GnuTLS. [1]
> 
> Duplicated code is bad, duplicated crypto code is particularly bad and
> I would really like to remove our existing duplicates rather than add
> more.  
> 
> Not only are we short on maintainece resources, we would also need to
> restructure our testuite to force a non-GnuTLS build to ensure we
> actually test this at all.
> 
> In doing so I know many folks really like running current Samba (both
> as an AD DC and fileserver) on older enterprise distributions.
> 
> In this case, RHEL 8, Ubuntu 16.04 and current debian stable
> all have GnuTLS versions later than 3.4.7.

Also SLE15 offers newer GnuTLS via an update.

Also note that the older the distro the more likely it is that there is no 
python3 available. RHEL7 will have to stick to 4.10 as it is the last version 
supporting python2.

That you can build a newer Samba version with python3 support is only possible 
because of EPEL7 repositories. I'm not sure something like that is offered.


Cheers,


	Andreas


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



