Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFA0105960
	for <lists+samba-technical@lfdr.de>; Thu, 21 Nov 2019 19:19:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=rvgQKQalkneJOc5NWYU/SnT35XR2J4GVqJmyN0sznqM=; b=N/63YeMEUKDI86FVOdYGbxR+YR
	/cSBSjMZcwmQGwDG9uliagjNfTbk8OD/L9sKQV+43meiPqP5feWs//X9ARrKgd/V3IWK1AsNFLipy
	w5rw4NxCPBsG2w3jyts5TVbzeoebLnjgCcqhz3hHxkSoHY48R09sy+AbnlsvGdqfILavpTNi1NCXL
	9sabUc6gfr9Icw/wsGZ42V8aSVtPsEOGtwRz0rYQH2tY/YPNQjRx9QBS6mUitVK4DILHFUvMpYjCh
	vFNfR7tRbYlVe86y6A4QQ0UfhcGe0ye8DLFtPJOxd1SYZZfWcyA7lywbRZugiJAyH03G6ds/mpq2a
	koG3YOhg==;
Received: from localhost ([::1]:27394 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iXr2W-001w8l-Di; Thu, 21 Nov 2019 18:18:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57716) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iXr2R-001w8e-C4
 for samba-technical@lists.samba.org; Thu, 21 Nov 2019 18:18:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=rvgQKQalkneJOc5NWYU/SnT35XR2J4GVqJmyN0sznqM=; b=t7FbD8zTa/Ia2iHbt3PxhPdobm
 7Rk1HzSL2RC4sQTDK6zZxeGFliDHWMbVbDS6KL3FMtUDcSkMjFUlvDoEFrytM0WR8CuHmZuDewdqy
 726FGKpSfTJk9zbysyOs3I7t4CPOVooVnsBetlvxG0MOWHs/FkSWwfVSH7PhoxwLJtxCBmX+cNro5
 txUkpIhY5wGJ9uwuuJvpUknEUHAI4uPXPJcqi6JQsBZkmBlEZL8OvY8PdskBWe2dbkWZtGbhK5IvN
 /ipxp5tRcBZlz/xLo0MnnFCBRsJ7ezGnCQECACUdg1aHAoESPCueCgbRjvokpOWEDmmbEPz6S0f++
 dh+5eNGk7t6vjBGGVPwlN5Fq/Who1GZvvGpJ68oyYOgObhWYDAhf08Hbr72+9ioxkHWIDGL7NoNjn
 SITb+Gy+7ZMDiSSYtgLoDQsxYkdg59zQwn5USTndK8DXZpyw3V9/aud+njV0OPfjYZ9gNFbd0Xt/n
 gIzJpKf87nY1RCMo8ZnJT0gH;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iXr2Q-0005KQ-BA; Thu, 21 Nov 2019 18:18:43 +0000
Message-ID: <20d3f005503d82862b0ba8856010ae7a8831d577.camel@samba.org>
Subject: Re: building source3 subsystems and libs
To: moore chestnut <moore.43132@gmail.com>, samba-technical@lists.samba.org
Date: Fri, 22 Nov 2019 07:18:39 +1300
In-Reply-To: <CAGYhc9=AZmkOjHAGx7rWd=iM6h5BaVohym+oWMWqfNEfNtju3Q@mail.gmail.com>
References: <CAGYhc9=AZmkOjHAGx7rWd=iM6h5BaVohym+oWMWqfNEfNtju3Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1 (3.34.1-1.fc31) 
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

On Thu, 2019-11-21 at 18:09 +0000, moore chestnut via samba-technical
wrote:
>   hello,
> 
> is there any way to individually build subsystems and libraries?
> 
> for example:
> 
> the msrpc3 library in  source3/wscript_build
> bld.SAMBA3_LIBRARY('msrpc3',
> 
> or
> bld.SAMBA3_SUBSYSTEM('samba3util',
> 
> when I try waf or waf msrpc3 in the source3 dir, it does not work.
> 
> currently trying on a 4.11.0 source tree.
> 
> I have read through the https://wiki.samba.org/index.php/Waf
> and tried the samples with no success.
> 
> Does this work for source3 libs/subsystems?

No, you can't really build bits of Samba in general.  Some binary
targets can be specified with the --targets option, and a few of these
work correctly, nothing beyond that has been tested.  So where it works
it works, but nobody is really working to have this be a general
feature.

Andrew Bartlett

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



