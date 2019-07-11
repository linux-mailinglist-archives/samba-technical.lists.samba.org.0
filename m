Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B4B65A39
	for <lists+samba-technical@lfdr.de>; Thu, 11 Jul 2019 17:17:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=6x7b8VajcF1DGZElO1FQVch8twXC3YkscWrtgn58UY8=; b=hq9h4BkGcZbA9IJzBlsYj10yOt
	T2S7W5PBzvd1g0sGVqR2Dn5zlv/jZZX4E2onjifOO1+F1hnLelszrHQi98MjzNCanBn/+8s8ywUvI
	a6hDDLz8IH4YTLkAlj+/iPCbSjW+fAKaSiwh5ntdyIxH+SnQEMLfGbRnVF7NA+0OGm6QM0CfLhnIg
	KW75hq300s8WKoCFvMwyoQ+oxPt1rS7s9qxk4f7x1ZUSeFuJDnPUCQ2ttkAUKnKm2YJDTabq+S3hc
	QUmV8ApUeoRtm8DpRY6cB9Mhig+AI8+XwZiql0hbe8PNc0sBT7eEA+rAedbmMBFEV2yMo8l07R9Si
	KoF43WfA==;
Received: from localhost ([::1]:45248 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hlao0-006TQN-O1; Thu, 11 Jul 2019 15:16:20 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:36840) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hlanw-006TQG-RC
 for samba-technical@lists.samba.org; Thu, 11 Jul 2019 15:16:18 +0000
Received: by mail-pl1-x642.google.com with SMTP id k8so3203929plt.3
 for <samba-technical@lists.samba.org>; Thu, 11 Jul 2019 08:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=6x7b8VajcF1DGZElO1FQVch8twXC3YkscWrtgn58UY8=;
 b=A5mxARREPEkiKsbxlHp+gfYMUQ6nJsUDXqeHSlHmKq4pp/M/ywFUqyeJEJxXQpsLms
 5Ldr5iiVCIyrbdXWwqbs07G/Cq8tAVKiSETXNajAVFqCxb0O1w9gnr9RA2bokGmG6AZr
 1qkz8vnfK4C59iUMTCTV90VqgmSSWR32h02BqNH0U6U5ffOCzZopi+0EuYJxMqONqgV/
 Z5PeaO3U1ncnxbL9X+3iod0JeAw4jZ/oTZUJh1ntv7qt8L431GAX4xny7tjp5Ry7ZdNT
 NTHy16YkadYlqAAULylQMdVAmGJgBgf89PBcATyFTHZp0eSvXwBfzIT5PIJTYA//pU89
 2ALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=6x7b8VajcF1DGZElO1FQVch8twXC3YkscWrtgn58UY8=;
 b=ND3tbJoMJAloZAm1p28rZzRYnG71UzwYxKoJ+Lvl7W6MGEPe4d63dL9zxUQgJDjvYS
 88UXXO7rVcmhQTloBM1wWY7KUStW49SBi7f+f0nEqctJmbe09YhxkXIGv5nUBh61rhUA
 m3DYEaNqjxOqCxjM8T/XFh2GzDeEwuR3hB0jTaDrISEwWBDZWynCe64/Yb/ntx3BsoHW
 jYDRQsNKY+t6hj7MS1L2HohC0OEvrEJn/0OaPSsotKphna0xEA4mPSs/o2E5ffwA0ai7
 Mhn+WwCcWlb+w9FY8EFrnUQrVU+jE1SF8wPdTp8z40hE691hj8yIcUunoZnIP6iUehwd
 m/vg==
X-Gm-Message-State: APjAAAV1fi6ObB5ya6ggq5D7YieUdSxRV62F426UhbCMzXe0V/uNE3dS
 EGPors8USLbRgpxVGwDMREMgqJEuQxmVXfqJT1E=
X-Google-Smtp-Source: APXvYqx98rqgVyjHmH1F+2j2JGK+j/Ul+Qm3OthdCFiY7dv6BKzfiiOdtWg8KoDQoyJgxhlluB0WCps3D9b0Gi6duoI=
X-Received: by 2002:a17:902:20b:: with SMTP id 11mr5344610plc.78.1562858174222; 
 Thu, 11 Jul 2019 08:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5ms8f_wTwBVofvdRF=tNH2NJHvJC6sWYCJyG6E5PVGTwZQ@mail.gmail.com>
In-Reply-To: <CAH2r5ms8f_wTwBVofvdRF=tNH2NJHvJC6sWYCJyG6E5PVGTwZQ@mail.gmail.com>
Date: Thu, 11 Jul 2019 10:16:03 -0500
Message-ID: <CAH2r5muC=cEH1u2L+UvSJ8vsrrQ2LV68yojgVYUAP7MDx3Y1Mw@mail.gmail.com>
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

On Wed, Jun 19, 2019 at 8:44 PM Steve French <smfrench@gmail.com> wrote:
>
> Patch attached fixes the case where copy_file_range over an SMB3 mount
> tries to go beyond the end of file of the source file.  This fixes
> xfstests generic/430 and generic/431
>
> Amir's patches had added a similar change in the VFS layer, but
> presumably harmless to have the check in cifs.ko as well to ensure
> that we don't try to copy beyond end of the source file (otherwise
> SMB3 servers will return an error on copychunk rather than doing the
> partial copy (up to end of the source file) that copy_file_range
> expects).
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

