Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A95D2C8C4C5
	for <lists+samba-technical@lfdr.de>; Thu, 27 Nov 2025 00:10:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=nH1JfdYw0mw2MsHTQz+O8kH6xkZ+R068FHjIhnf2bw0=; b=5lKC+Q5plMH4Gw33rX6e3yJQyk
	zR+slQ5TBKopX5FvQ2U4rdtOKd00VvLIYsI1hz69aO+1zn2gbatcX5GYrjXf4kr0QyR7MyS3ias4M
	cPlRtVxBY5sDgWeW/OQL0ikI4AN+QJ//uU3/JJwHk2n9/Q0kYUFU9sSkBtu240mvi82zBQJtGF9hl
	VQxVp1CerqMWi8CSWi4Zmq63h/5Ypkl9AiSZ39Uq06Rwq5MOQcWmwvzKluxbKMsntcIiUarctFXnC
	ookTRYPhRC1Z8at65v7GG1F/HxTAooEWfZ1Oll+AWqwETMxqy/DzbVjrIwfCtVl2Uy+LvD8D8qL6w
	2FcxzObA==;
Received: from ip6-localhost ([::1]:27594 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vOOeY-00DPDN-6u; Wed, 26 Nov 2025 23:10:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25]:41810) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vOOeS-00DPDF-TC
 for samba-technical@lists.samba.org; Wed, 26 Nov 2025 23:10:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7790C60177
 for <samba-technical@lists.samba.org>; Wed, 26 Nov 2025 23:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D3A1C4CEF7
 for <samba-technical@lists.samba.org>; Wed, 26 Nov 2025 23:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764198616;
 bh=nH1JfdYw0mw2MsHTQz+O8kH6xkZ+R068FHjIhnf2bw0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jFjCQhQQfUu5gnDZgSkXyb1ZoD38A6QW1rKlSEPRJOjNsHrjex1mRpihBXyFkKqMC
 PtTm1t+VPGG/XVPUXkRiV5geTuaql0s7yqaBzOQAXYqMdq7f8FN01HWFrlzcwYEk4b
 u/y2v5VTwct/49R4fC959vKx7QmOwCOKfGuioTBB6ypVQ5DELRm9CxUyX6N+pygBeD
 Arz+z6Pi0YUby8KOCi8vQQrpC2bheCCTNdD2GSxsn5fgPzZhUHHj+rsHBICRwwZjKT
 mht9o0NgQp6tQ8hsiKwkyIi1rgXOfRzU9LnvHRLodXuejkPkcvPAVWjfmEuAPmB/kr
 AwEkPfr6NIO+g==
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-640c6577120so637686a12.1
 for <samba-technical@lists.samba.org>; Wed, 26 Nov 2025 15:10:16 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUn1A9q10kw+MH/4orERE00ITRoUKURaklrg4jqK8V/gOddJRIhIP8gZoztLMWAe1EgwqnBNZqiHozPK12qde4=@lists.samba.org
X-Gm-Message-State: AOJu0YwtMG/IKrSHCfEvjxZwNoG/DXyjL3Ymm7l3gm13ZVTKy2YTKmNT
 bFXST+sWoECHQBWXcKGLvq7iY2c0m+JJo2N4oEJc1ffM69tlEsAHoMmt3zoS+Al27EmuHxCI32X
 NfvBAA7qPbr8YKllXR9S4NzP2X7wahvQ=
X-Google-Smtp-Source: AGHT+IFMsL+Ny0U3yIVfZOFe1R2tEdf5NXbzw26tQ91YaO8bw1yHPs+GioCAYVZtntpel8Tb1xbuQ+d62NsjJ7wSxHc=
X-Received: by 2002:a05:6402:3054:20b0:646:618:ff41 with SMTP id
 4fb4d7f45d1cf-6460618ff64mr2803350a12.2.1764198614733; Wed, 26 Nov 2025
 15:10:14 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764080338.git.metze@samba.org>
 <CAKYAXd_HKKBKx_B7+Z+b_jt+rHazuMkskYYPAp6BROPuy0uBfA@mail.gmail.com>
 <2786ee25-b543-48a8-8fff-e6c7ff341774@samba.org>
 <CAKYAXd8N-j8K1CUUH9_+wXpEZBo5i=K=ywkQPjJmmo76JbmXng@mail.gmail.com>
 <bd457989-d73e-4098-b3f7-c6871f49d188@samba.org>
 <ad3feff5-553d-4d98-b702-9c7a594dd7c0@samba.org>
In-Reply-To: <ad3feff5-553d-4d98-b702-9c7a594dd7c0@samba.org>
Date: Thu, 27 Nov 2025 08:10:02 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_UJHTsa6QNW+Qzo6BjEqOXEF_bM=a=XRKm=OFwoigu4A@mail.gmail.com>
X-Gm-Features: AWmQ_bkitniyxtmDo4233u1JmTOAWiQMhzWYpcHCGx1_cbfCmJf4bFc3YRTJ8tk
Message-ID: <CAKYAXd_UJHTsa6QNW+Qzo6BjEqOXEF_bM=a=XRKm=OFwoigu4A@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] smb: smbdirect/client/server: relax
 WARN_ON_ONCE(SMBDIRECT_SOCKET_*) checks
To: Stefan Metzmacher <metze@samba.org>
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
From: Namjae Jeon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Tom Talpey <tom@talpey.com>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, Paulo Alcantara <pc@manguebit.org>,
 Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Nov 27, 2025 at 1:03=E2=80=AFAM Stefan Metzmacher <metze@samba.org>=
 wrote:
>
> Am 26.11.25 um 16:18 schrieb Stefan Metzmacher via samba-technical:
> > Am 26.11.25 um 16:17 schrieb Namjae Jeon:
> >> On Wed, Nov 26, 2025 at 4:16=E2=80=AFPM Stefan Metzmacher <metze@samba=
.org> wrote:
> >>>
> >>> Am 26.11.25 um 00:50 schrieb Namjae Jeon:
> >>>> On Tue, Nov 25, 2025 at 11:22=E2=80=AFPM Stefan Metzmacher <metze@sa=
mba.org> wrote:
> >>>>>
> >>>>> Hi,
> >>>>>
> >>>>> here are some small cleanups for a problem Nanjae reported,
> >>>>> where two WARN_ON_ONCE(sc->status !=3D ...) checks where triggered
> >>>>> by a Windows 11 client.
> >>>>>
> >>>>> The patches should relax the checks if an error happened before,
> >>>>> they are intended for 6.18 final, as far as I can see the
> >>>>> problem was introduced during the 6.18 cycle only.
> >>>>>
> >>>>> Given that v1 of this patchset produced a very useful WARN_ONCE()
> >>>>> message, I'd really propose to keep this for 6.18, also for the
> >>>>> client where the actual problem may not exists, but if they
> >>>>> exist, it will be useful to have the more useful messages
> >>>>> in 6.16 final.
> >>>> First, the warning message has been improved. Thanks.
> >>>> However, when copying a 6-7GB file on a Windows client, the followin=
g
> >>>> error occurs. These error messages did not occur when testing with t=
he
> >>>> older ksmbd rdma(https://github.com/namjaejeon/ksmbd).
> >>>
> >>> With transport_rdma.* from restored from 6.17?
> >> I just tested it and this issue does not occur on ksmbd rdma of the 6.=
17 kernel.
> >
> > 6.17 or just transport_rdma.* from 6.17, but the rest from 6.18?
> >
>
> Can you also test with 6.17 + fad988a2158d743da7971884b93482a73735b25e
> Maybe that changed things in order to let RDMA READs fail or cause a
> disconnect.
The kernel version I tested was 6.17.9 and this patch was already applied.
>
> Otherwise I'd suggest to test the following commits in order
> to find where the problem was introduced:
> 177368b9924314bde7d2ea6dc93de0d9ba728b61
I don't have time to do this right now due to other work.
Did you test it with a Windows client and can't find this issue?
>
> After this it gets more tricky.
>
> metze
>
>
>

