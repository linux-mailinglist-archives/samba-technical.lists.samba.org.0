Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF1714339
	for <lists+samba-technical@lfdr.de>; Mon,  6 May 2019 02:31:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=WFVRdfEI5FCRTftesVNKmr/1wcN2KFuLejBlEcyzIwA=; b=M8pdhhoP24bh7+NMhBMGpbggfG
	5fVeFr7AeVQAcaDawaxSDZ0/loi6UI4gEbQpV98IUswqS/QWYsv0urqlokD+gSHB6rUo0b/j9/Jyo
	zNp7YI7iWaWDn1kSZeh8VDbS87p3RK9YXc5qNfPXDUrq4dMdQ6A4mA/S6c6NQ8FHbMFqJb/PXcT7h
	wIZlzF+5+8TgUOWtyt1Ibw9DAQ+aakSZLL5of3u2nyjX0TAMoh1vEAd0ULSYoigNbz0mbU/hxai0t
	8P9cWI9uyNqTMiCIc4q4MTXkZL30LUBtuoKXFVnd1os4YK1+858k2XgwQWfwRYcpbF0wrAs+sBhhl
	MwXPFRaw==;
Received: from localhost ([::1]:50978 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hNRX8-002V8G-1s; Mon, 06 May 2019 00:31:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:64892) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hNRX3-002V89-FS
 for samba-technical@lists.samba.org; Mon, 06 May 2019 00:31:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=WFVRdfEI5FCRTftesVNKmr/1wcN2KFuLejBlEcyzIwA=; b=pwV9/RisJ+rIXPBTiyLmhPqbiG
 8L5GoxaCQPEJKOlwT2NwpH23LL8ZFFfMoVraqzCa0Oo2rNMJb8cn5SIDFODHffAlXv1a53hl4AmGj
 vjtYFPybPWhj9/A0KEGa7O5NSoaUVs/thCNvyIspJnIgy0+Prh45sghBDnOK9buNW694=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hNRX0-0007kl-W9; Mon, 06 May 2019 00:30:59 +0000
Message-ID: <1557102655.14583.6.camel@samba.org>
Subject: Re: [coverage] enable coverage in autobuild.py and publish html
 report to gitlab pages with ci
To: "joeg@catalyst.net.nz" <joeg@catalyst.net.nz>, samba-technical
 <samba-technical@lists.samba.org>
Date: Mon, 06 May 2019 12:30:55 +1200
In-Reply-To: <13fdf77e-b5a7-d6d9-7f24-bca982c19812@catalyst.net.nz>
References: <13fdf77e-b5a7-d6d9-7f24-bca982c19812@catalyst.net.nz>
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAIAAADYYG7QAAAAA3NCSVQICAjb4U/gAAACRklEQVRYw81YS67DIAwkVe8FPRm5menJeAu3lmUCbyBGKqsmRXjwb8Y5aq3hl9Yj/Nh6Tu0upZRS+EdKiV+e5+mJqMKLiHLORBRjzDmbc/hlvb1QD2k3sG84+dhhvF6vlzymlNY8dyBJzUdLjAwyvaeU8n6/2WHpu/xDRkREJI8cOBMgfuRQxhj58JzzbBwhQDFGA07M6/efE0MQxDHGFvpdQHy6MUxqtU4yezRcH0B4GfbM44BWGqOurF6Omz140a0ASimJvdbwZT32XrpRh5yuwY1d0vPrdNkv91+T8uBRG8l1uiX+JtsHxPNIWE27ugwTctTdHCIiYXvuy4P7IDl0CxAzl2xgZTJwgw+g3kGaHwYh5g2sljyrjIVEq4pYBg2Kq3yXZ5WxjfO7zF9jRdXrnLcEmlbTRnNpcT0gvpTScUC2HlOE2ipAvPuJanMT+Xc0PC4dFzu1DEO4HgczaS5kOnZ4vM7zxNU+mtRyRVPDgqyX3cdx8AQCCrQnfkV9VzMA9Ryg3ek8Sgsg3QX+nbz03Og5l10ytp6HusQUwpjd1rnsksbHlhjuVGdBAbWzIiJu5MvEFkA6OkiwBO4uQL3ADeQ9b57t74+FBo1s47IqpVxqBDcuQ66r94QQJOH2ctnAf9oZtdbZYejpi2bQEveO0sb2JXu09OJJrnpil4SV5G2N6Y+1QjL+gHSKDApHJoJWF3hW2fInh6lutGW216OPRBZtRZscwyQvI+KuTj3rp4VP1VsAcTobxgDngukqm3LPgmL8A4m377Y5OvTKAAAAAElFTkSuQmCC
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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

On Mon, 2019-05-06 at 11:16 +1200, joeg--- via samba-technical wrote:
> If any one discovers problems from the above report or has fancy ideas,
> please let me know.
> 
> New tests are welcome to increase the coverage percentage from now on:)

Thanks Joe!

This is really, really cool.  We are currently below 40% code coverage,
partly due to a LOT of PIDL-generated code that we don't run, but we
also should be really proud, we do cover a lot of code!

Tasks from here are:
 - finding code that we think is tested but doesn't show up (and fixing
that one way or the other)
 - removing dead code (I'm going to try with callcatcher again)
 - adding new tests!

I'll gladly review any patches towards the above,

Andrew Bartlett

-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba





