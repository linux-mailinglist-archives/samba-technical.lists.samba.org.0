Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AE92D4E1D
	for <lists+samba-technical@lfdr.de>; Wed,  9 Dec 2020 23:40:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=PFECXYm/Qc3WIGhLfVMNxkHEd5QDWasTzTJgumS37fQ=; b=kYpy9/LNI0bDP0vkQbAo2TRr3N
	sH+w5rfelGl7DSmpmv3oorBdypk37zzxPC/juz9QvaphNye4NRWYsTO9Dhno9USUz3frfqpmNv6sH
	9ogL2yLVlAB/km7+yGTbpZ3wcJeT4LzRHjyWAH4Wfk2rj9IAg/xVU14S8K0wA2FdPE1aaPnNhqmRu
	1XA4JqDNMI6sBPRpiXKHA6FgfL1M50q9UyckawkkLHBfHimyjXfRf1P5ke5yT+0DS9XsKr0v4by5D
	8wReUJIdg6B0v/s3XhoCTS9aO4ZU2P7WNI8TfAR7MxmEryXkF6/8xpzIb/I/EKyDDDg8CkD0TD1P3
	LyRHtvOw==;
Received: from ip6-localhost ([::1]:50256 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kn87Z-000Iv8-Or; Wed, 09 Dec 2020 22:39:41 +0000
Received: from mta199a-ord.mtasv.net ([104.245.209.199]:38877) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kn87S-000Iur-Qq
 for samba-technical@lists.samba.org; Wed, 09 Dec 2020 22:39:37 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=20200311092113pm;
 d=gget.it; 
 h=From:Date:Subject:Message-Id:To:Cc:References:In-Reply-To:MIME-Version:Content-Type;
 i=j@gget.it; bh=HwTlKWN96rDXPfJ3C9LAJzINDMI=;
 b=DPsYXtbneu2KWVdZmoW8e7zkurAQZvgV5dfTPN2LBhGlmAEEXN8THMDXfKlklaWfFXv0Nnmbz12I
 zuwN6PtmpvmPGe/xmv2fx/EH0Q3vjxztdwn7EGfbGpbYYTEgX5reubb89vgEvCG0emmqSabznVFG
 gazcTIct1ZWuj5E0/sk=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=pm; d=pm.mtasv.net;
 h=From:Date:Subject:Message-Id:To:Cc:References:In-Reply-To:MIME-Version:Content-Type;
 bh=HwTlKWN96rDXPfJ3C9LAJzINDMI=;
 b=bugXCFxcZswDaZdTH+xNFSaFzfIzFMpqoMd2e+t3aNRo2RvO8v3Ao39QMO5oaLae79HtkW6syssf
 eMylmoPh4aEWuB0fecuOZPgflUoG0KJPGaTaDX/SUqWxRGdKzB25Ao/gZEYYN8PCR6+D1HfQrokK
 M1OzrpdLjYW/ghFNGF0=
Received: by mta199a-ord.mtasv.net id hq592c27tk41 for
 <samba-technical@lists.samba.org>;
 Wed, 9 Dec 2020 08:50:49 -0500 (envelope-from <pm_bounces@pm-bounces.gget.it>)
X-PM-IP: 104.245.209.199
X-IADB-IP: 104.245.209.199
X-IADB-IP-REVERSE: 199.209.245.104
DKIM-Signature: v=1; a=rsa-sha256; d=gget.it; s=20200311092113pm;
 c=relaxed/relaxed; i=j@gget.it; t=1607521849;
 h=cc:content-description:content-id:content-transfer-encoding:content-type:
 date:from:in-reply-to:list-archive:list-help:list-id:list-owner:list-post:
 list-subscribe:list-unsubscribe:mime-version:message-id:references:reply-to:
 resent-cc:resent-date:resent-from:resent-message-id:resent-sender:resent-to:
 sender:subject:to:feedback-id;
 bh=EIyLJh6+bqXKAZhLBepiTaCTlxmppzSgng+cRDirsW4=;
 b=Pmd+9Be8V1sFwPwj1mSawwRZi3pR4bIbiVmebkXpZy7NQGYhMyESnSwHnpJJN4w1F1e9kVWegki
 Cix4zjrcVSks0/WEYJfhFiTPLKwXjgcp9QtxghWIv2t0lvQW31BW7B4u2djWcSYT5P/GTQjQvYPQd
 M00F9AG1+a9YBnq2iPo=
Date: Wed, 09 Dec 2020 08:50:49 -0500
Subject: Re: Samba + exFAT : how to avoid pre-allocating when copying big
 files?
Message-Id: <fc04e216-71c8-4efa-b34e-f118ea12f67e@mtasv.net>
To: samba-technical <samba-technical@lists.samba.org>
X-Gm-Message-State: AOAM531GWDFGuIWOQUzOV/nwx04VyuSbXgkvel1MQDRN1rke+Jykb2BP2LYe3zAHYc5UhwU1cqk+3xxKF4U/9kn74e96Fwc=
X-Google-Smtp-Source: ABdhPJwv8PQXVvHsT478jdJxTVFDlO1vvhXF5BH50Zi5YKAK4KRUHYawTuFx488Jo2/HEdrSrwpO6pht6gIeib3IMEs=
X-Received: by 2002:a17:90a:7101:: with SMTP id
 h1mr2323323pjk.26.1607521848192; Wed, 09 Dec 2020 05:50:48 -0800 (PST)
References: <CGME20201208011550epcas1p26cebc8a4d2812fca862990739a059d43@epcas1p2.samsung.com>
 <007f01d6ccff$aad6f7f0$0084e7d0$@samsung.com>
 <008101d6cd05$0faa5500$2efeff00$@samsung.com>
 <CACyXjPwvNSfw9PLtUBxQQF4ysedpOE_TriTuX-JajRmFAHhQMQ@mail.gmail.com>
 <008201d6cd10$d5187910$7f496b30$@samsung.com>
 <20201208042132.GB1875689@jeremy-acer>
In-Reply-To: <20201208042132.GB1875689@jeremy-acer>
X-Gmail-Original-Message-ID: <CA+BV=GWHXO2ZD04LUox2xHnG+o-RDP9QLTUpYexzGXsFN8nL2g@mail.gmail.com>
Feedback-ID: s5244416-_:s5244416:a182037:postmark
X-Complaints-To: abuse@postmarkapp.com
X-PM-Message-Id: fc04e216-71c8-4efa-b34e-f118ea12f67e
X-PM-RCPT: |bTB8MTgyMDM3fDUyNDQ0MTZ8c2FtYmEtdGVjaG5pY2FsQGxpc3RzLnNhbWJhLm9yZw==|
X-PM-Message-Options: v1;
 9Hcc_PIAriBnYBOfaIwCcyIPcaJJ4QcTBG0Vjf0upsLgpqRZa9tU6RIlMq6j-Xrc
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Joseph via samba-technical <samba-technical@lists.samba.org>
Reply-To: Joseph <j@gget.it>
Cc: Namjae Jeon <namjae.jeon@samsung.com>, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

> FileEndOfFileInformation =3D=3D ftruncate();
> FileAllocationInformation =3D=3D fallocate(.., FALLOC_FL_KEEP_SIZE, =
offset,
len)

Jeremy, by ftruncate() do you mean "immediate writing of null bytes"?

I've analyzed syscall logs to see how some programs on Windows do, whi=
ch
1) create a file on exFAT partition
2) immediately set 1 GB file size *without* any delay; it's instantane=
ously
reported as 1GB in the Explorer; also, there is no 1GB null-bytes writ=
ing
3) then write the actual file content
It goes like this:
t=3D0.000s: CreateFile
t=3D0.000s: SetFileInformationByHandle with FILE_END_OF_FILE_INFO,
EndOfFile=3D1073741824
t=3D0.000s: SetFileInformationByHandle
with FILE_ALLOCATION_INFO, AllocationSize=3D1073741824
t=3D0.001s WriteFile     (here the real data writing begins)
...
t~44sec  WriteFile   (last block written)

So this confirms that, with the Windows native exFAT driver, neither
"FileEndOfFileInformation" nor "FileAllocationInformation" triggers an
immediate truncate() or writing of null bytes for an opened file handl=
e.
This "writing of null bytes" only happens when the file is closed for =
the
"remaining unwritten blocks", that's the trick. Example:
    CreateFile, SetEndOfFileInfo+SetAllocationInfo 1GB, Close  =3D> th=
en 1GB
of null bytes written
    CreateFile, SetEndOfFileInfo+SetAllocationInfo 1GB, Write 100MB, C=
lose
=3D> then only 900 MB of null bytes written
    CreateFile, SetEndOfFileInfo+SetAllocationInfo 1GB, Write 500MB, C=
lose
=3D> then only 500 MB of null bytes written
    CreateFile, SetEndOfFileInfo+SetAllocationInfo 1GB, Write 1000MB,
Close  =3D> then 0 MB of null bytes written ! <-----

Namjae, do you think this should be done directly at the Linux exFAT d=
river
layer?

I'm not sure if the modification should be at the Linux exFAT driver l=
ayer,
or in Samba?

If the latter, in Samba, would it be possible to avoid that
SetFileEndOfFileInformation =3D=3D ftruncate()  =3D=3D immediate writi=
ng of null
bytes?

TL;DR: with Windows' native exFAT driver, SetAllocation+SetEndOfFileIn=
fo
does not write any null bytes now, if the file handle is still open. I=
t
will only write null bytes, on file close, on the *remaining* space th=
at
has not been written before. If all the preallocated blocks are alread=
y
written, there is no null-bytes writing.

Jo
