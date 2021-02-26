Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 173F6326703
	for <lists+samba-technical@lfdr.de>; Fri, 26 Feb 2021 19:41:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=oOcqODUDKCm18TFCF1ZBYCu0GeQ7pxgs5kp3lpQZ6EY=; b=BIxlGojjURCTS6wlzdkQhg2PU0
	yP5s23/ZbxS+kRLYAcW1rpve9tNKxjGdmMDjAsCkzxVYIV8xBcbm5BkRAz/G1pYCasB9LPpKVlsxV
	VG7BfXFL948nHt3UL7Xt/BBGqUhIA+cliAw5goVuAWXmsKYpg+KNd0QEebz4hvkgU60gGpgl3Z9eJ
	9i1aA6n9SUis33zh01e5dpdT7/GMe3w8bpSmADYxj9a2c2+MEy+eYoWjSnHPM1vwP5qGoT0/4L06u
	bNAlJSzffATeXFCzJXMP2rKvBDQtKqGuvP30P1G45O2s1HdEWZhWldoMPencj1wqFZHqZADN6L6B2
	hG8ZKDEQ==;
Received: from ip6-localhost ([::1]:61616 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lFi2g-001cz1-3t; Fri, 26 Feb 2021 18:40:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47676) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lFi2b-001cyu-DC
 for samba-technical@lists.samba.org; Fri, 26 Feb 2021 18:40:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=oOcqODUDKCm18TFCF1ZBYCu0GeQ7pxgs5kp3lpQZ6EY=; b=FEzYvwYlt2q/nQ8ck12Hk0EeFX
 +S4WMHEIZZLtCFtJC9QvlUPw9X+ynkma7sZGlIdKi0ti/hLZMdDx5Vg5eiW4KDtY9cc7ZvU2GLeq+
 TwdLJ2dZesTMG+mYwVWi5x2/d3/h8ffknyfjt2oLnERPYeB1xy0tcjbwJXYE/btmXsUiSO5Kv5izB
 XpSsjbVaYKjur1HDyWp2tBd0rW1WcgpTarBQ9moXNIZXHvrXrpDnAxDqC3hZaA2/nBRZEM7183mu5
 QeXau56zlfxnFn6U4zobtErfCdULFeZ8W9mSOA2zzDmXQFGY+4HZl8PNc29UF2owI3XWQ4bjPbFZy
 vW/c3iWr0D6ClurXd3DCDxMPWrnUvaAbkhAAivPRJWOd5I55cVuu7zq6QdkeA6g9oYtIVRc2gov2t
 6gBQAlaEwjES+LckcYykotiRve6P89EiCnoke05OJtF6/MqAFAL9e4sEHf/E4ISqwbyuXGr0HcGF1
 jvziph6d5HRN9RBtMN+CEGSB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lFi2a-0001LE-63; Fri, 26 Feb 2021 18:40:40 +0000
Date: Fri, 26 Feb 2021 10:40:37 -0800
To: =?iso-8859-1?Q?Aur=E9lien?= Aptel <aaptel@suse.com>,
 Steve French <smfrench@gmail.com>, samba-technical@lists.samba.org
Subject: Re: flock possibly missing in SMB3 POSIX extensions?
Message-ID: <20210226184037.GB94004@jeremy-acer>
References: <878s7aztu8.fsf@suse.com>
 <20210226181702.GA94004@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210226181702.GA94004@jeremy-acer>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Feb 26, 2021 at 10:17:02AM -0800, Jeremy Allison via samba-technical wrote:
>On Fri, Feb 26, 2021 at 05:17:51PM +0100, Aurélien Aptel via samba-technical wrote:
>>Hi,
>>
>>While debugging cifs.ko customer issues we found that flock(2) seems to
>>be impossible to properly emulate using SMB.
>>
>>On first sight it looks like they could be emulated with SMB locks but
>>the main difference is that FLOCKs are completely advisory, the application
>>is free to ignore them and sucessfully do read/write, whereas with SMB
>>locks WRITE/READ will fail on locked areas.
>>
>>The flock syscall is avaible on most unixes so it would make sense to
>>support it I think. Maybe via a special flag for LOCK.
>>
>>Given the number of options to control locking behaviour in Samba and
>>given how NFS doesn't support it properly either maybe there are
>>problems I'm not seeing.
>
>Yes, flock has historically not been part of UNIX
>extensions. I think you *could* emulate it by converting
>them into UNIX extension fcntl locks over the whole
>file.
>
>Indeed, from man 2 flock:
>
>       Since  Linux 2.6.12, NFS clients support flock() locks by emulating them as fcntl(2) byte-range locks
>       on the entire file.  This means that fcntl(2) and flock() locks do interact  with  one  another  over
>       NFS.  It also means that in order to place an exclusive lock, the file must be opened for writing.

So the plan would be once a file is opened with a POSIX
context, emulate flock(2) by getting a byte-range lock
on the whole file. For a POSIX context this is an
advisory lock.

This matches what NFS does, and applications using
flock are usually not also using fcntl locks.

I'd rather not add "special" extra flags to the
protocol that need extra logic to implement. The
locking part is complex enough in SMB1/2/3, and
as NFS shows it's possible to emulate using advisory
byte-range locks anyway.

Of course this doesn't help SMB2+ without UNIX
extensions, but there are many POSIX things that
won't work there anyway :-).

