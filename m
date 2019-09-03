Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 64433A604C
	for <lists+samba-technical@lfdr.de>; Tue,  3 Sep 2019 06:45:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=+csLJ6bzP7CHmM/wy0w9Cdcmclff9nZ28Wvful/lvo4=; b=hBb7L7Vki9QTkaYiS0WjVm9Ha+
	sMN8qq5P08nPxkgpg/5SLdFF0SwTMA4E1N/MbWpIjdtCL9FFFp4pn5Xxc2Uu+Axz/FwyTVQwSnkAu
	TznUbRKgMI2BY3qEeYIJz5H+pZksXLjRubAOpHAiXIm1h6KI6bgFOhI/6qUe6tOp0mPH1ytom0uqB
	4qYoIN8NafOnqKMpuw3aH6eFHOndIr60YVL1NUeNUg+gxDv5OIugagVtxadD8xdGUsIfcL7lOAPOw
	qEv3+WXXLHHITl42mfIoh6A0yEXxtAptzZunzk2KzdV2GFOvAvpmxFCJR4VKrMVhNctG7Ltceo1zZ
	R2ISZspg==;
Received: from localhost ([::1]:52196 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i50gf-0035oj-VQ; Tue, 03 Sep 2019 04:45:02 +0000
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:39219 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i50gZ-0035oa-Nd
 for samba-technical@lists.samba.org; Tue, 03 Sep 2019 04:44:59 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46MvWK60tvz9s4Y;
 Tue,  3 Sep 2019 14:44:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1567485885; bh=bgwAn3stVJ6gYdDxiEOmK+UThV9eRvbDAm4lCI9CSow=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=quLCeyOgFyyFsyMHcKQONPgPA3X85WA6w89A2/gmFN8zBH+rY2Gzq2zXoq6WQ/OWY
 21XqH5EV4WcKRBnQuARdXBYOadmFOiLaooQaS9BIPJNxzfFQztocIpGROcVoq++axP
 HnGsTvQMDomWXTsQLvOzC30HUKethogY5jYBPdwkx2pXvMLAgt+xv+VUXpiyvT18YU
 KAtY2TKC5+6b+eM8awd1lFCE8hZ2uMnIxItObiMdQMvHDhY1k11QU+xyrCUM6Fo4xr
 fn90U4F0dETXHm1wHwhgRNISGIr1q+2/AMUnNrlO5Guaf+IGcjGiakTMd28iYYXMiN
 JEW0S3xjPbMfg==
Date: Tue, 3 Sep 2019 14:44:45 +1000
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Building Samba master on CentOS 7 (gnutls)
Message-ID: <20190903144445.58591c90@martins.ozlabs.org>
In-Reply-To: <1567482029.19432.46.camel@samba.org>
References: <1567482029.19432.46.camel@samba.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Andrew,

On Tue, 03 Sep 2019 15:40:29 +1200, Andrew Bartlett
<abartlet@samba.org> wrote:

> You correctly mentioned that discussing how to get past the new GnuTLS
> requirements on a unrelated and now closed Merge Request[1] is not
> really helpful.

> We do still have a mailing list, and this more 'meta' kind of issue is
> what it is for.

> The background is that we, in order to avoid having significant
> duplicated cryptographic code in the SMB2 server, we chose to
> exclusively require GnuTLS 3.5.7 or later.  We will increase this
> version in the future as and when the distribution landscape permits it
> as it is no longer favoured to have cryptographic code 'in-house'.

Sure...

> The instructions for preparing a build environment on CentOS7 are here:

> bootstrap/generated-dists/centos7/bootstrap.sh
> https://git.samba.org/?p=samba.git;a=blob_plain;f=bootstrap/generated-dists/centos7/bootstrap.sh;hb=master

> The key line is 'yum copr enable -y sergiomb/SambaAD' which enables a
> user repository with compat-gnutls34-* in it.  This is far from ideal,
> it would be much better if this was in EPEL, but someone would need to
> step up and do that.
> However this is only half of the story, as to avoid overwriting the
> system gnutls, the package is installed in a subdirectory.

The nutty thing is that I ended up removing the original gnutls
package anyway because dependent packages (including the devel
package) conflicted:

  Transaction check error:
    file /usr/lib64/libgnutlsxx.so.28.1.0 from install of compat-gnutls34-c++-3.4.17-4.el7.x86_64 conflicts with file from package gnutls-c++-3.3.29-9.el7_6.x86_64
    file /usr/lib64/libgnutls-dane.so.0 from install of compat-gnutls34-dane-3.4.17-4.el7.x86_64 conflicts with file from package gnutls-dane-3.3.29-9.el7_6.x86_64
    file /usr/lib64/libgnutls-dane.so from install of compat-gnutls34-devel-3.4.17-4.el7.x86_64 conflicts with file from package gnutls-devel-3.3.29-9.el7_6.x86_64
    file /usr/lib64/libgnutls.so from install of compat-gnutls34-devel-3.4.17-4.el7.x86_64 conflicts with file from package gnutls-devel-3.3.29-9.el7_6.x86_64

Given that gnutls.pc is in the devel package, and there's a direct
conflict between gnutls-devel and compat-gnutls34-devel, the
subdirectory for the gnutls.pc file is completely pointless.  If only
one devel package can be installed then it might as well be
self-contained...  :-(

> The build needs to first set as an environment variable
>
> PKG_CONFIG_PATH="/usr/lib64/compat-gnutls34/pkgconfig:/usr/lib64/compat-nettle32/pkgconfig"
>
> (this is in .gitlab-ci.yml).

OK, thanks!  That's the missing step!  Unless someone decides that the
subdirectory is pointless and fixes the packaging, then we should
document this with a comment in
bootstrap/generated-dists/centos7/bootstrap.sh or a README in that
directory.

I'm happy to take advice and make it so...

Thanks again!

peace & happiness,
martin

