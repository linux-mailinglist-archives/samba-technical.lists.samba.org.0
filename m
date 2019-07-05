Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BD060041
	for <lists+samba-technical@lfdr.de>; Fri,  5 Jul 2019 06:45:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=19yBgAoWuQkIb5/VBSPzv6S2nwbkievwhkXcjXvPpNM=; b=FX4+0sDbb9M305/GnOPLPApThB
	2AoN9IOqzFdpN0Qo3+b7lkIv3t8H9sEqnFCSXfKva6JIT2qQqnfwk08GHYisZkLkpsXR90uzk/fOA
	eWPIEiQNIZ4FX7YEHu6xU+dKKelz3yNLD64EqkvDA+385SH7+EECy4EmxuIZa8dqF25emBCfsBCir
	1XMjh1wYSmU31WOxa0Zg2LcdI172DHfG7xOHub4qMOxAX92vbXH5bEFXKeHvAD4aprJJqHC0y7RCw
	FVnUjLtdQSdXHUVeRdmNrYH3oyKw79/XVMJQx+3IoE+3szd8SSeCJpfCBt1Nyi4o1FiX9KVhXdess
	hEb+ij0Q==;
Received: from localhost ([::1]:22966 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hjG5l-005HXy-Bx; Fri, 05 Jul 2019 04:45:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40454) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hjG5g-005HXr-Nk
 for samba-technical@lists.samba.org; Fri, 05 Jul 2019 04:44:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=19yBgAoWuQkIb5/VBSPzv6S2nwbkievwhkXcjXvPpNM=; b=GhJxlZFSQhoNS8MDkCOnJzxqFk
 wtrnl5jZAjoj8ke3pP8PHwOVl/n624Wh0K4m7Lc58XVOSyLCaC2yhsUP8bsyUnsw6brA3agOS6rYc
 lz0w+3j2f3XP9EKrfjvlaqAAqdI3Dbck3s5e5OjkarTzwJZe4ezWhOCEW0XwqOoeySd4=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hjG5f-0001r2-F6; Fri, 05 Jul 2019 04:44:56 +0000
Message-ID: <1562301892.12681.43.camel@samba.org>
Subject: Re: [PATCH] WHATSNEW: Add CTDB updates for 4.11
To: Martin Schwenke <martin@meltin.net>, Samba Technical
 <samba-technical@lists.samba.org>
Date: Fri, 05 Jul 2019 16:44:52 +1200
In-Reply-To: <20190705141436.6dada72f@martins.ozlabs.org>
References: <20190705141436.6dada72f@martins.ozlabs.org>
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAIAAADYYG7QAAAAA3NCSVQICAjb4U/gAAACRklEQVRYw81YS67DIAwkVe8FPRm5menJeAu3lmUCbyBGKqsmRXjwb8Y5aq3hl9Yj/Nh6Tu0upZRS+EdKiV+e5+mJqMKLiHLORBRjzDmbc/hlvb1QD2k3sG84+dhhvF6vlzymlNY8dyBJzUdLjAwyvaeU8n6/2WHpu/xDRkREJI8cOBMgfuRQxhj58JzzbBwhQDFGA07M6/efE0MQxDHGFvpdQHy6MUxqtU4yezRcH0B4GfbM44BWGqOurF6Omz140a0ASimJvdbwZT32XrpRh5yuwY1d0vPrdNkv91+T8uBRG8l1uiX+JtsHxPNIWE27ugwTctTdHCIiYXvuy4P7IDl0CxAzl2xgZTJwgw+g3kGaHwYh5g2sljyrjIVEq4pYBg2Kq3yXZ5WxjfO7zF9jRdXrnLcEmlbTRnNpcT0gvpTScUC2HlOE2ipAvPuJanMT+Xc0PC4dFzu1DEO4HgczaS5kOnZ4vM7zxNU+mtRyRVPDgqyX3cdx8AQCCrQnfkV9VzMA9Ryg3ek8Sgsg3QX+nbz03Og5l10ytp6HusQUwpjd1rnsksbHlhjuVGdBAbWzIiJu5MvEFkA6OkiwBO4uQL3ADeQ9b57t74+FBo1s47IqpVxqBDcuQ66r94QQJOH2ctnAf9oZtdbZYejpi2bQEveO0sb2JXu09OJJrnpil4SV5G2N6Y+1QjL+gHSKDApHJoJWF3hW2fInh6lutGW216OPRBZtRZscwyQvI+KuTj3rp4VP1VsAcTobxgDngukqm3LPgmL8A4m377Y5OvTKAAAAAElFTkSuQmCC
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
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

On Fri, 2019-07-05 at 14:14 +1000, Martin Schwenke via samba-technical
wrote:
> Please review and maybe push...
> 
> peace & happiness,
> martin

Probably best to title it

CTDB Changes
============

I've kind of changed the heading structure this year because there were
so many sub-tasks under the 100,000 user AD thing, so we don't want
this to seem part of that.

Otherwise looks good.

Reviewed-by: Andrew Bartlett <abartlet@samba.org>

-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba





