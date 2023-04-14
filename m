Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A584F6E1D00
	for <lists+samba-technical@lfdr.de>; Fri, 14 Apr 2023 09:16:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=93Y5IeICrWicELv42wXo+fCjBZhpKMvQp9jCHTKXNVI=; b=p+jldgOkka5WnhblD53xTZtoPb
	VVapkjJtKGS3TJZ0C6f4fNZwb0DOPHuciMWTUCgs1UlTsBMWjXfY5mSs+Y2FLdQvh5BSqEGOTcSGT
	VEhbBRVPFYL07cJNSoPUrCa0X/mHesyN9jl3Adm/497aaNH/hfcUW9HUWy+o8YnSTdFQoK9zU2sRS
	aA2R0HCfetVled9VWr5nNTcl0LNTnUt2JurZFv9iSPRFSRMklc7f/ku7GjfB1L7fmpMU9omP1SMkL
	XEdqrRUlVI/373DEtb+fWnH4GJ5HbHi54rswDLEjsz1YOYXaAyWGmVWupC4ZQbGmQJuf83hl5PG5q
	kUDNlyNg==;
Received: from ip6-localhost ([::1]:62840 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pnDfN-001QtP-ON; Fri, 14 Apr 2023 07:16:18 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:49611) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pnDf6-001QtF-Fk
 for samba-technical@lists.samba.org; Fri, 14 Apr 2023 07:16:03 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id A0A0D40107
 for <samba-technical@lists.samba.org>; Fri, 14 Apr 2023 10:15:55 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 3CFEB95
 for <samba-technical@lists.samba.org>; Fri, 14 Apr 2023 10:15:55 +0300 (MSK)
Message-ID: <be86c050-570d-ccec-5a57-785edeb23793@msgid.tls.msk.ru>
Date: Fri, 14 Apr 2023 10:15:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>
Subject: smbd: NotifyChangeDirectory: NETWORK_ERROR (need help)
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

I tried to debug an interesting issue today.

The thing is that some applications, for example FarManager (farmanager.com),
will enable change notifications on the directories they keep "current",
including the case when this directory is on a remote samba server.
And sometimes, it ends up in list of files on the samba panel to become
empty with the error message:

  Error: Cannot read folder contents
  0x00000003 - The system cannot find the path specified.

This happens only on samba so far, and it didn't occur with older samba
version (I can't say which, maybe 4.16, but 4.13 for sure).  I can click
on "Ok" and tell it to re-read the directory, which works, until after
some more time the whole thing happens again.  What's interesting here
is that the directory in question is *not* actually modified, not this
one neither any file/dir inside it, so if anything, this notification
is false.  Also, I don't see any inotify filedescriptors in lsof output
of this smbd process.

So I started from tracing far.exe, but this one gave nothing really interesting.
Here's what ProcMon.exe (from sysinternals) shows for it:

  13.04.2023 16:09:24,2428431 Far.exe 11600 NotifyChangeDirectory \\tsrv\mjt-adm\ NETWORK ERROR \
     Filter: FILE_NOTIFY_CHANGE_FILE_NAME, ...

So system call NotifyChangeDirectory returned NETWORK ERROR.  After this,
far.exe immediately displays the above error message without issuing other
system calls.

I tried to match this event on the samba side, but I can't find it so far.
There are a few interesting cases going on there, some definitely unrelated,
some might be related, but overall things look quite ok, and there's no
relevant errors returned by the kernel.

What's interesting is that a) samba does not use any inotify mechanism, at
least there's no inotify file descriptors in use according to lsof.  Yet,
actual changes happening in the directories being watched, are immediately
catched up.

b) the above error happens when *no* files are modified on the samba side,
this dir and anything below it is *not* modified at the moment this error
happens.

c) as far as I can see, the error is often related to some *other* user
activity on the same machine (these machines are win10 with more than
one user running).  I'm not sure it is always the case, but so far it's
like this. Here, one smbd serves multiple user sessions (for different
users).


I have straces for the issue, where, among other things, I see smbd
receives SMB commands from the client and sends replies, but so far
I never tried to decode the protocol/commands which are being exchanged
(and I don't really know much about the protocol and the set of commands
it uses).

I'd love to find out what's going on.  Can I have some help here, or
is the only option for me to learn SMB and at least find out where smbd
sends "failed" NotifyChange replies to the client?


Thanks,

/mjt

