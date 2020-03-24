Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 047E71908E8
	for <lists+samba-technical@lfdr.de>; Tue, 24 Mar 2020 10:17:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=fzFUUAJEM4Ig6/vZKksgU40fzq68yfqcTEp2OPSQFgM=; b=xFDcpM56W5YKy3yFCEZqaV6CNE
	I7Zzz6QjanpGpsGLedvP/VMRGOJCtsW0JdRlALBxn3aoMKcxQR9Q6hDHHjh4xMwqNcO3RxiKDjYM9
	1tJApOfIIn9K7IDpfw5X55hoenVIItErGKRjrYjZvun9NKa7Ftp6oDBquLmmNKHiLyaXt8xXsq80N
	TAUhR5QhDhvlDCFBX+tJPyfbujkY9iu4DHH1vMc10ZDIDJmUM18TfH+CtnVd1UjXgVxp7sv3G8sLM
	e3vmsq9RirouWj+CPFtYpJH4c+SFGY4TwXCYfOr3nHJCKJ/SGbHaqNrtvSvrEyEukguKz37qY7aki
	0MANHakQ==;
Received: from localhost ([::1]:26408 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jGfgK-000XET-FK; Tue, 24 Mar 2020 09:17:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52370) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jGfgF-000XEB-3S
 for samba-technical@lists.samba.org; Tue, 24 Mar 2020 09:17:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=fzFUUAJEM4Ig6/vZKksgU40fzq68yfqcTEp2OPSQFgM=; b=XTJSgr5MIW7o48pUOlfa3JQJbR
 Wxpy9lr5dUNZnkrzMp4WZbfGz3tIoYU5cBNayFDgorC8pmh2Pv7fd3m9n7AB9aJfO6ascjx3/GqmF
 AgUetMhjELjWDQbu/sWMwAgXHP/ge8+EyOe+MtW8WwGr5Q1mCMxIUN2SIbpkuwih7+T1UneYoF5kZ
 5VhK1sbnfkBobTZaX1nL0QjHHmThFVHQDQZjoLZ8voVGewJ3wB6N6cB73qOX3QQzY2NwS53sVwnAl
 QfH1OGdF/d/F2BEE6RzEH9LbvPQ/uIzj6hPftZpgkZ1kDmVtdn4+M6grU/OXAB2KHqvuElrMwGeoo
 37HyDxogPeYwJCmMeSB7UoCzyjhyLvIxrWov6xPf/yBBwE9+pniRpWcA129eh4sMXIgc/RtdhAMNX
 9LpcJwys+ToewBAdF0ujTpbT5TAuGJ0jnvHHRLhRme++Omn5V7vNNOpFJOhgTvJSLKCapdWUGynSE
 UlA7BjHXaslNuNpDsxFInSe+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jGfgE-00044Z-Hy; Tue, 24 Mar 2020 09:17:02 +0000
To: samba-technical@lists.samba.org
Subject: Re: Flapping drs replica_sync test
Date: Tue, 24 Mar 2020 10:17:02 +0100
Message-ID: <3194063.E29luVxSUP@magrathea>
In-Reply-To: <1654325.iZmO6VesHS@magrathea>
References: <1654325.iZmO6VesHS@magrathea>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, 24 March 2020 10:15:31 CET Andreas Schneider via samba-technical 
wrote:
> Hello,
> 
> the samba-ad-dc4 job fails for me very often in CI and always with the same

It is samba-ad-dc-2 ...

> error:
> 
> UNEXPECTED(error):
> samba4.drs.replica_sync.python(vampire_dc).replica_sync.DrsReplicaSyncTestCa
> se.test_ReplConflictsRemoteWin_with_child(vampire_dc:local) REASON:
> Exception: Exception: Traceback (most recent call last):
>   File "/tmp/samba-testbase/b21/samba-ad-dc-2/source4/torture/drs/python/
> replica_sync.py", line 278, in test_ReplConflictsRemoteWin_with_child
>     self.ou2 = self._create_ou(self.ldb_dc2, "OU=Test Parent Remote
> Conflict") File
> "/tmp/samba-testbase/b21/samba-ad-dc-2/source4/torture/drs/python/
> replica_sync.py", line 126, in _create_ou
>     samdb.add_ldif(ldif)
>   File "bin/python/samba/__init__.py", line 230, in add_ldif
>     self.add(msg, controls)
> _ldb.LdbError: (68, 'LDAP error 68 LDAP_ENTRY_ALREADY_EXISTS -  <Entry
> OU=Test Parent Remote
> Conflict,OU=replica_sync1279459,DC=samba,DC=example,DC=com already exists>
> <>')
> FAILED (0 failures, 1 errors and 0 unexpected successes in 0 testsuites)
> 
> 
> Why does that entry already exist? Missing cleanup or timing issue?
> 
> 
> 
> 	Andreas


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



