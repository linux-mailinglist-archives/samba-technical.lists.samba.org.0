Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B874C53C
	for <lists+samba-technical@lfdr.de>; Thu, 20 Jun 2019 04:14:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=CT8hlrXVlTQmAih9bPn62q6lhl2ZtSQvdUbzFuBlEhw=; b=dKHQjVsFmONMC/VVI+dDAjUTeR
	UMqZ/29LFoO2HKUjzgrEvWfukUpMci8L1q+7DEe3z9rmkpplHFefJYEJvqpHlNG5lGbokjNtRgheq
	u1W0NyRgz/BBWbR1n/DTXGLPMWH/LGq0aGmftrHkiQQpV9DxK5xshOGDSrW2+GTR+XP1d3B0IYZKa
	4PRrSMb4V9BZoXGcThakhr/APCGGI+97ZrGn4JEF9ZJgDfud4RpJ9f+J4XEakK653Lr1H9O1/pV64
	vfUOUmMUI9livOKvxc1S+6aQkO9tb4NTeyRz4jOWBXXaES9dr9NsqCVBk2wf1QVfMrs+F3bK4/ovR
	mBUsyF0w==;
Received: from localhost ([::1]:44170 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hdmaq-000ZP1-QG; Thu, 20 Jun 2019 02:14:28 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:38944) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hdmam-000ZOu-63
 for samba-technical@lists.samba.org; Thu, 20 Jun 2019 02:14:26 +0000
Received: by mail-io1-xd41.google.com with SMTP id r185so639936iod.6
 for <samba-technical@lists.samba.org>; Wed, 19 Jun 2019 19:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CT8hlrXVlTQmAih9bPn62q6lhl2ZtSQvdUbzFuBlEhw=;
 b=mLHzwm4s78ijFOuibu94vz9s0tlyHHC4RZuFjv0uzt/kn1V2umCjZqxHN3bcx0h1u9
 RKnSqgSf2x8IxwE0aGRmo3e0rpTdZPsC66VULu/1foY8zbWl/loQD1Fp+UCDShnFox/o
 0iXNXC3JrDDLb7E+OS3CE/UquUHBypQj5pTribYniyPV6rsR3sHGVmgYSCF7nWPROTNg
 VSvRPAXFmFYW4GjbsA0t2WcMhgzBE5i0TToz5ks7GBnTokbjqo/FaH8s73u4xvDpyj9R
 DmVov9yUhFb4WByqS6N+gFL/Mb8xXHRgNVrgUoh0rzJ7Ld+DmrceUas0gFJ2Le6Yf2Ou
 LaGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CT8hlrXVlTQmAih9bPn62q6lhl2ZtSQvdUbzFuBlEhw=;
 b=Vo/te3Eu8A+ljxKLvfaH4+jX5mRphARB/oYdjDWaJaFeXQD4T1yWzjrIm9QNyY0gti
 vGzhxHtqZzgtJ0bV7gtQ0k43HrYGZd467Rbaa2Ow+aqhXEm2vpLWWo3uNGJKVUOe1/K8
 9ICspFn+7DIyDKRosE6eE5mWFqaazWW+eCJtOyIPyPJk/uduwxcaLA+XNXjxsAD0+kCA
 kvTzJN3illvrKru4DryjtFwAaVkni8N+AXVx2ZWKnsrClz0H8yKCBRHc2HBtoEGj/LFm
 qpiy823JrOjwiCFx0L5MHLsUFeX9gsLxnT4xke+wixGWxiSyra3aVQJAgs2JYlyNpUEk
 /a2Q==
X-Gm-Message-State: APjAAAUXkypi8HZu1rf0sIYZBk2Vd91yJpEN0KSDsszXt8bayGHNUq3v
 roLE3QZmz+WtV/kcIeUM+qv6q7MbaeODvl2cTbU=
X-Google-Smtp-Source: APXvYqza1O5vy/sMEXqio8vDj2ErJ1IMEfPJ6U9XMwIzVL98XV+0sA717DKpUHr2iaiGrtOr5oc+UrSRpmdUpCcaiUU=
X-Received: by 2002:a05:6602:98:: with SMTP id
 h24mr26972589iob.49.1560996861462; 
 Wed, 19 Jun 2019 19:14:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5ms8f_wTwBVofvdRF=tNH2NJHvJC6sWYCJyG6E5PVGTwZQ@mail.gmail.com>
In-Reply-To: <CAH2r5ms8f_wTwBVofvdRF=tNH2NJHvJC6sWYCJyG6E5PVGTwZQ@mail.gmail.com>
Date: Thu, 20 Jun 2019 12:14:10 +1000
Message-ID: <CAN05THSoKCKCFXkzfSiKC0XUb3R1S3B9nc2b9B+8ksKDn+NE_A@mail.gmail.com>
Subject: Re: [SMB3][PATCH] fix copy_file_range when copying beyond end of
 source file
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
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 CIFS <linux-cifs@vger.kernel.org>, Amir Goldstein <amir73il@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 "Darrick J. Wong" <darrick.wong@oracle.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Jun 20, 2019 at 11:45 AM Steve French via samba-technical
<samba-technical@lists.samba.org> wrote:
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

+ if (src_off >= inode->i_size) {
+ cifs_dbg(FYI, "nothing to do on copychunk\n");
+ goto cchunk_out; /* nothing to do */
+ } else if (src_off + len > inode->i_size) {
+ /* consider adding check to see if src oplocked */
+ len = inode->i_size - src_off;
+ cifs_dbg(FYI, "adjust copychunk len %lld less\n", len);
+ }

This makes us return rc == 0 when this triggers. Is that what we want?
Looking at "man copy_file_range" suggests we should return -EINVAL in
both these cases.



>
>
>
> --
> Thanks,
>
> Steve

