Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0605CA5F58
	for <lists+samba-technical@lfdr.de>; Tue,  3 Sep 2019 04:37:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=5ximUBuBnU4YIkaztQhHvt1XBYoUBQJRn4OL5mYzXq4=; b=jy4+x4Muw67O4vy2T6cW7/AOf1
	wdIm46NemyE9SX2rK9EwvlKNDjDo20YgzppfbcK9aGrf3uNWQ+7+cyd6kvnq21sez8LmSedBJJBG1
	C+jQNmt4hu7xHzRL43wZoAX8yk6AqpbJ1IwnEYIefM1biXCdx8Opq8aCcbsXSCDRUQyWkXWDCZh6M
	3T7NO68DFnu5UmAccoXjLIxFLRsUn8l4X9UmcMOFOwPedBRoVAMJE38CsJzktYs9oeasOeWmAROmn
	8P/+nQw/Q4ZGE2FgACHhvaeKYhG0MS2c8KQfLWA6bdbPyG9170Gil7DsuhdrwRp7AW2GCr7lrnau0
	ru9ZTo1Q==;
Received: from localhost ([::1]:50486 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i4yfi-0035G7-8f; Tue, 03 Sep 2019 02:35:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25172) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i4yfc-0035G0-18
 for samba-technical@lists.samba.org; Tue, 03 Sep 2019 02:35:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=5ximUBuBnU4YIkaztQhHvt1XBYoUBQJRn4OL5mYzXq4=; b=qlglSYhrrRfzKT6Eht5DZyGUXy
 j61bnRDSq8HznL2srIE+NynAYe2YokAw8oW0KYGXiOCSkzt9uouAbROTpoU0L4zfu/BhGpwGuOonh
 bin1PpfLqAFZmeRMl9meDwbTeS2AUAbW/jP7XrP0Q/OY5AUQtt4rClSsNkIzusPnMJwc=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1i4yfZ-0002yz-EA; Tue, 03 Sep 2019 02:35:46 +0000
Message-ID: <1567478141.19432.44.camel@samba.org>
Subject: Samba python deps management (was: Re: [Patch]Correcting the error
 message of 'samba-tool domain schemaupgrade')
To: Amit Kumar <amitkuma@redhat.com>, samba-technical@lists.samba.org
Date: Tue, 03 Sep 2019 14:35:41 +1200
In-Reply-To: <5d6d0209.1c69fb81.336d5.26fd@mx.google.com>
References: <5d6d0209.1c69fb81.336d5.26fd@mx.google.com>
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAIAAADYYG7QAAAAA3NCSVQICAjb4U/gAAACRklEQVRYw81YS67DIAwkVe8FPRm5menJeAu3lmUCbyBGKqsmRXjwb8Y5aq3hl9Yj/Nh6Tu0upZRS+EdKiV+e5+mJqMKLiHLORBRjzDmbc/hlvb1QD2k3sG84+dhhvF6vlzymlNY8dyBJzUdLjAwyvaeU8n6/2WHpu/xDRkREJI8cOBMgfuRQxhj58JzzbBwhQDFGA07M6/efE0MQxDHGFvpdQHy6MUxqtU4yezRcH0B4GfbM44BWGqOurF6Omz140a0ASimJvdbwZT32XrpRh5yuwY1d0vPrdNkv91+T8uBRG8l1uiX+JtsHxPNIWE27ugwTctTdHCIiYXvuy4P7IDl0CxAzl2xgZTJwgw+g3kGaHwYh5g2sljyrjIVEq4pYBg2Kq3yXZ5WxjfO7zF9jRdXrnLcEmlbTRnNpcT0gvpTScUC2HlOE2ipAvPuJanMT+Xc0PC4dFzu1DEO4HgczaS5kOnZ4vM7zxNU+mtRyRVPDgqyX3cdx8AQCCrQnfkV9VzMA9Ryg3ek8Sgsg3QX+nbz03Og5l10ytp6HusQUwpjd1rnsksbHlhjuVGdBAbWzIiJu5MvEFkA6OkiwBO4uQL3ADeQ9b57t74+FBo1s47IqpVxqBDcuQ66r94QQJOH2ctnAf9oZtdbZYejpi2bQEveO0sb2JXu09OJJrnpil4SV5G2N6Y+1QjL+gHSKDApHJoJWF3hW2fInh6lutGW216OPRBZtRZscwyQvI+KuTj3rp4VP1VsAcTobxgDngukqm3LPgmL8A4m377Y5OvTKAAAAAElFTkSuQmCC
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: ab@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

G'Day Amit,

I'm going to write here because you have opened mulitple MR, sent a
mail to samba-techncial and filed bugs and this converstation is
already a bit too spread out.

Samba's python code has dependencies.  These are documented in
our bootstrap system (finally), but of course many users don't use that
(because it really is built for the CI runners).

So, we have a problem at runtime when things like 'patch' or Python
Markdown are not installed.

My view is that, as pointed out so well by AB, we must not print
distro-specific package instructions at runtime.  That just ends in
madness.

https://gitlab.com/samba-team/samba/merge_requests/758#note_211145140

We do, in configure, suggest the typical RPM and DEB package name for
things we need, but given the proliferation of tools (apt-get, yum,
dnf, zypper) we certainly don't want to go for full commands.

What we need is a check at configure time that the python and system
tools we need are present.  Perhaps some way to use the standard python
requirements.txt would be nice, but could also cause more problems.

I realise that due to the nature of python (and calling executables)
that these can diverge between build and install time (of the binaries)
so I'm all ears on how to solve that also (beyond saying that it a
distributor problem).

However, I don't want this put into scatter-gut exception handling all
over the codebase.  It needs to be in one spot, and consistent. 

As we move away from using third_party for this we need to do this
once, and right.

Andrew Bartlett

-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba





