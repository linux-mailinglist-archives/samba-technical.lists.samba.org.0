Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F076BA7A8A2
	for <lists+samba-technical@lfdr.de>; Thu,  3 Apr 2025 19:33:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=GcsoXF35i/+hSpm25m6CjBETnlGwcsMcAt4eR6+93r8=; b=BGzS2c3bCmYjPl8aIBteWnql9+
	6lTO79wdMG4HSbbzDPPc9mYSa3NQs621QR4w6hJdupTxEIoQpaWQ/Dl3S/1xKiXlnsE/aCyAaEXx3
	WMuBKoMEnHreEZNHtrKvn0dz9ixTYg8rry7EKXCURUz2rMZlS+lY7hDVkPex2IkMAmiCkLPZH2U6i
	hylSGJuSZiib1mMzQoQv0rjUHbqqZD2/WbW3nHIR2cOdAbTUvXGsUB7jWxeGk5uTU/mIatu81gBWO
	Z3cT/wiDeTXDSOWXfhFd3TNv/pFoDIgJTdnftxryR3ifNVztcfBf8Df3koF29oBlru2VIDdp5i/8Z
	aR7e8fKg==;
Received: from ip6-localhost ([::1]:58528 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1u0OR7-001f1l-8m; Thu, 03 Apr 2025 17:33:05 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:46293) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u0OR2-001f1c-UL
 for samba-technical@lists.samba.org; Thu, 03 Apr 2025 17:33:03 +0000
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-54acc0cd458so1446950e87.0
 for <samba-technical@lists.samba.org>; Thu, 03 Apr 2025 10:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743701567; x=1744306367; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GcsoXF35i/+hSpm25m6CjBETnlGwcsMcAt4eR6+93r8=;
 b=YCsTnBDmOGLlOmq99CRUdIJauijYBkT6t8vf6sMPExm6z7rMguiZkQGog/lZ960HNb
 26BWhrVwUzWM5GOYcoIFdOSq20ldPsoe587FaovYIfr+K4WSWNI77kadxUHXcunHYZHL
 jfUevZ1eIgCQZ1oP6MeQhnpJp612bTBvwrEOKY4jSpQX+RuOfTAsZsUs7o/5mrHtWiFB
 Tb201/79GNL07UX3oy3bNkrdMZppSKEQRpcpUlsSvdBjagyDgWG1IodebO+sfDbBI6PI
 FVNaE4prUY0bY1AyMNyLl/KcBRceG6ewN9UxQOpEZZ7QNYzz6gsUOcsTgE58BmwIoVhZ
 vn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743701567; x=1744306367;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GcsoXF35i/+hSpm25m6CjBETnlGwcsMcAt4eR6+93r8=;
 b=V2MwDSPcMNCcsAe6lSnohJqbSN8deQNhM8FeWpHr2rcA9D4gJGGyPqK3+ZJ9mNdd6R
 SnSIJmieNJRA6eH7f63nBRELs3k8vC1q3xQW0CVmoqRDAJb3eMgxARgQwK/4ACFa3FNj
 aWXyDHoNTJjv9YOakeeaoFNdnG74XWz9Q1GTUOhnijGkQL4g5YKVjLmglORN120OZS2X
 kCyrZPtGiH2Mfr8fYc6dIPpTymzRU1QZah8tnMZvmx30VP8xJpJdUna4sWsmuQmchdJa
 xmqMkD/014dfZnvEiJbSLoSSr5aeWm9fCNEA+Sv7jWVrqr/vhtbza/fPJ2LSgBFrtySo
 XCJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTR/85D5pThMeYS5ahW9/6n+xLTV11B1YVAVcXQuti3ValapDhnBGKAGdl3kWx4X/8r/VBT96zsfdkK1m1Xt8=@lists.samba.org
X-Gm-Message-State: AOJu0Ywi4TpEk5Twa3E2480pDI8Xfa4yljXJtNaahoIwbyGs0f7nNTsj
 dhrFPGB+YkVb5wTwuABnQURXho8Xh0GUUVAtVnntg2AVapNLwSXow4cgHtvkJauMv1hN9GzGF5s
 9Au9bs5EPkBIMf2t2/juonOO0kxg=
X-Gm-Gg: ASbGncstyLBk/pryNzJqNZ6yyhs9a3CxugOO6NT50nt2kgpDVXqYPnPtNr/lBqwlqwM
 8pOQCL7Tvl2McgcpwKPPHB4K6lbn3/Ah32iK1VX+ojvBXgrWUb5Ays/ZOalalOyFLjxWHZxZUpm
 2KF2mcbQkLbMLkEYI/45puPr6LtALsN3tKZf7Vwe+Br7TS+eDwpNV8pufNH1kB
X-Google-Smtp-Source: AGHT+IHEe+uYv1jyrX50uRJRoS27zS+oZLgCijcqp496hedWd3XtoUrXrhlietwX3sqHe/edm9HqLxcqsCYQE1SC6PE=
X-Received: by 2002:a05:6512:39c3:b0:549:4d7d:b61b with SMTP id
 2adb3069b0e04-54c227dc60emr17560e87.35.1743701567095; Thu, 03 Apr 2025
 10:32:47 -0700 (PDT)
MIME-Version: 1.0
References: <1e95b93f-7632-441a-a4ba-aecd7e640383@huawei.com>
 <20250403172709.92329-1-kuniyu@amazon.com>
In-Reply-To: <20250403172709.92329-1-kuniyu@amazon.com>
Date: Thu, 3 Apr 2025 12:32:35 -0500
X-Gm-Features: ATxdqUEdkwlaOmIye7bwHb04zWJ1D1SxMn4NKhEDaZnPhFwGHdMaEUROeE9PlVA
Message-ID: <CAH2r5mtvkAAEur6_jPMtvpKa8q9fWufwV7VG+fXkATXs_jZv0w@mail.gmail.com>
Subject: Re: [PATCH 1/2] Revert "smb: client: Fix netns refcount imbalance
 causing leaks and use-after-free"
To: Kuniyuki Iwashima <kuniyu@amazon.com>
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
Cc: pc@manguebit.com, linux-cifs@vger.kernel.org, sprasad@microsoft.com,
 ematsumiya@suse.de, samba-technical@lists.samba.org, sfrench@samba.org,
 bharathsm@microsoft.com, wangzhaolong1@huawei.com, tom@talpey.com,
 kuni1840@gmail.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

> What branch should be used to send reverts for -rcX ?

cifs-2.6.git for-next

But probably won't be an issue in a few days (since mainline then will
likely include the conflicting patch - which fortunately is unrelated
to this discussion, just fixes an RFC1001 bug)

On Thu, Apr 3, 2025 at 12:27=E2=80=AFPM Kuniyuki Iwashima <kuniyu@amazon.co=
m> wrote:
>
> From: Wang Zhaolong <wangzhaolong1@huawei.com>
> Date: Thu, 3 Apr 2025 17:59:20 +0800
> > Hi Kuniyuki,
> >
> > When testing this patch on the latest mainline, I found that the follow=
ing
> > snippet has a conflict:
>
> I guess it's because I used for-next branch of the cifs.git.
>
> Steve:
>
> What branch should be used to send reverts for -rcX ?
>
>
> >
> >
> > > @@ -3444,6 +3441,9 @@ generic_ip_connect(struct TCP_Server_Info *serv=
er)
> > >         (server->rfc1001_sessinit =3D=3D -1 && sport =3D=3D htons(RFC=
1001_PORT)))
> > >             rc =3D ip_rfc1001_connect(server);
> > >
> > > +   if (rc < 0)
> > > +           put_net(cifs_net_ns(server));
> > > +
> > >     return rc;
> > >   }
> > >
> >
> > Specifically, it is this line:
> >
> > >         (server->rfc1001_sessinit =3D=3D -1 && sport =3D=3D htons(RFC=
1001_PORT)))
> >
> > In my code, it corresponds to the following snippet:
> >
> > ```
> > @@ -3333,10 +3330,13 @@ generic_ip_connect(struct TCP_Server_Info *serv=
er)
> >       }
> >       trace_smb3_connect_done(server->hostname, server->conn_id, &serve=
r->dstaddr);
> >       if (sport =3D=3D htons(RFC1001_PORT))
> >               rc =3D ip_rfc1001_connect(server);
> >
> > +     if (rc < 0)
> > +             put_net(cifs_net_ns(server));
> > +
> >       return rc;
> >   }
> > ```
> >
> > Looks like V3 needs to be sent?
> >
> > Best regards,
> > Wang Zhaolong
>


--=20
Thanks,

Steve

