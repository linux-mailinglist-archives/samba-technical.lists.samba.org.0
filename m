Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 60936C90DA8
	for <lists+samba-technical@lfdr.de>; Fri, 28 Nov 2025 05:54:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=juSOVHpElgAj3lcy+hr3kvGYlkDnZA9SphRC47f/dyg=; b=c7dMU06wOEF1C2Bw+HBWHAZUxw
	JZWNrSfkzeAkaqFm7iXHOJKDx13bSd95y1Eq3nNWsmNRDTQDINvCP3sIQbzOAJiyJHzuW2wExeLgJ
	zBlDcVxgLhRRmeKFKLu2esk92/iaOs5oqASm6Vw4TBkegx1t4CeMN6z6/2xwcn0WwGZGtlsskVadX
	Q+Yv352jI8touR30nB+UMl6lVYP9Aa8oARl6WO0huHTFzOVOpm/aG9sPwtklqQJdggK7o2pqj3UQL
	T8s0IlhAVBcEgluBNDZNZcTz7zzMjX9Kd76GEebQva2Kj5l6pFsV+b4hQQsBdNwgBxbteMC8BplKm
	lFjn9eCw==;
Received: from ip6-localhost ([::1]:33932 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vOqUj-00DUKV-KX; Fri, 28 Nov 2025 04:54:09 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:57573) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vOqUe-00DUKO-Du
 for samba-technical@lists.samba.org; Fri, 28 Nov 2025 04:54:07 +0000
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-880576ebe38so15243066d6.2
 for <samba-technical@lists.samba.org>; Thu, 27 Nov 2025 20:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764305642; x=1764910442; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4AiQbViec3kWwV24AE8XRrsBXOC5Tj12IX89HgLDWIw=;
 b=fx3L+bIwfq3nXS3MK1E9H/cOl6l0Eyx5IpSKpLNV3CpGEeX0jbKlq/r/5dLuGq6WvB
 17qOOpi/5+Ux52s6hmCmJibUoinV59tfZ+ljeRfnH7abxOmBsyoYSySpHx+rmS1KdaEr
 eW7YVWxUqF4oss+8O5Suc+7zR388Rx31EpGKl+Ct7po5FbNR9taV/rZGESvg3icg/nia
 fynSLYZup0TpHG1ZM/jz5uJ4jHYUMRu1coytrqBTtT3YnxrqmJqpz1/E1jIwwgDbZp2o
 8SWFiOO2oQGKojoeUHw7plbiLA1lDQHvHsBZGtQctRiWz5E+c6DFFT6JFGWnCFTArhsd
 n8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764305642; x=1764910442;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4AiQbViec3kWwV24AE8XRrsBXOC5Tj12IX89HgLDWIw=;
 b=r7xLD7DDbOJWJqej4iiHDlImp+iCt2jwWVcoU6tp4z9NqFx5z8U3P3Nban46rgg7/5
 /iP5hCREM1IVrSfj39fNYJt0QwJ2pY1/0decQhR1slqsDquZjlJHr31/APCfGynPnMUA
 mquvk9f3cGn5sOG1bcvULsHtDuAelK+tG5/6jelryo/31YBidsFL/V27iwZ/f5GPI3uC
 0USiOkSMa9W/1SFNp4DdowPSix10AMLAObCmZuq/kGIbkbBVozvs3fw/qhuuAof4cr35
 AnSmgYvZACuJtmuvFejRwkzWVi5b/nB1wRgKexSDZmyXo4q8/0j//dz5Jgr4ZeTO6+1D
 f4uA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJPbmI5NZFT3SiKCTr09d/gm9o8c5/BP4CP/6BQsoFMOvO/EP3QHPlwgQBcOFRhjLFuA5m/u+p7d5nVRQU1r0=@lists.samba.org
X-Gm-Message-State: AOJu0YwtqVGipMkg95MIW4gFkAyCV8a88XyqzTgHttyxHrjgY+93zaay
 zIm3Pc/1cHZelDhP4j5hsdGnRowMSjn3dXQucdVR6hzHiuG/prZACd4oSU0slervb1Xdl+XU4JO
 ijfSgyBZC4z7k8TUXrsQrPVhaBmvv1C0=
X-Gm-Gg: ASbGncv1OD5jOKPrjUK4lRlOwrKckaWBMG3wEbZdSqq4xlFUc2hftPn4gdS0R41Ruas
 b3vBgJa25j31DeeMDEj073C8Daig4+H/1Jn+GNMvWHoG+LsgPrSLGMtzIWglMcZKzJ1ImBEZzX7
 J1J9txcIumLOERWr9gCN3jBOwraFYpnKBIbcfbUVjem0GO59sswdTpeHy03udFh1YFSD62v2CzC
 GPchcAKZCZzf0UGgv13cIfZmiXn/SOOIWTo6ETxMQVCCKE2YWpjgocejrEtwghONdr8EvAIKNSy
 DWNDrnKVHJfCR/DtuXcAMm0JSoChYjWQz8A0VZiBZGrvgjer57czfCJTY4B4XFkE06J2yZadAjb
 3X0GixPR+2mUzgOYgZDj246pyNpN77niUKCH/4sp0UOyIAhuGCkljVZ47NnAj6Efjq72WpG1EyJ
 8xWxHGULLIkw==
X-Google-Smtp-Source: AGHT+IFvXI5hUUco3LCPerpEfxAmoRa8ysKIBg6GXGSrPcrirbnb2DxWXFd9fUL4L9pCjB9a7fteLd7qr0pKAOfhuIk=
X-Received: by 2002:a0c:f40e:0:b0:880:415d:a9fd with SMTP id
 6a1803df08f44-8863ae8a836mr174891076d6.23.1764305642288; Thu, 27 Nov 2025
 20:54:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764080338.git.metze@samba.org>
 <CAKYAXd_HKKBKx_B7+Z+b_jt+rHazuMkskYYPAp6BROPuy0uBfA@mail.gmail.com>
 <CAKYAXd8Nb6Ay1-J0GeDUCzRDWWYtRtcU-2FZ1LrX9p8soKpaKQ@mail.gmail.com>
 <bd2237e6-86e7-40c8-8635-8ba6c0573cbe@samba.org>
 <CAKYAXd8QhE_=zoK3pLqd0M-8Zw8M0auTw-P5yoqe6DioGXtsaQ@mail.gmail.com>
In-Reply-To: <CAKYAXd8QhE_=zoK3pLqd0M-8Zw8M0auTw-P5yoqe6DioGXtsaQ@mail.gmail.com>
Date: Thu, 27 Nov 2025 22:53:54 -0600
X-Gm-Features: AWmQ_bkQF0Wigb9KFDxAlgtXBnIq0D_cFRuhZ15v1kHBto2qfszmeLUDaXn2qA4
Message-ID: <CAH2r5mv0BLnF9+ori1ZfoaYfBLXcscjuFkkAjggSY+aroKDRiw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] smb: smbdirect/client/server: relax
 WARN_ON_ONCE(SMBDIRECT_SOCKET_*) checks
To: Namjae Jeon <linkinjeon@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-cifs@vger.kernel.org, Paulo Alcantara <pc@manguebit.org>,
 samba-technical@lists.samba.org, Stefan Metzmacher <metze@samba.org>,
 Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Nov 27, 2025 at 9:19=E2=80=AFPM Namjae Jeon <linkinjeon@kernel.org>=
 wrote:

> On Fri, Nov 28, 2025 at 12:54=E2=80=AFAM Stefan Metzmacher <metze@samba.o=
rg>
> wrote:
> >
> > Am 26.11.25 um 02:07 schrieb Namjae Jeon:
> > > On Wed, Nov 26, 2025 at 8:50=E2=80=AFAM Namjae Jeon <linkinjeon@kerne=
l.org>
> wrote:
> > >>
> > >> On Tue, Nov 25, 2025 at 11:22=E2=80=AFPM Stefan Metzmacher <metze@sa=
mba.org>
> wrote:
> > >>>
> > >>> Hi,
> > >>>
> > >>> here are some small cleanups for a problem Nanjae reported,
> > >>> where two WARN_ON_ONCE(sc->status !=3D ...) checks where triggered
> > >>> by a Windows 11 client.
> > >>>
> > >>> The patches should relax the checks if an error happened before,
> > >>> they are intended for 6.18 final, as far as I can see the
> > >>> problem was introduced during the 6.18 cycle only.
> > >>>
> > >>> Given that v1 of this patchset produced a very useful WARN_ONCE()
> > >>> message, I'd really propose to keep this for 6.18, also for the
> > >>> client where the actual problem may not exists, but if they
> > >>> exist, it will be useful to have the more useful messages
> > >>> in 6.16 final.
> > > Anyway, Applied this patch-set to #ksmbd-for-next-next.
> > > Please check the below issue.
> >
> > Steve, can you move this into ksmbd-for-next?
> Steve, There are more patches in ksmbd-for-next-next.
> Please apply the following 6 patches in #ksmbd-for-next-next to
> #ksmbd-for-next.
>
> 3858665313f1 (HEAD -> ksmbd-for-next-next, origin/ksmbd-for-next-next)
> ksmbd: ipc: fix use-after-free in ipc_msg_send_request
> b9c7d4fe6e93 smb: client: relax WARN_ON_ONCE(SMBDIRECT_SOCKET_*)
> checks in recv_done() and smbd_conn_upcall()
> 6c5ceb636d08 smb: server: relax WARN_ON_ONCE(SMBDIRECT_SOCKET_*)
> checks in recv_done() and smb_direct_cm_handler()
> d02a328304e5 smb: smbdirect: introduce
> SMBDIRECT_CHECK_STATUS_{WARN,DISCONNECT}()
> 340255e842d5 smb: smbdirect: introduce SMBDIRECT_DEBUG_ERR_PTR() helper
> 01cba263d1bd ksmbd: vfs: fix race on m_flags in vfs_cache
>
>
> Done


--=20
Thanks,

Steve
