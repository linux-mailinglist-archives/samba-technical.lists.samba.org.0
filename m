Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DA32961AD
	for <lists+samba-technical@lfdr.de>; Thu, 22 Oct 2020 17:27:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Lp6r2s+VhhUxhxNNCSEbzeOwMkYXWmHV+4TX/3Lawow=; b=AUR7y9fqYpbwbdrXa9niClhHrM
	/dOcK/DyOMhiIePKglSnj7jd6CHfSQTHrSeN/saqLy6HPuGWuF8ZDQ0Suph822TA0lQHPhig9r6NR
	4U0ook1RVyFM7IrLBA7FhBcC3KD5yy1Id3eA3AO32v1lJ3J02UssuhcoIvqdkapw2OQwoo5FvDE4X
	VpwpmvRUfujIwqjD4a9dvWB6k/papJRTqqJdPZxgPLCNjyNBRZjh/BGxFY/wqydLZmTFk8ML+N0ZQ
	HTe+pzeAGf6qX3+aQoU4GTlhAsQJHgNJPhjFlcc3iFCcsWpgoCr0qZEdagwb7a3k+iw5Sv+yHqfKH
	RcTOtCGA==;
Received: from ip6-localhost ([::1]:60494 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kVcUX-00DInB-AA; Thu, 22 Oct 2020 15:27:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51556) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVcUR-00DIn4-Oc
 for samba-technical@lists.samba.org; Thu, 22 Oct 2020 15:26:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=Lp6r2s+VhhUxhxNNCSEbzeOwMkYXWmHV+4TX/3Lawow=; b=TbkOqv4A7KsvQkSViM6QoWJ3DK
 +r7wTB/5vZ9zmdzDHRJVw1zGgycMKHICBXO2fSF0EqjWKjpzRKHJuL/gHeeTUv2nubmyug1w+O6ri
 Vsp9RCpqc4/c4eW119HqKsOt/SQVNBRwkmbWxPGuDyi6jNqPH2zWWnGFV2j8dvcS3RSEahZ4URm0v
 T2HaHYSNxR64JYsGyx7seYhSbd2eZaIheeLdgmjrOnvGc7zbYUsOSqnuXiUyR8Wy7gu5X1CgBnWCy
 AEVXv5B+9Z1LrUNUZ0W+xHy4JV81K6oSpX1tdVN75Anbf+WFVENTUnrUXMij67Q7SXxOb1zMBhIvp
 tfRJHiWSUFVbdEc/fU7jecxjsRVHqbxJ7dzgo+OO+YpAmeOZq/vLCTHi5TesZGoyAbaLlAYLDH9BD
 mFqNs/lfNVhATFOrwp7PKP8hhJnlISQohkgRZNEvAdUrbfGyd1g7DpP5u32qUuiZHNr/8q3qAoYmm
 iLnZfk4dambXhmP8eiixPEwP;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVcUL-0003Ts-84; Thu, 22 Oct 2020 15:26:49 +0000
Date: Thu, 22 Oct 2020 08:26:45 -0700
To: Ralph Boehme <slow@samba.org>
Subject: Re: talloc: Other minor issues/queries
Message-ID: <20201022152645.GA941511@jeremy-acer>
References: <3A50457D-74F6-4C7B-BC2E-8EA68EE64C61@freeradius.org>
 <20201021001113.GA754426@jeremy-acer>
 <264F0B23-F45D-49F3-A0B7-4E717B129898@freeradius.org>
 <20201021183701.GA809738@jeremy-acer>
 <8E5EC9FB-62C2-4BA7-B809-72F26FEF2CD1@freeradius.org>
 <20201022010855.GA853779@jeremy-acer>
 <dbf19314-7d9e-76d1-cdb7-116148e91c34@samba.org>
 <4134ee06-d420-bc29-fd88-78550fa5d23a@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4134ee06-d420-bc29-fd88-78550fa5d23a@samba.org>
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
Cc: Stefan Metzmacher <metze@samba.org>, samba-technical@lists.samba.org,
 Arran Cudbard-Bell <a.cudbardb@freeradius.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Oct 22, 2020 at 11:31:33AM +0200, Ralph Boehme wrote:
> Am 10/22/20 um 10:57 AM schrieb Stefan Metzmacher via samba-technical:
> > Maybe we could abstract the low level allocation (malloc,realloc,free) in talloc and just
> > implement the other allocation schemes below the main talloc logic.
> > 
> > In order to be able to handle much higher IOPS in our SMB server, we need to find ways
> > to optimize our talloc/tevent_req handling.
> > 
> > These are some ideas, but it will be a long road to get there, so I guess we need to
> > find incremental mini steps...
> 
> stuffin all this extra stuff into talloc() is going to make to add a lot
> of extra complexity that we'll have to maintain in the future as a team
> and ideally not just you, Jeremy and Volker. Therefor I'm asking to
> please carefully consider if this is worth it.

Well my current goal is to reduce the complexity by
removing the memlimit stuff, and adding a flag to
stop a talloc_pool being able to expand out into
memory outside the pool.

Those are the two initial proposals on the table
IMHO and the complexity removed by getting rid
of memlimit more than makes up for the small extra
complexity by adding the talloc_pool flag.

The rest is "blue-sky" thinking IMHO :-).

Are you on board with the first two steps Ralph ?

The other stuff comes later (if at all :-).

Jeremy.

