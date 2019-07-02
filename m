Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 775FA5C813
	for <lists+samba-technical@lfdr.de>; Tue,  2 Jul 2019 06:15:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=CvyC1HAsfspuGWI1MQIFNxvtoap7aPJB8mQBnJGSplg=; b=waHRWI0V1OBD3/ZmtRQumyFm5C
	t2GeKRnwwJrJQZaz9nv5eTh6mnDxeKzbN4ql0oFFvPlhVIQOOjZz/PCS2h80VoeD7PbnOdbwk5sdz
	PevUt6mE6fHUcDn+QyqKfoVW3zdewmLNcOcFAt0a1j5bch1HbTm3b848nPPUGFdIQGlvi/cYP1A/y
	uQoDVXOeWRNdNeNXFqseoqe2GYVAOQKnBNFfauTtE7mzB5TOAdHzzCwA6vre3RQ465E6oJRY3u+jm
	STsJO1rv6EzlG0sRe9D3StImQnBTTepiAkabtsrCFZtPayKR6U8unsUeiUGKPiIr22+LCvrzdrZN7
	w88Dh25A==;
Received: from localhost ([::1]:43058 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hiABL-004MVj-Uv; Tue, 02 Jul 2019 04:14:16 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:33133) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hiABH-004MVc-1T
 for samba-technical@lists.samba.org; Tue, 02 Jul 2019 04:14:13 +0000
Received: by mail-io1-xd42.google.com with SMTP id u13so34011271iop.0
 for <samba-technical@lists.samba.org>; Mon, 01 Jul 2019 21:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CvyC1HAsfspuGWI1MQIFNxvtoap7aPJB8mQBnJGSplg=;
 b=ARaZvEQEn1txEdSGKliFsESWO3veKRXDHOoUrAkjYDpPdosgEdaVM5+xEFqaMftGrL
 J5BUvc3XeOKLdmmaxM1i4cjiKMU4CtI83/MnU/DdZx8zvTYJit6XpVMigqzv8vIHn76y
 g/bTZXrQuvUPa62vtNE9OiF6BOmJ41KJ9mAooGgS846Mf74NE5BjCSUqyicjKCL5QayA
 BIocZ9OtDmCT/Mp0eSNFFM0T8Xp9TbY/tCAQi/gpZ43IQyoowl+rYt4hWsvfSd7m3k0r
 3REIUHRrPC9yW2nkB5E4/eEanP90ttWl130Hrq0IIlm1CVBDng9/vrpH6rNVtS69YpR9
 oF1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CvyC1HAsfspuGWI1MQIFNxvtoap7aPJB8mQBnJGSplg=;
 b=C5ECkjhIFnLrv0pDXPZGXVAqgPXL1yr1T1zWHz3s3EcBwxvbuW+17X0nZHSHk2kr/z
 aCvpUCgvY8KoANKQkHlkPhm0CPQZ7/cLUfh1k4HhZw4NzVX/eLIpWir0PPSgHF9+EDGt
 utq0miLJDpcC2NzeKiYzDClUqTblP6C2LY8N8vggzQY2e47OQ5athrDcxI2uitxhebZk
 Ib0UsmKcEdAq+Q9KDjUiId642TLTOjvpc7im0fn/Ue62GJdWkMvaVGxuam0vr+M1Vp47
 I+pq9oH2t869sSugOyws51zIOVoaJ0GvMv+kt7zLijdKsZQIGl7AXUKvT8yi5fHRcP4j
 q1Gw==
X-Gm-Message-State: APjAAAWuRvApTFVf2X960SF0zwU4BgKc5O0CoBoYQJOsbyMjvlVgDUJj
 N1wP4hMemeGRavjbv+/qDe1EJMIw95YifgO03r4=
X-Google-Smtp-Source: APXvYqxLGxHR9UPNtiYxtDdXyuP1AP+AzXuWVm6GX6NFO+DhfWSrrconKtEHOc+wjc+Bd4On7fSzM+WuxNZjJoX7R4o=
X-Received: by 2002:a6b:dc08:: with SMTP id s8mr6214012ioc.209.1562040849158; 
 Mon, 01 Jul 2019 21:14:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5msqF-Cvq=q7ae1XmnOi6DbB3UKSDSDvZbT8MNscLH3XTA@mail.gmail.com>
In-Reply-To: <CAH2r5msqF-Cvq=q7ae1XmnOi6DbB3UKSDSDvZbT8MNscLH3XTA@mail.gmail.com>
Date: Tue, 2 Jul 2019 14:13:57 +1000
Message-ID: <CAN05THQnBWYehEO4YXV71FtZB2Q4umpn0T74patTjQ=jbwRrJg@mail.gmail.com>
Subject: Re: [PATCH]Fix querying symlinks
To: Steve French <smfrench@gmail.com>
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Jun 28, 2019 at 5:09 PM Steve French <smfrench@gmail.com> wrote:
>
> Querying of symlinks to the Samba server with POSIX extensions works!
>
> (Also would work for querying symlinks generated in Windows NFS server)
>
> # stat /mnt1/symlink-source
>   File: /mnt1/symlink-source -> symlink-target
>   Size: 14            Blocks: 2048       IO Block: 16384  symbolic link
> Device: 39h/57d    Inode: 10354691    Links: 1
> Access: (0000/l---------)  Uid: (    0/    root)   Gid: (    0/    root)
> Access: 2019-06-28 01:43:37.145324400 -0500
> Modify: 2019-06-28 01:43:37.145324400 -0500
> Change: 2019-06-28 01:43:37.145324400 -0500
>  Birth: -
>
>

Very nice.

Change parse_reparse_point() to take a struct reparse_data_buffer as
argument, not a reparse_symlink_data_buffer.
i.e.
parse_reparse_point(struct reparse_data_buffer *reparse_buf,

Then this check should probably be in parse_reparse_point() and not in
parse_reparse_posix() since we will need this check for every type of
reparse point:
  + if (len + sizeof(struct reparse_data_buffer) > plen) {
  + cifs_dbg(VFS, "srv returned malformed symlink buffer\n");
  + return -EINVAL;
  + }

If you do that, then you can remove the equivalent check in
smb2_query_symlink() :
if (plen < le16_to_cpu(reparse_buf->ReparseDataLength) + 8) {
...



> --
> Thanks,
>
> Steve

