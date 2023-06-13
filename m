Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F67772D75A
	for <lists+samba-technical@lfdr.de>; Tue, 13 Jun 2023 04:25:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=A6j1TYw4MRECG36S+arbdcA7Y2i1mlDdB+PkiHOiKyQ=; b=ZuNFAXfy+1PHyLU+hyz+A0Phui
	MDhhWCk6nu1gpVR/qKTROpi7rfppNSJLR2DVMC/K62B+N0fsk9YX7bI7mzg+elLOV+mP6hNUaTsgy
	GIXG+frkEOuHuL++P7SM5Q4f05iBNLzeZjqRUVhUHO3jOzvHT5TsYXsSmJ+zSkLRc3ZeH0gspwqbR
	6K4g365NQgwxo9EEFl4e2mZkzosHFBEJM5c4A8+3EdPoO85WN27w87pYYYfGcO+ussFkdm0oENMcE
	KBg5qB3Ps46Yjkfg6H2aRL6f3tdPYXN7uPQ2ZF+dchMXgBfxw6jqT3SCqhcVELyA86FzzZCJt0d12
	qhIKZyeQ==;
Received: from ip6-localhost ([::1]:29756 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q8thn-001kxb-No; Tue, 13 Jun 2023 02:24:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45342) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q8thh-001kxS-Eo
 for samba-technical@lists.samba.org; Tue, 13 Jun 2023 02:24:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=A6j1TYw4MRECG36S+arbdcA7Y2i1mlDdB+PkiHOiKyQ=; b=oaMQ6IcnrvY5vyk8PB7RVEu4Yo
 wBvVImUxM7x9vXIaUS2yVOGQcJRExRLjRoZqk3JpzsBxzhdMJv4VVmRO0HntsFAVeKTyYvMiIkEE0
 glkwb0LS4YEw3R8A8z/4zniVnahxeJAWvkEeJraXrOX6CSMlBR275chfQ4WF7XJMvolS2u8LuGEzc
 zgAKp6zzAJscJ8qCSG8z23ZcnpbapdndAzM2lyW1uhXd0vAACnAFqjHHCr2n5Cz5s6tWlZT5scKQN
 yAz1eweMqreIOBckkX1P1l8eRRvdFIZZBevHIr0ajwkjQuWEHqF5YI0axgpV6qQxXsrTMp+nZGV6H
 KIL5npV0QDKmkHlbOqqBEiwHTDqmOl7GOVSy5B22UsejiSPsr4nUwLz1+BcuYX4YNlV352XAsRtLB
 D+nf4DXkbrR4jcsjSfOtzjY/nNdDib3CSq9SdP+bGHWO8aChKY40YKDi1fV9ysPmCFdb6omghay9z
 hQ2AlscObBJGF8ucQvDSgbYn;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1q8thf-001aY7-2c; Tue, 13 Jun 2023 02:24:16 +0000
Message-ID: <5b000720e52fc5a0a06072a93376cd962ed8b293.camel@samba.org>
Subject: Re: atomic ops in heimdal: -latomic
To: Michael Tokarev <mjt@tls.msk.ru>, samba-technical
 <samba-technical@lists.samba.org>
Date: Tue, 13 Jun 2023 14:24:11 +1200
In-Reply-To: <ee8d1fe9-f7e0-a629-715f-5e859af8fcbc@tls.msk.ru>
References: <ee8d1fe9-f7e0-a629-715f-5e859af8fcbc@tls.msk.ru>
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

On Mon, 2023-06-12 at 13:06 +0300, Michael Tokarev via samba-technical
wrote:
> Hi!
> 
> Something changed - probably in Debian (where I build packages), and
> some stuff
> started failing, eg
> 
> https://buildd.debian.org/status/fetch.php?pkg=samba&arch=armel&ver=2%3A4.18.3%2Bdfsg-1&stamp=1686556171&raw=0
> 
> 
> /usr/bin/ld: third_party/heimdal/lib/krb5/krcache.c.55.o: in function
> `krcc_get_principal':
> ./bin/default/../../third_party/heimdal/lib/krb5/krcache.c:1395:
> undefined reference to `__atomic_load_8'
> Apparently this now needs -latomic on the link line. I don't know yet
> why it ended up like this,
> but other projects which faced this same issue, just added -latomic
> in similar cases.

Any chance of building a configure test for waf to detect this? 

How do we know if we need this?

Once you have the test, it should just be a matter of adding a
dependency on 'atomic' in the right spot, on platforms that don't find
the library this will just be empty (eg ignored in the dep calcuation),
you don't need to do string manipulation in the subsystem declarations.

Andrew Bartlett


-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead                https://catalyst.net.nz/services/samba
Catalyst.Net Ltd

Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company

Samba Development and Support: https://catalyst.net.nz/services/samba

Catalyst IT - Expert Open Source Solutions




