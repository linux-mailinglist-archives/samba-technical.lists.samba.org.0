Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCC01403FF
	for <lists+samba-technical@lfdr.de>; Fri, 17 Jan 2020 07:29:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=BmmngnEvJtiPArRGg8h/3VTtmGvYdWfkKyZbJWBjV+I=; b=nYtJeFekBWXt3RIBG04sVxHJWV
	FcGvEs01gQM8dZ50D+ZTwFO4fG9CCEIQm/Mw6cxHZo/82mMrBbmwbRt1o6d0KwX9d/pFiWil07r1f
	seqif+VbqnmJT56uUQB4g8QpeYUlYEHpzx3Rl3r149lSJhU4lpkZDDC+spi0auDwpjLtshMdhtDxV
	TrI5DISUqNfUWrTCu6fOFMkn3/KQFKEVriRhLNbsZNeKvznDGY3dbwrbPIggt5KEgwwCyeodEYCKy
	H61VKxVzBZs41JXRmRNHqpaKIfiec4ELIHUyLJHJdC4kS0fcA+y2coQMUV9hJ76lpeML8fH5xo5rz
	aGDGSMaw==;
Received: from localhost ([::1]:21080 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1isL7g-003jUo-MB; Fri, 17 Jan 2020 06:28:49 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:41517) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1isL7P-003jUf-KI
 for samba-technical@lists.samba.org; Fri, 17 Jan 2020 06:28:36 +0000
Received: by mail-il1-x129.google.com with SMTP id f10so20396194ils.8
 for <samba-technical@lists.samba.org>; Thu, 16 Jan 2020 22:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BmmngnEvJtiPArRGg8h/3VTtmGvYdWfkKyZbJWBjV+I=;
 b=Kbet3eoIzBEIBvuUpwkv5FRqvBQ98J8DdJqtkbv/H3mwBZM4W2pN5jBLLRrFW22SL1
 VteViHCStmMX7M8DaYs72F02O2EkRWpSQrN7/c+7gyJR6gzxioxzR++IYBgJYAjzxGkU
 SyCsIiVi7260+nvB8lhxnYMyzdM8iTC33AUkMnTYGb5PVarcbKLyPZvGoJ0NTUBmBPfO
 BQClzpht9D8uDQv6Gs0iQ4GtDJH3cmtzJsAUfaBQQ/ywQr2jSt0qJyxYupOO1aIqLYtv
 AJ2TyqE4ehpj9RaPuxeMUxp17iSeLov3dnDqfTXhJ8D7iHFTzrqEdX3+avQA60b8bFAG
 J36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BmmngnEvJtiPArRGg8h/3VTtmGvYdWfkKyZbJWBjV+I=;
 b=IWS3EBhZ5oW9CPssaCj0+PuaRuSdMc7Unz1iwJsWxdGuRaD84MY0t/EKrTFWEs/V92
 25PrXrA8HCCOjbHGYeQoNBrkRN+kdkae7Jf0voX16/ysWxWcwz44/LgP2u4DRjl6Ud36
 L2d59BnIDUw5jjpRAO6KGtjYllTM0Xwc5l1tuTNwJWdwpgwaXByHse+P1pFWnQOY5inA
 C3Aa+VQe3wNck1PDK4rbLhfiLoQBQI1UgLNBXtajxlQwNVDQOm/i/vClP0A0alBL8tCT
 kudi5VyAzywxoWdTXC1cZNtJrYXCno8vLV1slqNVk/fe7M1qJe7lIGjBy9d31ACqT+X+
 QscQ==
X-Gm-Message-State: APjAAAX7gV/MRn6s2iU6KpW/lb2lLKGdEjKdeU0iYQcSSLA267olAxMH
 kSwJN3VMkYQms/io3MocE9vgz2dbOPGjr+bG3bY=
X-Google-Smtp-Source: APXvYqyunpPaxghUD3X/gKriYwjjlTu4ypTX65hwhFHtE8cN8nE2qM/G6r//qxikYpDOCIR+wxf5L8otwa1GgNntWKc=
X-Received: by 2002:a05:6e02:d05:: with SMTP id
 g5mr1759030ilj.272.1579242508030; 
 Thu, 16 Jan 2020 22:28:28 -0800 (PST)
MIME-Version: 1.0
References: <CALe0_75KJMBOMMAtSWNH=GkHv-vzvYQxOVuj8Eht6jfVfoYCcA@mail.gmail.com>
In-Reply-To: <CALe0_75KJMBOMMAtSWNH=GkHv-vzvYQxOVuj8Eht6jfVfoYCcA@mail.gmail.com>
Date: Fri, 17 Jan 2020 00:28:16 -0600
Message-ID: <CAH2r5mvJZ07D1+UtGJP-r-V3E2x4mxYkgP5PO530Lew7jDeW2Q@mail.gmail.com>
Subject: Re: cruid+multiuser mount options
To: Jacob Shivers <jshivers@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a really good question and I think they should be allowed
together.   looking at cifs_sb_tlink in some detail, and also thinking
about common scenarios and how to make them less confusing to the user
I think they need to be supported together (optionally).  As an
example:

Imagine a scenario in which two users access the same Linux client
machine, and the machine is joined to the domain (and they login via
sssd or winbind to Active Directory or equivalent).   These users
would want to be able access the server with the correct permissions
for the particular user they are running as at the moment in a
particular app, a particular process, on Linux.   So as an example:

ssh in to the client as kerberos admin_user@domain
su root
mount -t cifs //server/share /mnt -o
sec=krb5,mfsymlinks,noperm,mutliuser,cruid=admin_user
<any access to the mount as either root or the admin_user on the Linux
client gets the expected permissions of "admin_user@domain")

then in different session ssh in to the client as kerberos
some_non_admin_user@domain
<any access to the user from processes running as
"some_non_admin_user" gets the expected permissions because with
multiuser we automatically setup a session for him>

If we didn't support cruid and mutliuser together then the user would
have had to do an extra step, he would have to do a confusing kinit
before doing the mount (which was unneeded since he could specify
cruid on mount)



On Thu, Jan 16, 2020 at 11:57 AM Jacob Shivers <jshivers@redhat.com> wrote:
>
> When mounting a Kerberized SMB share with both cruid and multiuser,
> the multiuser mount option is negated. This is not documented as
> explicit behavior. The question is whether this intended behavior or
> if it is unexpected.
>
> Does anyone have any existing thoughts on this?
>


-- 
Thanks,

Steve

