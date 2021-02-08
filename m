Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D450312A3C
	for <lists+samba-technical@lfdr.de>; Mon,  8 Feb 2021 06:50:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=MEuxTlGGfwSG5I1P/p/i0rmdXnHyF57xxbgMJypphoc=; b=jKq5ADbbH09fvmyPCX+/m6g/tv
	usY1nEPqE9AJT9t05S3eeQ8yvfohDHxnwTL1LRe8ffXYAv0zUtE5D4jMuOgIbbVH6QFsxP+Lfbl5s
	ElNuZ85RI1XS2Vue82XzUMFjQyktim6L4AF+3qJpja9suM0Nbbq4K8btGu4whuZLNNeyrmBFok4U3
	yQuR3UzPxtaVgiO33PdsWx2qZoruP3hU3gAioY0KQylk5/sDLDNNulc6eV7poW8stjiP49XCFA3n1
	6GQxTQ08838WdASM1bCWTCe1IrjXPDpsr8bFnB6Og0bDtOuHDBEbgwaVr+WBJLR6+9jJth/5d+eIk
	X9TFqHqg==;
Received: from ip6-localhost ([::1]:33158 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l8zQS-00Bazh-Be; Mon, 08 Feb 2021 05:49:32 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:44962) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l8zQJ-00Baza-C1
 for samba-technical@lists.samba.org; Mon, 08 Feb 2021 05:49:26 +0000
Received: by mail-lf1-x12a.google.com with SMTP id p21so20462889lfu.11
 for <samba-technical@lists.samba.org>; Sun, 07 Feb 2021 21:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MEuxTlGGfwSG5I1P/p/i0rmdXnHyF57xxbgMJypphoc=;
 b=fKl5gnPHMmqUjeShZSy9R9Aodw0JVaA4YPCg4pvlGXuAzx6KP0a5IfOiQz69svWS8S
 R+lfdY0cwg4GpzwGs0qWiBDMvPmHjwx/lVlygoEpYhQmbsTuk62bhCNa35J+iI22noJw
 TPffpQ0TvLId3UFgLcPPlq2NLUGB4xYzb3N4g4SFKflqE+uZfQoH3TwaXfELfpboV4ng
 Rkkf7vZLMUN9Kx0FFidC+2fPKA5nrcZhD2pScP/gQCn3tio+2Q2XMzFumUcdRd01HvhD
 /kbEo89/iu5Pn/bWE0QlIdlch4Hsx2YeHU58UvGbYQEgSHbsHC8hzSV5+M1i1Ikz3Z5s
 kUag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MEuxTlGGfwSG5I1P/p/i0rmdXnHyF57xxbgMJypphoc=;
 b=i0d7HiuqzWqKXCyN8mb+rJmv0RUfibtDLDan28PSiYwUYJdxcJarA3pF1P98L9xZ5+
 YDoB4oOXkAKjo0WtFy4rLx0UJF3PKHBn+qdS1nlSC1U/vwh4u+mtqZgbWBwyjhAB/ad2
 TeFkS4c+haR5yko6hCqElzYm2kohzx/aehDD248vC/miWnAneDHlzac2JuqpaME7ip5b
 EfNIr6u7a2nq6rPxTVQ0o4TgdzygN1D7pcpO38RyUN+mRD8Ltt9d4XVRlSMGa7KzdYEe
 9QPdtAq+FQe3amZIGaSETxk8s0ZMT1wbabfzUSGmtgBBJ7RTaNhIKgy89DHoLknNm/Qm
 KNVQ==
X-Gm-Message-State: AOAM531F95f1VQD/3RQ2MB+8YbegTrYE9OV5znKRDfdMOawqWeO/GPrY
 9myQam82c75a955hxjy2GoxUKwDVdN46V3H7PHY=
X-Google-Smtp-Source: ABdhPJwbukRXgSK6X+G29DKQq80c+lQZ2TtCiYF6wDVPqAp6mzSnJQdfAkjonPOo3TbzazZYLrkh/hAwHDVLIvfU+uc=
X-Received: by 2002:ac2:592c:: with SMTP id v12mr9164512lfi.133.1612763359685; 
 Sun, 07 Feb 2021 21:49:19 -0800 (PST)
MIME-Version: 1.0
References: <CGME20210126023109epcas1p257c4128a9d8673cb44f81dca636da39a@epcas1p2.samsung.com>
 <20210126022335.27311-1-namjae.jeon@samsung.com>
 <09887b1a-3303-9ac6-1d29-c53951be5324@samba.org>
 <CAKYAXd-rfk26A4SOeqvhMkBV2FcvpE0goj415HX7T4fBim1zQA@mail.gmail.com>
 <CAH2r5mutwPP570YbwxDWikwM6e+gdD7m2iwMJ5xNEcvqpkVrNg@mail.gmail.com>
 <000101d6f833$d9c38ba0$8d4aa2e0$@samsung.com>
In-Reply-To: <000101d6f833$d9c38ba0$8d4aa2e0$@samsung.com>
Date: Sun, 7 Feb 2021 23:49:08 -0600
Message-ID: <CAH2r5mtmmei0q9kemkjL-QyDfeiNNYCidAuqX=WN0PncoqiokA@mail.gmail.com>
Subject: Re: [Linux-cifsd-devel] [PATCH] cifsd: make xattr format of ksmbd
 compatible with samba's one
To: Namjae Jeon <namjae.jeon@samsung.com>
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
Cc: Stefan Metzmacher <metze@samba.org>, CIFS <linux-cifs@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 Namjae Jeon <linkinjeon@kernel.org>, linux-cifsd-devel@lists.sourceforge.net
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I have rebased cifsd-for-next on 5.11-rc7

Will kick off some buildbot tests with it this week - it is looking
good so far, but let me know of other PRs coming soon

On Sun, Jan 31, 2021 at 6:47 PM Namjae Jeon <namjae.jeon@samsung.com> wrote:
>
> > FYI - I have rebased the cifsd-for-next branch onto 5.11-rc6
> Let me check it!
>
> Thanks!
> >
> > https://protect2.fireeye.com/v1/url?k=776f3edf-28f407c5-776eb590-0cc47a6cba04-
> > 039abc8d8963817e&q=1&e=3337a309-5806-4005-8f00-
> > b7312c0621f1&u=https%3A%2F%2Fgithub.com%2Fsmfrench%2Fsmb3-kernel.git
> >
> > On Tue, Jan 26, 2021 at 4:46 PM Namjae Jeon via samba-technical <samba-technical@lists.samba.org>
> > wrote:
> > >
> > > 2021-01-26 23:36 GMT+09:00, Stefan Metzmacher via samba-technical
> > > <samba-technical@lists.samba.org>:
> > > > Hi Namjae,
> > > Hi Metze,
> > > >
> > > >> Samba team request that ksmbd should make xattr format of ksmbd
> > > >> compatible with samba's one. When user replace samba with ksmbd or
> > > >> replace ksmbd with samba, The written attribute and ACLs of xattr
> > > >> in file should be used on both server. This patch work the
> > > >> following ones.
> > > >>  1. make xattr prefix compaible.
> > > >>     - rename creation.time and file.attribute to DOSATTRIB.
> > > >>     - rename stream. to DosStream.
> > > >>     - rename sd. to NTACL.
> > > >>  2. use same dos attribute and ntacl structure compaible with samba.
> > > >>  3. create read/write encoding of ndr functions in ndr.c to store ndr
> > > >>     encoded metadata to xattr.
> > > >
> > > > Thanks a lot!
> > > >
> > > > Do you also have this a git commit in some repository?
> > > Yes, You can check github.com/cifsd-team/cifsd
> > > tree(https://protect2.fireeye.com/v1/url?k=abb45e79-f42f6763-abb5d536-0cc47a6cba04-
> > 4d12d0be7dd14e1f&q=1&e=3337a309-5806-4005-8f00-b7312c0621f1&u=https%3A%2F%2Fgithub.com%2Fcifsd-
> > team%2Fcifsd%2Fcommit%2F0dc106786d40457e276f50412ecc67f11422dd1e).
> > > And there is a cifsd-for-next branch in
> > > github.com/smfrench/smb3-kernel for upstream.
> > > I have made a patch for that git tree, but I haven't fully tested it yet...
> > > I'm planning to send a pull request to Steve this week after doing it.
> > > >
> > > > I played with ksmbd a bit in the last days.
> > > Cool.
> > > >
> > > > I can also test this commit and check if the resulting data is
> > > > compatible with samba.
> > > Great!  Let me know your opinion if there is something wrong:) Thank
> > > you so much for your help!
> > > >
> > > > metze
> > > >
> > > >
> > >
> >
> >
> > --
> > Thanks,
> >
> > Steve
>


-- 
Thanks,

Steve

