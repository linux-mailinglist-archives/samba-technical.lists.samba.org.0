Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2134DC91F59
	for <lists+samba-technical@lfdr.de>; Fri, 28 Nov 2025 13:12:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=F9f9DGXUrMDAnd6Dn6rt6a+KkNE9C3JXOmFHvWQiH2A=; b=D+6HeAHuJr97ERA6nCbydpoXaq
	MQ3+Uq8ACu0JmrJRgMVaLaKl9r8QG1kPXTtQbPFtzXQdnphHnQv6QVxv8SHX7A64w6Pg7YR95hf2C
	k5Az0+ujClizorQOl4DQOtJqus0vhB0Eq0FueBQnWYVEqdaxieLT23sWVFFRrb0LZXAFVB/wav6Ch
	dKjGjYWMEsNX1p2y82kjsITVhXz/4/lW84BhWkPVboNZlNA02VnjeECUiYiTxP2IFTKCoKWKwERqR
	H/N382DudC2wfHP5Iq4sv6qfIE5urDDQG7+wXYKodkDA0b1GBwEZ709XWGXos2fP4eYr2KgaRFVyB
	WoDXf48w==;
Received: from ip6-localhost ([::1]:36742 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vOxKT-00DVyi-Bv; Fri, 28 Nov 2025 12:12:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25]:37826) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vOxKO-00DVyX-SD
 for samba-technical@lists.samba.org; Fri, 28 Nov 2025 12:11:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B2A9A6021D
 for <samba-technical@lists.samba.org>; Fri, 28 Nov 2025 12:11:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D3C5C19424
 for <samba-technical@lists.samba.org>; Fri, 28 Nov 2025 12:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764331904;
 bh=F9f9DGXUrMDAnd6Dn6rt6a+KkNE9C3JXOmFHvWQiH2A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jtFqyPfLOECpSBRGXvZlHENcJWOaafmlVI/XoNG+NUo5pUYtKn5PHcaNBZdbsqRzZ
 NfWyE2kkh6t6flZD0ou6Z46szF3f36nC58bLLdTaACXbld6paHUteedw5l1pXXgGRa
 aWt4a8bQNU+dtN6t4XVDFfCNgZfSf/vtzXKgKhZ70GBqbMjMhxHSbYMXJSlJaHobUh
 m+Cbo3ZI16L23yXMReP8SsIcgu37L5ins+kwDpbx+HQWkrOLSEgzA0qOUTSnEond+B
 m9yrp/iKKR/3AWaNSC4ynJrO5T5zdGN1iwS9WrPU6Hat4lsPmNHSTzOPIuO2zG8GMd
 hsHhpAGTqGUHQ==
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-63c489f1e6cso2714188a12.1
 for <samba-technical@lists.samba.org>; Fri, 28 Nov 2025 04:11:44 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVfhqoPirgfdwXUc9LkhUuIaeWxUZP0iGAD/JZhFMZ2teyLF34KCI29YFxTsERWCSjvRFlfe7hnir68FREU8tw=@lists.samba.org
X-Gm-Message-State: AOJu0YzcVfWkb/U7MZI0XjeI7udK7yRlKdRbAoB/oO4BjuQ/PXjH6qdZ
 ywfPwUBF2ALKxL4rBep++jmLx9HHft0Xgt8U/KBc8O8eK3C89he0symqU+S5Kj/YvzNrMu0btqz
 6Thk/WWctoPm7JynveLLyOJu98lW9cjo=
X-Google-Smtp-Source: AGHT+IEffDeZwVF5mFCzAVnIQ8TJdGu+rjb9yXvUfWzVpLBxZiS0LGnwDmnR/XdTLP4zWNha3bWXYAMaNbnF3wfwIOk=
X-Received: by 2002:a05:6402:1d1c:b0:640:aae6:adc5 with SMTP id
 4fb4d7f45d1cf-6454ddd44e5mr19170827a12.4.1764331902898; Fri, 28 Nov 2025
 04:11:42 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764080338.git.metze@samba.org>
 <CAKYAXd_HKKBKx_B7+Z+b_jt+rHazuMkskYYPAp6BROPuy0uBfA@mail.gmail.com>
 <CAKYAXd8Nb6Ay1-J0GeDUCzRDWWYtRtcU-2FZ1LrX9p8soKpaKQ@mail.gmail.com>
 <bd2237e6-86e7-40c8-8635-8ba6c0573cbe@samba.org>
 <CAKYAXd8QhE_=zoK3pLqd0M-8Zw8M0auTw-P5yoqe6DioGXtsaQ@mail.gmail.com>
 <CAH2r5mv0BLnF9+ori1ZfoaYfBLXcscjuFkkAjggSY+aroKDRiw@mail.gmail.com>
 <b1f6271b-3c2a-493a-a404-7cdacd791acb@samba.org>
In-Reply-To: <b1f6271b-3c2a-493a-a404-7cdacd791acb@samba.org>
Date: Fri, 28 Nov 2025 21:11:30 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9ykY7y0PGFcibQMUjQxb9_usEqKEJFrWJCBFuNesji1A@mail.gmail.com>
X-Gm-Features: AWmQ_bmtVVQXPh5UQzokz3qk6O3MeIluP216uxsVWDjRbdhl1T9UnaQJmZGX-Js
Message-ID: <CAKYAXd9ykY7y0PGFcibQMUjQxb9_usEqKEJFrWJCBFuNesji1A@mail.gmail.com>
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

On Fri, Nov 28, 2025 at 7:17=E2=80=AFPM Stefan Metzmacher <metze@samba.org>=
 wrote:
>
> Am 28.11.25 um 05:53 schrieb Steve French:
> > On Thu, Nov 27, 2025 at 9:19=E2=80=AFPM Namjae Jeon <linkinjeon@kernel.=
org> wrote:
> >
> >> On Fri, Nov 28, 2025 at 12:54=E2=80=AFAM Stefan Metzmacher <metze@samb=
a.org>
> >> wrote:
> >>>
> >>> Am 26.11.25 um 02:07 schrieb Namjae Jeon:
> >>>> On Wed, Nov 26, 2025 at 8:50=E2=80=AFAM Namjae Jeon <linkinjeon@kern=
el.org>
> >> wrote:
> >>>>>
> >>>>> On Tue, Nov 25, 2025 at 11:22=E2=80=AFPM Stefan Metzmacher <metze@s=
amba.org>
> >> wrote:
> >>>>>>
> >>>>>> Hi,
> >>>>>>
> >>>>>> here are some small cleanups for a problem Nanjae reported,
> >>>>>> where two WARN_ON_ONCE(sc->status !=3D ...) checks where triggered
> >>>>>> by a Windows 11 client.
> >>>>>>
> >>>>>> The patches should relax the checks if an error happened before,
> >>>>>> they are intended for 6.18 final, as far as I can see the
> >>>>>> problem was introduced during the 6.18 cycle only.
> >>>>>>
> >>>>>> Given that v1 of this patchset produced a very useful WARN_ONCE()
> >>>>>> message, I'd really propose to keep this for 6.18, also for the
> >>>>>> client where the actual problem may not exists, but if they
> >>>>>> exist, it will be useful to have the more useful messages
> >>>>>> in 6.16 final.
> >>>> Anyway, Applied this patch-set to #ksmbd-for-next-next.
> >>>> Please check the below issue.
> >>>
> >>> Steve, can you move this into ksmbd-for-next?
> >> Steve, There are more patches in ksmbd-for-next-next.
> >> Please apply the following 6 patches in #ksmbd-for-next-next to
> >> #ksmbd-for-next.
> >>
> >> 3858665313f1 (HEAD -> ksmbd-for-next-next, origin/ksmbd-for-next-next)
> >> ksmbd: ipc: fix use-after-free in ipc_msg_send_request
> >> b9c7d4fe6e93 smb: client: relax WARN_ON_ONCE(SMBDIRECT_SOCKET_*)
> >> checks in recv_done() and smbd_conn_upcall()
> >> 6c5ceb636d08 smb: server: relax WARN_ON_ONCE(SMBDIRECT_SOCKET_*)
> >> checks in recv_done() and smb_direct_cm_handler()
> >> d02a328304e5 smb: smbdirect: introduce
> >> SMBDIRECT_CHECK_STATUS_{WARN,DISCONNECT}()
> >> 340255e842d5 smb: smbdirect: introduce SMBDIRECT_DEBUG_ERR_PTR() helpe=
r
> >> 01cba263d1bd ksmbd: vfs: fix race on m_flags in vfs_cache
>
> It seems these are the v2 patches, please use v3,
> the difference is that the __SMBDIRECT_SOCKET_DISCONNECT
> defines are moved up in order to let the patches on top work
> with out modifications. I noticed the difference while
> doing a rebase on ksmbd-for-next and get conflicts.
Right, Sorry for missing v3 patches.

Steve, Please apply updated 4 patches in ksmbd-for-next-next to ksmbd-for-n=
ext.

fc86cca6087f (HEAD -> ksmbd-for-next-next, origin/ksmbd-for-next-next)
smb: client: relax WARN_ON_ONCE(SMBDIRECT_SOCKET_*) checks in
recv_done() and smbd_conn_upcall()
111b7cb1b7f6 smb: server: relax WARN_ON_ONCE(SMBDIRECT_SOCKET_*)
checks in recv_done() and smb_direct_cm_handler()
12059ee95a5b smb: smbdirect: introduce
SMBDIRECT_CHECK_STATUS_{WARN,DISCONNECT}()
3658d5ac7908 smb: smbdirect: introduce SMBDIRECT_DEBUG_ERR_PTR() helper

Thanks.
>
> Thanks!
> metze
>
>

