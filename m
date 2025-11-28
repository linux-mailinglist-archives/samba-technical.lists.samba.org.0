Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B15BC92628
	for <lists+samba-technical@lfdr.de>; Fri, 28 Nov 2025 16:02:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=/szzNrYlz98R3QfGXotkgAtD3Y44xYYQjzP9HCDXiVk=; b=cFtSVtCpQYRw2KZ8JMwXrytxTz
	ER/6/UXXwiadAr+DyrB09Az988FOvO4mOBVkAcybOdNiceJ+47vNi9pmbpKrb784yWo8wqNToJWOr
	RUMaS1KPbBeUA1CakMxY5+Q68CIPc7W51FZiomupWPswZaI8d+1dNntdovWfoIAR+MGzspcC9cifG
	t+lczKSX5NWUuOvXiGv1ycnjwenfbSdFk2mKoxSriWie3ZioR0n0SXQ6mTVgicmcPnGdWdIhJGfOZ
	xc+UAn7AxCliuz10e2awcOGhEdSO2h+nbdfwP1oz1AK1yxEmsknDOGJS3qx/oddMPzsmILsf6YLs/
	++MFXAng==;
Received: from ip6-localhost ([::1]:20234 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vOzyU-00DWsZ-QW; Fri, 28 Nov 2025 15:01:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31]:58850) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vOzyP-00DWsS-MS
 for samba-technical@lists.samba.org; Fri, 28 Nov 2025 15:01:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C5320432D0
 for <samba-technical@lists.samba.org>; Fri, 28 Nov 2025 15:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6034C16AAE
 for <samba-technical@lists.samba.org>; Fri, 28 Nov 2025 15:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764342071;
 bh=/szzNrYlz98R3QfGXotkgAtD3Y44xYYQjzP9HCDXiVk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dNZEbyV9tQ66RlTMpyKfSEU9OSZd3fhDhPK+ARWSBtc+LXVGICwsyvkKJ4p64l7se
 pYdXrmglCcRcyyyU/e7MJ9o0gP3TxJTBqGGTlHZMjFEmR5C17jgNOePhstHKxLoLKw
 CoXP4L1gWZQjBgsn+ZmBxHxCdHU+XzhwIUBDfc/PGo/WNyOpiB0oqgcJbcb33NDkKg
 PvLYeBgM5DsqDzzRwPZq9sceBYRbuZ+rgDKTZovyBrd+VWDUu6eLTekko4HgtAhZEb
 OTkrfxPfVsj265+Uj/9p+cau6oBQKL9SLQRPuhQxkplcVzGDkdBoXxJCw3u4enWwCS
 Xq+wGOGc01fnA==
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-b735487129fso280934466b.0
 for <samba-technical@lists.samba.org>; Fri, 28 Nov 2025 07:01:11 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVu8ulsXNyZ7fKoEnzNISXEDve6cBKJOAhbwP75RymhLwXCj1gDtk7w6rgKnM/uHbfk7jIJ4TOUZb1qxbSzRb4=@lists.samba.org
X-Gm-Message-State: AOJu0Yxuyaphi7dOENEGg0GXTGn6QEiGpmyLAsusf9NvasZZrmOm36fz
 zN/nJSPknKkJetd7rKP/QfTQ1k1QMSXb7lUmgMwRDIoBi9qj/xXXFZIIAxLY0PCB/Rvpyp4jtMK
 M8wIe+RpKvUcjIzIDkFaljRfUDLtePQE=
X-Google-Smtp-Source: AGHT+IGHlZ1Es0U7rEAngTS8cZtvPlTvl4knXZuU8toy/vG2ApkMPS/LvqqgX2OzPNh3dmKI6PABZy/tw9ZtuOSzk6M=
X-Received: by 2002:a17:907:9487:b0:b76:6020:ed2b with SMTP id
 a640c23a62f3a-b7671898fd8mr2929650466b.45.1764342070152; Fri, 28 Nov 2025
 07:01:10 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764080338.git.metze@samba.org>
 <CAKYAXd_HKKBKx_B7+Z+b_jt+rHazuMkskYYPAp6BROPuy0uBfA@mail.gmail.com>
 <CAKYAXd8Nb6Ay1-J0GeDUCzRDWWYtRtcU-2FZ1LrX9p8soKpaKQ@mail.gmail.com>
 <bd2237e6-86e7-40c8-8635-8ba6c0573cbe@samba.org>
 <CAKYAXd8QhE_=zoK3pLqd0M-8Zw8M0auTw-P5yoqe6DioGXtsaQ@mail.gmail.com>
 <CAH2r5mv0BLnF9+ori1ZfoaYfBLXcscjuFkkAjggSY+aroKDRiw@mail.gmail.com>
 <b1f6271b-3c2a-493a-a404-7cdacd791acb@samba.org>
 <CAKYAXd9ykY7y0PGFcibQMUjQxb9_usEqKEJFrWJCBFuNesji1A@mail.gmail.com>
 <788d9b9e-e693-437f-bb56-1b84868b4250@samba.org>
In-Reply-To: <788d9b9e-e693-437f-bb56-1b84868b4250@samba.org>
Date: Sat, 29 Nov 2025 00:00:58 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9eAZieZPb3RuOpC6msi9ctjpQ8aT-V33oF7qHxvAELLA@mail.gmail.com>
X-Gm-Features: AWmQ_bliYiHSUKajTi2xnXqj7qubxaxH6gUefndRP-u8yPXTyL9LKZBdO65mDiU
Message-ID: <CAKYAXd9eAZieZPb3RuOpC6msi9ctjpQ8aT-V33oF7qHxvAELLA@mail.gmail.com>
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
Cc: linux-cifs@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Paulo Alcantara <pc@manguebit.org>, samba-technical@lists.samba.org,
 Tom Talpey <tom@talpey.com>, Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Nov 28, 2025 at 10:35=E2=80=AFPM Stefan Metzmacher <metze@samba.org=
> wrote:
>
> Am 28.11.25 um 13:11 schrieb Namjae Jeon:
> > On Fri, Nov 28, 2025 at 7:17=E2=80=AFPM Stefan Metzmacher <metze@samba.=
org> wrote:
> >>
> >> Am 28.11.25 um 05:53 schrieb Steve French:
> >>> On Thu, Nov 27, 2025 at 9:19=E2=80=AFPM Namjae Jeon <linkinjeon@kerne=
l.org> wrote:
> >>>
> >>>> On Fri, Nov 28, 2025 at 12:54=E2=80=AFAM Stefan Metzmacher <metze@sa=
mba.org>
> >>>> wrote:
> >>>>>
> >>>>> Am 26.11.25 um 02:07 schrieb Namjae Jeon:
> >>>>>> On Wed, Nov 26, 2025 at 8:50=E2=80=AFAM Namjae Jeon <linkinjeon@ke=
rnel.org>
> >>>> wrote:
> >>>>>>>
> >>>>>>> On Tue, Nov 25, 2025 at 11:22=E2=80=AFPM Stefan Metzmacher <metze=
@samba.org>
> >>>> wrote:
> >>>>>>>>
> >>>>>>>> Hi,
> >>>>>>>>
> >>>>>>>> here are some small cleanups for a problem Nanjae reported,
> >>>>>>>> where two WARN_ON_ONCE(sc->status !=3D ...) checks where trigger=
ed
> >>>>>>>> by a Windows 11 client.
> >>>>>>>>
> >>>>>>>> The patches should relax the checks if an error happened before,
> >>>>>>>> they are intended for 6.18 final, as far as I can see the
> >>>>>>>> problem was introduced during the 6.18 cycle only.
> >>>>>>>>
> >>>>>>>> Given that v1 of this patchset produced a very useful WARN_ONCE(=
)
> >>>>>>>> message, I'd really propose to keep this for 6.18, also for the
> >>>>>>>> client where the actual problem may not exists, but if they
> >>>>>>>> exist, it will be useful to have the more useful messages
> >>>>>>>> in 6.16 final.
> >>>>>> Anyway, Applied this patch-set to #ksmbd-for-next-next.
> >>>>>> Please check the below issue.
> >>>>>
> >>>>> Steve, can you move this into ksmbd-for-next?
> >>>> Steve, There are more patches in ksmbd-for-next-next.
> >>>> Please apply the following 6 patches in #ksmbd-for-next-next to
> >>>> #ksmbd-for-next.
> >>>>
> >>>> 3858665313f1 (HEAD -> ksmbd-for-next-next, origin/ksmbd-for-next-nex=
t)
> >>>> ksmbd: ipc: fix use-after-free in ipc_msg_send_request
> >>>> b9c7d4fe6e93 smb: client: relax WARN_ON_ONCE(SMBDIRECT_SOCKET_*)
> >>>> checks in recv_done() and smbd_conn_upcall()
> >>>> 6c5ceb636d08 smb: server: relax WARN_ON_ONCE(SMBDIRECT_SOCKET_*)
> >>>> checks in recv_done() and smb_direct_cm_handler()
> >>>> d02a328304e5 smb: smbdirect: introduce
> >>>> SMBDIRECT_CHECK_STATUS_{WARN,DISCONNECT}()
> >>>> 340255e842d5 smb: smbdirect: introduce SMBDIRECT_DEBUG_ERR_PTR() hel=
per
> >>>> 01cba263d1bd ksmbd: vfs: fix race on m_flags in vfs_cache
> >>
> >> It seems these are the v2 patches, please use v3,
> >> the difference is that the __SMBDIRECT_SOCKET_DISCONNECT
> >> defines are moved up in order to let the patches on top work
> >> with out modifications. I noticed the difference while
> >> doing a rebase on ksmbd-for-next and get conflicts.
> > Right, Sorry for missing v3 patches.
> >
> > Steve, Please apply updated 4 patches in ksmbd-for-next-next to ksmbd-f=
or-next.
> >
> > fc86cca6087f (HEAD -> ksmbd-for-next-next, origin/ksmbd-for-next-next)
> > smb: client: relax WARN_ON_ONCE(SMBDIRECT_SOCKET_*) checks in
> > recv_done() and smbd_conn_upcall()
> > 111b7cb1b7f6 smb: server: relax WARN_ON_ONCE(SMBDIRECT_SOCKET_*)
> > checks in recv_done() and smb_direct_cm_handler()
> > 12059ee95a5b smb: smbdirect: introduce
> > SMBDIRECT_CHECK_STATUS_{WARN,DISCONNECT}()
> > 3658d5ac7908 smb: smbdirect: introduce SMBDIRECT_DEBUG_ERR_PTR() helper
>
> Given that we missed linux-next for this week anyway,
> we could also add everything from my for-6.19/fs-smb-20251128-v5
> branch, which is rebased on smfrench-smb3-kernel/ksmbd-for-next with
> the top 3 commits replaced by the top 3 commits from
> smfrench-smb3-kernel/ksmbd-for-next-next.
> And has the patches from David's cifs-cleanup branch
> as well as my smbdirect.ko patches.
I have added stable tags to the top 4 patches in ksmbd-for-next-next
so they can be applied into 6.18.
Cc: stable@vger.kernel.org # v6.18
>
> metze

