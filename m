Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9B71E7E6
	for <lists+samba-technical@lfdr.de>; Wed, 15 May 2019 07:28:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=ReRfCoDnebF5cGT0v2d+P2RpFo56c1b+HGo43bdNnjo=; b=OQo+qUwzlM8SVwB3odtYzycIa1
	glS7RaGh2j00s5e0dTwYCmaBhnCLUA+tR6pf58YSok6d7vceKZA1HvHJIYdqKEdTDN24QtIOCpRF9
	mEOcKE/UMkEQ6pm26us6ak4vU1KFHqfGzK+XwoLykRMKulqYwJ1XOb6nuynA83BFJBnfvFOQ+OhKz
	QvPVm/c0YXoa9NMFZj6wLxdVICVm7fMQY5WD8ZXwjB+sDQfeRGiVPqc6iJqqgaWJ9uLlZuind3G0X
	OxakoYy16s+OgpqK1zVQECRx31RGWSXDEAw3iZSJC8cAfzvVFt3ClhBAWgx/bGNiQsbdqbw94qDag
	+n06kHrg==;
Received: from localhost ([::1]:61728 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hQmRs-003hQk-J7; Wed, 15 May 2019 05:27:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:21810) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hQmRj-003hQd-5v
 for samba-technical@lists.samba.org; Wed, 15 May 2019 05:27:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=ReRfCoDnebF5cGT0v2d+P2RpFo56c1b+HGo43bdNnjo=; b=TYQYJWgXDgmJyKM87uNj9oSKv1
 kjEQl/AdjETo+yfUtMs3OHFKuBm54NMVu3UdWwBVSwvajkylqL7adFrB7WGQKeQQrX5PCeXc92MJd
 Z+fh1tISqFFkGfOyrWomZhA0k4X2ga6nCmJ5hOTN81QsVAkbJqJdtq9LfHQwc7sM9iVc=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hQmRe-0002vU-G7; Wed, 15 May 2019 05:27:15 +0000
Message-ID: <1557898030.25245.8.camel@samba.org>
Subject: Re: [WIP] [PATCH] ldb: new on-disk pack format
To: Garming Sam <garming@catalyst.net.nz>, Aaron Haslett
 <aaronhaslett@catalyst.net.nz>, samba-technical
 <samba-technical@lists.samba.org>
Date: Wed, 15 May 2019 17:27:10 +1200
In-Reply-To: <01caab91-5ec4-392a-0227-c4782db5959e@catalyst.net.nz>
References: <09dfb485-0056-44f9-3baf-3ba38675758a@catalyst.net.nz>
 <01caab91-5ec4-392a-0227-c4782db5959e@catalyst.net.nz>
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
Cc: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2019-05-01 at 16:33 +1200, Garming Sam via samba-technical
wrote:
> Some initial testing shows that the new format has 50% more throughput
> (for unpacking group-like objects with a few thousand (member) values
> like what happens in the LDAP bind). Or in other words it's 33% faster
> to finish a single call. It also leads to much better memory performance
> under load, which is harder to predict in terms of overall improvement.
> 
> ldb_kv: Avoid memdup of database records in the case of base searches
> 
> a76d2865372988c29baef42ecc4257e861692e7b

Just a reminder to the list that we are still working on this.  It is
really important for the 100,000 user case, our performance tests are
unable to run (acceptably) without it, the responses just get too slow
on the large DB.

This is particularly due to the large number of user groups in that
example DB.

A set of patches to remove other inefficienies is in autobuild, but the
main change now almost ready (just working out the upgrade process for
example).

At this stage we are thinking to have GUID indexed databases use the
new pack format, with an upgrade on first use, exclusively.  This will
avoid changes to non-Samba LDB users while keeping the test matrix
compact.

Aaron will post some updated patches soon.

Thanks!

Andrew Bartlett
-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba





