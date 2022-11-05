Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EC58B61A78B
	for <lists+samba-technical@lfdr.de>; Sat,  5 Nov 2022 05:39:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=pbMdUA8UzsgI7FBm0NGKkw14zTLbr3tXLACAHzr4fDs=; b=2mv8/vGL/LhokwgUjNynjrbuEN
	+QTIOjGSAHtjba9FrPLpB/ZbdqV7k3MOMG6csuZQy7txqoe5PPTBwMPDfClDuD5v6neph4kraoUQ+
	WN4Eq4tf9XiBwGoshVkAHbr0hL3VqvDteydt37f0jc95h2W/QFSmZHbJCcRnSr1EoUgQPiYayx43/
	LIzgRBDytPKQ5zSgto/uhF64vsKpehXHLL9wMgfQIxmcmLGAWvakSN+H2im983To6DL3rEghNDD4J
	KMCQwQg1MgiT6U4a7CvBbDav1P9EWVJ3lZ/EMBaDLRI1SNq+/aNhCSNRF8qEutYjgQ8+81y85SwWD
	Y24TqUyA==;
Received: from ip6-localhost ([::1]:62432 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1orAxz-00AzJw-NE; Sat, 05 Nov 2022 04:39:35 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:42645) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1orAxt-00AzFm-Ep
 for samba-technical@lists.samba.org; Sat, 05 Nov 2022 04:39:31 +0000
Received: by mail-lf1-x12a.google.com with SMTP id o12so9903010lfq.9
 for <samba-technical@lists.samba.org>; Fri, 04 Nov 2022 21:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pbMdUA8UzsgI7FBm0NGKkw14zTLbr3tXLACAHzr4fDs=;
 b=CBUyq6rYjIfFSwz5VzRXGpr7DVFky/4CH0A1ipD4d8L+781f6w+0x2TsJmqGkamr6I
 Hhnl26yg+95M13iR75yIefdX4cFjP7cM7ovutbIu4KrZRCmVksiqh7JoLI37N0plcNMS
 s9NnMhjo2JWh1+xUY9vq9Afy0Dxf54t2hlyzG2wVyu1exu6xtm9AuZjL4+J35APgWn5Y
 OwWXVvFlXy7J8ZlO7Bihw9NhuQo5QQ34atPRgXxJaqUOe8hGIzxu6K8muyCci9r05v02
 Z4JLv06IBzqXbfXhVZc86fRd6QpvdlNiGQHLWu9sFaR4N4yNlRcNnQvCxQTtS8l6jBqk
 ueTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pbMdUA8UzsgI7FBm0NGKkw14zTLbr3tXLACAHzr4fDs=;
 b=kVAfkI8n7pYBssXJC55BxWqY+AEQzxmcVUGKb5k64VZYZ9Jb4bOgHxTMuv1Qy7HYb/
 Runv0oBRCNnedcAEQNpyCiietbgdeERKcVUEn9Qp14dJIggRbzq08Lvg7WxntOH3bzOE
 CPn6mg79HqTtNS7MZE2WTViSq0H+f6s7DmVw9AHHqggJiWZ+Ql8B3BF6wPNdInfnvUOX
 tfc0B2CCLKXzrk77avQWrQOLeJDPFpvmkXfVXqvT0qEs05c3d4VUE2JnWp2dlkLDp2IH
 0sGzc6THslHpq1gkmxEGfjdBw5C4lQiUOMb7r1L/qcByWaY/cQ5sq0rrjuDG61TjQwvi
 ieBQ==
X-Gm-Message-State: ANoB5pl4OuzFILpxa/TNcrnZFmJ+7Ffy226j4CjnMhkeoQgnbFJE1vXX
 jRqgzYO97fu9pDo7HsGjh5ZYI8Mv5fqnAfPQeanXc5pu
X-Google-Smtp-Source: AA0mqf7nLvop9D7qwQ0uqbWJPpEk5/avywHRXNBnPB/1d3nHsLxajC4xHLpyUku0yqPnJvMAPZXupJDsz6XCNwkQ0DY=
X-Received: by 2002:a19:c215:0:b0:4b2:9de:44fe with SMTP id
 l21-20020a19c215000000b004b209de44femr1584906lfc.636.1667623160012; Fri, 04
 Nov 2022 21:39:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221104074441.634677-1-chenxiaosong2@huawei.com>
 <871qqi1u3a.fsf@cjr.nz>
 <CAH2r5msDR41wQhtsAcE_pUvXXdvwWBBNdESvCkieBoy42vVhcA@mail.gmail.com>
In-Reply-To: <CAH2r5msDR41wQhtsAcE_pUvXXdvwWBBNdESvCkieBoy42vVhcA@mail.gmail.com>
Date: Fri, 4 Nov 2022 23:39:08 -0500
Message-ID: <CAH2r5msCeS_3LJffON76hOO5fe7HA6Kc-5z7wDbXuoEDAijVbA@mail.gmail.com>
Subject: Fwd: [PATCH v2] cifs: fix use-after-free on the link name
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>
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

tentatively merged into cifs-2.6.git for-next pending additional testing

On Fri, Nov 4, 2022 at 12:57 PM Paulo Alcantara via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> ChenXiaoSong <chenxiaosong2@huawei.com> writes:
>
> > When opened a symlink, link name is from 'inode->i_link', but it may be
> > reset to a new value when revalidate the dentry. If some processes get the
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


-- 
Thanks,

Steve


-- 
Thanks,

Steve

