Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BAEB2B745
	for <lists+samba-technical@lfdr.de>; Tue, 19 Aug 2025 04:48:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=PmWPVHaLppPixeUwoFvslppM1gYT6LqJCGwpsC8+n6Q=; b=haIe9GVjEzo1YrEPuRBpeNwiv1
	mJBWur73Y0sMlLIj74JxuT3cF2eoQQqdlAcbwQjYm2MLYqnQSVNQp8PaULuSJEvomSIkHuI8pjoUU
	ca1XK6xoOabgOGvvV1rUqyKttLVn1WPJSNlQA2XASNeDWnY/iFR2t9Z7Z9j8IxIhgDC4elaBp6GZb
	RO9xXhUEST/BPTFDhJb/y8CCA6w7BBqb/rJ0FF3OlK+bG4pAqDcXtaSdZNWXbndgRdQt27e0l6JC3
	Y2QaNs6KXHGkuHu9rqfn3WMbrsQwcqwAISUc/tvpQjmbWeMFBlZkVBmbvvez7ElL9q2P0DcjnSjWw
	iZBfl8aQ==;
Received: from ip6-localhost ([::1]:37806 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uoCNu-00FHtd-AI; Tue, 19 Aug 2025 02:47:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217]:34410) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uoCNq-00FHtW-Ho
 for samba-technical@lists.samba.org; Tue, 19 Aug 2025 02:47:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4C5735C5AC7
 for <samba-technical@lists.samba.org>; Tue, 19 Aug 2025 02:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B33CC116C6
 for <samba-technical@lists.samba.org>; Tue, 19 Aug 2025 02:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755571649;
 bh=887WRRVjnbigM/7ON7rCWHqrq9BjliCaN3UdiEL0QlQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bXMeXLXFVqudH21ps9kG1uh+2rEJ27oOpMjNQRjyNGfGdxTXu+Vb2zqP2Yx0msSA4
 Xfs8DZ+oboGi6gDIam9+3f8igdThn9JgaSLjEgFrkRlt6gontj72rx66ZoSX0ONQXV
 R/ZKWUbUNuZDdVD8de44sYAMtsREcmGX74dulKlzD8cA+XzD1o7CfdNHDT+s068ZBB
 AFm/sC9eMODw+BWoWrtez6fmR9PyjaIFk7tuzQInsWJj7PGJ0WddGsNPD+FKCE5owk
 BfUdOUugzSrKeHE/Xtl4VkVD/o0ipC23Piumm4xQDZMedLO9V28fKIlQ4HklJE6SHM
 s31NmYpX3ikcQ==
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-afcb78fb04cso688067766b.1
 for <samba-technical@lists.samba.org>; Mon, 18 Aug 2025 19:47:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXd0HZyABR9A5/qkon2i2lJCQX+vqwGvU/Gq5bUk8xFM8+nDQnv3SlIGzsqqnqrCKFkUyaoFdpS8RcL+nqpsms=@lists.samba.org
X-Gm-Message-State: AOJu0Yyg5KEvk4+mLLkuQJCirvLmTP4L/Uecjovb5ISsp9Qn1/oKIidT
 LG+222otP9Dh8vbAEF27Gdt7gNsbH172qUfxHOGqNeZxh0J0wLSXsQg7Ui7WJIKxxehAR4D9te6
 0YJHAsm10pMPHz1pjM2d5e4iLoJj90bY=
X-Google-Smtp-Source: AGHT+IHbcgWIgLjwxnP6ifJJwJ8gLsF1v1Haocw3LiHwz9NZgkZd1CGGhSk0Nr5I39m+rB1kDDc1373wFlHrNpJrAR0=
X-Received: by 2002:a17:907:7fa1:b0:ad8:87ae:3f66 with SMTP id
 a640c23a62f3a-afddd249ab4mr76817766b.60.1755571648234; Mon, 18 Aug 2025
 19:47:28 -0700 (PDT)
MIME-Version: 1.0
References: <c2d9d516-d203-44ff-946d-b4833019bfd5@samba.org>
In-Reply-To: <c2d9d516-d203-44ff-946d-b4833019bfd5@samba.org>
Date: Tue, 19 Aug 2025 11:47:16 +0900
X-Gmail-Original-Message-ID: <CAKYAXd99qOQ7HX++=KbaL0H3S1Pg2XFwKvdWUeEvre6vMYkqew@mail.gmail.com>
X-Gm-Features: Ac12FXxcs2VEwEzvZfhRHqupBYtvU5gx39PYmQL27Uj8B2pQoDtTYsGb0_SCO3g
Message-ID: <CAKYAXd99qOQ7HX++=KbaL0H3S1Pg2XFwKvdWUeEvre6vMYkqew@mail.gmail.com>
Subject: Re: Current state of smbdirect patches
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
Cc: Tom Talpey <tom@talpey.com>, Steve French <smfrench@gmail.com>,
 Samba Technical <samba-technical@lists.samba.org>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Aug 19, 2025 at 5:25=E2=80=AFAM Stefan Metzmacher <metze@samba.org>=
 wrote:
>
> Hi,
>
> I'm at the point where server/transport_rdma.c only has there
> local structures:
>
> struct smb_direct_device {
>          struct ib_device        *ib_dev;
>          struct list_head        list;
> };
>
> static struct smb_direct_listener {
>          struct rdma_cm_id       *cm_id;
> } smb_direct_listener;
>
> struct smb_direct_transport {
>          struct ksmbd_transport  transport;
>
>          struct smbdirect_socket socket;
> };
>
> All others are moved to smbdirect_socket.h.
>
> For the client I'm almost there I just need to
> finish the move of struct smbd_mr.
>
> Should I post all patches including the ones already in for-next and ksmb=
d-for-next-next?
> But resorted, first all fs/smb/common/smbdirect/ patches, then
> all fs/smb/client patches and finally all fs/smb/server patches.
>
> Maybe we want a smbdirect-for-next branch, which could be a shared ground=
 for
> for-next (client) and ksmbd-for-next[-next] (server)?
>
> So how should I post what I have?
The simplest way is to put the client/server's smbdirect patches on
top of #for-next.
Because you are changing the /common directory together and it would
be nice if it was merged and tested in linux-next.
>
> metze
>

