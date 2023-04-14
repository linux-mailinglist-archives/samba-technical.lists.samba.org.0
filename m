Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CA66E28AE
	for <lists+samba-technical@lfdr.de>; Fri, 14 Apr 2023 18:48:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=HA21TjpplCmbx+IJsS09dedNfl5I2P6f7CpJElZAN+8=; b=LNu0dqWkCAbXZQSe3aty3XFHO5
	048bPNCurJ0mdTrIzyanTxNEzsdj96d/AyhBGdY/hEnduehiqgVj4XSUbNgVLm5LZ+wYXHxcKuTFL
	cnuz8aesmWGunzEwa5QUCW0Ue5NBykYCvalix14ZAf1Ny2srd0fmuxWwMIGlwD6B8sEfoRKaBcSY9
	+EJgGKYQp6P+XkDQgR1fIdeWjdLbrdqH6zZy7M6Ij+C56ojTig4vjtzXVwl9abkR6/TYZ28heiKL6
	rZsNcKyLrfwHgKtnczYcn1aVyx6pfJ6QSr21Kv2nZpjlzya7tyIO5p3e2PiYlsUvsQcx2syLsIFmR
	fJSKuYcA==;
Received: from ip6-localhost ([::1]:30814 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pnMaO-001nDV-BD; Fri, 14 Apr 2023 16:47:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45334) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pnMaJ-001nDM-7M
 for samba-technical@lists.samba.org; Fri, 14 Apr 2023 16:47:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=HA21TjpplCmbx+IJsS09dedNfl5I2P6f7CpJElZAN+8=; b=nuCDiUKpwgdGjMBgQJ+glK03aa
 R/dG68Mxj9/RbXCjvcMU+ctDgrt4lPxHPrdWgLxcE752sVSvk3QnDhpR5yZrbX9TQw3evtJFe1t+q
 vldeVSQ5mTFozAO1cHRau8aZXLD+i4YlFsVWmugR5jIlg03HfXelMOyoISf+dBQXmguYcGTxZl4SV
 /HzYLrqj19eDU8qCBVTdQlazlZQ6vV13syWF5H1Rt8sRwFYeERho4tukKDRv2P9uAOMzefCE+66Qt
 Qqh5bgLPFJ94FlYK8nQDCw4p1upOIqhjE1GNO+KXSCspX3Ti0bzSK4auwE3zsF9oMOfbkX9jMAhLC
 c1EvmdNzGZ/q2YUZ+wjnvFH/YK0TwNzDsvFMgE3tOsT/jH5ywvCSjba2Z2t8FM9Asc6fOzpcHOXNr
 aKbSvNNOgeldgYSJLF+UXV/BIFO/LYfmF2+iU5NKRbdTSkPqRBi6VoLktHe+hh8noRfqQLQLoeOI+
 s8Bm/gKddTvCSsIsFtVP3DYn;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pnMaH-001BFy-OP; Fri, 14 Apr 2023 16:47:38 +0000
Date: Fri, 14 Apr 2023 09:47:35 -0700
To: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: smbd: NotifyChangeDirectory: NETWORK_ERROR (need help)
Message-ID: <ZDmDp83rwA13Ndan@jeremy-acer>
References: <be86c050-570d-ccec-5a57-785edeb23793@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <be86c050-570d-ccec-5a57-785edeb23793@msgid.tls.msk.ru>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Apr 14, 2023 at 10:15:55AM +0300, Michael Tokarev via samba-technical wrote:
>I tried to debug an interesting issue today.
>
>The thing is that some applications, for example FarManager (farmanager.com),
>will enable change notifications on the directories they keep "current",
>including the case when this directory is on a remote samba server.
>And sometimes, it ends up in list of files on the samba panel to become
>empty with the error message:
>
> Error: Cannot read folder contents
> 0x00000003 - The system cannot find the path specified.
>
>This happens only on samba so far, and it didn't occur with older samba
>version (I can't say which, maybe 4.16, but 4.13 for sure).  I can click
>on "Ok" and tell it to re-read the directory, which works, until after
>some more time the whole thing happens again.  What's interesting here
>is that the directory in question is *not* actually modified, not this
>one neither any file/dir inside it, so if anything, this notification
>is false.  Also, I don't see any inotify filedescriptors in lsof output
>of this smbd process.
>
>So I started from tracing far.exe, but this one gave nothing really interesting.
>Here's what ProcMon.exe (from sysinternals) shows for it:
>
> 13.04.2023 16:09:24,2428431 Far.exe 11600 NotifyChangeDirectory \\tsrv\mjt-adm\ NETWORK ERROR \
>    Filter: FILE_NOTIFY_CHANGE_FILE_NAME, ...
>
>So system call NotifyChangeDirectory returned NETWORK ERROR.  After this,
>far.exe immediately displays the above error message without issuing other
>system calls.

I'm guessing ProcMon.exe doesn't give you the SMB2 message id,
which would allow you to discover exactly what packet causes
the problem.

Without that, how synchronized are the times on client and
server ? If they're close, use the ProcMon.exe reported
time to look at the wireshark trace around that time.

