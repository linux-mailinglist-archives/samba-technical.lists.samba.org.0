Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 898D61FAA2A
	for <lists+samba-technical@lfdr.de>; Tue, 16 Jun 2020 09:41:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=sZ6teP2s4M2LiUgE/Mc7USBu365z1qz62QGUyvuUos4=; b=YUhDa0Ggw5cRaaf18QFrQ31jRi
	Tf02LOGrCEVYFhyGNgK+gq+SMVsTN8EitQT+Rcl0nIDeFubjme4tJ6qnkdD+V7rMurnbzJKC5HXsc
	ugxhzbDvIdSvVIVcRJPgu34U9Do7otfsSfh5ihwB7fTgBpRbqg6ah7pNhtzwWSlD7hZrTP+hqHtaK
	04zYMlUzIKqvVtfW4bK68kYjNtbjOer3X95VQFtgfC1hkmlyCJd8vhfuqw2HGzGBHuotGIhsZWhRS
	8cZiBiFlrrpNaQuyyeHvesQDzxt1S/zeJ2feCuRGrggI9zStFM4JJogJUxkcUoBBaTy/3z0kOAX3Z
	nOzzRHcw==;
Received: from localhost ([::1]:60934 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jl6DB-000ahR-RU; Tue, 16 Jun 2020 07:40:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36944) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jl6Cs-000ahK-TL
 for samba-technical@lists.samba.org; Tue, 16 Jun 2020 07:40:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=sZ6teP2s4M2LiUgE/Mc7USBu365z1qz62QGUyvuUos4=; b=HtqTzrZ4scsMH3iKY3tMNPUrE3
 HrcxAKZ56lymUS/3M+fJUXyO2Ujd/E6SLrxtx/ZVaBmvw67bIWotE9tDZL3be//Cxyn1WDUSfgoO0
 0szUBaKbJD0yUQst3u35XWWwHO9HPdKzcpBnDoAB+9fYd1Um9jHxSKXNJrg+XxXGWPboYFvSBdUAn
 /sqhRF+M55QF0ecW3N0C+ziqfLmZ1S35zl2snzxQ3udNTF0WdinPJ3K7fy703zApVumIVUAjelZk6
 nhKW6Msf+LP5j6teqWVcqCtNw0FwMYmfXeqUPQwC0YdSOx4SCO0JhPKamzgzmEHEnNNf3KiMbyvLX
 IpyFeJLOlygri8/RGabLR/obNo5IemGTWtvJKhy+xr0VRhbNj9gAL+DRmuEKVidqVNAwR2Tu3xYMe
 oIAR79xcJ+C76WUkcVxg6unqorXZDTEybwqQzE+l3Y6QJoapHLUFdR0eB9gJb2+an3dg2+YY6aXhl
 Sa8VFC/mDI/Oq89dWrseAlkl;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jl6Cp-0002qX-08
 for samba-technical@lists.samba.org; Tue, 16 Jun 2020 07:40:27 +0000
Subject: Re: deprecate pdb_ldap and "NT4-like" domains in Samba 4.13 to allow
 removal for Samba 4.14 in March 2021?
To: samba-technical@lists.samba.org
References: <d48e22dab11b2cc72cd1e402730814a506e7c363.camel@samba.org>
Message-ID: <2319880e-515a-f909-716c-9f29c19f7d13@samba.org>
Date: Tue, 16 Jun 2020 08:40:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <d48e22dab11b2cc72cd1e402730814a506e7c363.camel@samba.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 16/06/2020 01:04, Andrew Bartlett via samba-technical wrote:
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
>   - number of LDAP ASN.1 parsers
> and in particular
>   - number of incompatible stacks (structures and helpers) above those
> parsers
>
> For example, these functions all do the same concept:
>   - smbldap_get_single_attribute
>   - tldap_talloc_single_attribute
>   - ads_pull_string
>   - ldb_msg_find_attr_as_string
>
> We likewise have the client-side handling for paged searches in:
>   - ldb (paged_searches module)
>   - libads/ldap.c
>   - lib/smbldap.c
>   - tldap
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
>
> Thanks,
>
> Andrew Bartlett
>
Well, after I picked myself up of the floor ;-)

A very huge +1 from myself and as a side note, I noticed that Red Hat 
has sort of beat you to it, smbldap-tools isn't in epel8

Rowland



