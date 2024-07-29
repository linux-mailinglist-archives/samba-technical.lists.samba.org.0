Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B56893F783
	for <lists+samba-technical@lfdr.de>; Mon, 29 Jul 2024 16:22:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=fnvzz3gQTaWiCgrh6+3ebwt/Yh57AOkIt99ZlvG6sfk=; b=fLc4WyShEt0R/pibXJ0r2sGhEF
	+SFSdKfj1kxvxiF+k1VkrsXGox9/NCAlleM/6xS7N6AsVCfsh5fQqo8nbJoUhr9dMXLV010nKH2x6
	JlRqQ+sjGP/pBq81sktCkOQytimJjf+f/C/8eXJeMzrY/DNg6qj+aBJr63oc72f0/jwTqEG2SKM5C
	Sk/6pzejZknrYMA0gmHbPGDNVq4AicwnHf2Cq5OmoSFEuJIJhEXRY2xHQzfQs+6bHZVbNUiKwqAwY
	KJoTHEGPRKU+DqVbJeqHuFyAMAaIxvlZlrsLKIGwwM/qKVP0+Wnpcz9nlrqc41dBdI+kjFQ9Eufty
	N4GP9xSA==;
Received: from ip6-localhost ([::1]:25316 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sYRFi-001kuR-Aw; Mon, 29 Jul 2024 14:21:30 +0000
Received: from relay4.ptmail.sapo.pt ([212.55.154.24]:36922) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sYRFd-001kuK-3w
 for samba-technical@lists.samba.org; Mon, 29 Jul 2024 14:21:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapo.pt;
 s=sapo20240325; t=1722262879;
 bh=fnvzz3gQTaWiCgrh6+3ebwt/Yh57AOkIt99ZlvG6sfk=;
 h=From:To:Subject:Date:From;
 b=eTApkcSk71mWHeaJlcx0pR56BHZWXiyb5S//zeqwUQEeZPtYSbJ/jVzHP+E4fv7v+
 siP1c2RaFfnCsMoUb1egQ7TXkG8dmyE7cFoSLvpoqBL4C6H0MFp9Q5Q3LBhT3LQXM0
 YACOscQe+OavVus2xYRkjTkHw1K7Id6CWVaqF80w5MMcfyMjlS8e35G7pErgdc0UOo
 faFpcj/kglGLUnIXA6fgUahN70zIbq+KnHkKC/04S+3bXEPpyylcbheIK/JBYM/lu3
 U+uwwP6ukv2tvXrQAUdZMwNsOyTDSHsn3ZEpvpiHJ+b8gStMAe3NfHCE+mVBFgeEDS
 xJ8QOy1ltz9gA==
Received: from sapo.pt (unknown [10.134.36.76])
 by relay4.ptmail.sapo.pt (Postfix) with ESMTPS id 20164B54D71
 for <samba-technical@lists.samba.org>; Mon, 29 Jul 2024 15:21:19 +0100 (WEST)
Received: (qmail 17586 invoked from network); 29 Jul 2024 14:21:20 -0000
Received: from Sepher3 (unknown medalist@sapo.pt@[85.246.65.64])
 (envelope-sender <medalist@sapo.pt>)
 by ptmail-mta-auth02 (qmail-ptmail-1.0.0) with ESMTPSA
 for <samba-technical@lists.samba.org>; 29 Jul 2024 14:21:20 -0000
X-PTMail-RemoteIP: 85.246.65.64
X-PTMail-AllowedSender-Action: 
X-PTMail-Service: default
To: <samba-technical@lists.samba.org>
Subject: Error messages and how they are presented to the common sysadmin
Date: Mon, 29 Jul 2024 15:21:20 +0100
Message-ID: <024001dae1c2$95732fb0$c0598f10$@sapo.pt>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AdrhwSU+lsqXQipSTaaPcYWxH9ITIQ==
Content-Language: pt
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
From: miguel medalha via samba-technical <samba-technical@lists.samba.org>
Reply-To: miguel medalha <medalist@sapo.pt>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I thought that I could bring some contribute here about the usability of
Samba.

While using 'samba-tool dns', I received the following message:

ERROR(ldb): uncaught exception - LDAP error 1 LDAP_OPERATIONS_ERROR -
<00002020: Operation unavailable without authentication> <>
  File
"/usr/local/samba/lib64/python3.9/site-packages/samba/netcmd/__init__.py",
line 285, in _run
    return self.run(*args, **kwargs)
  File "/usr/local/samba/lib64/python3.9/site-packages/samba/netcmd/dns.py",
line 1375, in run
    remove_dc.remove_dns_references(samdb, logger, dnshostname,
  File "/usr/local/samba/lib64/python3.9/site-packages/samba/remove_dc.py",
line 101, in remove_dns_references
    zones = samdb.search(base="", scope=ldb.SCOPE_SUBTREE,

This message contains a lot of information that is useful only to coders.
The common systems administrator will embark on too long a journey through
all that haystack in search of the needle he desperately needs:

ERROR : Operation unavailable without authentication

Or even:

INFO : Operation unavailable without authentication

Is there currently some manner of building Samba in such a way that the
common, non-developer, sysadmin, can uncomplicate his already complicated
life?

That would be a marvelous gift.

Thank you and good work!

I love Samba



