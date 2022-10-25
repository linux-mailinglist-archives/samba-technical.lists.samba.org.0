Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8949960D24E
	for <lists+samba-technical@lfdr.de>; Tue, 25 Oct 2022 19:16:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=vXzMT8ihPJ2lLJ/p2pnyw7avLwBA1aEHyew2ZMyUxa0=; b=EDzGGqTDU7M5q4YFRxkiw5xXgi
	infT69sax8vdi594fuUv4ZUU0rPUfb1I8wonkDpyPPc+R/OKNs9MEGhqoIcqlqMAgm5mj7SBNdeSr
	edfpxQ9Yqwpws49evNCOEmgO4R0zpd5c/i3DTf7Tu+xIEyUhBabhZ42A5dnv1x+uep2XstQXfHi/j
	9MFLEchgTetXnXhkxDPI6oZUuAmBOlbiHFUYQmXSh50mcsRkaS4O8Slnv18wpaBj3lr3oS7fQ5cIw
	hZxi2LnDg7lDmFotas9uIgT9Ck0WzR6B1bqtlPwOOYqPjI9/zxq0MYePTxOB+zWb+oM8VkuQumbMl
	z0dnGXOQ==;
Received: from ip6-localhost ([::1]:18532 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1onNX6-005ydH-D1; Tue, 25 Oct 2022 17:16:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32876) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1onNWz-005yd6-4j
 for samba-technical@lists.samba.org; Tue, 25 Oct 2022 17:16:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=vXzMT8ihPJ2lLJ/p2pnyw7avLwBA1aEHyew2ZMyUxa0=; b=rODughKaiKPwheM6Rv7+aaENBd
 ybzqP/LXoXNWP7om96UjllaW2Qld+FM4VVPDQkpVwzAhdcRLv4djezeNrJnkBBkixMDEK+DyUg49M
 NJgPIBQMDfYAKVFR8zEK1x9LIvAHHjaJWouWKhJ2+3WCdb3VDJYFAaZteGfdG/t/gRLI1TEpU9Z36
 1xVrm/x2SKqzAzFCNIdz59LzJh55HibhZNiI6dxDaEBFj0yGcHefVJyvIuV/cJptiB49QBWSsPyTr
 JaiwfQTovPXS8INUAtcAahzEPneqJkQ8TJtKZPGrahJCwJaS/FoDhkzE3ZPB/hMrBrz9MWyx6WM7q
 6xe3CRFdkl8V7nBMjmhjH03HtsaHA4On7LIc+xEJsPZ2vaWCX4lR73G31T09NE6tHun8q4t2iCKa+
 LtDyWfUUR5LrI2VyeIGFwAfD/tWoe3/y8S/3/OpOSx1Mxj3ZNFhH0qnsNKQR30W56h3IpL8j2pQLo
 wiRi2jO4RsXFEPKu24Mx/qUe;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1onNWy-005lRh-GW; Tue, 25 Oct 2022 17:16:00 +0000
To: samba-technical <samba-technical@lists.samba.org>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: running only selected tests in samba sources
Date: Tue, 25 Oct 2022 19:16:00 +0200
Message-ID: <2855388.e9J7NaK4W3@magrathea>
In-Reply-To: <afca8f8d-f9df-3489-902c-bc82ced76731@msgid.tls.msk.ru>
References: <587ebe9d-3f91-7389-5ad1-c6d96e435b99@msgid.tls.msk.ru>
 <2656048.mvXUDI8C0e@magrathea>
 <afca8f8d-f9df-3489-902c-bc82ced76731@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, 25 October 2022 12:49:50 CEST Michael Tokarev wrote:
> 25.10.2022 13:15, Andreas Schneider wrote:
> > On Tuesday, 25 October 2022 11:16:30 CEST Michael Tokarev via
> > samba-technical
> ..
> 
> >>> https://wiki.samba.org/index.php/Writing_Torture_Tests#Running_tests
> >> 
> >> All this applies to a build with --enable-selftest. My question was how
> >> it is possible to run certain tests (like ldb selftests for example)
> >> without building whole thing with --enable-selftest.
> > 
> > Run 'make test' in the ldb package. See the libldb spec file.
> 
> Um. What *is* ldb package? Do you mean the separate ldb-x.y.x.tar.gz
> tarball? I was asking about the ldb bundled within samba tarball.
> 
> Does samba ship spec files? I don't see any?

cd lib/ldb
./configure
make
make test

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



