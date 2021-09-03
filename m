Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3273B3FF931
	for <lists+samba-technical@lfdr.de>; Fri,  3 Sep 2021 06:01:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=cf+mfKZ3NE7IjJz7GWwPxVHLuBy3kg7F1hELMfQWwjI=; b=zXFgRzxzwL/UiFGvgdavFLdFZu
	M2Jsv4Yhmc5GIcAWYjmUJNg31ZLB40LPipQ2eUk36qUcr50cC1qEIGalzCKmoQ9YKmM3jNlBT7r9c
	FG0x1SJh8p+u//itnqyPUpJBPrsFdpPLzW4LFScv3Sydo4Lg3292flzKdmGeqQfIzxuiRJf0gNVCA
	/RacA9sXKvolJD+oZtUmtd7sUiyPJUt2G1KQdejlDB2BQc0rzAn0p0AO+5hNq9EMrANzcKwA0EdUn
	zIfMeQgxYSMDB0Rj25m2SWVz8mTMZWa2T+inolNIjZSBUWj3KlEznHrZsCO1ENVYoeF85b8vZ/LGV
	pFMG9Ryw==;
Received: from ip6-localhost ([::1]:60912 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mM0Np-00CtPR-Pg; Fri, 03 Sep 2021 04:00:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57262) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mM0Nk-00CtPI-FI
 for samba-technical@lists.samba.org; Fri, 03 Sep 2021 04:00:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=cf+mfKZ3NE7IjJz7GWwPxVHLuBy3kg7F1hELMfQWwjI=; b=rAwwh2MmG5qR5pFxouu0/l7ts6
 lZsZCzr+JmMvD0+rdXv+1FLUUMIX0hkfoHm80n6A83299Dw1PybS840H4imCP94RkV/4vp/mKQ5oF
 eVPoSr2ffvEHrF6SOGrdrG0NfMlKq9IUds9fJOE3qgd2sBmu9CUyB/QSaeFI48zRAFXwZCQdVVFI1
 VWajUBrKexREHotcC0YYObpz9AQ5uDFPOu5H9B+M6R7192jGuTpohPkBaypcRhHZSEioeWnvHvK9U
 Jqm7DnkB3hse3G5d49xFxvai80DeY14kFVQw+Lk89vQGf5JF1MJqrMEJ9sU6I6DtAYwcfBWzL3ndt
 0JpGwRixDYoEWuZUYqbLoz2Y4aHJvptzmg9pRxGF9pevds0YuCw0rO/u3WJTRDvuq85osukGUAvSx
 UlNcWhusjevK7xMZ7DjGJPcSLlRp9nc1haDg91EjabdbV1LHrWexJotGGybrXqlevPbcSOXQFamFl
 W726ddb09UP+o3JP5Nfv6lag;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mM0Nh-004MnA-WC; Fri, 03 Sep 2021 04:00:46 +0000
Message-ID: <1325f3bc09eede86bf18dfd7c4af26776d6048ac.camel@samba.org>
Subject: Re: New developer - CI build failure in /usr/include/gpg-error.h -
 can't read, not connected with patch at all!
To: Matt Grant <matt@mattgrant.net.nz>, samba-technical@lists.samba.org
Date: Fri, 03 Sep 2021 16:00:41 +1200
In-Reply-To: <457c64e2-32b4-2de9-7c63-99583d679942@mattgrant.net.nz>
References: <457c64e2-32b4-2de9-7c63-99583d679942@mattgrant.net.nz>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2021-09-03 at 15:51 +1200, Matt Grant via samba-technical
wrote:
> Hi!
> 
> 
> In Merge request 2146, CI pipeline #364432341,  had this unexplained
> failure:
> 
> Processing file third_party/socket_wrapper/socket_wrapper.c
> Processing file third_party/uid_wrapper/uid_wrapper.c
> _*genhtml: ERROR: cannot read /usr/include/gpg-error.h*_
> Processing file /usr/include/stdlib.h
> Processing file /usr/include/netdb.h
> Processing file /usr/include/pthread.h
> Processing file /usr/include/grp.h
> Processing file /usr/include/gpg-error.h
> section_end:1630640126:step_script
> [0Ksection_start:1630640126:cleanup_file_variables
> [0K[0K[36;1mCleaning up file based variables[0;m[0;m
> section_end:1630640126:cleanup_file_variables
> [0K[31;1mERROR: Job failed: exit code 1[0;m
> 
> What gives please?  The patch for the dns forwarder port has nothing
> to
> do with this header file, every thing compiles for me, and the
> dns_forwarder tests run fine on my Dev environment.

This looks like you are somehow attempting a code coverage build.

The issue is that GitLab has helpfully copied he CI/CD configuration
file setting from:
https://gitlab.com/samba-team/samba/-/settings/ci_cd
to
https://gitlab.com/grantma/samba/-/settings/ci_cd

Set the CI/CD configuration file back to nothing or if that doesn't
work, '.gitlab-ci.yml'.

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


