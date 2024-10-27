Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C41EC9B1C20
	for <lists+samba-technical@lfdr.de>; Sun, 27 Oct 2024 05:24:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=5VvBhQHDz5AH5btC/72ChiEvV+o89Kf9B/kkYbuzxg0=; b=cdzE48gdowcYcH5ZO4PjETYi3w
	pjwV838FHpx6cGJKaOnMr1kFcw/YGKfzMz7HQcZC6P42IXv3sAHTDdvZLTwwaXvs+kF+ZQVfQwHCF
	2Sz1uINUc2Z0d365RvzxIu74PCYCH0PQ4lKB64kSpAu+KUVgle75GpCqiPt0erG4qp0Bhb49+5egy
	5sf3W0Vp77g/IlbnhJtQKVxnxFdrGRHXKJ3JHgNpjc73TcneT1trjjQgdl0fXCD46jLSgqxkkEHtS
	wMi57CO1r3i+eELy8Z/CLYuKQtnF5O6xS95iDJxVW7tVwBi/3Mud776UYOHqw5FKjkb6P5CwObvt7
	zu/x7M0w==;
Received: from ip6-localhost ([::1]:57454 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t4uoo-0058ld-8j; Sun, 27 Oct 2024 04:23:58 +0000
Received: from cat-porwal-prod-mail11.catalyst.net.nz ([202.49.243.52]:41784) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t4uof-0058lW-HD
 for samba-technical@lists.samba.org; Sun, 27 Oct 2024 04:23:55 +0000
Received: from [192.168.1.219] (unknown [114.23.142.188])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail11.catalyst.net.nz (Postfix) with ESMTPSA id A6868AB;
 Sun, 27 Oct 2024 17:05:16 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=catalyst.net.nz;
 s=default; t=1730001916;
 bh=Y//Tl7NxYcNUawSxfcDERSXuVvMJ/SpSSSDwoyJyH/U=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=uv7qLNOnfsL/zK1njQFJJlF0to1IFCc5YntLxPqUYzBc/0JtR2k3tVNDbA9Ga3VoI
 UZb1WCoXmIjYQ6TyulgQqsYjOjWvS0lQ8PgRe9d1anris6sUxMOugwQNmb2dGq+EU0
 avXkWqgWK7egKzzDTZpvfbFjMUrhj11s6cFBys0csb02bkKppvGe6Te1B1Xmwvqk2j
 X+QzITfcu+0x5F0vB6zGjJbAcb64k/OGTv5GPBurMTE8SEt6AWNM2g+lOqXpv8eaza
 +Bte6KKPz6LsUvBwQ5c/lm5cWdl791pcGujBvqicJz9xD4dOPzZ+SjYM17ZfobylNq
 w3GdpXAchNxPw==
Message-ID: <1de670f9-1d63-4d96-929a-c1157f37fe3a@catalyst.net.nz>
Date: Sun, 27 Oct 2024 17:05:15 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: python crypt library in python/samba/tests/password_hash.py
To: Michael Tokarev <mjt@tls.msk.ru>,
 samba-technical <samba-technical@lists.samba.org>
References: <4911a1d9-346c-4099-ba02-a0f5e70ed3d1@tls.msk.ru>
Content-Language: en-NZ
In-Reply-To: <4911a1d9-346c-4099-ba02-a0f5e70ed3d1@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 26/10/24 19:32, Michael Tokarev via samba-technical wrote:
> Hi!
> 
> Samba password tests uses python crypt library.  However, this library has
> been removed in python 3.13, so these tests don't work anymore - see
> https://docs.python.org/3/whatsnew/3.13.html#whatsnew313-pep594 for
> details.  There are several alternatives listed there as possible
> replacements.
> 
> Can we get rid of this module usage?

Yes. A bugzilla bug would facilitate backports.

A merge request is welcome too of course.

It looks to me like we only use sha256 and sha512, and if crypt
'rounds' works as I think it does, we can do this with hashlib.

Thanks for pointing this out.

Douglas


