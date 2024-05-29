Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEC68D297A
	for <lists+samba-technical@lfdr.de>; Wed, 29 May 2024 02:38:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=r5DecbpQdDns0VpZIVdj9VGCBOuSTPj6bCPhbDVZ6cY=; b=cCNOidX8KosMG9QWjRqOnNUeYg
	QQ+i1swhaisI9A0A3JISxRmExnNbAoIrLJObhJqLxGUqXLOH9hQ61MjnBaexDTDe9G0ajZNNBBsMo
	u/s+J/Td8Ay1ZLeSgO7iAh6bft1Q13t/sZTOHRdSswsVgHqC4Ds9WH+Ez5+bBol5ZX7GLd0TNgDTu
	3Pq9eWOSASl+kTM2tvr6IyoIuZwHQD+nB6Zun0opd2pJqARmRryHtajOVhOvkKD8CWOQtTCq3RHqV
	HMfdzT0YYuTwVmSb5emi5M95lgT/g0T4hibJxzZHLuB/ARrA0mn3uAmV1VrmKw/pxlUd3VHwJT9iy
	3N8aoMmg==;
Received: from ip6-localhost ([::1]:31054 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sC7Jn-00AC5A-FS; Wed, 29 May 2024 00:37:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28754) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sC7Jh-00AC53-Qa
 for samba-technical@lists.samba.org; Wed, 29 May 2024 00:37:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=0bhwDkF8jDD1+CpCKIWD7MAOdGoqaQREurrlmfHp7V8=; b=g9ldgHVuJQj7uuFrBs2TZIW/uX
 g/2WcxVSr4PNeAgL+lJVa1UoN7IYWEQInyYW8Bny4VI7gnbr/4kHMF4LGeKMn/H2UxmWiKK1RkZzD
 7veZ9splkk6QsX0zaLeqEaJTsPKsTKrY/vScwA2JIQTbayr5vwFX8WoSgt66lOmDczARSZ7KQUg7C
 pX0M6stcnxtCYWSCGt9sQICEouWLf3Oa7YXpmHDY4dV4u36Mop3IWtjO7HYsokHkyeiRV02ZFH7mS
 hAYow9IqPxmpWQsvT5xOCXyYroqku+uReZNgi2UpZgYvTWyOpPFoWm9J7re1yUyGZpgM3UXG/5MPN
 OZ8VBqPPjX5G7vJ/7h6wU/O54/YIMPVeH3HJwJ6Ra3vB9LUqZjSDj0bvkrFa284Hq4jDTtNgnjqoD
 6nvxsQin5DCcsBV50gACEO6NxDs6Jf/OUMd33NenFH71Us/wwheEnQCtxJVseH7Br6hnQyrATUC+m
 mRY3yr2FILqMo/YZNjV7MSgX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sC7Jg-00Di4Y-1j; Wed, 29 May 2024 00:37:21 +0000
Message-ID: <be1bfa58a29fa70397c709735d38ffe266b1c197.camel@samba.org>
Subject: Re: Fwd: Regression: ldb performance with indexes
To: Andreas Schneider <asn@samba.org>
Date: Wed, 29 May 2024 12:37:17 +1200
In-Reply-To: <5597028.rdbgypaU67@magrathea>
References: <4856178.OV4Wx5bFTl@magrathea> <2262962.t9SDvczpPo@magrathea>
 <2090201.YKUYFuaPT4@magrathea> <5597028.rdbgypaU67@magrathea>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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

On Tue, 2024-05-28 at 13:56 +0200, Andreas Schneider via samba-
technical wrote:
> On Tuesday, 14 May 2024 16:31:53 GMT+2 Andreas Schneider via samba-
> technical wrote:
> > > Using a red black tree doesn't solve the issue:
> > > $ bash repro_dev_ldb.sh 10000 indexesRED BLACK TREERED BLACK
> > > TREERED BLACK TREEAdded 2 records successfullyRED BLACK TREEAdded
> > > 10000 records successfully
> > > real    0m9.299suser    0m9.212ssys     0m0.263s
> > > https://git.samba.org/?p=asn/samba.git;a=shortlog;h=refs/heads/asn-ldb
> > 
> > The thing is that those subtrees have 4 entries, with 10000 entries
> > we walk4x10000 so 40000.
> > This needs to be optimized. As dbwrap_rbt is similar to tdb we
> > share thesame problems. Those could be removed if a real rbtree is
> > used.
> > So someone with more ldb knowlege should look into this. I dunno if
> > wealways need all those 4 entries and are then overwriting stuff or
> > if wealways traverse those 4 entries but don't have too if we found
> > the one weneed.
> > With two rbtrees we could just push nodes from one tree to another.
> > It isjust pointer that should be fast. Allocating memory and
> > traversing isprobably what makes it so extremely slow.
> 
> Andrew,
> any comments?

I haven't looked into this all, my focus has been on trying to finish
some other work.
Sorry,
Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead                https://catalyst.net.nz/services/sambaCatalyst.Net Ltd
Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company
Samba Development and Support: https://catalyst.net.nz/services/samba
Catalyst IT - Expert Open Source Solutions
