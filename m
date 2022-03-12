Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 082694D714E
	for <lists+samba-technical@lfdr.de>; Sat, 12 Mar 2022 23:48:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=ov6Vk3sqiSIA/GBlo0gQ6f7EioPUyI2osqGOXXjpY14=; b=5IqvX6m/ntgZotsYVP4k+eEwte
	jkvCDnDVbGF7EKNH4y1PAT51NPQjtlB11oa44nVAhf79ewl175dO07AEp7ye/VT+0EYL4Qgf42crp
	S1uiEiw765RQrUdRWm4runBhZrj24VwxPUBT9isjp17U0NdSDhvqe7YvpXukfkCwsmvc1wYOS1I6a
	UL1iV+mfh52KgayZrOOarYlFaEley1Xpb/2/lJtYbVSLUoQ+by82OOO5LRFqnT3nF62HxlOLn0OiE
	e/rjW8rSqs41cFHVMYY+p/y4VJ+tS5bTlwzyWU6hjs3cAJI9CXS9V3QSSODFbyVXt9FEmXljTL1I8
	eHZ2amfQ==;
Received: from ip6-localhost ([::1]:35602 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nTAWC-0025hP-G3; Sat, 12 Mar 2022 22:47:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37530) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nTAW7-0025hG-BL
 for samba-technical@lists.samba.org; Sat, 12 Mar 2022 22:47:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=ov6Vk3sqiSIA/GBlo0gQ6f7EioPUyI2osqGOXXjpY14=; b=jfUjnBdMgDrl7OKUv13Espw1Io
 l0JQgm71M47aWEPgwkxAvyZBXJmlmpim4aeKVos9WypFWr0QAwtXqrYdNgSDjemw1fFMV/W/Bvz9A
 GgxYyRLPKewDK1zyVHJjlivkWCH6uOdoGdaLXfalG+Vgd0yniIJQzb8WpB/HcDtIZM6Uc6gLYxEtV
 0Xo5PX3GoakF4MNeoSP2seawaN85o+D/uDycuURbCTfbZG92qEakY/eh1QWAQRTKRzfx6zJNVQjYl
 +koqQ5BhVeXo8gGfcMHCTljkYeL7S52Xt2EpEyfHMnwPWGaa2mg1GFu7iwQ+4k6S7BTq+dyDB8rTY
 zfxwz0IKqeetcoGqEVAkc93abmik4nXWqyYMsKTKUIkJX58IBD45OwoO6rfKDtFUqOxlICm6uMu4z
 xfHx6hAtsZNwRCB6kmICRBSD82v9qQ4nOPid6oWkwwCOPRubRXvuc910VU96NEoujob+N4tR4NIFE
 tLN7fAHF0sqrz3FTnErYWIw4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nTAW4-00164G-UO; Sat, 12 Mar 2022 22:47:17 +0000
Message-ID: <15f3b6f1fa0c6911be44ae49c1d4723744b99a27.camel@samba.org>
Subject: Re: tevent: reproducible-builds: build path embedded in various
 libraries
To: Vagrant Cascadian <vagrant@reproducible-builds.org>, 
 samba-technical@lists.samba.org
Date: Sun, 13 Mar 2022 11:47:13 +1300
In-Reply-To: <87o82a3kjc.fsf@contorta>
References: <87k0d6619e.fsf@contorta>
 <ee068c77b1e0d6a72e12c24ca1d447015529a094.camel@samba.org>
 <87o82a3kjc.fsf@contorta>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35) 
MIME-Version: 1.0
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
Cc: 1006863@bugs.debian.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, 2022-03-12 at 13:53 -0800, Vagrant Cascadian wrote:
> On 2022-03-07, Andrew Bartlett wrote:
> > I would rather this be discussed and implemented upstream.
> > 
> > For one, the tevent build system is shared with the rest of Samba, and
> > if possible this should be implemented by default for all 'make
> > install' runs, just as we do to strip out the bin/default from -rpath.
> 
> Originally reported as https://bugs.debian.org/1006863 where I proposed
> passing additional arguments via CFLAGS in the debian build system.
> 
> Attached is a proof of concept patch that works by adding the argument
> to CFLAGS by patching the upstream buildsystem.
> 
> The patch is bit ugly in how it derives the top level source directory
> and likely error-prone... a cleaner way of going about that would be
> much appreciated!
> 
> It also requires gcc 8+ or clang 10+ ... making it detect weather the
> argument was supported and only adding it conditionally might be
> desireable.

testflags=True should be doing that, the CI should help determine if
that works for this option.

> I am not too familiar with samba project processes, let me know if
> there's a better place to send this!

https://wiki.samba.org/index.php/Contribute shows how to open a Merge
Request for samba.  Once you get a gitlab username let me know and you
can skip to using our shared development repo for a full CI.

conf.env.srcdir should get you the srcdir you need.

I guess my main concern is once Samba is packaged etc, can we still get
a full backtrace?  How does this interact with debug packages etc?

Andrew Bartlett

-- 
Andrew Bartlett (he/him)        https://samba.org/~abartlet/
Samba Team Member (since 2001)  https://samba.org
Samba Developer, Catalyst IT    https://catalyst.net.nz/services/samba


