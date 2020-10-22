Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8482955BA
	for <lists+samba-technical@lfdr.de>; Thu, 22 Oct 2020 02:42:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=CXQL/frbZHxX+t3HFpvHCk6E4maloh+NIVNuMsFaico=; b=6XukJstwTn3ePApy+/ZGtB+i62
	9OseRdRJsii49kkS0ShL0Xxlq5pLw3ECqRCxbzZSeKyAaNPkclz/73OzhTH2ZvvEv2O+R+IF32Umf
	vFrgMhrFPIqUb06Xn+tGCoJMZwpqdPJRYhHGoTWCwe+OwfsbhqEDDHgX0X9UQoigwoKpLx8oBd229
	+zNVdzWV5OUfe7b/PTTOX+FJOY5peTeAz1khAeYMLyjrXiY3K1G1rdEACO+i/p0ZtSYi/m/R4yMXW
	k/uqY4sx7eqW4Hv6W9EsVU0m5j73TzX6GCXO16Kq4SLQsaOA08bOMpsA6/AAtcdkOsCTStWMm1qeI
	bBgRCiCQ==;
Received: from ip6-localhost ([::1]:31120 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kVOg4-00DDH3-G2; Thu, 22 Oct 2020 00:42:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58444) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVOfz-00DDGw-Ma
 for samba-technical@lists.samba.org; Thu, 22 Oct 2020 00:41:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=CXQL/frbZHxX+t3HFpvHCk6E4maloh+NIVNuMsFaico=; b=3CAVQXk7V81uN7rmlXXjZcFLP+
 RXoTPjwUlCNlu2TO19MA1qN2k38gbLBiJUmwE4WNI/arowI9A9ZVT96Uta2rrR4whBspG748nPrRi
 5mPjC0jAMwPC4M8qfaV0JiRyr8Wv4gcAoJ4ajqYix+H55WycaY2Qr9tWycT/VSaKEQ46M+Vt/1G/x
 WtS+dMFFNXOUVDA8NW8IlQRpE6502CEciFcS8hhKLVbLOx1liRh3rh7D2pV9ONk0+OGt30lAX1Ie7
 N2Jq1cBwtpK5oBJZVU0dkSQdvOaTPQ2MTXG7yjStEUNHmf/iZ7zyab0+YdDwWfKWvpDEY9OsEiVM4
 Th+BV2czWy+BQVH6CWVDBhP1ebhEN3YG4Mh8x2jB0klA3VXBPnbKr+Y7oLo2SxrqHHaa7bSZysTjY
 /q/tHrPvTYgaFgNBjXlLZXoz9Z7EaWX9h3ZIMchqO3wCpbI4GuSaMgHTfZhAh7apXe9CRh+OvZQia
 WmYbqvlj5+OkCwvlbJ/EWOO2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVOfy-0002bi-Ea
 for samba-technical@lists.samba.org; Thu, 22 Oct 2020 00:41:55 +0000
Message-ID: <6e676db2323a9f96443ab3cfc65a586413bc37ea.camel@samba.org>
Subject: issues with oss-fuzz and missing libraries (avahi-common)
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Thu, 22 Oct 2020 13:41:48 +1300
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
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

I've spent a day or so merging Douglas's work to have seeds for our
oss-fuzz build and trying to fix the coverage build.

We have the coverage build mostly working, but we do see this:

Error occured while running fuzz_nmblib_parse_packet:
/out/fuzz_nmblib_parse_packet: error while loading shared libraries:
libavahi-common.so.3: cannot open shared object file: No such file or
directory

It appears that while our RUNPATH setting works well for the first level of libraries we link to, those on which libc depends are not found in $ORIGIN/lib, because RUNPATH is not applied recursively.

Others have hit this in general, eg here:

https://superuser.com/questions/192573/how-do-you-specify-the-location-of-libraries-to-a-binary-linux#comment1771162_192678

This isn't just for the coverage stuff - I've checked, and the impacted fuzzers just never successfully run, which is a big problem.

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




