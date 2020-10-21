Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B46B2947BF
	for <lists+samba-technical@lfdr.de>; Wed, 21 Oct 2020 07:22:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=R/RCjjhFdcbB6iZwnroNUnHaeGRk4718oXCX+bNL/cI=; b=egGZPs5oygtJe0HdYmeXuy+JYi
	hRYtN6NElGLrhokFnNg7TPkIdaYGWmyPnq7frPpPBMm1Fgfc6ud+66JaWq3sNjwp6iHXKS1h7lnB5
	1IGIxQM4X7eAbfv7RLM4OBgUd/iCHFAiLzwji2tltxAcYtnR+x4sDhfnNz9RE4uy6OgwF/9pm5DA0
	C89x+lOwPSwJuPNaoPxnO5rnxN7789MSQ6YGpnI0Cr67/XnwvBlnuN1EiT3vTLhNSGPsqc9TapZsc
	NrYnWeipxzF1/TITafyRma2AVEv5Dp4XgzPwZn9Buvczu1aOyFP/53VNQGrl4EuhtCn+b72G/R55e
	OtpebuVQ==;
Received: from ip6-localhost ([::1]:51628 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kV6Z1-00D12p-Ec; Wed, 21 Oct 2020 05:21:31 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:45247) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kV6Yv-00D12h-G9
 for samba-technical@lists.samba.org; Wed, 21 Oct 2020 05:21:27 +0000
Received: by mail-lj1-x22b.google.com with SMTP id a4so1068394lji.12
 for <samba-technical@lists.samba.org>; Tue, 20 Oct 2020 22:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R/RCjjhFdcbB6iZwnroNUnHaeGRk4718oXCX+bNL/cI=;
 b=t36jz0XnuGO5n2iYFnSbqkxjtqc4sNGxqHujaFS/7ny0rSR5S3jJIskc3JlLRka48S
 kTbPaiZ23QH8Z6E9k3ccfbAYtsBy3C/7FYogg1oBpTU6MaOyrGTpUb7MFqTWTSurKdwI
 s/jlXKsv0X5WdLIEcLV1tG4suUkjfDbUb9kUIJH9WMK8vaY1SEuP/0we44HBu+GwtpTj
 Y33I6xfFq4OMxWtrq69hW3gn2NgZ8fllk9jj4YwvayWAAQDN56dK9KDIM6/5blj9qwTU
 PmB8O8CJ+CUVJ7LZPm1zepwcK1WstyLaugaDUykyZdZsZRV/u4+iAwLgw9C+atEHFeKu
 c7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R/RCjjhFdcbB6iZwnroNUnHaeGRk4718oXCX+bNL/cI=;
 b=DgQkWqZAvYGdt3t3i05N5+6ENyx9LnczohQ8ZX5xgmVW/AHynSVvyVnQ0I4nk6mC+B
 TW5xS+ov+ntZFYrF3IuhOQ8viR6gxTFC/GKH1i4+wSGDChL4dPopyRTsnAdgnGnj+nPM
 hT0cN5RdxMGSFfOsOlHepEjBvODObmn0PymYbMqZFTs+vPbk0v1xc2yMvgexb11Vw+5H
 bUxje3wAc2LQh1BwBJYxl8M77+4YnRVLxp+/QAL1v/dBHQq6kUlcTkr5GvNdwz1fY89K
 hxnekBPPHtG+R973+tDNJ2TfjaLE9gtRhjuS8NvcNqQY2+5GzJi+3OB+P9jRk60bu0mK
 2BWQ==
X-Gm-Message-State: AOAM533LHAkKuJ9RfArjDQK5+w381q5S3NOjTfil/66rYfJ6V4dN2eky
 wQwWcg6FMzVv+fRmpTrrmbGmMGGv0F6j4LLy3JE=
X-Google-Smtp-Source: ABdhPJzbK0V7cF6PathH7Sarkc9Yuh5wIX2weOj8e66KGJej+nNY5MjlJDVd/XTfdlYIu/Lj3OrJYj2h5s1nhhEa5jA=
X-Received: by 2002:a2e:b009:: with SMTP id y9mr549643ljk.372.1603257675835;
 Tue, 20 Oct 2020 22:21:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mu2s3Fu+_mWTiXFp+JYTAWZZrPCDyDNtWAhit2DjB890g@mail.gmail.com>
 <CAN05THT4zcQaB8HHEsYi_nA9=VQMuqd53h0=BTSi+FtxYMuiMA@mail.gmail.com>
In-Reply-To: <CAN05THT4zcQaB8HHEsYi_nA9=VQMuqd53h0=BTSi+FtxYMuiMA@mail.gmail.com>
Date: Wed, 21 Oct 2020 00:21:04 -0500
Message-ID: <CAH2r5mvv4MKEL=mGMLBBjLrOapG60N6O2EjjhpCdEYDnnwbx0w@mail.gmail.com>
Subject: Re: [PATCH][SMB3] fix stat when special device file and mounted with
 modefromsid
To: ronnie sahlberg <ronniesahlberg@gmail.com>
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

We probably should if we could create special files to Windows using
reparse points (or just set them up manually).  I created these by
doing mknod and mkfifo over NFS to Windows and then doing directory
listings and stat over SM3 mounts

On Tue, Oct 20, 2020 at 11:19 PM ronnie sahlberg
<ronniesahlberg@gmail.com> wrote:
>
> Receiver-by me.
>
> Should we set up a test for this in the buildbot?
>
> On Wed, Oct 21, 2020 at 2:05 PM Steve French via samba-technical
> <samba-technical@lists.samba.org> wrote:
> >
> > When mounting with modefromsid mount option, it was possible to
> > get the error on stat of a fifo or char or block device:
> >         "cannot stat <filename>: Operation not supported"
> >
> > Special devices can be stored as reparse points by some servers
> > (e.g. Windows NFS server and when using the SMB3.1.1 POSIX
> > Extensions) but when the modefromsid mount option is used
> > the client attempts to get the ACL for the file which requires
> > opening with OPEN_REPARSE_POINT create option.
> >
> >
> >
> > --
> > Thanks,
> >
> > Steve



-- 
Thanks,

Steve

