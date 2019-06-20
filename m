Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC474C6E0
	for <lists+samba-technical@lfdr.de>; Thu, 20 Jun 2019 07:47:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Xqza1RteE+yZnsf6TJJy8YfLugJSOmuDDR38PN1bfrc=; b=X8Rw6D2lsidh+lgba+ttJEqL0W
	VI6VRefRuCEffSQykqEZb4sWxZibqP32F9RP6nBOpQzmpxbKstE6jlEK/OCfVVuszkpyPP5JzInlf
	xrDbN8Y9pka7ZJlk8c+aCtL8QE8AXrK3d91j6QMr1mOyhY8uRVq9wnJnQsce0W+w3ON65Fj9I2tHO
	H0qZIdaFoZJTsuwbsFgED8r9CLCWUJXohbkmfhsg5FnmeDuW8F93gwa2nBwGKDuEBh2mBaZB2m4dH
	gBFFQ9c6PDnPM7/xsc8gzyjVhxzQcl2bwQuN2c4czFBAmzG3L8POyj2vlVnvaXqOFTtv2u+aTwbQ8
	9ReZBJUg==;
Received: from localhost ([::1]:53916 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hdpuQ-000bK4-9l; Thu, 20 Jun 2019 05:46:54 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:35109) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hdpuM-000bJx-96
 for samba-technical@lists.samba.org; Thu, 20 Jun 2019 05:46:52 +0000
Received: by mail-pl1-x644.google.com with SMTP id p1so925733plo.2
 for <samba-technical@lists.samba.org>; Wed, 19 Jun 2019 22:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xqza1RteE+yZnsf6TJJy8YfLugJSOmuDDR38PN1bfrc=;
 b=P14P/qz5XwxUgQH5ZKcLdhJIchj1Br+vuXZXjsECJ9duC6sW8+e7sQHuxcONHn1Bm2
 pA1wS928va/XyNAnqV8jxGFj33duinqRHd+tnhZojxeriad5MIUXDtAhqhCqlao5K4Ni
 M3To3kpv9PkqlPQyy4I2tOR94IL0aZt7YULOfgS8gm+i0KDT8MjxZj2H5+VIpdnYJFWn
 gO5H2E0sLnob/zyruQUTb8237C3Ag0szk4YSU5+y+7lTEB0KC59CwBkJYLRvFP98qVIZ
 qltVM70znWuEiY9ZokJuMnLs6VsoN5tQrKrM25yreSajOqKYaYnZbgzZsVbOQ1CbuHL/
 3Seg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xqza1RteE+yZnsf6TJJy8YfLugJSOmuDDR38PN1bfrc=;
 b=Sj95mDApQYF2PfxA1pK37T2p29HHjuwyBoMHIJXbc2TDSGaW6AglXP6MiUjotSHpIn
 zY08Y+F/4j0uUhOHgYp1Qi9StRL7CHd0ki7AG8j2rcxw8vmVbBFKL3COtAGXAn2aboGF
 ykXlgG/HGtR3Hz2sty8L+HpZzKUTo/YyXzN+N45JoEFk2QmNaFVmbIeVzYjlxZjrJzi0
 jsu2gLAWs91hbGSLhHGwJQwbiuk/2VlCy1oCyVV3OsF7Ti5uggkpcJ2Qu0cmH6/Nfuyo
 92opSTFuw0PEoGeydZlzZEEcnmsNWpiV5oLRXIpxaLK4Lt2hXX65T5tKCRElIwr3RQHg
 NoKg==
X-Gm-Message-State: APjAAAUTnzfK3Zi4k+Z9Q/C4LuetG4uWjEyaL78lNvp4+S0MTUgUuzk5
 2IUn6o+86pLyYZ4lQIBw1Qm+Uqs340d01wIUMvY=
X-Google-Smtp-Source: APXvYqyBWIon8FQ32Ge0RTteBZ33psUWVbLEsMlRpTFDS2mZSgvHNpNjiHi3y69kR/hpO4Mc2qv9m2iBUKKaSHQIpfU=
X-Received: by 2002:a17:902:8543:: with SMTP id d3mr528215plo.78.1561009607478; 
 Wed, 19 Jun 2019 22:46:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5ms8f_wTwBVofvdRF=tNH2NJHvJC6sWYCJyG6E5PVGTwZQ@mail.gmail.com>
 <CAOQ4uxhC9x-quL0O9CYaqQ6_uX3yW_3PgW=a68AJboB4pjqz1w@mail.gmail.com>
In-Reply-To: <CAOQ4uxhC9x-quL0O9CYaqQ6_uX3yW_3PgW=a68AJboB4pjqz1w@mail.gmail.com>
Date: Thu, 20 Jun 2019 00:46:35 -0500
Message-ID: <CAH2r5mtUK0AD=igA3fsmJC=ktWodWEhonytbaWHgvaNrt5H8dg@mail.gmail.com>
Subject: Re: [SMB3][PATCH] fix copy_file_range when copying beyond end of
 source file
To: Amir Goldstein <amir73il@gmail.com>
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
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 "Darrick J. Wong" <darrick.wong@oracle.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Jun 20, 2019 at 12:28 AM Amir Goldstein <amir73il@gmail.com> wrote:
>
> On Thu, Jun 20, 2019 at 4:44 AM Steve French <smfrench@gmail.com> wrote:
> >
> > Patch attached fixes the case where copy_file_range over an SMB3 mount
> > tries to go beyond the end of file of the source file.  This fixes
> > xfstests generic/430 and generic/431
> >
> > Amir's patches had added a similar change in the VFS layer...
>
> BTW, Steve, do you intend to pull Darrick's copy-file-range-fixes
> branch for 5.3 and add the extra cifs "file_modified" patch?
>
> Thanks,
> Amir.

Yes - that seems reasonable to me


-- 
Thanks,

Steve

