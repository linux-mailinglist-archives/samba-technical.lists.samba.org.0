Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DB12DA72F
	for <lists+samba-technical@lfdr.de>; Tue, 15 Dec 2020 05:41:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=IBp8DM3ofgp+zTY8EnfVD75VOjKHi7zZhJ7O4lBtMpQ=; b=cyoyAdie+RePpXhrHXdKySXGaf
	7Mqc/2OpfAvC9clxYxs25itmlAAHYP+8VBxCX2m+pczaFscC6kj/2S/Nsu39ZWtrGXq1b08520PEK
	fTSoAcZiSGUACjdHhdY022VP9UVWrk3eJ1Mmvtw2ZFzmDoaOLOn7Sz6RrqY8VoaEmiFWTkS/64hFW
	qKLsdo9+qSAI3J9ipq86ZJoLCLQ5aV95WgfHxrzW1vGlyM6j+fbVEfoPZQh+nTq8Xt88R2Eq8juAo
	l3blb1Jj/K3ftVnpunb0L4FNQ8gCczH2etOs8uo6mfOZGvsJUXiUVZ5+y23ckfotCg+qpY3DQ0CWM
	cQYSRYLQ==;
Received: from ip6-localhost ([::1]:44252 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kp29J-001HfE-QO; Tue, 15 Dec 2020 04:41:21 +0000
Received: from ozlabs.org ([2401:3900:2:1::2]:40513) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kp29A-001Hf6-Oj
 for samba-technical@lists.samba.org; Tue, 15 Dec 2020 04:41:20 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cw5DD2znPz9sPB;
 Tue, 15 Dec 2020 15:40:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=202004;
 t=1608007244; bh=PEgpxr6iid+cLHEYMMJ3tkQBCVqWdE4CFCegfggiaeE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Pk6AbRKz1Vu8FldUaPC+6TDbE34UZLkHdV0hiqiT3jZhIzpp1YB8YVC7VGjMxgoZg
 Thhc1xMQ9xT6qkbMzHtu9stmDbi58lCCrllGBnxNVC1RrcJgMWwqq60UXWZ8poUbBI
 lFY8FO+H/XaI1vMgGvP3xKwhePExZZHp6EKnEZOX6zQdpwF9NSoRY7BLKCnHC+Y6K7
 C3XL0ztQUUiwhGMPMNZe7grRHgCKgNySCahvwrmCMvQutg6nLHrMNFkQjxYRv7kmdv
 lSb2tXgbLXaLPyImpmLKyHDelcElwF5Yt4jPqlpzIhslg9yLpeSvLpL8uTXj0BwDrQ
 Z4PBfVKjgYnlg==
Date: Tue, 15 Dec 2020 15:40:43 +1100
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Samba testing on CentOS 8
Message-ID: <20201215154043.3b1c5876@martins.ozlabs.org>
In-Reply-To: <20201212112535.48699809@martins.ozlabs.org>
References: <20201208231746.3c15f5b0@martins.ozlabs.org>
 <20201208124406.GF5029@pinega.vda.li>
 <20201209003132.328ca229@martins.ozlabs.org>
 <df4952fb-87d9-6cc8-e55c-a08487ff34aa@samba.org>
 <20201210142744.398a7e75@martins.ozlabs.org>
 <380efeccd76b37a958da2a49656a5c1c959a0173.camel@samba.org>
 <20201212112535.48699809@martins.ozlabs.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, 12 Dec 2020 11:25:35 +1100, Martin Schwenke via samba-technical
<samba-technical@lists.samba.org> wrote:

> On Sat, 12 Dec 2020 09:45:44 +1300, Andrew Bartlett
> <abartlet@samba.org> wrote:

> > One advantage of the current bootstrap system is that as long as nobody
> > deletes the CI images that are built, the existing images remain a
> > stable snapshot.  It is 'just' the bootstrap scripts that break for
> > others, and of course building a new image now becomes more difficult.  
> 
> Thanks for hammering that observation home!  I found it slightly
> annoying when I had to build new images to test my branch on GitLab but
> I now realise that the stability is a core feature.

Of course this is also a bit dangerous.  The worst case is very
unlikely, but if a change accidentally depends on a 3rd party libray
bug and all of the test platforms later fix the bug then our test
framework won't notice the breakage because we're using "stable"
(i.e. out-of-date) images.

It makes sense to update our CI images every so often to make sure our
tests still pass on current versions.  I'm not sure how we would do
that.  The technical part is quite clear (SAMBA_CI_REBUILD_IMAGES=yes)
but the process part is more interesting.  For example, how do
we do out-of-band CI image builds to ensure that new images are OK
before the CI system defaults to using them.

I guess the easiest way would be to add a comment to
bootstrap/.gitlab-ci.yml like:

# Rebuild: 1

(or make it actual YAML data) and increment this for every rebuild.
That would change the sha1sum so that old images are not overwritten
and the new images can be confirmed OK before pushing the change with
the incremented rebuild number.

Just an idea...

peace & happiness,
martin

