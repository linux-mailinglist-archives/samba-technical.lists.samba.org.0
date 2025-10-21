Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E48ABF4C05
	for <lists+samba-technical@lfdr.de>; Tue, 21 Oct 2025 08:53:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=nt7hyyncho+qVQzOr1F3z+jC3PEq01hhyew9ppkTazk=; b=CqrrOd//Xbb/Xq2xQTy9GGvWpM
	aiaHo1yyy+TJXd2sXKJO2PToAM4OxnWPVZPT7iGaX9t/r51hRhlk+cr43WiAmiAk1LJCROWV+0lXf
	XSt3YZ8jpqnpYXWWwTawSAq1LxOHocAo+NjaQvJhMzjrbLUNaBEE6kZjO2rT4abK72123cjNhQycD
	qff3/OIETy+1Dkd+mtmD9kjIHwFClqt1V7WvvL3YcjSMkEKvkPgkCsfs3O77WbcUZHvl70WUcO+dA
	VmorxlnamaHK/21DhDplIk9OMYdPewaJXacpA/aH8ESha8N98uNatgh0POgT9L4baC1hYNacwElC7
	+vuD/cZQ==;
Received: from ip6-localhost ([::1]:49674 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vB6ER-008Pm9-Sx; Tue, 21 Oct 2025 06:52:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31]:36550) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vB6EK-008Pm2-Ic
 for samba-technical@lists.samba.org; Tue, 21 Oct 2025 06:52:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E810743B3C
 for <samba-technical@lists.samba.org>; Tue, 21 Oct 2025 06:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9F86C4CEFD
 for <samba-technical@lists.samba.org>; Tue, 21 Oct 2025 06:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761029529;
 bh=sn2oVwNS+TozRSZUOIzYvrxL5Ano16/PHHOHPc8rOcA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bnej4HOwelhXTLL32Ygz2bYk2/QYpTl7sDs/x2ZvgN+erBRSwsN/juVJvVPUMTF8a
 Cuod+l+YB+NYl4jh+RLbb0vw2glEY+bPB3sGSizFUX4M2lSDCYciXQ0SjmBnYKocbE
 +U2aaTX7n3EGOvvyzsOsThip+PCQiT0/wA2rZOJJejaVeS9CC7ZKgbPjGLMnQ3Iaga
 5kYkX39h0jcYTpGZkeKFavJ5s5oWFT4NYqHytv6ytl2Llz+fB4IoXFi8U5n8lsdfIe
 wZs6ET1LtF4P97YmDWVlwAA4LRzF9RInBPYAfFy4FUWsjZJsGpVhF7p5e23GIlruGt
 5mFSxz2zfIHiQ==
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-63c3d7e2217so6712564a12.3
 for <samba-technical@lists.samba.org>; Mon, 20 Oct 2025 23:52:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUSNzEhsBRC9403llvc2qtmu0DGubPlUBG2So8xYgrRCwL3r9WDyWYam2puxdaP/WU/pb0eOwEKlb2ih0/RZUk=@lists.samba.org
X-Gm-Message-State: AOJu0YxsbqqSs6ATj7iyGzuPd6LL3FzYVoHNC83j8qtx7Rih4La3+YEY
 oXnDxRi01a2NX8MChoQJuBNYBRvh0D0o7Ux2dB0Pts/5huP1zW8U/au0BDTZjxXOUv1E784DM4Y
 3DAbpsryhj4kfMh/i1O1oQbdbJuH5Qvo=
X-Google-Smtp-Source: AGHT+IFZNDKNWJa48C/FXExjke0/+yALeZkgGB9ynQVEz6IqFXNklSnl/HfM6TIrj1PZHpT8Uxy7FEc57DZ1+JBCd2o=
X-Received: by 2002:a05:6402:5252:b0:63a:294:b034 with SMTP id
 4fb4d7f45d1cf-63c1f634868mr15205207a12.13.1761029528359; Mon, 20 Oct 2025
 23:52:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1760984605.git.metze@samba.org>
In-Reply-To: <cover.1760984605.git.metze@samba.org>
Date: Tue, 21 Oct 2025 15:51:56 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8KQzA+0HoEFpfHj4rNRjkbhkUQn0P2dOgmr_bx_64XLg@mail.gmail.com>
X-Gm-Features: AS18NWAgxtJNHqWVefs6e3Lo8TZ4yADtDXKQ6fcO_ZG8HqiIEATt5ATIWq5VxXY
Message-ID: <CAKYAXd8KQzA+0HoEFpfHj4rNRjkbhkUQn0P2dOgmr_bx_64XLg@mail.gmail.com>
Subject: Re: [PATCH 0/5] smb: smbdirect: introduce local send credits
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
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Oct 21, 2025 at 3:36=E2=80=AFAM Stefan Metzmacher <metze@samba.org>=
 wrote:
>
> Hi,
>
> our client already has some logic to prevent overflows of
> the local submission queue for ib_post_send(), if the peer
> granted more credits than we asked for.
>
> But it's not as easy as it could be.
>
> I guess that won't happen against Windows, but our git
> history indicates this could happen.
>
> Now we have a loop of local credits based on our send_credit_target.
> With that we always try to get a local credit first and then
> get a remote credit. When we got both we are able to
> mark the request as pending in order to keep the
> existing logic based on the pending count working.
> Removing or changing that is a task for another day,
> when all code if in common between client and server.
>
> For the server this is a real bug fix, as such a logic was missing
> before.
>
> For the client it's not strictly required for 6.18, but
> I think we should keep things consistent, as it will reduce
> churn on my 6.19 patchset, which already has about 100 patches
> and brings things into common code. And more is comming there...
>
> Stefan Metzmacher (5):
>   smb: smbdirect: introduce smbdirect_socket.send_io.lcredits.*
>   smb: server: smb_direct_disconnect_rdma_connection() already wakes all
>     waiters on error
>   smb: server: simplify sibling_list handling in
>     smb_direct_flush_send_list/send_done
>   smb: server: make use of smbdirect_socket.send_io.lcredits.*
>   smb: client: make use of smbdirect_socket.send_io.lcredits.*
Applied them to #ksmbd-for-next-next.
Thanks!
>
>  fs/smb/client/smbdirect.c                  |  67 ++++++++-----
>  fs/smb/common/smbdirect/smbdirect_socket.h |  13 ++-
>  fs/smb/server/transport_rdma.c             | 106 +++++++++++++++------
>  3 files changed, 129 insertions(+), 57 deletions(-)
>
> --
> 2.43.0
>
>

