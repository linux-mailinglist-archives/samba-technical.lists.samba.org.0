Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DB545FC94
	for <lists+samba-technical@lfdr.de>; Sat, 27 Nov 2021 05:48:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=RvtdZ1uv+Vfm84h3jTyY/XTmYMS1iSS5AIwpjwnoZv8=; b=kwK3cYuQPslR0QIadX3FqPffEx
	oDvSkA/i0kxxr8TA5YzlySU8+QfHxXga0Ix2EZybUGC72EXRAgdk8y0Z8vCUVddAAgxkiJizSU0jy
	JO4no7zT884OiT0d7UKtz0o3h9RjNk2Vk40NPAWS+lpxUgtcudTWmnEecX75rYeYtKAB+Wov+KScz
	83o40Vb4f/Lnp+s16VxFGEaLY0lcOTiQvZjBmJ5hOL1IbtDof0UDju3/nGDjg7YmJytFRJDr80rXD
	SMAlbNgKIrNGzCoN+RDhsJKpPp61/pajhv/i/Ka9K+vwnbbW/kqPgsJne6xxveKYFfuOtYzXaTrpk
	nojKCxGQ==;
Received: from ip6-localhost ([::1]:29390 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mqpcu-0057Ef-6N; Sat, 27 Nov 2021 04:47:52 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76]:58141) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mqpcn-0057EW-HW
 for samba-technical@lists.samba.org; Sat, 27 Nov 2021 04:47:48 +0000
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4J1JXz2d7Tz4xbs;
 Sat, 27 Nov 2021 15:29:23 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J1JXz1D3Lz4xbC;
 Sat, 27 Nov 2021 15:29:22 +1100 (AEDT)
Message-ID: <fdea1346054342bfd3221da902e68044bcc934f3.camel@samba.org>
Subject: Re: 4.15.3 release date please
To: Matt Grant <matt@mattgrant.net.nz>, samba-technical
 <samba-technical@lists.samba.org>
Date: Sat, 27 Nov 2021 17:29:22 +1300
In-Reply-To: <CAHA-KoPW_vf-fg45gMWD4poPLYr0jap8rW+73jB5Xu80jKpsgA@mail.gmail.com>
References: <CAHA-KoPW_vf-fg45gMWD4poPLYr0jap8rW+73jB5Xu80jKpsgA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, 2021-11-27 at 16:40 +1300, Matt Grant via samba-technical
wrote:
> Hi!
> 
> Could someone please tell me when this is due?
> 
>  Want to roll out a patch at work, but 4.15.2 seemed rushed, with
> regressions, and don't want to break my employers mission critical Samba
> servers at this point.

Kia Ora Matt,

Your employers mission critical servers should be patched to 4.15.2 or
another of our security releases, otherwise effectively you have
promoted all users to 'domain administrator'.

As to the releases being rushed/regressions, we are only aware of
issues around the deliberate change to nsswitch name lookups in the
minority case where Samba is in a AD Domain but nss_winbind is not in
used (rare and previously untested, we added tests it tuns out not
enough tests) or when in MIT realm (incredibly rare, and untested). 

This deliberate change was required to address the security issue, but
we continue to seek to minimise the impact.

Given the scope of issues addressed in 4.15.3, I'm incredibly proud of
the low rate of reported regressions so far.

However, be advised that per
https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.15
Wednesday, December 8 2021 - Planned release date for Samba 4.15.3.

Andrew Bartlett

-- 
Andrew Bartlett (he/him)        https://samba.org/~abartlet/
Samba Team Member (since 2001)  https://samba.org
Samba Developer, Catalyst IT    https://catalyst.net.nz/services/samba



