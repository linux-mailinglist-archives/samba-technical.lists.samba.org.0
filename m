Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DA24465A42
	for <lists+samba-technical@lfdr.de>; Thu, 11 Jul 2019 17:19:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=1Scw8EBfXi2sOweYF6caCQ0l43iWeGXOCR41hnkNkXE=; b=BD7WLfmmrtg/zYyVXkoAdY9HGY
	K9GQb869WQwJuutHHU6N220M67NZ7nBo09uRwtxaKZtBY6pFDog7Cu1gBMwD5ROlpe/W9H7wKrnDR
	oWHyl02kED+0PBJfH4mE1+nJjBJ/OutQqS4C/I1Xeuw4rtWgwOucOwSCHywvzNSg5xd29gn5w/RSn
	++KARQNoSioZPoWqAuaFcRa2MOIgAwbWc4pfAkplb4vFk0taiSanxq+Ip3b8m0W5PwCXgEnsyisSB
	LWaxuNBMzUZ+SZeRgDl+L8YQGWo+wygLNQPUkpSnqPPRYGN7i4kcaKN8zEZHukYZUxUCpyFZG+rm4
	NZkT0NiA==;
Received: from localhost ([::1]:46014 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hlarK-006TWn-Sl; Thu, 11 Jul 2019 15:19:46 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:35857) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hlarG-006TWg-Fr
 for samba-technical@lists.samba.org; Thu, 11 Jul 2019 15:19:44 +0000
Received: by mail-pl1-x644.google.com with SMTP id k8so3208758plt.3
 for <samba-technical@lists.samba.org>; Thu, 11 Jul 2019 08:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=1Scw8EBfXi2sOweYF6caCQ0l43iWeGXOCR41hnkNkXE=;
 b=FvNZk2qoaGjVF6/4FvkTP9ylhK1zu71wjFI4zOWsVHFA2ekzR2J33f6me9dMLXdNB5
 I1Dl8O7Cs3564+v0YkaXzhhHtM2+v2023L27TjsUL2a37hKb2gevEZPDnY9pEHdAQJSP
 3SNVjGqZhzp+/DLSo0AJUWpoedVpiM6GHcMrK6AJGy2mhz4HiI2WR9SQJf1pCJEsj/8O
 W1/z1a6PBbQQqBEj/FdlF4LWq/CJdg+R1/yidOmCJnUCFAFFFhJaCiRuZweE6LxmQGIy
 2CJDMKxu0I8ylli3Qfq1UY6AiVFJ6rNLBaSwobTmnMm441BXXrK5c3QkOwhacvlZcJk+
 6n0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=1Scw8EBfXi2sOweYF6caCQ0l43iWeGXOCR41hnkNkXE=;
 b=k2+bjkDgAqC/UzDgYgbXAiIp/ebJMQYm9hjFn+As7+5yeypGEDPwl4cXQZkHBI7hHZ
 mH5Yb5CEeqdUyen1vJl/iguhaYIqGPVmyhErxzLouc0R66iyp7BbmVpxEQcUV0xLFAkw
 /344axJSdz8IkpVcLdCt2HJkaPh5LK2gjoOnwNtWw4DlvBy8R8rRvcZ4Ie+iKZt9in2E
 sYcA054pGiMACOHfQgWb3H0rYVGDBBSbrNxXU8TQAB/3DQxTGf1owc2rETAF7VUE8riv
 QotbFwC4l5CQgg6ULHFhr3ASAN/d9YQnEvOMQ2UP+FoSv5sJkpw4fUxhUHO/J3EJf4Gh
 V7bw==
X-Gm-Message-State: APjAAAXYIiBd7fP/sZY43TWlOCx+Yr4QPoutCIvE/hZXIehKJPRZj4QJ
 xBvf+BpKEV9GHmMEs9H4AAemgbNS+CKcAjUe8B4=
X-Google-Smtp-Source: APXvYqxkDmzU6lrXhQVX1vYv3kqYMuM1bSDmHAo339CuovC7LsZitqB6uUcy7Mf+2ml1UdDURTHVdBTW3SXeHPRXvc0=
X-Received: by 2002:a17:902:2a68:: with SMTP id
 i95mr5336584plb.167.1562858380451; 
 Thu, 11 Jul 2019 08:19:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5ms8f_wTwBVofvdRF=tNH2NJHvJC6sWYCJyG6E5PVGTwZQ@mail.gmail.com>
 <CAH2r5muC=cEH1u2L+UvSJ8vsrrQ2LV68yojgVYUAP7MDx3Y1Mw@mail.gmail.com>
In-Reply-To: <CAH2r5muC=cEH1u2L+UvSJ8vsrrQ2LV68yojgVYUAP7MDx3Y1Mw@mail.gmail.com>
Date: Thu, 11 Jul 2019 10:19:29 -0500
Message-ID: <CAH2r5mu0yMPX+JFrWvnciYdWVRxGYgPsSX2UKOj2O70-bxzrsw@mail.gmail.com>
Subject: Re: [SMB3][PATCH] fix copy_file_range when copying beyond end of
 source file
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>,
 Amir Goldstein <amir73il@gmail.com>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 "Darrick J. Wong" <darrick.wong@oracle.com>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I noticed that the copy_file_range patches were merged (which is good)
- see below.

Anything else to merge for the changes to cifs.ko that we discussed
earlier.  I wasn't sure about the "SMB3: fix copy file when beyond
size of source" patch - it may be redundant.  I will need to check
with current mainline.  Anything else needed for the enabling of
copy_file_range cross mount etc.

commit 40f06c799539739a08a56be8a096f56aeed05731
Merge: a47f5c56b2eb fe0da9c09b2d
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed Jul 10 20:32:37 2019 -0700

    Merge tag 'copy-file-range-fixes-1' of
git://git.kernel.org/pub/scm/fs/xfs/xfs-linux

    Pull copy_file_range updates from Darrick Wong:





On Thu, Jul 11, 2019 at 10:16 AM Steve French <smfrench@gmail.com> wrote:
>
> I noticed that the copy_file_range patches were merged (which is good)
>
> On Wed, Jun 19, 2019 at 8:44 PM Steve French <smfrench@gmail.com> wrote:
> >
> > Patch attached fixes the case where copy_file_range over an SMB3 mount
> > tries to go beyond the end of file of the source file.  This fixes
> > xfstests generic/430 and generic/431
> >
> > Amir's patches had added a similar change in the VFS layer, but
> > presumably harmless to have the check in cifs.ko as well to ensure
> > that we don't try to copy beyond end of the source file (otherwise
> > SMB3 servers will return an error on copychunk rather than doing the
> > partial copy (up to end of the source file) that copy_file_range
> > expects).
> >
> >
> >
> > --
> > Thanks,
> >
> > Steve
>
>
>
> --
> Thanks,
>
> Steve



-- 
Thanks,

Steve

