Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 113E52D1B97
	for <lists+samba-technical@lfdr.de>; Mon,  7 Dec 2020 22:04:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=N8+2vBO6xJfnVCJKuIPB3sDdHvwUUXYmrdVydSBCq0E=; b=MemcjUKDpcIK+j/MO6YDa1vzwE
	WhMsFFCARexisucNvbbH4tggPLDIF+eD+Irn2HhxaMfo1je2IXbykPNShaCL6957IfVK9znI9FeIF
	eSijraBjSK8cfuy63EFztJnBYg0paVTfi8vZV/DxAHsSJf9ZG8TuKFFILNA1wi2RNQ6YJvmIrCkK4
	ZjxBFDf6UopoLYNjLbXSUeed18zIGCX5Eivsry4NL2tcpICcIb1yJ5+3QH6yEkXM17R4bboWHkJj5
	3dPDUHRRog+1EHPaOjg/5Y+LUPPkAS+4/Uqa8ExJ1YZRtw46Cz0IHs/C/4b1y5bRYrQPCJ0owg1m2
	Jlek4xEg==;
Received: from ip6-localhost ([::1]:53608 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kmNgD-0007Eh-Gq; Mon, 07 Dec 2020 21:04:21 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:32990) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kmNg8-0007EZ-Te
 for samba-technical@lists.samba.org; Mon, 07 Dec 2020 21:04:19 +0000
Received: by mail-io1-xd2a.google.com with SMTP id o8so14814824ioh.0
 for <samba-technical@lists.samba.org>; Mon, 07 Dec 2020 13:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N8+2vBO6xJfnVCJKuIPB3sDdHvwUUXYmrdVydSBCq0E=;
 b=T9zKuACfLQSFWU5K4Pb1YYreQEfu6DLfipvn0fbMn7pWOxOlYCXfJlHc23nlISOxQu
 6DimD5bjYX0l8jg+EccmhuDoPYUxaS1C1hlLWvJt64t1ofRkxU5uj5fy+apEn0AJcur/
 xHRpbi9fPA6hoFQPsUKTMgieuolwaoaxbniPloDPIp+OZ2VlyZhGIGa0fN3xz3jbPl21
 vyrrMEeFC9xBjAarkZXtNmqNmXQWvWlJfi4LH5RV/A0rRjXASpUpQzfZPDuzZtq7H2Py
 TQLJ1g42QWGJtWs5lBvD0k1nkd3686IXwI9Hq/P2+A2E3PvDi03bDGVbEGGFKxCLOhRP
 IyhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N8+2vBO6xJfnVCJKuIPB3sDdHvwUUXYmrdVydSBCq0E=;
 b=jRbEdQ+Fki269DIffHFIgonx/66rjGgATxK/9S+/aK6mNdfRY9iicpde6GChG16ybd
 7GtCucY0405gnifO0ILC/wR/CA0mUmSCLsuvMrwAE6TlCAitKvfELMwWphI+t6QcjmOH
 CvqJ3631SnkSmDO3spwIJRNOHGQQthskQuXp47URZo4cnJNkpxsLAofOWjDHaA007FIR
 tiviz/x+D830JCI7LvZUYeHfQpSeGohSfuQCnGEiAAVzIwBCuDrGfJeKD+JiUh7Gsc4N
 7TJGMAYYsLs7g+8CdzNhDNWd509fLv7B0kAc94/9CX2AZ5+1IYuSlRwvl9+JWa0p2dXZ
 IHBg==
X-Gm-Message-State: AOAM532OuoU17tG+Bq/Fy390xnvGG4SEemnGi/DriuTPoIpk5lmi+1Xy
 muvPoDV/5qZkJs1ZBLLNLiPjzcMMAJ+6dwrcop9yM7op
X-Google-Smtp-Source: ABdhPJwR0h4QrDrB+wUp6k2cIjy+wONzQw0aAnQ9fIyxhG9Vjlo9cBnJSGVNr4XMnYL7x9XlxdMw+CInYE43rPbF+hw=
X-Received: by 2002:a02:c7cb:: with SMTP id s11mr12889070jao.94.1607375038815; 
 Mon, 07 Dec 2020 13:03:58 -0800 (PST)
MIME-Version: 1.0
References: <81fae2f8-970f-44a4-bb46-fb5237715070@mtasv.net>
 <20201207180509.GD1730617@jeremy-acer>
 <d056cc18-3ef5-4cdd-b25d-bbf86d041787@mtasv.net>
In-Reply-To: <d056cc18-3ef5-4cdd-b25d-bbf86d041787@mtasv.net>
Date: Tue, 8 Dec 2020 07:03:47 +1000
Message-ID: <CAN05THQvhxFS57zggYz_67A6pzdtztZvuy2rhTRjg5mvj-sTMQ@mail.gmail.com>
Subject: Re: Samba + exFAT : how to avoid pre-allocating when copying big
 files?
To: Joseph <j@gget.it>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Dec 8, 2020 at 6:09 AM Joseph via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Thank you for your response Jeremy.
> Good news: if I still write *from Windows*, but from a Python script like
> this:
>
>     import os
>     with open(r'\\RASPBERRYPI\public\test\hello.txt', 'wb') as f:
>         for i in range(100):
>             f.write(os.urandom(10*1000*1000))  # 10 MB blocks
>
> then the problem does not happen: each 10MB block is appended one after
> another, and there is no "preallocation".
> This seems totally logical, but happy to see it working: so writing from
> Windows to a remote Linux+Samba+exFAT computer in itself is working fine!
> (if the client is *not* Window Explorer, but another file-copying process,
> such as the Python script here)
>
> Now the only problem is the Windows Explorer file copy which probably does
> this EOF fileseek to be sure there's no ENOSPC error.
>
> Is there a full verbosity logging in Samba server that would allow me to
> see exactly which open(), write(), seek() are sent by the Windows Explorer
> Samba client to the Samba server? Can we log so precisely all IO calls? I'm
> curious to see what Windows Explorer is sending exactly.
>
> Since millions of people use exFAT in the NAS context (especially in the
> RaspPi world and also people who use media players / TV which don't support
> ext4 but only NTFS or exFAT), it would be great to see if a fix could be
> possible :)
> I've literally seen dozens of forum posts about nearly exactly this issue
> (NAS-related / RaspPi / media-players-related forums, ec.).
>
> I would be happy to analyze precisely what the Explorer does to see if a
> trick could solve this.
>
> PS: perhaps just *not* doing a flush() after the "seek EOF" would be enough.
> Indeed I noticed that, on the Linux computer, with Python:
>
>     with open('/mnt/exfat/test.bin', 'wb') as f:
>         f.seek(1000*1000*1000)  # move 1 GB forward, no delay!
>         f.write(b'END')                  # no delay!
>         f.seek(0)                           # go to the beginning to
> actually write the file content, no delay!
>         f.write(...)                          # write the actual file
> content

Try adding a f.truncate(...) to set the file size after you open the
file but before you f.seek()
I think that will better emulate what windows explorer is doing.

You can also look with wireshark to see what the client is doing
immediately after it has created the file with the SMB2_Create
command.


Have you tried NTFS instead of exFAT? NTFS is a much more reliable and
rich filesystem which does support sparse files.


>
> all the first lines happen without any delay. There is a delay if and only
> if we flush() after the seek() or write(b'END'), but we could easily bypass
> this.
> With this method, the 1GB is written only once on disk, and not two times.
>
> All the best.

