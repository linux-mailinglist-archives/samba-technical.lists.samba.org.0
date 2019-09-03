Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1E4A5FD5
	for <lists+samba-technical@lfdr.de>; Tue,  3 Sep 2019 05:41:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=DTNS97wEhxSoxhDrWKck++woVTgulVMWFeTnzBNUqWU=; b=OgtfcBmPO5UIX0i1n7ab+nErdj
	CZRrattiDq4d7663lX/xCWLL3K4rgd4gUeAZI85BBWpZ+BmaRueMlY/dUQ5qGGZuA4ZazsRnJ/MPK
	xrRcZzuQEGW7o9nmkW9njNwi5nBr3hFN1Y8olOn/oUnVZDJ8K4+w5feOUJ+6rnI+r5m8nJfecFeoU
	go4GXQq1J0Wg+4htaW/mA87gk0w0RYPgogHf1iEW8bYj7RY0S1AGlLS5IXHO7lqiePt0aQPEXT63l
	02q8AbHQFNrhDAGS3uCenWZgtHlP47hp1oHM3bIoPGC12TElpz1XC1QIz+BWQuDnZJ6bv8XiOrrSu
	yT1hiNDg==;
Received: from localhost ([::1]:51318 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i4zgO-0035TF-J7; Tue, 03 Sep 2019 03:40:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43894) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i4zgI-0035T8-Gq
 for samba-technical@lists.samba.org; Tue, 03 Sep 2019 03:40:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=DTNS97wEhxSoxhDrWKck++woVTgulVMWFeTnzBNUqWU=; b=aEvjdKytTNEHvEiDLuTnUljasH
 kVSLxViCA4KIA+jpIKgx5MMiiFzVaExNn46piZ9Fsl6h15oYLxSXWgp3osCjjcAfCi/IBcicO2mAD
 JWIKa9vUcNUPsoP5PZSk/PFEj538DPscc+5u8j3GabyOG4tlMSnpAk4YUY/0kjbDgz7w=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1i4zgH-0003cj-1w; Tue, 03 Sep 2019 03:40:33 +0000
Message-ID: <1567482029.19432.46.camel@samba.org>
Subject: Building Samba master on CentOS 7 (gnutls)
To: Martin Schwenke <martin@meltin.net>, Upstream Samba Technical Mailing
 list <samba-technical@lists.samba.org>
Date: Tue, 03 Sep 2019 15:40:29 +1200
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

G'Day Martin,

You correctly mentioned that discussing how to get past the new GnuTLS
requirements on a unrelated and now closed Merge Request[1] is not
really helpful.

We do still have a mailing list, and this more 'meta' kind of issue is
what it is for.

The background is that we, in order to avoid having significant
duplicated cryptographic code in the SMB2 server, we chose to
exclusively require GnuTLS 3.5.7 or later.  We will increase this
version in the future as and when the distribution landscape permits it
as it is no longer favoured to have cryptographic code 'in-house'.

The instructions for preparing a build environment on CentOS7 are here:

bootstrap/generated-dists/centos7/bootstrap.sh
https://git.samba.org/?p=samba.git;a=blob_plain;f=bootstrap/generated-dists/centos7/bootstrap.sh;hb=master

The key line is 'yum copr enable -y sergiomb/SambaAD' which enables a
user repository with compat-gnutls34-* in it.  This is far from ideal,
it would be much better if this was in EPEL, but someone would need to
step up and do that.

However this is only half of the story, as to avoid overwriting the
system gnutls, the package is installed in a subdirectory.

The build needs to first set as an environment variable

PKG_CONFIG_PATH="/usr/lib64/compat-gnutls34/pkgconfig:/usr/lib64/compat-nettle32/pkgconfig"

(this is in .gitlab-ci.yml). 

Do let me know if you have any further trouble and I'll spin up and image and debug further for you. 

Thanks,

[1] https://gitlab.com/samba-team/samba/merge_requests/745#note_211012864
-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba





