Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A941FC90BEE
	for <lists+samba-technical@lfdr.de>; Fri, 28 Nov 2025 04:20:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=FYs/MBFp68N1iTyfSYVx6m/YYUnE4Nw9pQlanRMznfs=; b=EoPPP6lm/YsFDbkVYTo4lpTziz
	b9jr81ND1Emq8nKFe85jlaJQqs3BVax22DUkwueJSkAp9qCUS+cLYh/B6rI/NaY/2dEgIeEqwZK4K
	gL7aSCVuuQBzOKAoGjvvobU6jV8XGKiwOEmyuwu4l8u+xqgx/K6FdgbIStio3PLX5M19sdZDKSYOE
	TILIf92ZOV4iHzRUUuKnoFXuPstNM7fa+RjpLne0vu4LatGEflADCcNdH1DfT5OpSCQrTVel+jD7I
	tBUNAYw3DG6tRXMdvsvE0ssqAAt1KvZxUYLDtJfYja2zogvLpisi5hmK3EqEmzhBUsF4qPpgt2/ku
	3xD906iQ==;
Received: from ip6-localhost ([::1]:36154 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vOp19-00DTqB-Ev; Fri, 28 Nov 2025 03:19:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25]:36150) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vOp14-00DTq3-4c
 for samba-technical@lists.samba.org; Fri, 28 Nov 2025 03:19:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1223160254
 for <samba-technical@lists.samba.org>; Fri, 28 Nov 2025 03:19:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD2B9C16AAE
 for <samba-technical@lists.samba.org>; Fri, 28 Nov 2025 03:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764299952;
 bh=FYs/MBFp68N1iTyfSYVx6m/YYUnE4Nw9pQlanRMznfs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qPAzVwVCTyb36oTQ/6Lx9RszqZQSsjPXJUYL9W461N7M3R8qzjeDDle7Fg/K+m4Sb
 YcgKxAeykOyJQFz9+SEGzYSLGLxmV8gPTllwptei6L3Ljze1Z4qYPihCI1EeyQXPJi
 yWRJjQvTEs1/XbgPUbFNS5J5h3mxxCh1VHKFQB4wZ/3CkEFwEw1/l0hgC3uesInqtS
 4/ZaX0QoXFfqn59HTLi+kd8sdMMc3MHh+ubOj3R2JnwqpLh1O3x931P4M76CEAvSGA
 oGu0HsLNt/BQ4r8EY3DGjESzkSCXXrjdwfGuny7e3Yxol+mzm8hcLzL54ySmEoY7/j
 fhIEBeOW6fhxA==
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-6418b55f86dso2563472a12.1
 for <samba-technical@lists.samba.org>; Thu, 27 Nov 2025 19:19:12 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUITEZvnieY060gas6AaRHTgTIie1N8/VeZDFlWexCbW40tmHif1oZEalWPTdL9BSZQBJxRk0xDwoc4VUlfNW0=@lists.samba.org
X-Gm-Message-State: AOJu0Yzt+4U/llldZphOThlAi17hQb5aWClFkpUfcLfa/XPu7YDZNJGq
 J71naXwwmZGFlpp6norOpkOJbawWq9jt3REnCaK1ab6v94tqYfEZmy/txNsAEIFh87RHU33gKLP
 VccNg8EhwOdww2/E7q1g2G4OBg3VGpMM=
X-Google-Smtp-Source: AGHT+IH5XTvaMrPG4bnSmW+lhd1fqCfFmftv1P/fIwHE0EQlMuIIlNsmdaGaCSIA7xj6rEdYB18K0Qnfc5IHIy6TojA=
X-Received: by 2002:a05:6402:42ca:b0:640:9eb3:3686 with SMTP id
 4fb4d7f45d1cf-64554685822mr22504773a12.19.1764299951293; Thu, 27 Nov 2025
 19:19:11 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764080338.git.metze@samba.org>
 <CAKYAXd_HKKBKx_B7+Z+b_jt+rHazuMkskYYPAp6BROPuy0uBfA@mail.gmail.com>
 <CAKYAXd8Nb6Ay1-J0GeDUCzRDWWYtRtcU-2FZ1LrX9p8soKpaKQ@mail.gmail.com>
 <bd2237e6-86e7-40c8-8635-8ba6c0573cbe@samba.org>
In-Reply-To: <bd2237e6-86e7-40c8-8635-8ba6c0573cbe@samba.org>
Date: Fri, 28 Nov 2025 12:18:59 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8QhE_=zoK3pLqd0M-8Zw8M0auTw-P5yoqe6DioGXtsaQ@mail.gmail.com>
X-Gm-Features: AWmQ_bl7Wo8372Rh5RdOEiNopn9S1Y4slRdqHCH2m32yeCmqPYNSAA9tLvanS2I
Message-ID: <CAKYAXd8QhE_=zoK3pLqd0M-8Zw8M0auTw-P5yoqe6DioGXtsaQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] smb: smbdirect/client/server: relax
 WARN_ON_ONCE(SMBDIRECT_SOCKET_*) checks
To: Stefan Metzmacher <metze@samba.org>, Steve French <smfrench@gmail.com>
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
 samba-technical@lists.samba.org, Paulo Alcantara <pc@manguebit.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Nov 28, 2025 at 12:54=E2=80=AFAM Stefan Metzmacher <metze@samba.org=
> wrote:
>
> Am 26.11.25 um 02:07 schrieb Namjae Jeon:
> > On Wed, Nov 26, 2025 at 8:50=E2=80=AFAM Namjae Jeon <linkinjeon@kernel.=
org> wrote:
> >>
> >> On Tue, Nov 25, 2025 at 11:22=E2=80=AFPM Stefan Metzmacher <metze@samb=
a.org> wrote:
> >>>
> >>> Hi,
> >>>
> >>> here are some small cleanups for a problem Nanjae reported,
> >>> where two WARN_ON_ONCE(sc->status !=3D ...) checks where triggered
> >>> by a Windows 11 client.
> >>>
> >>> The patches should relax the checks if an error happened before,
> >>> they are intended for 6.18 final, as far as I can see the
> >>> problem was introduced during the 6.18 cycle only.
> >>>
> >>> Given that v1 of this patchset produced a very useful WARN_ONCE()
> >>> message, I'd really propose to keep this for 6.18, also for the
> >>> client where the actual problem may not exists, but if they
> >>> exist, it will be useful to have the more useful messages
> >>> in 6.16 final.
> > Anyway, Applied this patch-set to #ksmbd-for-next-next.
> > Please check the below issue.
>
> Steve, can you move this into ksmbd-for-next?
Steve, There are more patches in ksmbd-for-next-next.
Please apply the following 6 patches in #ksmbd-for-next-next to #ksmbd-for-=
next.

3858665313f1 (HEAD -> ksmbd-for-next-next, origin/ksmbd-for-next-next)
ksmbd: ipc: fix use-after-free in ipc_msg_send_request
b9c7d4fe6e93 smb: client: relax WARN_ON_ONCE(SMBDIRECT_SOCKET_*)
checks in recv_done() and smbd_conn_upcall()
6c5ceb636d08 smb: server: relax WARN_ON_ONCE(SMBDIRECT_SOCKET_*)
checks in recv_done() and smb_direct_cm_handler()
d02a328304e5 smb: smbdirect: introduce
SMBDIRECT_CHECK_STATUS_{WARN,DISCONNECT}()
340255e842d5 smb: smbdirect: introduce SMBDIRECT_DEBUG_ERR_PTR() helper
01cba263d1bd ksmbd: vfs: fix race on m_flags in vfs_cache

Thanks.
>
> Thanks!
> metze
>

