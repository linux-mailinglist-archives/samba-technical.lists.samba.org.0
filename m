Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 179924B147A
	for <lists+samba-technical@lfdr.de>; Thu, 10 Feb 2022 18:44:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=QSrsKNFQN27xEcB+pwv/vqtk2D5TPyH4qQLBWPazTo0=; b=h9yOtgxRSTuyHsRFPu5tluCayd
	wzV0b5oT++JTZIbXfZojt6s6B5/szFiiUzTYAqgV7vMx+aHVd4v3YWPXbFEVqWwv5SQ7zg3HyYkc5
	Xt/gD/391NFwodLKjWH3q+nj4KmPqYSbWbiQ6yGVYWrXtF6WoFMwDBW5J4gpp9Y6/PKb6RiRqh8Lq
	z4q1u8HecOCYGttNrhtv2BrrIhiqP3hyIgV5C55V1hKm4cDAFewenjYenyV5yA1ATsOP33ouAPEHB
	yCm37nIAS/7C5vxZaYRpUhupUkOxUUyWpPQC60Yd7Kn7j6tgRxdmF3ZjSnGWQRk7GnLXSEMm61B7V
	OZYIxf8A==;
Received: from ip6-localhost ([::1]:55304 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nIDTq-006Jof-0H; Thu, 10 Feb 2022 17:43:42 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48844) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nIDTh-006Jo5-4v; Thu, 10 Feb 2022 17:43:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=QSrsKNFQN27xEcB+pwv/vqtk2D5TPyH4qQLBWPazTo0=; b=yQbVCpxx+C25EgCA1BglFiIeUX
 iprbveWhuUU1nBhejbX9J7p0OXraY9gNnJAvfi54GPhNxvgClTP64wWewhVjDzJjEe2M+lTiTF3dV
 urcIHpr/q8P2XZ5FD5+0IKoBCozHSvhkcNlSm4ExB7xHP5+HdUE5ejfPQ50deLp6IkCJOTO/qwCWm
 WkPJ5wlP0flKVSoMDWsddJtnbGvRRfjqCTer8MhPWibvUltsYOUBEA5VN9PRcCFGmo+US3z1QK/G4
 4kvRw6aL+zSNE8uUuU5Mgj49umiD7YVqfy79R+aC9zUtu2JFaTXCx09ZbHllpCKVX6ueKcTwaw+LW
 rdmpDXV+ed67G37ZbvFIj/HlOeQCkpa+tHd9sq4A4dgJLwjM0LmD+dK8FqkDIr9nYkf3o9+OUlhO7
 t+Zc4/bJhZwVEhn+9cZQXvJqi3ktN+kbLzrgC9x1tTyxVY/4ClF2CuWH7lBm22YUKwqeh397N9iCM
 8bAd7srsjE6m34oUv/uhGRxn;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nIDTf-0038SI-VT; Thu, 10 Feb 2022 17:43:32 +0000
Date: Thu, 10 Feb 2022 09:43:27 -0800
To: samba@lists.samba.org, samba-technical@lists.samba.org
Subject: Re: Great article on Samba symlink fixes at Linux Weekly News - Now
 a public link.
Message-ID: <YgVOv7jF+COK7q4c@jeremy-acer>
References: <YgVF9NubyuF37CLN@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YgVF9NubyuF37CLN@jeremy-acer>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Feb 10, 2022 at 09:05:56AM -0800, Jeremy Allison via samba-technical wrote:
>https://lwn.net/Articles/884052/
>
>It's a subscriber-only article for now, but
>lwn opens them up to general readers after
>two weeks. It's worth subscribing to read
>(IMHO of course :-). Full disclosure, I
>reviewed the article for technical accuracy.

Jon Corbet (creator of lwn) just gave me
permission to post a public link, so
here it is for all samba & samba-technical
subscribers.

https://lwn.net/SubscriberLink/884052/15bc73887e122c39/

Thanks so much for your generosity Jon !

If you like this article, please subscribe.
lwn is where I actually *learn* new things
about the Linux kernel and its ecosystem :-).

Cheers,

Jeremy.

