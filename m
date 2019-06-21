Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCC04DE50
	for <lists+samba-technical@lfdr.de>; Fri, 21 Jun 2019 03:06:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=1fpwU8D/bOM7aho15h3UOTW0KC06u1f6/QbgI9gjYN8=; b=iXAD1MV3Ku06QoE+GpUKS79wyn
	dCZt34bwAcdlnluJzwo+OET1DZrC0r6NqtlcpOkeNHUVeQT+wT01pXHVxmRI9sp6jzydqDl0yNRe8
	V+YGZGKelKi41BSV9DUpZlv1aO3WrxeUyRKNt4euQcYbjdpOKvzC0G1TxAUV9pOBXOKW32y9PDnMW
	6oKGwx5LXHJ84j+VJeCx/LBx5xixOBj+aBrlnx2E1FuyzrWWr100iZ75AXVRmtxoZsgWjG0OJ9pIG
	Fr/MUTM9Zd0tFWtnPSS7OqVRnbCAmyijbrVx/QMZq4xiQlK1emM039396qiyNWWZxVcZ/BhEY0b3A
	CVC3yX/w==;
Received: from localhost ([::1]:46928 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1he7za-000qJq-VL; Fri, 21 Jun 2019 01:05:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34850) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1he7zW-000qJj-AU
 for samba-technical@lists.samba.org; Fri, 21 Jun 2019 01:05:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=1fpwU8D/bOM7aho15h3UOTW0KC06u1f6/QbgI9gjYN8=; b=aIM1ekArIbVBeL1EqIDDzB8J0P
 gOCJpzF0/uaPdfNNIwTKJ4WzprsdhTMMiQcwPkYMobQfnrOCW85mbFppl+80aMyUlllvUiRr+NjIx
 8k0uWn9f4InY5WoX6O4+4Av6OjYaMA6QKaZBQxOPfUfTFoi4KVSI3lMYBajaXxoG5Kvc=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1he7zV-0003VQ-A9
 for samba-technical@lists.samba.org; Fri, 21 Jun 2019 01:05:21 +0000
Message-ID: <1561079117.28284.21.camel@samba.org>
Subject: Document GitLab as the only way to contribute to Samba?
To: samba-technical@lists.samba.org
Date: Fri, 21 Jun 2019 13:05:17 +1200
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAIAAADYYG7QAAAAA3NCSVQICAjb4U/gAAACRklEQVRYw81YS67DIAwkVe8FPRm5menJeAu3lmUCbyBGKqsmRXjwb8Y5aq3hl9Yj/Nh6Tu0upZRS+EdKiV+e5+mJqMKLiHLORBRjzDmbc/hlvb1QD2k3sG84+dhhvF6vlzymlNY8dyBJzUdLjAwyvaeU8n6/2WHpu/xDRkREJI8cOBMgfuRQxhj58JzzbBwhQDFGA07M6/efE0MQxDHGFvpdQHy6MUxqtU4yezRcH0B4GfbM44BWGqOurF6Omz140a0ASimJvdbwZT32XrpRh5yuwY1d0vPrdNkv91+T8uBRG8l1uiX+JtsHxPNIWE27ugwTctTdHCIiYXvuy4P7IDl0CxAzl2xgZTJwgw+g3kGaHwYh5g2sljyrjIVEq4pYBg2Kq3yXZ5WxjfO7zF9jRdXrnLcEmlbTRnNpcT0gvpTScUC2HlOE2ipAvPuJanMT+Xc0PC4dFzu1DEO4HgczaS5kOnZ4vM7zxNU+mtRyRVPDgqyX3cdx8AQCCrQnfkV9VzMA9Ryg3ek8Sgsg3QX+nbz03Og5l10ytp6HusQUwpjd1rnsksbHlhjuVGdBAbWzIiJu5MvEFkA6OkiwBO4uQL3ADeQ9b57t74+FBo1s47IqpVxqBDcuQ66r94QQJOH2ctnAf9oZtdbZYejpi2bQEveO0sb2JXu09OJJrnpil4SV5G2N6Y+1QjL+gHSKDApHJoJWF3hW2fInh6lutGW216OPRBZtRZscwyQvI+KuTj3rp4VP1VsAcTobxgDngukqm3LPgmL8A4m377Y5OvTKAAAAAElFTkSuQmCC
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
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

G'Day all,

I gave a talk at SambaXP about our first year with GitLab, and one
point I made is that it is *not OK* to have public contribution
documentation that does not match our actual practice.

I was talking about GitHub, which we advertised but did not embrace
(and which by the end caused new contributors to be told off,
essentially).

I've recently found myself doing the same thing!  But now I'm berating
contributors who follow our public documentation and so innocently send
patches to samba-technical, or attach them to bugzilla. 

So, I would like to propose this.  That given the practice of the Samba
Team and almost all contributors is to contribute via a merge request
against https://gitlab.com/samba-team/samba that we document this, and
only this, as how to contribute to new patches to Samba.

This is only one tiny step in a process to have clear, practical
contribution instructions, but I would like to ensure we agree on this
much.

Essentially it would mean a better version of this being prominently
placed:

https://wiki.samba.org/index.php/Samba_CI_on_gitlab#Creating_a_merge_request

and updates to:
https://wiki.samba.org/index.php/Using_Git_for_Samba_Development

Non patch, meta and broader architectural discussions still belong on
samba-technical of course. 

Any thoughts?

Andrew Bartlett

-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba





