Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD7CC87A3B
	for <lists+samba-technical@lfdr.de>; Wed, 26 Nov 2025 02:08:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=k13xYtcpKnmNS27OsarbftKT+tHwd3a+/WTcbq0PuPs=; b=T9jNXmiZjbr9V6nGJP1YIG/6YA
	SjSmJ084PvdrMWePW3WkMwk8rdsoth/2PN+X1S4IyoVb7U6sZhz2C1Y4/L08ugHjebWYuvHKov2+c
	iNfVAAPFoZ508yYsJbaoRNYIGfke0lvqxhnUjg2337ZtsTdtpYYz9IBiFszA0jS8CgINimfgRr8cN
	rPAvj+Ve2uE0Cysl4CwshNdjAMq2bArrKU9NuwXKaH+tpBLHWPpVNLRfJnWQ488iLKinuOQINF4rf
	E83wu8r4ejJ6Ke1vJv8QEE5+SL9X7ipNAYjaByqKoNhPVaYoLfQsNZ67FfGLR14nK5cdQ0yWfmSFF
	DUQ0Rtxg==;
Received: from ip6-localhost ([::1]:54578 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vO40Q-00DKp5-Gw; Wed, 26 Nov 2025 01:07:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31]:59178) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vO40L-00DKoy-06
 for samba-technical@lists.samba.org; Wed, 26 Nov 2025 01:07:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2943D43AA3
 for <samba-technical@lists.samba.org>; Wed, 26 Nov 2025 01:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05C67C16AAE
 for <samba-technical@lists.samba.org>; Wed, 26 Nov 2025 01:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764119248;
 bh=4j4prJ1loIfsv2jK9hZf/AhlJq1vyu2k3SCgc+a0DiY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=W2jJBe86jX0Q1jEWgMJtbB0EOn0DCWLa46xqczWnqUsnQkHpl5viQRTOZ/j0COO+W
 LwAAabZNdt55FF7QTylxpIVy4ZuwteytBj8b1ZjjLglwc1mgsVu3rvV6R0OPAGBS0A
 DpWw/o1l13zW9vRIpVoMVGtHuAW8Ooo3QkkIeq1iYM88gqqAZiSwHOlc3vjYH+THs1
 8zcxiwX5eQILRvMFldZoD30EWPtDuJ6WiOJq1JrPf07sQLnWlichZuuAuXBHGjazJY
 UBbNbr9U6dNu+47k35R8vvLT8k6zpc7upPv79LcDMaRv7gWEgKhKctJhh+gPv5aG8e
 hV3WV5HI8smgw==
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-6418738efa0so9534001a12.1
 for <samba-technical@lists.samba.org>; Tue, 25 Nov 2025 17:07:27 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXVnYpqVRxrLKSGhpeyyvDvOW/gSYtPhKoB2MI5BJi8Z962PLWbji69aq2KqwXprFO4CbLQhII8sjGPwdNpBMs=@lists.samba.org
X-Gm-Message-State: AOJu0Yx7BHa0JvMTvKAtN6xjPcvA833ScOc5UkXkh8tHU8upCU32zblb
 Ms4IX9IHl8/EcfyKsuGZP3CwKYwzZqJI9FEf+SyNCG9qZpddxgNT94aeYfxK3CnBdWFivE0pj/g
 YP7Atgn87WSeu+sMmRDXLetLuJUGz4z8=
X-Google-Smtp-Source: AGHT+IEnf08wlMbr4Q08I0+n1zOXDqkv7FG8rzgZ6TbR/EuZYOpwQBXw8/gnAR7H+t5q6Zbl5m5+Vhh99twJNTFQhjc=
X-Received: by 2002:a05:6402:13ce:b0:640:947e:70ce with SMTP id
 4fb4d7f45d1cf-64555b85acamr15860662a12.5.1764119246619; Tue, 25 Nov 2025
 17:07:26 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764080338.git.metze@samba.org>
 <CAKYAXd_HKKBKx_B7+Z+b_jt+rHazuMkskYYPAp6BROPuy0uBfA@mail.gmail.com>
In-Reply-To: <CAKYAXd_HKKBKx_B7+Z+b_jt+rHazuMkskYYPAp6BROPuy0uBfA@mail.gmail.com>
Date: Wed, 26 Nov 2025 10:07:14 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8Nb6Ay1-J0GeDUCzRDWWYtRtcU-2FZ1LrX9p8soKpaKQ@mail.gmail.com>
X-Gm-Features: AWmQ_blBYvP1q6cepw1F9ocRFzh8URcE5zVIZr5F4HETE1xj2kMQdhzvD5ERR5Y
Message-ID: <CAKYAXd8Nb6Ay1-J0GeDUCzRDWWYtRtcU-2FZ1LrX9p8soKpaKQ@mail.gmail.com>
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
Cc: linux-cifs@vger.kernel.org, Paulo Alcantara <pc@manguebit.org>,
 samba-technical@lists.samba.org, Tom Talpey <tom@talpey.com>,
 Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Nov 26, 2025 at 8:50=E2=80=AFAM Namjae Jeon <linkinjeon@kernel.org>=
 wrote:
>
> On Tue, Nov 25, 2025 at 11:22=E2=80=AFPM Stefan Metzmacher <metze@samba.o=
rg> wrote:
> >
> > Hi,
> >
> > here are some small cleanups for a problem Nanjae reported,
> > where two WARN_ON_ONCE(sc->status !=3D ...) checks where triggered
> > by a Windows 11 client.
> >
> > The patches should relax the checks if an error happened before,
> > they are intended for 6.18 final, as far as I can see the
> > problem was introduced during the 6.18 cycle only.
> >
> > Given that v1 of this patchset produced a very useful WARN_ONCE()
> > message, I'd really propose to keep this for 6.18, also for the
> > client where the actual problem may not exists, but if they
> > exist, it will be useful to have the more useful messages
> > in 6.16 final.
Anyway, Applied this patch-set to #ksmbd-for-next-next.
Please check the below issue.
> First, the warning message has been improved. Thanks.
> However, when copying a 6-7GB file on a Windows client, the following
> error occurs. These error messages did not occur when testing with the
> older ksmbd rdma(https://github.com/namjaejeon/ksmbd).
>
> [  424.088714] ksmbd: smb_direct: disconnected
> [  424.088729] ksmbd: sock_read failed: -107
> [  424.088881] ksmbd: Failed to send message: -107
> [  424.088908] ksmbd: Failed to send message: -107
> [  424.088922] ksmbd: Failed to send message: -107
> [  424.088980] ksmbd: Failed to send message: -107
> [  424.089044] ksmbd: Failed to send message: -107
> [  424.089058] ksmbd: Failed to send message: -107
> [  424.089062] ksmbd: Failed to send message: -107
> [  424.089068] ksmbd: Failed to send message: -107
> [  424.089078] ksmbd: Failed to send message: -107
> [  424.089085] ksmbd: Failed to send message: -107
> [  424.089104] ksmbd: smb_direct: Send error. status=3D'WR flushed (5)', =
opcode=3D0
> [  424.089111] ksmbd: Failed to send message: -107
> [  424.089140] ksmbd: Failed to send message: -107
> [  424.089160] ksmbd: Failed to send message: -107
> [  424.090146] ksmbd: Failed to send message: -107
> [  424.090160] ksmbd: Failed to send message: -107
> [  424.090180] ksmbd: Failed to send message: -107
> [  424.090188] ksmbd: Failed to send message: -107
> [  424.090200] ksmbd: Failed to send message: -107
> [  424.090228] ksmbd: Failed to send message: -107
> [  424.090245] ksmbd: Failed to send message: -107
> [  424.090261] ksmbd: Failed to send message: -107
> [  424.090274] ksmbd: Failed to send message: -107
> [  424.090317] ksmbd: Failed to send message: -107
> [  424.090323] ksmbd: Failed to send message: -107
> [  432.648368] ksmbd: smb_direct: disconnected
> [  432.648383] ksmbd: sock_read failed: -107
> [  432.648800] ksmbd: smb_direct: Send error. status=3D'WR flushed (5)', =
opcode=3D0
> [  432.649835] ksmbd: Failed to send message: -107
> [  432.649870] ksmbd: Failed to send message: -107
> [  432.649883] ksmbd: Failed to send message: -107
> [  432.649894] ksmbd: Failed to send message: -107
> [  432.649913] ksmbd: Failed to send message: -107
> [  432.649966] ksmbd: Failed to send message: -107
> [  432.650023] ksmbd: Failed to send message: -107
> [  432.650077] ksmbd: Failed to send message: -107
> [  432.650138] ksmbd: Failed to send message: -107
> [  432.650151] ksmbd: Failed to send message: -107
> [  432.650173] ksmbd: Failed to send message: -107
> [  432.650182] ksmbd: Failed to send message: -107
> [  432.650196] ksmbd: Failed to send message: -107
> [  432.650205] ksmbd: Failed to send message: -107
> [  432.650219] ksmbd: Failed to send message: -107
> [  432.650229] ksmbd: Failed to send message: -107
> [  432.650238] ksmbd: Failed to send message: -107
> [  432.650256] ksmbd: Failed to send message: -107
> [  432.650270] ksmbd: Failed to send message: -107
> [  450.254342] ksmbd: Failed to send message: -107
> [  450.254644] ksmbd: Failed to send message: -107
> [  450.254672] ksmbd: Failed to send message: -107
> [  450.254688] ksmbd: Failed to send message: -107
> [  450.254825] ksmbd: Failed to send message: -107
> [  450.254859] ksmbd: smb_direct: disconnected
> [  450.254866] ksmbd: sock_read failed: -107
> [  450.255282] ksmbd: smb_direct: Send error. status=3D'WR flushed (5)', =
opcode=3D0
> [  450.255342] ksmbd: smb_direct: Send error. status=3D'WR flushed (5)', =
opcode=3D0
>
> >
> > Thanks!
> > metze
> >
> > v3: move __SMBDIRECT_SOCKET_DISCONNECT() defines before including
> >     smbdirect headers in order to avoid problems with the follow
> >     up changes for 6.19
> >
> > v2: adjust for the case where the recv completion arrives before
> >     RDMA_CM_EVENT_ESTABLISHED and improve commit messages
> >
> > Stefan Metzmacher (4):
> >   smb: smbdirect: introduce SMBDIRECT_DEBUG_ERR_PTR() helper
> >   smb: smbdirect: introduce SMBDIRECT_CHECK_STATUS_{WARN,DISCONNECT}()
> >   smb: server: relax WARN_ON_ONCE(SMBDIRECT_SOCKET_*) checks in
> >     recv_done() and smb_direct_cm_handler()
> >   smb: client: relax WARN_ON_ONCE(SMBDIRECT_SOCKET_*) checks in
> >     recv_done() and smbd_conn_upcall()
> >
> >  fs/smb/client/smbdirect.c                  | 28 ++++++------
> >  fs/smb/common/smbdirect/smbdirect_socket.h | 51 ++++++++++++++++++++++
> >  fs/smb/server/transport_rdma.c             | 40 +++++++++++++----
> >  3 files changed, 98 insertions(+), 21 deletions(-)
> >
> > --
> > 2.43.0
> >

