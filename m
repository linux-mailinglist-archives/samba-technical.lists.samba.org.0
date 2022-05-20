Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ED26C52F5C2
	for <lists+samba-technical@lfdr.de>; Sat, 21 May 2022 00:38:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=1pYifmp2fAi/C+NTeGbtKhmPW7zZnymiTifaYc5bz1M=; b=GSduy2iuYZ6Rym2zJq5KwVXqln
	37yxnPJuxzpw4FPqq0ETLYKEZF2zH23bIRhW10JxD+JEPvAGUyvR/3Z2235p60FiQZtN+8/m0Uf+w
	m3kmbs2xbGisKq3mLaHjOpg+rUZvmgwZztf5CQt41w11lTAKwycvp3/cWYlvTlPtIgNOG6Q/aGW+3
	NJLwzvK4TeCUHhzFkv2ssOjzrvDASM+5bpMzCvxHBvqrHwdnOIj+1T1+pcDeCFEcV3X0lkaAtB/ZH
	x2BKgTdTX5MB3LHqwnpb+q8enpmhERHkL6DS0srO58Y2jaSgas2lJCblNz01vwEAQrBNjTuRPvig9
	O+2n9Naw==;
Received: from ip6-localhost ([::1]:36598 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nsBGH-002KqF-PO; Fri, 20 May 2022 22:38:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61728) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nsBGB-002Kq5-On
 for samba-technical@lists.samba.org; Fri, 20 May 2022 22:38:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=1pYifmp2fAi/C+NTeGbtKhmPW7zZnymiTifaYc5bz1M=; b=EROefkf59CHDvKEZlSYDFd7p5X
 hjnWLga4PKOaj+ir5ghg7taN+c8sqg/sMowzsIL2rTCcXQQhn1AhBmPbJJ6n7qvqKd3Q/SrtavKEH
 4xdt4GSyLk3iU2afJlFzK1drl8pVMJIKOPN9h4xCpOyZg+2SiNOUJnbHtibSEpfRsF836MTJnbX98
 WIhXzJ7Ig+OFPGNCRbt6vayp7R17bdnJmpwnmY6zDRaPwA8vY8TzbONeroxVZHYe2K5qyUnnED100
 J7yoJ8047wuYwOEJ5TzRfe9qrvnh3l2VaA/kb4MZoxEkx3lIPB9GOKPM/E5jvy7kZBZIKw6tcA88C
 M9bl2xbTL1RRBtVJuCuod/vigWiX6l0lbbHfvdvkETqK26+AzmWWsGDcG+jOWd4/hXyqjWSyOhThk
 1++XjZIlytnGUJTd/mfCqgL8MF46dLc/rrY/Wo/xMZYEcb4Zgp9Igp3sujR4+UjmcBBjyLKITcHyH
 T8eQgwwLoJqMf7t2Nne/s4x4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nsBGA-001ptN-AW; Fri, 20 May 2022 22:38:15 +0000
Message-ID: <957f6a8362f2643902b839ae1defd02770ded806.camel@samba.org>
Subject: Re: ldap simple bind problem after upgrade from 4.14 to 4.15
To: "Dr." =?ISO-8859-1?Q?Hansj=F6rg?= Maurer <hansjoerg.maurer@itsd.de>, 
 "samba-technical@lists.samba.org (samba-technical@lists.samba.org)"
 <samba-technical@lists.samba.org>
Date: Sat, 21 May 2022 10:38:11 +1200
In-Reply-To: <e7d2c0a2-ce6c-e5a4-c100-f429acb0cb58@itsd.de>
References: <e7d2c0a2-ce6c-e5a4-c100-f429acb0cb58@itsd.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Fri, 2022-05-20 at 11:12 +0200, Dr. Hansjörg Maurer via samba-
technical wrote:
> Hi
> 
> we upgraded an 4.14.12  AD-DC to 4.15.7 and after the upgrade all LDAP 
> searches with simple bind failed with
> 
> A commandline  ldap search (working before, User and domaininformation 
> replaced) shows
> ldapsearch -x -D "CN=user,CN=Users,DC=xxx,DC=yyy,DC=de" -W -H 
> ldap://192.168.0.1:389 -b "CN=Users,DC=xxx,DC=yyy,DC=de" -s sub 'uid=ccc'
> Enter LDAP Password:
> ldap_bind: Invalid credentials (49)
>          additional info: 80090308: LdapErr: DSID-0C0903A9, comment: 
> AcceptSecurityContext error, data 531, v1db1
> 
> 
> 
> During the bind Samba  Logs  (User and domaininformation replaced as above)
> 
> 
>    {"timestamp": "2022-05-20T08:38:09.967130+0200", "type": 
> "Authentication", "Authentication": {"version": {"major": 1, "minor": 
> 2}, "eventId": 4625, "logonId": "0", "logonType": 8, "status": 
> "NT_STATUS_INVALID_WORKSTATION", "localAddress": "ipv4:192.168.0.1:389", 
> "remoteAddress": "ipv4:192.168.0.10:56620", "serviceDescription": 
> "LDAP", "authDescription": "simple bind", "clientDomain": "DOM", 
> "clientAccount": "CN=user,CN=Users,DC=xxx,DC=yyy,DC=de", "workstation": 
> "DC01", "becameAccount": null, "becameDomain": null, "becameSid": null, 
> "mappedAccount": "user", "mappedDomain": "DOM", "netlogonComputer": 
> null, "netlogonTrustAccount": null, "netlogonNegotiateFlags": 
> "0x00000000", "netlogonSecureChannelType": 0, "netlogonTrustAccountSid": 
> null, "passwordType": "Plaintext", "duration": 2301}}
> [2022/05/20 08:38:09.969011,  3] 

> The domain above is a rather old one, migrated from samba NT DC with 
> openldap backend many years ago
> 
> I tried to setup a fresh 4.14 AD-DC Testsysstem, migrated it to 4.15 and 
> the problem does not occur.
> 
> What does the
> NT_STATUS_INVALID_WORKSTATION mean and could the problem be DNS related?

Do you have a list of workations set in userWorkstations on this user?

For this version we fixed a bug with a crash in simple binds going to
winbind (RODC) and filled in a "workstation" for LDAP binds, which may
have meant this policy started to be enforced.

Andrew Bartlett


-- 
Andrew Bartlett (he/him)        https://samba.org/~abartlet/
Samba Team Member (since 2001)  https://samba.org
Samba Developer, Catalyst IT    https://catalyst.net.nz/services/samba


