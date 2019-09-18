Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A93BB6FB5
	for <lists+samba-technical@lfdr.de>; Thu, 19 Sep 2019 01:33:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=H7OGlh2D5cP9mGpXcw9aQtqwDu6u6uGlIzzWYsFifpc=; b=MMU13/hPC8DwRAhbWPA4oROXn5
	o8WNhtQzWznNptMMsCerZpkn9609LjoebbnPGZRV/b0ks2qBmuski5AoQSqgX84v1bbTh9FUCLdsg
	8r1P7cuj3/lOtndh6Vtq3SffmlXggsihmvSCbH/CrPOB64PAQSGH3ACyKZ4cTrS3Tz534ffZK7UlW
	ZY9u4qFURKnCAZPAufWrso1nL5jftzKBLi8av/29+D6GnQPYKSlr4dQ54Ae8EvX47JCaqS4DZr61B
	1y5lwZu0vqRnwzIf5kPhv/Ba+nK6uHrwq6jHLcyYq2vnrqpib5pYZn1x/1DAmWyCMERHwSxgeF7eP
	g8okuxrQ==;
Received: from localhost ([::1]:46732 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iAjRJ-006jBB-4C; Wed, 18 Sep 2019 23:32:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12912) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iAjRD-006jB4-QO
 for samba-technical@lists.samba.org; Wed, 18 Sep 2019 23:32:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=H7OGlh2D5cP9mGpXcw9aQtqwDu6u6uGlIzzWYsFifpc=; b=LiCENOpbL1M790JN2BB6s+4CaQ
 MvC38ipZSg2pF1eYOZ/xZUmAPbE7dAvtnJHtG7VCLou/FtavfRKvNUV4RmhnhG/B/GKAbYTk70DQr
 tgoZkGy2riQZuyOPlmpkiUlhNgmBF0mHscaYQOOqpUevFpxFg1cx7HaPY/ulIeHJojpo=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iAjR9-00048R-O7; Wed, 18 Sep 2019 23:32:40 +0000
Message-ID: <1568849556.4377.70.camel@samba.org>
Subject: Re: Building Samba master on CentOS 7 (gnutls)
To: Martin Schwenke <martin@meltin.net>
Date: Thu, 19 Sep 2019 11:32:36 +1200
In-Reply-To: <20190903144445.58591c90@martins.ozlabs.org>
References: <1567482029.19432.46.camel@samba.org>
 <20190903144445.58591c90@martins.ozlabs.org>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2019-09-03 at 14:44 +1000, Martin Schwenke wrote:
> Hi Andrew,
> 
> On Tue, 03 Sep 2019 15:40:29 +1200, Andrew Bartlett
> <abartlet@samba.org> wrote:
> 
> > You correctly mentioned that discussing how to get past the new GnuTLS
> > requirements on a unrelated and now closed Merge Request[1] is not
> > really helpful.
> > We do still have a mailing list, and this more 'meta' kind of issue is
> > what it is for.
> > The background is that we, in order to avoid having significant
> > duplicated cryptographic code in the SMB2 server, we chose to
> > exclusively require GnuTLS 3.5.7 or later.  We will increase this
> > version in the future as and when the distribution landscape permits it
> > as it is no longer favoured to have cryptographic code 'in-house'.
> 
> Sure...
> 
> > The instructions for preparing a build environment on CentOS7 are here:
> > bootstrap/generated-dists/centos7/bootstrap.sh
> > https://git.samba.org/?p=samba.git;a=blob_plain;f=bootstrap/generated-dists/centos7/bootstrap.sh;hb=master
> > The key line is 'yum copr enable -y sergiomb/SambaAD' which enables a
> > user repository with compat-gnutls34-* in it.  This is far from ideal,
> > it would be much better if this was in EPEL, but someone would need to
> > step up and do that.
> > However this is only half of the story, as to avoid overwriting the
> > system gnutls, the package is installed in a subdirectory.
> 
> The nutty thing is that I ended up removing the original gnutls
> package anyway because dependent packages (including the devel
> package) conflicted:
> 
>   Transaction check error:
>     file /usr/lib64/libgnutlsxx.so.28.1.0 from install of compat-gnutls34-c++-3.4.17-4.el7.x86_64 conflicts with file from package gnutls-c++-3.3.29-9.el7_6.x86_64
>     file /usr/lib64/libgnutls-dane.so.0 from install of compat-gnutls34-dane-3.4.17-4.el7.x86_64 conflicts with file from package gnutls-dane-3.3.29-9.el7_6.x86_64
>     file /usr/lib64/libgnutls-dane.so from install of compat-gnutls34-devel-3.4.17-4.el7.x86_64 conflicts with file from package gnutls-devel-3.3.29-9.el7_6.x86_64
>     file /usr/lib64/libgnutls.so from install of compat-gnutls34-devel-3.4.17-4.el7.x86_64 conflicts with file from package gnutls-devel-3.3.29-9.el7_6.x86_64
> 
> Given that gnutls.pc is in the devel package, and there's a direct
> conflict between gnutls-devel and compat-gnutls34-devel, the
> subdirectory for the gnutls.pc file is completely pointless.  If only
> one devel package can be installed then it might as well be
> self-contained...  :-(

Drat.  That isn't ideal.

> > The build needs to first set as an environment variable
> > 
> > PKG_CONFIG_PATH="/usr/lib64/compat-gnutls34/pkgconfig:/usr/lib64/compat-nettle32/pkgconfig"
> > 
> > (this is in .gitlab-ci.yml).
> 
> OK, thanks!  That's the missing step!  Unless someone decides that the
> subdirectory is pointless and fixes the packaging, then we should
> document this with a comment in
> bootstrap/generated-dists/centos7/bootstrap.sh or a README in that
> directory.
> 
> I'm happy to take advice and make it so...

We can't easily add comments like that to the bootstap.sh, but a README
might work.  Only trouble is that you will need to modify
bootstrap/template.py to also exclude that new file from the sha1sum
calcuations.

Getting a better gnutls34 or later package into EPEL without the
conflicts would also be really helpful.

Sorry this didn't go as well as I had hoped and hopefully smoother
sailing with CentOS8 is on the way soon.

Andrew Bartlett

-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba





