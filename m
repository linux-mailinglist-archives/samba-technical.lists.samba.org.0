Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D866E14B5
	for <lists+samba-technical@lfdr.de>; Thu, 13 Apr 2023 20:57:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=kVOyE8wWnUe9+gTmtkCXgA6cy20JwFSpH6q8zseK6qE=; b=vvsKmKYzfW2LWJMUU3yDwIhTo2
	w6xAb9YiIhKLLaENGa/LzGVbPwEj3yk8Fkd2VEkbIjX6LTRrOoEPF8P4QBQ8ptnqnQy4AslxRE3ku
	rG6wwHn0r4fVyf72b7KPD5N5rkUwQAzNOLmk0Pyp64pUVwJndUJCFdceKQs7ojCGHim/sIGDvTnBT
	e/3f+pIQf2HP0RLtqzPpUB3axCLpoYVxeTla5XMsUPMuBH+Ixw/p1359qf7ud3ksq57btDFfv0FnC
	Ske0ZTJlnF2kGEiGuyXrxJntCMcImWDL5Z2qDo4g95Jf5MoYhUozsvOdgxhU+0NXGUZUn1ZVIziK1
	Q7QS2MUQ==;
Received: from ip6-localhost ([::1]:37040 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pn27r-001AdN-UT; Thu, 13 Apr 2023 18:56:55 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:40635) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pn27n-001AdE-Pm
 for samba-technical@lists.samba.org; Thu, 13 Apr 2023 18:56:54 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id BAF5F4012D
 for <samba-technical@lists.samba.org>; Thu, 13 Apr 2023 21:56:49 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 6A1451FD
 for <samba-technical@lists.samba.org>; Thu, 13 Apr 2023 21:56:48 +0300 (MSK)
Message-ID: <0be5f27e-1b25-b756-66c1-9e5034920e7f@msgid.tls.msk.ru>
Date: Thu, 13 Apr 2023 21:56:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>
Subject: smbd tries to read ~root/* files
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

While debugging an unrelated issue, I noticed some interesting things
in smbd strace.  Here's one example:

getpid()                                = 1078652
getuid()                                = 0
openat(AT_FDCWD, "/etc/passwd", O_RDONLY|O_CLOEXEC) = 4
lseek(4, 0, SEEK_CUR)                   = 0
fstat(4, {st_mode=S_IFREG|0644, st_size=5976, ...}) = 0
read(4, "root:x:0:0:root:/root:/bin/bash"..., 4096) = 4096
close(4)                                = 0
openat(AT_FDCWD, "/etc/passwd", O_RDONLY|O_CLOEXEC) = 4
lseek(4, 0, SEEK_CUR)                   = 0
fstat(4, {st_mode=S_IFREG|0644, st_size=5976, ...}) = 0
read(4, "root:x:0:0:root:/root:/bin/bash"..., 4096) = 4096
close(4)                                = 0
openat(AT_FDCWD, "/root/.krb5/config", O_RDONLY) = -1 ENOENT
openat(AT_FDCWD, "/etc/krb5.conf", O_RDONLY) = 4
fstat(4, {st_mode=S_IFREG|0644, st_size=480, ...}) = 0
fstat(4, {st_mode=S_IFREG|0644, st_size=480, ...}) = 0
read(4, "[libdefaults]\n"..., 4096) = 480

I *guess* one of those 2 /etc/passwd reads comes from getpwuid(0).
And the next thing it does is trying to open /root/.krb5/config.
Note the current uid of the process is 0, so it *can* open such
(secret) file if it existed.

Another similar example:

getuid()                                = 0
openat(AT_FDCWD, "/etc/passwd", O_RDONLY|O_CLOEXEC) = 29
lseek(29, 0, SEEK_CUR)                  = 0
fstat(29, {st_mode=S_IFREG|0644, st_size=5976, ...}) = 0
read(29, "root:x:0:0:root:/root:/bin/bash\n"..., 4096) = 4096
close(29)                               = 0
openat(AT_FDCWD, "/etc/passwd", O_RDONLY|O_CLOEXEC) = 29
lseek(29, 0, SEEK_CUR)                  = 0
fstat(29, {st_mode=S_IFREG|0644, st_size=5976, ...}) = 0
read(29, "root:x:0:0:root:/root:/bin/bash\n"..., 4096) = 4096
close(29)                               = 0
openat(AT_FDCWD, "/root/.hx509/config", O_RDONLY) = -1 ENOENT
openat(AT_FDCWD, "/etc/hx509.conf", O_RDONLY) = -1 ENOENT

I *guess* this comes from heimdal code (but I might be wrong),
and I think this is quite wrong to use ~root for samba configuration.


This stuff is repeated over and over again while smbd is running.
Note again: this is smbd, a file server process, while serving
files of a random regular user on the system, - it should not be
doing anything with files on home dir of another, especially
privileged, user.

This might be, at the very least, quite unexpected, - once
there's something in root's configs, samba will do stuff not
configured in smb.conf?

/mjt

