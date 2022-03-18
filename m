Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 148314DE19B
	for <lists+samba-technical@lfdr.de>; Fri, 18 Mar 2022 20:09:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=+cXldiyZkYDni0zFWbc65pa5LElI/al2vHdp9Ryjuus=; b=kIK/E0SSic++Q5E1e3un9ULEqT
	spjY06TzSi27ivg3wGfyEq1uwI39wPArffi4+Qv3aFFv5bm0oL+ARusSqZ798bTcJnrP+SiHZSGu7
	l3IZQxk9sGHvjaDsCCcuucSyAGbnpEx0PsHrqiH2kIEi+Cb6c+YGBpjvGrMAuMScBUscBct93xhRF
	ZwrAVRfZ1sDXjjfwnTF7CcCdyndPhpWJYKfbpqllhySPxmwszYP79ulQz9HPmJCl4hK2KHmIZxd+L
	ot6qQN0rAvFUWIoRKaQDuElZ/LYipcHTSi1cZk7O13Mm4eLe+olYGtDoEpQD4GD9a2wL64h5gzvBH
	aiQPOm1w==;
Received: from ip6-localhost ([::1]:60438 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nVHye-003UoE-9f; Fri, 18 Mar 2022 19:09:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37710) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nVHyY-003Uo5-WE
 for samba-technical@lists.samba.org; Fri, 18 Mar 2022 19:09:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=3TAYy+o3WY57EI5v31S3pjRSiGPCOmEwjA+mY8Qr14U=; b=ltzkjtwQc+XTRH1GW53S59YwHI
 mtNCOesB/pjBwvLIh/A4llD+HxYHgY98Oou2qS6daO0BRhyL2D2stl9EO6BJJukT6aIbuYnqfq6hR
 8Yu2VoPIVRHgm86BrsuD0XMAapGklAy3nu1mftz7Kq5A+smVJrvO3Y7F8MI5BBlGzAR+yMKd5bmhg
 Y8k0ox+sjqFjoFUAiaz1ilm0G5yIrJ1j5aN/MzL2iF2JEx4M8Kg3wcB/qlnBRqQMM9G+WG/qI9nYs
 5SNQtgS64G9/rFAOovP3k+nTJ3LvR2FryTv/D7ndfLJ2IAmYdSXexyr2tUNbhI5XAB4f34kskUPb/
 XA+UzreWC5OPTBU12ebv1xqvs5VnR1/d2e/ZrQU/iMY3OawzB2zgR2XJj6HM8kBts+Uh9fsBGZrTm
 dPRcI8ZuLy+KpklJPvYBt0Zv5sNoy0DQfxeD16c/psvFC4qfubBkdaaststY/KFai4LLEcMuuYfn/
 fD9cbAfx1B3Ne1qULXUuLEKp;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nVHyW-002C2S-SP; Fri, 18 Mar 2022 19:09:25 +0000
Message-ID: <3ada695fdff1b1cb3e1f0edd14b41e9b4605dff4.camel@samba.org>
Subject: Re: We need to rework "allow weak crypto" mode in Samba
To: Aleksandar Kostadinov <akostadinov@gmail.com>
Date: Sat, 19 Mar 2022 08:09:21 +1300
In-Reply-To: <CAH9M6rL7Xc9BnymYt5vgiacwG4jOStNBmumvgOt0dDMGwSwVVg@mail.gmail.com>
References: <e0c3b5921e018a5b74448f40a26af4015193824c.camel@samba.org>
 <CAH9M6r+uJ8VPTdHy_=094QXOqQaf63DpfN9H0k0kUaKfUk5ajA@mail.gmail.com>
 <0d1584239bc53567cb2165074b63338d6570f4d6.camel@samba.org>
 <CAH9M6rL7Xc9BnymYt5vgiacwG4jOStNBmumvgOt0dDMGwSwVVg@mail.gmail.com>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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

Fair enough, and largely my point. Samba doesn't really have a FIPS
mode (given it is applied inconsistently), we have a "allow weak
crypto" switch currently controlled by the GnuTLS detection of the
system FIPS
mode.   
We should have better global control of weaker crypto, to allow
organisational policy guides to be written, that is beyond the
GnuTLSFIPS mode.
Andrew,
On Fri, 2022-03-18 at 21:00 +0200, Aleksandar Kostadinov wrote:
> It is good for samba to have some switch for enabling only secure
> algorithms. But I don't think it has to be implemented by the FIPS
> mode. Some newer secure ciphers can yet be unaccepted in a FIPS
> standard. FIPS doesn't mean highest security. It just means the FIPS
> standard.
> 
> On Fri, Mar 18, 2022 at 8:36 PM Andrew Bartlett <abartlet@samba.org>
> wrote:
> > Correct, Samba can't be FIPS compliant, but we can avoid using
> > known
> > 
> > poor cryptography not for certification purposes, but for sensible
> > 
> > 'secure by default' or at least 'can be configured to be sensibly
> > 
> > secure' design principles. 
> > 
> > 
> > 
> > Just as you wouldn't offer SSLv3 even when the host is not FIPS-140
> > 
> > certified.
> > 
> > 
> > 
> > Samba's CI system runs on a Ubuntu 20.04 base for the majority of
> > the
> > 
> > tests (as mentioned, we run a tiny number of tests in a Fedora 35
> > 
> > environment to test "FIPS mode"), but most importantly the final
> > 
> > autobuild is under the Ubuntu 20.04 platform, so we should ensure
> > that
> > 
> > our tests are run there when possible.
> > 
> > 
> > 
> > I'm quite disappointed at the "FIPS mode" in GnuTLS is optional in
> > this
> > 
> > way - also denying any application or administrator the opportunity
> > to
> > 
> > opt out of weak ciphers on a per-app basis - but that is life.
> > 
> > 
> > 
> > Andrew Bartlett
> > 
> > 
> > 
> > On Fri, 2022-03-18 at 12:07 +0200, Aleksandar Kostadinov via samba-
> > 
> > technical wrote:
> > 
> > > How can samba be FIPS compliant on a non-FIPS compliant operating
> > system?
> > 
> > > Might be easier to just run the tests in a FIPS compliant
> > environment.
> > 
> > 
> > 
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba
Samba Development and Support, Catalyst IT - Expert Open SourceSolutions
