Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 093B02D1C38
	for <lists+samba-technical@lfdr.de>; Mon,  7 Dec 2020 22:37:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=857lhcLZLWenmI0aJWkQR0JKop+eAv1wQOl2qYT0B9k=; b=AMz1Tyjo3nIziWXAC5cDggksKg
	F1OjnM6eQ6WMupAAiTH7ec942oeIP6wQqHCZdnuOUOqTQlmKiOIGE6KoY/ulbaADErYMB26P58VBS
	SxiKivcOT2DORg9mnY8zivL6bjbOQTOHGk6z4TxfKgFE5bFvRyio4W+8EkwWcD7J7kDsqAxUyVh9k
	9SZhQPFtCONHpZe/WWSgMs+VraZRKx7gAKr5IwdL/q2IakxUYP7AyC0zM7VqGAXhWQ/k/flxPWxjC
	5+UMbPKk6dgdUrP2CesBKzml7wrG3wZhxbP8zHykcUIjfDeZvcOcEuXgBi6TwsnoM9hxfHFgoMCBq
	Vxur8PEw==;
Received: from ip6-localhost ([::1]:55036 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kmOBZ-0007ST-W8; Mon, 07 Dec 2020 21:36:46 +0000
Received: from mta213a-ord.mtasv.net ([104.245.209.213]:50165) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kmOBP-0007SL-7N
 for samba-technical@lists.samba.org; Mon, 07 Dec 2020 21:36:43 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=20200311092113pm;
 d=gget.it; 
 h=From:Date:Subject:Message-Id:To:Cc:References:In-Reply-To:MIME-Version:Content-Type;
 i=j@gget.it; bh=JFkK9lbwqsKtnfRYUo42D59sfDE=;
 b=ahT/DYq3E9THVn/2j2BdbpkyxdZo0LdPR4w+lZOjMkhogYIvvqhsfGrks3zNnNLX+9pzaBHLXdPZ
 5kU6CZ66wJi4DkOta2mzLxMCxWeTSiMy40Hs/8327fIn1YAV80guysRZfjEho8jtOHN1D1U2U6VU
 /Rq8idm0ZYtGJOwlAnE=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=pm; d=pm.mtasv.net;
 h=From:Date:Subject:Message-Id:To:Cc:References:In-Reply-To:MIME-Version:Content-Type;
 bh=JFkK9lbwqsKtnfRYUo42D59sfDE=;
 b=ZI574ethbsrgBH0/fzLeq1D41mWNBRmgMmvG0JQoXShjxzQ6M9Ty3mea/9MQnbi96lpWpyLw8zyC
 Fq55CqCJVz6/EDmonFSK19m9UqJi9CvbQSAUHPgSH1BvP0G4/L6/xnhJ+ky2lDdFsxoqDT9dRkSe
 0QaVfDxlnWcke1loVZY=
Received: by mta213a-ord.mtasv.net id hpqg6627tk4a for
 <samba-technical@lists.samba.org>;
 Mon, 7 Dec 2020 16:36:00 -0500 (envelope-from <pm_bounces@pm-bounces.gget.it>)
X-PM-IP: 104.245.209.213
X-IADB-IP: 104.245.209.213
X-IADB-IP-REVERSE: 213.209.245.104
DKIM-Signature: v=1; a=rsa-sha256; d=gget.it; s=20200311092113pm;
 c=relaxed/relaxed; i=j@gget.it; t=1607376960;
 h=cc:content-description:content-id:content-transfer-encoding:content-type:
 date:from:in-reply-to:list-archive:list-help:list-id:list-owner:list-post:
 list-subscribe:list-unsubscribe:mime-version:message-id:references:reply-to:
 resent-cc:resent-date:resent-from:resent-message-id:resent-sender:resent-to:
 sender:subject:to:feedback-id;
 bh=YWwtUWO71wLanrhZYHfqg3kuKhguMd+DLAWrBD9/PgI=;
 b=URIJHUNAIT99I0KPvG+ve6k/V2txcxXHMVUOqzHJWC4mNEx6+ZZyWZTDhQ+EuyyzAjkStc5C3Eo
 7FHfsuEasEhXBOMKasO3yYdjWfPe0s7AHhtid+dnNXvr8fyoNyTJpSMJ9V/+29T7JLhZ86m/2KHNB
 2ga8hTKFEiH2QvxWi9w=
Date: Mon, 07 Dec 2020 16:36:00 -0500
Subject: Re: Samba + exFAT : how to avoid pre-allocating when copying big
 files?
Message-Id: <9cda5594-7a12-45a8-a8c9-49daa308f3a6@mtasv.net>
To: ronnie sahlberg <ronniesahlberg@gmail.com>
X-Gm-Message-State: AOAM5313z5x18HNeyuNnUx/62UpQv5H5kZSl6sK3X/9kR5U3g5NZxNzLumlWCvAkIqwziBe0NV83haTo7mIE0q89GE/BcGg=
X-Google-Smtp-Source: ABdhPJwTSig79w8v8XftA0x7jUfGZ4RllsIikKNLsMzwRdrzpKKgU7v25xTh0n3I18DNw2j//S3P+P6hwibTdTTj588=
X-Received: by 2002:a17:90b:350a:: with SMTP id
 ls10mr777619pjb.192.1607376959542; Mon, 07 Dec 2020 13:35:59 -0800 (PST)
References: <81fae2f8-970f-44a4-bb46-fb5237715070@mtasv.net>
 <20201207180509.GD1730617@jeremy-acer>
 <d056cc18-3ef5-4cdd-b25d-bbf86d041787@mtasv.net>
 <CAN05THQvhxFS57zggYz_67A6pzdtztZvuy2rhTRjg5mvj-sTMQ@mail.gmail.com>
In-Reply-To: <CAN05THQvhxFS57zggYz_67A6pzdtztZvuy2rhTRjg5mvj-sTMQ@mail.gmail.com>
X-Gmail-Original-Message-ID: <CA+BV=GWWmJLDyQ3hXXYvySVDdpreMX1mFAxBoKt5BP0GC0-tyQ@mail.gmail.com>
Feedback-ID: s5244416-_:s5244416:a182037:postmark
X-Complaints-To: abuse@postmarkapp.com
X-PM-Message-Id: 9cda5594-7a12-45a8-a8c9-49daa308f3a6
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
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks Ronnie for your answer.

I've used NTFS before (ntfs-3g which uses FUSE), but it's slow on
RaspberryPi (20-30 MB/s) whereas exfat can reach 70 MB/s.
One solution would be to wait for the new ParagonSoftware open-source =
NTFS3
driver which will (or not?) be merged in Linux kernel.
But I think it won't be easily available on RaspberryPi soon.

So I decided to try with kernel's exfat (non-fuse) which is very fast =
...
except this problem.

> Try adding a f.truncate(...) to set the file size after you open the
> file but before you f.seek()

You're right Ronnie: a f.truncate(1000*1000*1000) here takes 16 second=
s,
i.e. writing 1 GB of null bytes at 60MB/s, that sounds correct.

--

This is confirmed by Jeremy's analysis (via email), here is a summary
obtained after looking at my logs where it gets stuck for 30+ seconds:

>  smbd_do_setfilepathinfo: test/a.rar (fnum 1649140843) info_level=3D=
1020
totdata=3D8

-> that's an SMB2 SMB_FILE_END_OF_FILE_INFORMATION call.
-> This is going into (ultimately) vfs_set_filelen().
->  SMB_VFS_FTRUNCATE() call to set the length.
-> static int vfswrap_ftruncate(vfs_handle_struct *handle, files_struc=
t
*fsp, off_t len)
probably here?
https://github.com/avati/samba/blob/master/source3/modules/vfs_default=
.c#L1813

So two possibilities:

* is there a way to set an EOF on a file descriptor on exFAT that *doe=
sn't*
do the allocation? This would require a modification in the exfat driv=
er?

* would it be possible to have a mode in Samba in which it never
"truncates"?

    [global]
    no_truncate =3D yes

The file size would grow when new data is appended when a file is copi=
ed
(like my code in Python before, with only f.write(...)), but no trunca=
te at
all.

Do you think this would be possible?

Here is a linked report on the Github page of exfat-fuse:
https://github.com/relan/exfat/issues/45
