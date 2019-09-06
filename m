Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 58041AB1CD
	for <lists+samba-technical@lfdr.de>; Fri,  6 Sep 2019 06:50:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=wyO0NUyLW9CpKTPIS2L53Ux3At7nW6dXhv3i6c9o88g=; b=Q/tAOZPODDYG6E3EK87AAFtFFp
	XCu52zxPtB2h3QPSYTCR3Acns1Tuu/hXNAATqt/t/3lZJjTt6FFE09HKZRA/6V30BlYQyGLNHj+S4
	3sirdTuwlxcCFceXt+2dxlcQgafK7oNap/Jm6672a4DMda5AQTW7AOQwVzfFAkYbpGcudrQeQYi2Y
	c0Wbc6C3zY4C0nYhSU6tQfec+dj6YrkgWtWVMGQkZB8xTPaOiL+Lq5/EB5hWlxxPjZeMxTUqOTH4E
	0oCmFbR5kaBwyMeaJY0ZvVYBet9mzQgvZFvpPLDAHc+ASQ0ai65Zx+PX2PUGiZfVUyehRaooFgR//
	5bRNne0g==;
Received: from localhost ([::1]:34816 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i66CH-003rPu-UO; Fri, 06 Sep 2019 04:50:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26380) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i66CB-003rPm-Vg
 for samba-technical@lists.samba.org; Fri, 06 Sep 2019 04:50:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=wyO0NUyLW9CpKTPIS2L53Ux3At7nW6dXhv3i6c9o88g=; b=Gn0u928SvkfjlQ2aVGVwMFCAU+
 rSkHFy8YhTMLC/Pke99F/zky6ah4vEBK6Cl0kOADiD6H9RqNHsii1LcBINfABYM4eEoptI3lTuVci
 qaMAEJL7wiShDnlfITtM+Z4VYw7qy3QIeQsCun8lKlOGTFje3wUjrngCu5NklnE2KyOo=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1i66C8-00043x-Lq; Fri, 06 Sep 2019 04:50:01 +0000
Message-ID: <1567745396.20732.11.camel@samba.org>
Subject: Re: [PATCH 1/2] lib/replace/wscript: Avoid generating nested main
 function
To: Khem Raj <raj.khem@gmail.com>, samba-technical@lists.samba.org
Date: Fri, 06 Sep 2019 16:49:56 +1200
In-Reply-To: <20190906044447.41266-1-raj.khem@gmail.com>
References: <20190906044447.41266-1-raj.khem@gmail.com>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2019-09-05 at 21:44 -0700, Khem Raj via samba-technical wrote:
> clang is not happy when it sees another main nested inside the main
> function and fails the test for prctl syscall, therefore avoid adding
> implicit main() here
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

G'Day Khem,

Thank you for your submission.

However it is most helpful if you could submit changes to samba as a
gitlab merge request, we keep better track of outstanding patches here
than on the list, and can see CI results for them. 
https://wiki.samba.org/index.php/Samba_CI_on_gitlab

Also ensure you have followed 
https://www.samba.org/samba/devel/copyright-policy.html
if required.

Specifically do not use git-send-email as samba-technical rewrites the
author and so the patches get owned by samba-technical, not you.

Thanks!

Andrew Bartlett
-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba





