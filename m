Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 712B361A788
	for <lists+samba-technical@lfdr.de>; Sat,  5 Nov 2022 05:39:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=vDF++S4LhIrpmDDfVfJDNoaDy6OEV3tUQnxpL3sdKps=; b=rMSh6v1rRpL1ifdIX7mTLukc1g
	LiuAjxRJYTvO1l//XXlln5aCvOvRcwg4EgVenShGOcxVEuPsFisi+zIYOcv727f3ov4pFT0lRy7Vp
	FnAjMqlk0zk5XeCqDnMLiWxki1ZkSRpxpwq2Zkj8pP7BRcOUCguwjbJCCabUkj++I3iTH1g/ocdFh
	oI3z4+sKYw1N7EmFVMPp6P9Vu7gB2ySkepOn1gqmYst+8dapNf9fNpEv3JSIyjaq99DY7PJstC+4E
	Y7S1osbgqudVBVPBIANF66XGEm6GOHQKJrNFcAcUaLWNWoTBufvbJnjiPprZ8rbpEfgfhKJ2tj6P3
	JwYbu1tg==;
Received: from ip6-localhost ([::1]:44186 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1orAwl-00Az6d-QK; Sat, 05 Nov 2022 04:38:19 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:47020) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1orAwc-00Az6T-RD
 for samba-technical@lists.samba.org; Sat, 05 Nov 2022 04:38:16 +0000
Received: by mail-lf1-x135.google.com with SMTP id bp15so9867238lfb.13
 for <samba-technical@lists.samba.org>; Fri, 04 Nov 2022 21:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=G94EzSpLejiOW80KGsFHMF17xj8eUqaUn5dCiJyeBV4=;
 b=c3otOZ6k4tKN2ar+RrSt4t5g8aTPBH+h8rvM6YT9Ifc8kMXYhBLaaF5ALYn/LXBbgn
 dVJKJNA/85G09cHpZwQc9wTwOaC2xt0yPPeq8rQINjjGcJzo6rQ70CFX6p/yz55IJvh2
 cbhhRenbaA69f7UWBjT4q6TSIdViosrEkiDS9mNOKprPVPh9FaDf2Bbx4e7/QCAEMnrX
 XdQw3/OP2jWPhD06OGeUJs3ULvK4Sh3feJYb2lZ16Hm14cQrW2xVo/cMlLgzjL/Kvkj5
 j575Rr3Fszk+fe2I3lcK4uSkrmzS24ChNyQYFa9I+JFHGYePtmOqYkpGl+6mjNrqO/Ps
 xekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G94EzSpLejiOW80KGsFHMF17xj8eUqaUn5dCiJyeBV4=;
 b=ZSjzz2Fqr/u0RmdyovwKvbgVmbhJSaSsu5dYY/A78A1GuJ8P0brWcJUgEVEH+QtSFe
 RUGadA+aF2ZRGhzoea76ZVnwt5JZE4CqYk4GSCRvFe6l1z/bHWwwaMDZ3wFRkITKVZNY
 oKE10qQTJoWiCWZWtoGk2IC8TvXG2bQyNM/QVdhfsz97eqIk5tXVC2lx5RsyUzXFoPTd
 G1RapCQ45NMXGhfRJZVZgERQYAQeyow71MPaWrCC8BZBJ9re5Wefm9/9LfFtcHCqJzQ+
 K8Eor7aYktlnAmXxwoe14QPUSpxhkId6JM5y3kkvkG/URe3lBPqMwQvP0fKwCILRMouK
 mwtQ==
X-Gm-Message-State: ANoB5pkeuqAl7ZIYHlNvJYuN1B2dVr2zT3/HY0YVOIkXQA43qhTIjf+t
 Yj94oZFS4wqrNzmVkK0hOhOz+2QQ8EZeI1szUz4=
X-Google-Smtp-Source: AA0mqf630Xg00Yu7pb6a7TdYcLYCHS7nJO9v2+7O+LpiBo01fAiy1Fn8jysrPibB4D8SkxZ1jEwfCCIOhZzUxRNC4Ik=
X-Received: by 2002:a19:c215:0:b0:4b2:9de:44fe with SMTP id
 l21-20020a19c215000000b004b209de44femr1583825lfc.636.1667623088718; Fri, 04
 Nov 2022 21:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <20221104074441.634677-1-chenxiaosong2@huawei.com>
 <871qqi1u3a.fsf@cjr.nz>
In-Reply-To: <871qqi1u3a.fsf@cjr.nz>
Date: Fri, 4 Nov 2022 23:37:57 -0500
Message-ID: <CAH2r5msDR41wQhtsAcE_pUvXXdvwWBBNdESvCkieBoy42vVhcA@mail.gmail.com>
Subject: Re: [PATCH v2] cifs: fix use-after-free on the link name
To: Paulo Alcantara <pc@cjr.nz>
Content-Type: text/plain; charset="UTF-8"
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: linux-cifs@vger.kernel.org, yi.zhang@huawei.com,
 ChenXiaoSong <chenxiaosong2@huawei.com>, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, lsahlber@redhat.com, sfrench@samba.org,
 zhangxiaoxu5@huawei.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

tentatively merged into cifs-2.6.git for-next pending additional testing

On Fri, Nov 4, 2022 at 12:57 PM Paulo Alcantara via samba-technical <
samba-technical@lists.samba.org> wrote:

> ChenXiaoSong <chenxiaosong2@huawei.com> writes:
>
> > When opened a symlink, link name is from 'inode->i_link', but it may be
> > reset to a new value when revalidate the dentry. If some processes get
> the
> > link name on the race scenario, then UAF will happen on link name.
> >
> > Fix this by implementing 'get_link' interface to duplicate the link name.
> >
> > Fixes: 76894f3e2f71 ("cifs: improve symlink handling for smb2+")
> > Signed-off-by: ChenXiaoSong <chenxiaosong2@huawei.com>
> > ---
> >  fs/cifs/cifsfs.c | 26 +++++++++++++++++++++++++-
> >  fs/cifs/inode.c  |  5 -----
> >  2 files changed, 25 insertions(+), 6 deletions(-)
>
> Reviewed-by: Paulo Alcantara (SUSE) <pc@cjr.nz>
>
>

-- 
Thanks,

Steve
