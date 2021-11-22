Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 713284588A0
	for <lists+samba-technical@lfdr.de>; Mon, 22 Nov 2021 05:29:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=i2AXMyrJ+RsIL3SGnRJxq6WgVkDeodTClLeDDrl+bOw=; b=qmMPj2gVAcWSORvdYe+N/Z+JZB
	eVJnEHQPiG8FH2N6T2TxOIssBspLq4UmLFuVpVsEPMePmw+qWaCSYoDfq7f4hgvQdOruUO3h5ypLZ
	CoTKW5bZFRXvqIJp7TlZLPDxLZYUXC3dVCsuPWBeVzciWJOUeGuRb1UPtuVK8VbDvtGxhoxaOdPrg
	+c5w5G8LQ0b+fi+AZa9pzSwIxLCvVU4QUpnOs9bf5qHug154Kg/IRA7i33h/2dZ58BSnZLihAWgto
	wLIJQQfRJqt50O9M00zZk3wc2TBDiePDLO2ZCUOtq3vIl+MATNzLmLBxH0sCPwCes6sc0+VOdkBJA
	ItNRHoGg==;
Received: from ip6-localhost ([::1]:56828 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mp0wN-003ZEK-Dv; Mon, 22 Nov 2021 04:28:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58422) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mp0wI-003ZE6-DF; Mon, 22 Nov 2021 04:28:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=i2AXMyrJ+RsIL3SGnRJxq6WgVkDeodTClLeDDrl+bOw=; b=djpi7cvlH3JguRh2IwzWaUL8/S
 GYL5/5/VdXMugLDu0L/8l1kOS9OQAXQoWsKrTwSSsQGQpZkFUtIfQoNtQR8AL9wA1AzsLgzlpY+gk
 s1fuTxQ4BwgHV8PDb34OWlG74O9VmoeBRjGFzAOXYFgZeKeytn9jwD1yyS0utqeUhq+aVD1fDyRG0
 orNBF3ll1yXKKrTGWne0i3hmp6MujO9+Q19X9hPpKnCFHYPPYEKcEbUQnBb00Batd168L1+S4S43T
 Bxu629g8UX1+/g0aQcFuhzmR9TAVg3Sepq6k4nECtE4zk2ThMkHlqbWHXnjIi6n64SFWuDXZny5+q
 /tTYayvoQ69RnKLB8NXu8EqD7gC+8HLnqgDsHvSPj69rxH4+4tuAGGgYXpEIG7tKeM15jY/zOAD8N
 9zRXoIkBpL+wdeZLukrwuuUX/pft8dBvWkn+4p+wra8OTkFEQ/d9ImQFS4jek0NSeV6eGW23Aaaky
 jPpEFWdzuFwnIUAsBi7Udzj1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mp0wG-008I3H-Vr; Mon, 22 Nov 2021 04:28:21 +0000
Message-ID: <c8187137526a42e9c370415ddcfa5aa1df2a6af3.camel@samba.org>
Subject: Partial mitigations for the Nov Samba CVEs
To: Debian Samba Maintainers <pkg-samba-maint@lists.alioth.debian.org>
Date: Mon, 22 Nov 2021 17:28:10 +1300
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
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
Cc: samba@lists.samba.org, seb@debian.org,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 "sathieu@debian.org" <sathieu@debian.org>, jmm@debian.org,
 Salvatore Bonaccorso <carnil@debian.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

G'Day Debian Developers and potentially other folks packaging Samba.  

A number of distributions have rightly been reluctant, particularly
given my warnings, to backport what patches for our recent issues to
older versions.  While a monster patch was generated for Samba 4.10,
Samba 4.9 and earlier only support Python2 and the modern testsuite
validating these changes is written targeting Python 3.6.

Regardless I've put some thought into what would be the barest of
minimal steps to mitigate the worst of the Samba CVEs issued recently

https://bugzilla.samba.org/show_bug.cgi?id=14564#c16
https://bugzilla.samba.org/show_bug.cgi?id=14561#c31

In short, for the cases where a full backport is not possible, it would
be good to at least take these patches from 
https://bugzilla.samba.org/show_bug.cgi?id=14725


CVE-2020-25722 Ensure the structural objectclass cannot be changed

CVE-2020-25722 dsdb: Restrict the setting of privileged attributes
during LDAP add/modify

The "CVE-2020-25722 Ensure the structural objectclass cannot be
changed" patch is for the AD DC the bit that changes this from "any
user can become domain admin" (really horrible) to "semi-privileged
users become domain admin" (bad, but not horrible), and is quite
isolated in terms of backport conflicts. 

I would note that for CVE-2020-25717 [SECURITY] A user on the domain
can become root on domain members
https://bugzilla.samba.org/show_bug.cgi?id=14556

Backports have been made to many, many versions.  This also includes
the patch:

CVE-2020-25717: auth/gensec: always require a PAC in domain mode (DC or
member)
That is very helpful on the AD DC for CVE-2020-25719, but there is
still much more to fix that issue if unprivileged users can create
other users.

I hope this helps,

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


