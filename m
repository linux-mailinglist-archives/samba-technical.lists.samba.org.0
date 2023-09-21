Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C61E7A92DD
	for <lists+samba-technical@lfdr.de>; Thu, 21 Sep 2023 10:55:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=SnbRN7wo49XI77QAFPJAlGfCsVsY/lWrHGKPNiRuJeE=; b=uGSdZvt9leegARESztEV2o4Oa2
	uwiXkPUGxNEOggR3k9R38wrbTYNTfzGm9uRQpT4D5hcnKcRAtwuLLCbbD4cHUgM8MLXwG59FLYBB/
	x6aXI/wby5wZgpW8dAjGomT90K82/L/A5Aa6CKYEv4br0VqhYIwZFpttzfq8ERPATXOgrBLrXSs8O
	eDnRl6ufHA4PYXV+de0VnOjkL8f8P/MqC1A205CxsZI+XMcnPXFM5A0l4p0SDyce/nirkk9xVmxT9
	ucIuX7f6PTnZxC9AojGmq+BYX6wVysrgzuWloP0/rJHKYBJXl4AOLDbacDTAoJ4K2hDHwqcvTeEG/
	nR/zcRew==;
Received: from ip6-localhost ([::1]:22540 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qjFSg-005ZnL-A7; Thu, 21 Sep 2023 08:55:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50524) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qjFSa-005ZnC-8s
 for samba-technical@lists.samba.org; Thu, 21 Sep 2023 08:54:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=SnbRN7wo49XI77QAFPJAlGfCsVsY/lWrHGKPNiRuJeE=; b=NBUNPhxLFKbr7MkaPI6huT/8sG
 13oQzhD7+4UkvKfry6zIvpM3J6cmmTbfX6VfGQ4EjDhA9+G/uwIyJb0gJ/qLGyjDmBk9eURXX+hec
 OGTH229GNsqt73kXhX0d0tPFyfYlb8bMeB9c2D67fa70bVnQoGIt320AwvqyjSYdNXvSywXBFssqn
 H6O2Pm5gubDV1ogWCv/0Hawib3HBxK4q+Sd0HSl/IX1lsSkTmiXRWI2gHLA8ylNQBbZJeWto2nuch
 Jn8p+q6NeeJO2cV+es5qiWDSgVu8Ddn2c7lM1/5xkASwHTqUWpnFzC4ZCn1gLjKPkO+UTKpVGZ2pn
 4vjD0/FADYSs/+b8eJpYikpzuMhaRyxsXT3A1tpNtTnqUoxTvZt7GD8N9X2xzggCNhXw54Tj0AV72
 WSyqoce4hLWuOgqfhB7sX+VQXyEMC9MF2IrXeR3CV106YtcsQ7NU51GyWEgCdykxZgqOtQLGqKrJP
 4iT5lkR5UrpP+2fzIpnmjXGP;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qjFSW-00Ee4B-32; Thu, 21 Sep 2023 08:54:53 +0000
Date: Thu, 21 Sep 2023 11:53:21 +0300
To: =?utf-8?B?SmnFmcOtIMWgYcWhZWs=?= - Solaris Prague <jiri.sasek@oracle.com>
Subject: Re: How modern Samba handle krb5?
Message-ID: <ZQwEgdmLKEadm6f5@toolbox>
References: <85be042b-f13e-2280-e0aa-5d074fd3e4c6@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85be042b-f13e-2280-e0aa-5d074fd3e4c6@oracle.com>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Чцв, 21 вер 2023, Jiří Šašek - Solaris Prague via samba-technical wrote:
> Hi Experts,
> While sniffing packets I have found "net ads join" and "winbindd" handles
> krb5 by such strange way:
> 
> No.	Time	Source	Destination	Protocol	Info
> 47	38.477244	10.163.87.117	10.163.87.58	KRB5	AS-REQ
> 48	38.478496	10.163.87.58	10.163.87.117	KRB5	KRB Error:
> KRB5KDC_ERR_PREAUTH_REQUIRED
> 49	38.479156	10.163.87.117	10.163.87.58	DNS	Standard query 0x439f URI
> _kerberos.SMBSETUP.CZECH.SUN.COM
> 50	38.479597	10.163.87.58	10.163.87.117	DNS	Standard query response 0x439f
> No such name URI _kerberos.SMBSETUP.CZECH.SUN.COM SOA
> win-lqmsb4eue0v.smbsetup.czech.sun.com
> 51	38.479833	10.163.87.117	10.163.87.58	DNS	Standard query 0x0e56 SRV
> _kerberos-master._udp.SMBSETUP.CZECH.SUN.COM
> 52	38.480165	10.163.87.58	10.163.87.117	DNS	Standard query response 0x0e56
> No such name SRV _kerberos-master._udp.SMBSETUP.CZECH.SUN.COM SOA
> win-lqmsb4eue0v.smbsetup.czech.sun.com
> 53	38.480366	10.163.87.117	10.163.87.58	DNS	Standard query 0x50be SRV
> _kerberos-master._tcp.SMBSETUP.CZECH.SUN.COM
> 54	38.480658	10.163.87.58	10.163.87.117	DNS	Standard query response 0x50be
> No such name SRV _kerberos-master._tcp.SMBSETUP.CZECH.SUN.COM SOA
> win-lqmsb4eue0v.smbsetup.czech.sun.com
> 
> ...where Add-DnsServerResourceRecord do not support URI RR-type and also the
> _kerberos-master is not commonly supported in DC. Can Samba still work with
> Windows/based DC?
> 
> Older Samba releases were able to respond on err: preauth.required by
> preauthentication so I am curious why the modern Samba will fall into such
> madness in such case. Is there an option to rail even the modern Samba back?
> 
> Note: on Solaris I am pushed to use MIT krb5 API where my attempts to build
> Samba with Heimdal to check if it will not work breaks on conflicts with
> system headers.

URI-based discovery is part of MIT Kerberos handling of realm and KDC
discovery. Added in MIT Kerberos 1.15 or so, in 2016, to implement what
was later transformed into https://datatracker.ietf.org/doc/html/draft-ietf-kitten-krb-service-discovery

It has nothing to do with Samba and in general Active
Directory implementations do not support URI-based discovery, though
they probably should, for MS-KKDCP implementations be better
discoverable.

We use it actively in FreeIPA.


-- 
/ Alexander Bokovoy

