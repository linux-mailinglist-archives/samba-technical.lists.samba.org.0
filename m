Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D67F6C41F0D
	for <lists+samba-technical@lfdr.de>; Sat, 08 Nov 2025 00:23:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=1+AFCmcGkAqt1At2HC2TTbyCq2E8P2gcZqbl9tGD188=; b=YCy/BZpU/AqUUN6fRXWHe5iAA6
	IezqcLUKnkXOU2/sWQ/go6kX5fKxHAIswlV31dQCKuzjpFxGa5Z96+d3mbw/8fF7eZop9sPABbWDX
	UnZDjE5KvnCGsWZYoGe9n+XAcbFwv9UkI7gRBB9/Zuzqqkbn1mhPGwaP/v9DbtGQy7YRvbaHciXcK
	T0t2MVMyxhfo2IVGGlYPwB54iKBHB7d5PEOWHWfw43O9z2PvpX6VS6Ae1H/KuDMJlti4B6SSu5ziQ
	lNAJnf26Yori9ybfea9RuNs7uQ/U4ztSd7fvU2aL3ir6rxJEsydECHuod8ONGRC4oD4ZP5tiCRS6q
	GR5EHqIA==;
Received: from ip6-localhost ([::1]:43186 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vHVmw-00BkIF-CD; Fri, 07 Nov 2025 23:22:38 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32]:50365) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vHVmq-00BkI8-NO
 for samba-technical@lists.samba.org; Fri, 07 Nov 2025 23:22:36 +0000
Received: by mail-qv1-xf32.google.com with SMTP id
 6a1803df08f44-8804f840579so19149986d6.0
 for <samba-technical@lists.samba.org>; Fri, 07 Nov 2025 15:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762557751; x=1763162551; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1+AFCmcGkAqt1At2HC2TTbyCq2E8P2gcZqbl9tGD188=;
 b=U56cyxGEgVhWqwRHzEpT4zqGDG2/HydVQHHZyJzaBY2uCU6Ic1/n7E9cZ6DB8m78O6
 mqdOJJMXEO/HmlNH9sZ5gkzWY6Hpyemgab8nWCnsQGreTTM1sKB1OvyPKHBxA7WcywWt
 a0nrGXGNdQnKdY1TId4vwGT47041jDWIUAeE+bSFR6Svtd3LU8H9l4Ei65PMaUTcrZn3
 RUtW/ecHf59kdmx1x6YZUdluL00o9V7elbxzlwK690sNbNPRvZlLC+hkrbUOkaHVQvTi
 eXMj7I7VdhXEvEn85h8YxG00F8Pc1iC1z0GbP8loDzyCnB7oSHarVjgMj+WLYA0WvLvM
 eL+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762557751; x=1763162551;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1+AFCmcGkAqt1At2HC2TTbyCq2E8P2gcZqbl9tGD188=;
 b=BA8mI3EtqjwND/1s8CnM25DiWSW7OGsT6RrV8eLHiylr/U1+9EXPawr2wVAAC94gWc
 AN6/mgBeAng61R33vRnaNwoWFOoQ1rfsKp34vIbRGDNdmJmyE36LAR/zSbg3M1SkIjTt
 9zKKL3K6oB55jvI6vw/DVxCC906i+wfB5ed6wcbU8VS6IbZVD+tx1OGhQ598MXJy348s
 XRbiR82EjK7rWBJPIvzLWTMUESgaRBkH92mtGMWyzwfqGvZ4zFbd/uX3kywyiR50Gavg
 EXZdHcX+A5V8VyG/snFIG2oSrNhwco0JIudOcwWit5mlgWUHq7JTCeg/jL31NXeAEHOV
 cPpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqv4m+iHCoYMwR/iJ/4qo6GjqVh3HvyusbApQSk8eCDQj/x+eah73m63gRGuOS+5ycQv9+Gxpd1ZlxMpXm3II=@lists.samba.org
X-Gm-Message-State: AOJu0YxiS0mYiBzwHBpNiojBBWe+hHgcXYpOB4n7eOAuxw3ujkUZN9ig
 kErj32fXVyJH6silNn4y2PelRc6jceAAoGG9hAWNj4C3ywqGj0FgVZJm54gCreTaTgCTmtx2VSy
 7Ofhl42HdiKj/v9pS+JllA5zv0Pfit/s=
X-Gm-Gg: ASbGncu94FNfsf7v5sffMoytPmnJ7pVPrE4ex9FYLvOkDPaS3mBX+RL0NHBd4Eyzajx
 IocNl5JvegmYY07cL+9KJmhuZ8TWEw7MaoZ46F8YFap7lPM4FqgvyGxiuRBYVHQ2kHBd+M1c3gN
 PnzQ7ggWdnZXkbAUJnjPxxIfY1cdxg2VY8LLIHGqjJz0/MKEtAApnYrddbt/t22POuRJn/VSsaK
 nP8jiT21eCwHBM5nTtD1qAsLBmyNZ3dA094jc0UP5HWb+tzNwdLwrwTQw9W9gTgN5IcAUbzflVr
 aJbadhCUQWIO0e8GLzVPUrtosbosGwUyu724E3H9XILGnIrJASi44EVRzDuPtEIdQsou+lYyfV6
 uEBfsNlu1Kj99UZ0kYsDwrbAsBWGnCKueFDDzeX2J4xqdRS6p0+WDDLwB7GNV05gWcJdoF2Oyci
 cnP10N8w==
X-Google-Smtp-Source: AGHT+IFJ2JgPKhmnyzgneRGCagyAH4hzlYSmYiz/O+vgt1pHhAQ2ZKQ355Y4DvJc4HnzxtJb+9vAUFNwr0i9OGzJEOM=
X-Received: by 2002:ad4:576e:0:b0:880:4614:bb0d with SMTP id
 6a1803df08f44-8823864299cmr11365096d6.27.1762557750876; Fri, 07 Nov 2025
 15:22:30 -0800 (PST)
MIME-Version: 1.0
References: <690da014.a70a0220.22f260.0026.GAE@google.com>
 <tencent_5D8667DBC6ECD2FF464349ADEEFD2EE84C06@qq.com>
 <f25e47415998a9d9360ac87eca7292a2@manguebit.org>
In-Reply-To: <f25e47415998a9d9360ac87eca7292a2@manguebit.org>
Date: Fri, 7 Nov 2025 17:22:18 -0600
X-Gm-Features: AWmQ_bkEpYmY2gRj8B26Nn5J__r1j5sVrw-fQtqJ15_06sBhrYAkZmr7jut9NuQ
Message-ID: <CAH2r5mvRrFmZFtNaQuRFHy2mVM1AG1AnsNwZMOoT=w8LZaLX4Q@mail.gmail.com>
Subject: Re: [PATCH] cifs: client: fix memory leak in
 smb3_fs_context_parse_param
To: Paulo Alcantara <pc@manguebit.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-cifs@vger.kernel.org, sprasad@microsoft.com,
 samba-technical@lists.samba.org,
 syzbot+72afd4c236e6bc3f4bac@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 sfrench@samba.org, bharathsm@microsoft.com, tom@talpey.com,
 Edward Adam Davis <eadavis@qq.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next pending additional testing.

Also added Cc:stable tag

On Fri, Nov 7, 2025 at 8:52=E2=80=AFAM Paulo Alcantara via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Edward Adam Davis <eadavis@qq.com> writes:
>
> > The user calls fsconfig twice, but when the program exits, free() only
> > frees ctx->source for the second fsconfig, not the first.
> > Regarding fc->source, there is no code in the fs context related to its
> > memory reclamation.
> >
> > To fix this memory leak, release the source memory corresponding to ctx
> > or fc before each parsing.
> >
> > syzbot reported:
> > BUG: memory leak
> > unreferenced object 0xffff888128afa360 (size 96):
> >   backtrace (crc 79c9c7ba):
> >     kstrdup+0x3c/0x80 mm/util.c:84
> >     smb3_fs_context_parse_param+0x229b/0x36c0 fs/smb/client/fs_context.=
c:1444
> >
> > BUG: memory leak
> > unreferenced object 0xffff888112c7d900 (size 96):
> >   backtrace (crc 79c9c7ba):
> >     smb3_fs_context_fullpath+0x70/0x1b0 fs/smb/client/fs_context.c:629
> >     smb3_fs_context_parse_param+0x2266/0x36c0 fs/smb/client/fs_context.=
c:1438
> >
> > Reported-by: syzbot+72afd4c236e6bc3f4bac@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3D72afd4c236e6bc3f4bac
> > Signed-off-by: Edward Adam Davis <eadavis@qq.com>
> > ---
> >  fs/smb/client/fs_context.c | 2 ++
> >  1 file changed, 2 insertions(+)
>
> Reviewed-by: Paulo Alcantara (Red Hat) <pc@manguebit.org>
>


--=20
Thanks,

Steve

