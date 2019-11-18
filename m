Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E40100CFF
	for <lists+samba-technical@lfdr.de>; Mon, 18 Nov 2019 21:19:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=vyAcD7x6q5dAXH65GItk8iLTMT05P03f6f/pvBvTP4U=; b=vq/UxL2ZoVFQP87V5ET0exjQPc
	+hVwebl97tkppXEQ67MzWjejON8U62KPgzGGWopxXkTu1tgdtbIFvBg3lAX5wyJ+e7b2Uv/2T49kP
	NG+ywvc0mZ7uOGH5pGUNuC+htF5N7D1TVj/BF+I07irbAkjnH0OiE37E/dR5hQtNwC5G22f0aeuu2
	AznmjB8odFWBE0lqEyaP3E3X4f38nyNWXviKhLRaU4WB3Ed9N6yhvaL7JFr39T1XnpCMAjOUSDuZ9
	Asni89fl55SOYFJRz8SXZ/uppyOhB976k5XGN21F5tkbxYOEHmzxIlgKLdsH7YssPKbiXwEzaV0tb
	H8hw0h7Q==;
Received: from localhost ([::1]:53590 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iWnTe-001ZxT-86; Mon, 18 Nov 2019 20:18:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40260) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iWnTa-001ZwZ-Au
 for samba-technical@lists.samba.org; Mon, 18 Nov 2019 20:18:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=vyAcD7x6q5dAXH65GItk8iLTMT05P03f6f/pvBvTP4U=; b=E8YmJlrPJe/Rr97aJ4Wrm0BDK+
 Sm+9BoAvgP+aipbBalp0uuV56jdMwi+0y4W+oDsgr9bVoEdLsrGOa+NWR7g2ygkoY1uHTQdvPRSfN
 Mkp64eaYKDHtsOuNFlj0BKx6IywLo36+xz0JtHt0/dVJ3MM7QlXjX191Iy70OGFaiV6QRpx9j92V8
 5wp886omaKVKvokXC4aHK+3Q+AkCqb9BCD4ytQEsNgsaj7YXGLtMln8VrenV492AsvN/Y4WbKV14s
 hvKnOjneJniQgeAFH0RUH1pvoFDSDm8r19RahgM2Q96Vu1tcrVeBsaaobo/c8dKTXn6mfbNSungUF
 YlQG7WRGt94WglyltS6SmMCUAC+6ac0U/p8ZQwybpia6P5rgmrQ4We2Jmz2BBHB9atEA3D4OcxJeH
 BFxK+OKDt7MjNlqW04c0yGteX8FmYK75zedtx4awF/koLOz+lY+PbfyYVR88v33fItQ+djjTlFMTG
 N0WkQMg9h9NGFUIVkco3pS+G;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iWnTY-0004qo-Uq; Mon, 18 Nov 2019 20:18:21 +0000
Subject: Re: library versioning
To: Stefan Metzmacher <metze@samba.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Andreas Schneider <asn@samba.org>
References: <4008ac5d-ec0c-c184-f5c9-731987718f8a@samba.org>
 <50203bef-dce2-39a5-0b1d-7e47a10a6a8a@samba.org>
Message-ID: <905e8409-9614-2cad-485f-f9f06780ce79@samba.org>
Date: Mon, 18 Nov 2019 22:18:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <50203bef-dce2-39a5-0b1d-7e47a10a6a8a@samba.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
From: Uri Simchoni via samba-technical <samba-technical@lists.samba.org>
Reply-To: Uri Simchoni <uri@samba.org>
Cc: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 18/11/2019 17:01, Stefan Metzmacher via samba-technical wrote:
> Hi Uri,
> 
<snip>
> 
> ldb is the exception as there's a strong interaction between samba's ldb
> modules and the library, that's why we can no longer use the same scheme
> and need one ldb release stream per samba minor version.
> 
> Regarding talloc, tevent and tdb we have an new temporary exception
> because Samba 4.10 still supports python2 and python3 bindings (also at
> the same time). While 4.11 and master only support python3 bindings.
> That means in order to do new releases (which can work with Samba 4.10)
> be need to do them from v4-10-test. The question is if we really need
> to do that for 4.10 or if 4.11 and newer would be enough (which I'd
> actually prefer).
> 

Thanks Metze and Andreas, that clears things up.

We can avoid fixing bug 13846 for 4.10.x and tell users who are still 
stuck in 4.9.x (e.g. OpenWRT last time I checked...) to jump straight to 
4.11 or 4.12, and that way we shall avoid 4 lib releases. If we do 
backport the code fix, the precedent seems to be that this calls for a 
new lib version, so we'd need a new 4.10-based release for all four libs.

One missing piece in the puzzle - We seem not to backport "version 
bumps" in talloc/tdb/tevent. It looks like if a bugfix requires that we 
touch, e.g. lib/tevent in a stable branch, then we upgrade it all the 
way to the newest version, but if a bugfix doesn't touch code there, 
then we don't backport changes just because there's been a new release 
in master(See for example tevent 0.10.1 which was merely a version bump 
due to waf upgrade - the version bump was not backported to v4-11-test). 
That would mean that, possibly contrary to what Andrew has suggested in 
the bug thread, I don't need to backport my talloc/tevent/tdb version 
bumps from master to v4-11. Is that correct?

> I'd prefer that we only backport waf 2.0.18 (commit
> 09e282ec8173f2935bdb579e0396f269ce712e0d) to 4.11 and 4.10.
> And we need new ldb versions for 4.11 and 4.10. All other libraries
> can come from master.
> 

The way I see it, we need either new ldb/tdb/talloc/tevent for 4.10, or 
not fix the bug there at all and then we don't need anything.

Going back to the specific problem at hand -

I suggest that I cherry-pick the actual bug fix (waf upgrade and 4 
commits that accompany it) to 4.11 *only*, and issue a new 4.11-based 
ldb version. That would accompany the version bumps for 
talloc/tdb/tevent which already landed in master, and which don't 
require back-porting at this time. As an alternative, also backport to 
v4-10-test and also bump versions of all 4 libs there.

> metze
> 
> 

Thanks,
Uri.

