Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F76A4D39
	for <lists+samba-technical@lfdr.de>; Mon,  2 Sep 2019 04:04:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=QOAk1p6slNs9Qcr4d6xmlFmn7f+h7iaz13dkXEfzSEY=; b=1jOYvJEpc1rlXXAsYU9Z5MXL4B
	8te1J3g1mwpjF2oRHReTx5giB6EWvqn9ESVtJgoRWJ5hIuXOHrwjKqEXLd0bmWAbRpxt5cBKokZrs
	n9FVxXU53gB3LDktlWtKGNKUzBb+yTaznC20CZI5XlWYwkLh4S5mS1fLelAWFhrCxGeXKvERUPbjC
	KoN6Gz6zxYAmur14sjdSMYwa0Z9+qqwSzTcvEBdSg3Fl/TlzJ23DIb3LvXZbvsIaeuy7zngFC7/4B
	V35gGDJcRC2rVL6ARBg7klE1yiw+M2fLxBOdzdZ1ddQXKgTPZrTdRdqztH+xvn8/rFmGUJnOeE2xz
	REubQVuA==;
Received: from localhost ([::1]:20956 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i4bhP-002rec-6v; Mon, 02 Sep 2019 02:04:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64370) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i4bhK-002reV-2K
 for samba-technical@lists.samba.org; Mon, 02 Sep 2019 02:04:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=QOAk1p6slNs9Qcr4d6xmlFmn7f+h7iaz13dkXEfzSEY=; b=kqqXihpA6YIckKNUeKdYlOzm4E
 uTBW84i06HQluEbXTr7oIkfRFihzpYGAr+MdHm5Qh4fJhcIToVf+Ts8T6RXnnIY5joBm9rZT7mTvE
 N8m4ohvGyEy+JQUF1mf47vlnu7BJrb587j1TSibo2Jui5VjaraShA1a+FOBjZY2CGPec=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1i4bhI-0007Tg-US
 for samba-technical@lists.samba.org; Mon, 02 Sep 2019 02:04:01 +0000
Message-ID: <1567389837.19432.26.camel@samba.org>
Subject: The road to removing Samba's internal copy of AES (and perhaps DES?)
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Mon, 02 Sep 2019 14:03:57 +1200
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

G'Day,

I wanted to write to update the list on where we at at with removing
cryptographic code from Samba.

We now absolutely rely on GnuTLS 3.4.7 or later, which has allowed use
to delete a great deal of such duplicate code.

We do still have AES code, for the AES CFB8 and CMAC functions.

These could probably be open-coded against raw AES routines from
GnuTLS, but for now I would rather not go down that route. 

The operating systems that do not supply that[1], in our CI system are:
 - CentOS7
 - Ubuntu 16.04
 - Ubuntu 18.04
 - Debian 9

By April 2020 we should have a new Ubuntu LTS, Debian 10 is already out
and CentOS8 will be available.  (And we already backport GnuTLS for
CentOS7 regardless). 

So I would propose we remove the fallback internal code after Ubuntu
20.04 is released, or discuss it earlier if we can get a newer backport
package for the above.  

On a related note, I plan to experiment with implementing our DES code
via GnuTLS using the CBC-DES cipher and an all-zero IV.  That may let
us remove that code as well, becoming essentially crypto-free and
therefore honouring FIPS mode correctly in all cases.  Do let me know
if you happen to experiment in this area so I don't double-up!

Thanks,

Andrew Bartlett

[1] configure shows:
No gnutls support for AES CFB8
No gnutls support for AES CMAC

-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba





