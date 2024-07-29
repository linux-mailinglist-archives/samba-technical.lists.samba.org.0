Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D7393F869
	for <lists+samba-technical@lfdr.de>; Mon, 29 Jul 2024 16:40:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=8EgDhpBAW0aaatfGeiuI8ml6BHhtlp4kctmmOwYnLdM=; b=fz/Z5ZwgWJHAk/viK7HfoqDfeX
	RzEgMXLJ07hbmHmdNBxzyWLfI1kglsW9Ax8KMQbHM2x9mRRElpSekM9tqq7nJSfo9XjFqerhujJps
	cFtDX1hItYfxqq3WUzUUUU1abTRQ/3Aqcwo6fg3rE6+bPkllibCOIU1OtkLX0qh8IZ4xYpvmE7zG+
	S5/PF6tDB1MgFexb3TXdOE8CQokxBMADunIbGTbQQDGdpuLcyi/g7XNfaqBG1SIlb+zw4+PPz0bbK
	GwyKMsb3WJhADcWQQmKBLxhpnM55k+OYWmOsYhSwAdUH0QOjs1EJLhU7gvTV1NBdB03hMTOrmFb9m
	N5YHJlDA==;
Received: from ip6-localhost ([::1]:32896 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sYRY9-001l0U-KL; Mon, 29 Jul 2024 14:40:33 +0000
Received: from relay3.ptmail.sapo.pt ([212.55.154.23]:42348) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sYRY4-001l0N-QS
 for samba-technical@lists.samba.org; Mon, 29 Jul 2024 14:40:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapo.pt;
 s=sapo20240325; t=1722264023;
 bh=8EgDhpBAW0aaatfGeiuI8ml6BHhtlp4kctmmOwYnLdM=;
 h=From:To:References:In-Reply-To:Subject:Date:From;
 b=nkaGj+MNZXns8BHGjPthRc13d/xv9S8ByUAhCoekhtKA/Ibhlzk6/PpRgmCe8SxWv
 BASTllCY3MmPdaDsQTqiT8T2N9x4ySpzBBWlqghah7kWOPKsI2gz81RLQNB2e5QT8C
 08tLpcav3jn/YYMCKBhLnoE1A/tWtBHw/Ll9e9o4XHmIFdrys9JweGJpXC4a6wxa4M
 vrueeP/I/KbFBJPsQpJHopFl6kl86QHmQEUTDTbRJuYxP2fsgenfGjVTeRVYsvNQA0
 +jTBD3e9EccFsf/D312bcY17nZHQg38H18HkJ2ZVICSGA64i92Q8pgrCXVFUU9Vva1
 EffJuEBKA2yvA==
Received: from sapo.pt (unknown [10.134.36.76])
 by relay3.ptmail.sapo.pt (Postfix) with ESMTPS id 91850B55D9A
 for <samba-technical@lists.samba.org>; Mon, 29 Jul 2024 15:40:23 +0100 (WEST)
Received: (qmail 7582 invoked from network); 29 Jul 2024 14:40:24 -0000
Received: from Sepher3 (unknown medalist@sapo.pt@[85.246.65.64])
 (envelope-sender <medalist@sapo.pt>)
 by ptmail-mta-auth02 (qmail-ptmail-1.0.0) with ESMTPSA
 for <samba-technical@lists.samba.org>; 29 Jul 2024 14:40:24 -0000
X-PTMail-RemoteIP: 85.246.65.64
X-PTMail-AllowedSender-Action: 
X-PTMail-Service: default
To: <samba-technical@lists.samba.org>
References: 
In-Reply-To: 
Subject: RE: Error messages and how they are presented to the common sysadmin
Date: Mon, 29 Jul 2024 15:40:24 +0100
Message-ID: <024801dae1c5$3f36bdd0$bda43970$@sapo.pt>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQLlw2jM+uJtaaG585LO/K7h3FyfFa/3/qZg
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

INFO : Operation unavailable without authentication

Or even:

INFO : Operation unavailable without authentication
LDAP error 1 LDAP_OPERATIONS_ERROR

The rest?

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

As much as I appreciate it, why would I care at this moment? I'm too busy,
and sometimes even afraid, to look at that now.

Maybe different levels of messages, activating on build through a switch.
People who need the second part can build Samba to their specification. The
others would plunge in their world of silence, or the music after a while
created from the patterns that are forming from the beatings of the" noises"
from of all those fans and disks...

Or is this already available and am I the one here not seeing it?

Regards


-----Original Message-----
From: miguel medalha [mailto:medalist@sapo.pt] 
Sent: 29 de julho de 2024 15:21
To: samba-technical@lists.samba.org
Subject: Error messages and how they are presented to the common sysadmin

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



