Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8281A53C8A8
	for <lists+samba-technical@lfdr.de>; Fri,  3 Jun 2022 12:29:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=eWXiyc9LStyyNa8STW3211q+kbm1aId3wTEJ2kmmlWk=; b=E60l7R/gxgc7Nmo0SyAoTJziAH
	FjYywuxJbVVf0Z5mnM4DbHYFDoE3Fp2oBH+q06X9qOD5hQk72w5oT+wc8dCZ7UfvluuwXaUlZ1/Um
	tZ7rrDaVvdjYT5caj0imHlolrIiks/fJdmZ+fZLet+pTzXiXqtXVjwO7FOgLUeVp1WBMomzTAtOpi
	z/hPXKeAuB0oQWpolONfI+jH+ptbqnHLHFMPlcpPYiMktNSDINSjmwVw+3Ifr8s0CgcddL1frDFgj
	w169xnVk0MZE4lu2xdwjzSUrdwnMxhWLMTpXNCukrrk8/CN1f5auWVPWv+RH4yNLhfQu0IpiYTn2D
	0az2Gx5w==;
Received: from ip6-localhost ([::1]:40182 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nx4Yh-006pWj-4f; Fri, 03 Jun 2022 10:29:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61988) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nx4Yc-006pWa-HP
 for samba-technical@lists.samba.org; Fri, 03 Jun 2022 10:29:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=eWXiyc9LStyyNa8STW3211q+kbm1aId3wTEJ2kmmlWk=; b=rzhRJEnwEttjE5crsTn8U511BK
 Qb4brYKx1Fv+MJf29sV3slxV/I0XfAHrgi/v2dee1awg3Ki574CKvrmC8ZeGndkQfJ31qdsEb9gdS
 c6HG1NCkouEMpmrLzeRC4f40SGt0aFOQsSkABBBPNh/ji2V0Zf72wfue7rOnDc2RQNLnqoxX7qnOM
 XxlFMuqJCPCAEDOokXlz2+l2mfAoUvsWKojjs97Sp2nQLRGha2k43mrtMO9u1ZkoicfblprK8TMEP
 xmnModlaOjvD90quhossdkxNXJfb+T+1e6aheHAD1DTc5lpH7G4MaecdbfEdAAjCSc6YImJnwrfc3
 NpT3oc74/2MGY2rNnaAgcwEbf2Qa9+qRVwdPp3BU/mqOLDUmXLcCITVDpZ+HzKx3xDe6ebQLlv+Ns
 GaD9inAZvM0XBSrU385OiQFm8phbiISvW/1mi4wjM/2zD9MFNIa2eMzWczumVxQSX31tpwSG01gqR
 MG69tAwCRf4oaWJggssdxgNN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nx4Yb-003pB4-Bs; Fri, 03 Jun 2022 10:29:29 +0000
Date: Fri, 3 Jun 2022 13:29:26 +0300
To: scabrero@samba.org
Subject: Re: Reintroduce netgroups support?
Message-ID: <YpnihosjSq1oalmK@pinega.vda.li>
References: <7b6cb695be2fe801b2e10139eaf84873e6578fea.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b6cb695be2fe801b2e10139eaf84873e6578fea.camel@samba.org>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On pe, 03 kesä 2022, Samuel Cabrero via samba-technical wrote:
> Hi,
> 
> I have received some complains after we dropped netgroups support in
> Samba 4.15.0. Our release notes only mention we dropped NIS but
> netgroups went with it.
> 
> Some people still use netgroups without NIS, stored in LDAP and made
> available to the system through nss_sss, but it is also possible to use
> /etc/netgroups.
> 
> I had a look to the removed code and I think it is possible to
> reintroduce netgroups support independently from NIS, using the
> getdomainname() function from glibc instead of yp_get_default_domain()
> from libnsl. 
> 
> Should we bring back netgroups support?

When we were discussing removal of NIS support from Fedora 36 last year,
I did some research as FreeIPA does provide NIS server simulation.

-----------------------------------
FreeIPA does depend on nisdomainname utility (part of hostname package).

SUDO depends on the correct value returned from getdomainname() in order
to support netgroups in LDAP-stored SUDO rules. Same rules are
implemented by FreeIPA and SSSD.

However, I think this is *not* deprecated technology question. Domain
name information is the part of UTS information in the kernel.

According to glibc implementation, getdomainname() pulls the domain name
from uname() syscall:
https://sourceware.org/git/?p=glibc.git;a=blob;f=misc/getdomain.c;h=09bb3b0e2cc214b406387294ad90b3c01e2d9a71;hb=HEAD

where 'domainname' is GNU extension. It represents a name of the domain
this host belongs to. Note that the domain name itself is not a DNS
domain name as it represents a higher abstraction level entity which can
be roughly mapped to a whole IPA or AD domain. This is how we actually
are using it in FreeIPA.

Someone has to set the domain name upon startup. So far, only
nisdomainname tool was doing that. If that is removed, then SUDO will
definitely break.

This does not require presence of NIS infrastructure but does require
properly configured NIS domain name on each client. Which means we must be
able to continue configuring NIS domain name.
------------------------------------

So Samba definitely can rely on getdomainname() to provide the same
functionality.

The question is more towards distributions: who would set the domain
name? Original Debian's package for 'hostname' does not provide any
method to call 'hostname -y' or 'nisdomainname' to set the domain name
system-wide. Same with 'net-tools' version.

Fedora and openSUSE do have a systemd service, nis-domainname.service,
that automate setting a domain name from /etc/sysconfig/network or
/etc/sysconfig/network/config, depending on a distro flavor.

It looks like Debian-based distributions already broken with regards to
netgroups support as they have no means automatically set the NIS domain
name.

-- 
/ Alexander Bokovoy

