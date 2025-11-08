Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D26E6C426D7
	for <lists+samba-technical@lfdr.de>; Sat, 08 Nov 2025 05:29:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=KO4XlPxpyr6A6CDUplPXQkHQJ9QmhDHMaWGNSWYd/48=; b=mUav1Z/l7X6fNaPJK68Xs3GwJT
	G3SrTwz6RLsXdXfxrgG9mIAoaGSM6OZvF1lb1ExISw8Mqn5YL32LKcySADuQ3B7JadmMLPJqmKwEn
	0UZYlbjlwPwwBf5lyu+UtEKOlqRFtEVi8lPpxMC6scqMNrfAM4apQLOxe+LkFTqE5VVJiRpkl2ruW
	8BNjnqVM+PmISo1SA5UUJvuKN2IxBqAt1qBj2WfgXhF5A40cvIqi0huhuf74Re9/QeZZtyzRQkfoX
	8tf0sUQ1SgEWMbvZuZpX/Jopuz/jeC4CBNeph2MZgPAKArKHt/Q4D0l/6F1FANtkovtF1rzoX0D1p
	PzfQhZbg==;
Received: from ip6-localhost ([::1]:60518 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vHaZX-00BkxV-9R; Sat, 08 Nov 2025 04:29:07 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:51605) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vHaZO-00BkxO-Bc
 for samba-technical@lists.samba.org; Sat, 08 Nov 2025 04:29:02 +0000
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b5b823b4f3dso197818166b.3
 for <samba-technical@lists.samba.org>; Fri, 07 Nov 2025 20:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762576137; x=1763180937; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KO4XlPxpyr6A6CDUplPXQkHQJ9QmhDHMaWGNSWYd/48=;
 b=SU1ROkjwsXe+hbFm6nMFV8ENsY+LpnTPIgSM4xHodC1+KdriHH61hlO2HNDfhD1hhH
 b8lKWCMUivfES8pjOVwjkDq8DMr3m1vGt4tD3OLMbQ/M64oDee1mpeY6dsuSwC66Eere
 tDLI/IipiIjjBlpe0CqEamrrzNAw4HEResNR1nHnQ/IAgz7PPAMjVWGvpPy0pzgbKK3o
 yVYA9Zmv7EpNBXkOeYNszKtMOe9a461pP1etZQgjJyt8yOhQ4sizehCBFFcCtImSDiil
 Ven+3wTbHWTstqAFCuoh/wW6RjKZl0o0lV7hAcpG1CZaiL7emAtDhn5tds2xGdidYlMn
 jlPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762576137; x=1763180937;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KO4XlPxpyr6A6CDUplPXQkHQJ9QmhDHMaWGNSWYd/48=;
 b=dUmrW3ZikkoKR9kUhga/vD4dPMHQ+j85rZgl2KsD/esJSSC+qloiZn8Hx42K94PnqB
 JM/k/CKmTJDTXOxUM62W0kyAPuiRxaWcpcfSg36/r+KwMb+bJTCvREU1iMiPXe0StTVY
 2mqJ6Nv86GIUGLsmgU0V+ldQLawsJNsPVXggLbenMnBFK80HC+T6Qtl+ntzhsPtB46PN
 M4FQM4PqCyrNXwFmVAhB/XEZO0Gq8+EgcBQwXSZN56gAZq6+K9PS660BFJaqmNtsz2hR
 c24BtcSu1VdwQ6WpcQNk/6vF2XDW2pV81TqCLYfDsKAVRwXQDF11qvXoke7eJRN90MJd
 PLLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2rDymRMSBGhsjO41N+aRJCIzo/c6CSHw/jHJor4+cnZ/8skVk39hqnwtRImLo3J2xFCq/7aHSr8pTBhsXu+Y=@lists.samba.org
X-Gm-Message-State: AOJu0YyITUu5mISNz4+7YCAGSyUYyNqPXHHBFwI9bIqdTorG/Q3BZElD
 84jHbEIvVsDWF2fpTA+rp7tsFOnqlNg+tN8Tq8O0/Edr7r5ZmXF1FwoYT+Ya7fj87l5nMkC5TGp
 WgFgKuRnkW93h2ZnfhnOD/gizkB/FK4I=
X-Gm-Gg: ASbGncsZT2F0RBVO98vxk9/UM6yz2f+7ElelI9cFdZUIef3F4kY58kIMvB3S7nk8K1Z
 XJuqcqxaGBgFDKdjKuEzR5ME6lzvwB9/t51I5AqKrV8tPMebKdVknQBZ2C41jeZ1Wvf4IKHixMa
 3wPwDZ3EkyqpMYhml6KxsJr5KC7Qqw4p2aOQu+Qo57TAc7PPldpPrLKKULAo3FZTcDWMl23mkCB
 +IDYFB142hsuTt78wQPSPCz7jBIQhR4ZU0ssSKeI2Su1IBBpkklww7yytkJ9Kc5AgsjGg==
X-Google-Smtp-Source: AGHT+IGrMxHCCDZvCnZIYxC8OlI5J6aNsXhuWL7dXVFTt9tofuSFasRc4eGE7nHVxUSZrLRJk0lUZkNzkkPL/JdP2IM=
X-Received: by 2002:a17:907:9706:b0:b40:5752:16b7 with SMTP id
 a640c23a62f3a-b72e05e83c3mr158113866b.51.1762576137173; Fri, 07 Nov 2025
 20:28:57 -0800 (PST)
MIME-Version: 1.0
References: <690da014.a70a0220.22f260.0026.GAE@google.com>
 <tencent_5D8667DBC6ECD2FF464349ADEEFD2EE84C06@qq.com>
 <f25e47415998a9d9360ac87eca7292a2@manguebit.org>
 <CAH2r5mvRrFmZFtNaQuRFHy2mVM1AG1AnsNwZMOoT=w8LZaLX4Q@mail.gmail.com>
In-Reply-To: <CAH2r5mvRrFmZFtNaQuRFHy2mVM1AG1AnsNwZMOoT=w8LZaLX4Q@mail.gmail.com>
Date: Sat, 8 Nov 2025 09:58:46 +0530
X-Gm-Features: AWmQ_blo19sY8oI4byZVSAxpSm_eal3zwPqIUf3DK2UfzTSBtaRF2CJoGUN1P1A
Message-ID: <CANT5p=pC2JShLzXPJG5imWTJBRfXheZeqBhMSpXuOw3rBkRxEw@mail.gmail.com>
Subject: Re: [PATCH] cifs: client: fix memory leak in
 smb3_fs_context_parse_param
To: Steve French <smfrench@gmail.com>
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
From: Shyam Prasad N via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shyam Prasad N <nspmangalore@gmail.com>
Cc: linux-cifs@vger.kernel.org, sprasad@microsoft.com,
 Paulo Alcantara <pc@manguebit.org>, syzkaller-bugs@googlegroups.com,
 syzbot+72afd4c236e6bc3f4bac@syzkaller.appspotmail.com,
 Edward Adam Davis <eadavis@qq.com>, linux-kernel@vger.kernel.org,
 sfrench@samba.org, bharathsm@microsoft.com, tom@talpey.com,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, Nov 8, 2025 at 4:52=E2=80=AFAM Steve French <smfrench@gmail.com> wr=
ote:
>
> merged into cifs-2.6.git for-next pending additional testing.
>
> Also added Cc:stable tag
>
> On Fri, Nov 7, 2025 at 8:52=E2=80=AFAM Paulo Alcantara via samba-technica=
l
> <samba-technical@lists.samba.org> wrote:
> >
> > Edward Adam Davis <eadavis@qq.com> writes:
> >
> > > The user calls fsconfig twice, but when the program exits, free() onl=
y
> > > frees ctx->source for the second fsconfig, not the first.
> > > Regarding fc->source, there is no code in the fs context related to i=
ts
> > > memory reclamation.
> > >
> > > To fix this memory leak, release the source memory corresponding to c=
tx
> > > or fc before each parsing.
> > >
> > > syzbot reported:
> > > BUG: memory leak
> > > unreferenced object 0xffff888128afa360 (size 96):
> > >   backtrace (crc 79c9c7ba):
> > >     kstrdup+0x3c/0x80 mm/util.c:84
> > >     smb3_fs_context_parse_param+0x229b/0x36c0 fs/smb/client/fs_contex=
t.c:1444
> > >
> > > BUG: memory leak
> > > unreferenced object 0xffff888112c7d900 (size 96):
> > >   backtrace (crc 79c9c7ba):
> > >     smb3_fs_context_fullpath+0x70/0x1b0 fs/smb/client/fs_context.c:62=
9
> > >     smb3_fs_context_parse_param+0x2266/0x36c0 fs/smb/client/fs_contex=
t.c:1438
> > >
> > > Reported-by: syzbot+72afd4c236e6bc3f4bac@syzkaller.appspotmail.com
> > > Closes: https://syzkaller.appspot.com/bug?extid=3D72afd4c236e6bc3f4ba=
c
> > > Signed-off-by: Edward Adam Davis <eadavis@qq.com>
> > > ---
> > >  fs/smb/client/fs_context.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> >
> > Reviewed-by: Paulo Alcantara (Red Hat) <pc@manguebit.org>
> >
>
>
> --
> Thanks,
>
> Steve
>

Looks good to me.
Steve, this is one of the mount options that is missing in the man page.
Also, I don't understand this option. Why is it needed? Don't we
specify the source in the mount command as devname anyway?

--=20
Regards,
Shyam

