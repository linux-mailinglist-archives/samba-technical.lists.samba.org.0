Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 976D11FA4ED
	for <lists+samba-technical@lfdr.de>; Tue, 16 Jun 2020 02:12:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=gvU9NgwqUSAyITcGDVyLMJidjZd/lTxWiDgmyFh6+3s=; b=cGsJYmxlHiuVtgrHCYr4HKxY3N
	7BC/t5p+XyX0TFwS5r4yxRZrVp5g9Apoxv5Q3HDW4oQW/2woRUS7p4jggDjTrjUEcbetnRGUu/6p1
	ZS/KvaLC/+FZQsoVOHthLCVcjxxO9c34MwlblO98UggIyppwx3Xna5LknJBNk1yE2KF3xTY5K7/QN
	rDEi8U/roVv07w40yA3Wctus0PSHhrxSO0EsBnJBGzk/rSaMHCSHwWEdSQTgbD+zavyO2agsyvdR7
	VADKG+yECChBhqHMPfYipaUb3fxi+1xULrUENza9zLe+bdLIvcf8FAm2kEC8Qh23Pg2FE1BLU6Kkh
	61YFQrbw==;
Received: from localhost ([::1]:54870 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jkzD2-000YN7-U6; Tue, 16 Jun 2020 00:12:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62140) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jkzCv-000YMw-68; Tue, 16 Jun 2020 00:12:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=gvU9NgwqUSAyITcGDVyLMJidjZd/lTxWiDgmyFh6+3s=; b=25UZ8mFaMMe0M4kq/y3mPV0Xa4
 B68/N4J68HsBSLR0vv+pr8SBmKH3P9tv0JwJEEEBxhRb6WQZJswu2Dd7Estp8IGL5YhJWutCQeZR2
 PEMqQIFw5jgvdxukF4sTLv29dD01t0cEXQN5Dk6gYy01wXO4+GTeDYroL/do0NBV6HPExZ9o6Yshm
 gYD2oxgWVFLyTP5+LRtFUawdiOKULBs57Ck7hW5xsJTBQ6uQkqKLZRGKq9K/EAT+X3QrUpKFTJeEj
 V5uWVtUjtnI9904BZh6idMCLZ6uVhzu8ysDUbR/1OwBZu2AePIP3bqHxnYyR5fNIBw8edAC1L/djZ
 l6BwWFHx1aNZeBAPhuYONlv7omVX2H1z6q5rUZXy/DIL969XVtE6nPivMVxbfbSYmvwHpVAG9uhWA
 5uUkxchnbFUu7diPxJ0p2WZct1FTBPXjtNvaWHYMHq2lMlkMnbAGkeGehh8cepsNeBbyL6xpzWtRt
 ZDZs4QQsCqS/e5Gl8zboUBU3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jkzCt-0006of-Ug; Tue, 16 Jun 2020 00:12:04 +0000
Date: Mon, 15 Jun 2020 17:11:57 -0700
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: deprecate pdb_ldap and "NT4-like" domains in Samba 4.13 to allow
 removal for Samba 4.14 in March 2021?
Message-ID: <20200616001157.GQ3711@jeremy-acer>
References: <d48e22dab11b2cc72cd1e402730814a506e7c363.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d48e22dab11b2cc72cd1e402730814a506e7c363.camel@samba.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba@lists.samba.org,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jun 16, 2020 at 12:04:19PM +1200, Andrew Bartlett via samba-technical wrote:
> With all the recent talk about ldap stacks, I wondered if we could
> discuss deprecating and eventually removing pdb_ldap?
> 
> The reason is that pdb_ldap is primary user of smbldap.  smbldap is in
> turn yet another of our ldap stacks (I have found four so far), in the
> sense that while it uses OpenLDAP under the hood, it replicates with
> libads, ldb and tldap the 'get AD-thing out of an LDAP reply' part.
> 
> I've huffed and puffed about so much over the past little while that
> sometimes it isn't clear what I'm really most frustrated by, but it
> comes down to:
>  - number of LDAP ASN.1 parsers
> and in particular
>  - number of incompatible stacks (structures and helpers) above those
> parsers
> 
> For example, these functions all do the same concept:
>  - smbldap_get_single_attribute
>  - tldap_talloc_single_attribute
>  - ads_pull_string
>  - ldb_msg_find_attr_as_string
> 
> We likewise have the client-side handling for paged searches in:
>  - ldb (paged_searches module)
>  - libads/ldap.c
>  - lib/smbldap.c
>  - tldap
> 
> Of the two, I (perhaps strangely) actually care most about the upper
> 'helper' layer, because it is in this that we encode Samba and AD style
> LDAP on top of LDAP.  If you look around the functions I list there you
> see so much borrowed, but never made common between them.
> 
> -
> 
> The extensive smbldap layer, largely in duplicate with the others, is
> provided for pdb_ldap (and the pdb_nds for Netware, remember that?),
> net sam (for pdb_ldap installations), idmap_ldap and idmap_rfc2307.
> 
> While it would hit a significant number of large and legacy sites that
> still have not made the move the AD, but I wondered if we could
> deprecate pdb_ldap?  
> 
> pdb_ldap has never been automatically tested, and is primarily in
> support of NT4-like domains (which we should deprecate at the same
> time, for consistency).
> 
> Merge work is hard, particularly when the users are untested.  Removing
> smbldap would reduce by one the number of LDAP stacks, and allow us to
> focus on finding a common way forward for ldb, tldap and libads without
> needing to accommodate smbldap as well (presuming that the idmap
> modules can be migrated). 
> 
> What do folks think, can we move on from these features in 2021?
> 
> (To be clear, we won't break stuff actually needed by FreeIPA, but
> individual codepaths might only be available to FreeIPA in some future
> release, or be only in selftest like the NTVFS file server, or be
> passed over the the FreeIPA side of the fence entirely).

Thanks for bringing this up Andrew. I would love to be
able to remove pdb_ldap and pdb_nds. They are legacy
connections from a time (NT-PDCs) that has long since
gone.

Even if we don't immediately remove the code, marking
them as deprecated should help put people on notice
that we don't have the resources to keep maintaining
these things forever.

So a big +1 from me.

Cheers,

	Jeremy.

