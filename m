Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D81B1DCF3
	for <lists+samba-technical@lfdr.de>; Thu,  7 Aug 2025 20:15:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=yDmHIeR9vBGhvgS6PfsbuztwiDYgJcdK8fhBDdr6eZw=; b=TRrsAai1b/HVa45s/26WkNlScz
	fY8/tYLbIHMn6KnVPGb0hCmZj3WSvqOfulqNYhmBJ/nUB1c0k5oT3cISXw95Hrqe/r3HtKrqYnVkf
	LMBNWKPpHoqKtcjeHkqhhVWhGJPCkv3K7X0XnQyRkqCc54YvUvGhramNr0LLzhblyq6Iw61HX+5Ac
	1NbA35Nme44bQgleyySwoZJm2v5nNO5X23Jq+3uTMKnYTwCaZP7/UVG+CFX/EGu8zsTelIjGi0gHI
	/dvmUp15/7yPzfG3YjyrWu8ez7PgdtGGqsVpSgdsX5eHSy0hWqVJq1q9tJEKtTMtE8YczLpnF+6k4
	tVyOCEmQ==;
Received: from ip6-localhost ([::1]:24606 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uk592-00Ebrp-T3; Thu, 07 Aug 2025 18:15:17 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:61642) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uk58p-00EbrM-RE
 for samba-technical@lists.samba.org; Thu, 07 Aug 2025 18:15:08 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id
 6a1803df08f44-707453b0306so13582406d6.2
 for <samba-technical@lists.samba.org>; Thu, 07 Aug 2025 11:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754590502; x=1755195302; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yDmHIeR9vBGhvgS6PfsbuztwiDYgJcdK8fhBDdr6eZw=;
 b=ndugmND37g9si6LDPgzXNIWxruBnN/m4FdPrz7wrNY9E9EhEusDfqk4VLdlPUEaCUv
 +/mCAF5PLgJq6I0QdulfMAh0TvmRuNdircQugfs/agrkg1hrLenXNF+I3pZg01kqksBx
 T07uYkFMvf1+GDhYoCYLriHVm5ftKLlFcJ+0EbnkhJM57p1sm814g2zKM7dSpRoLo4Iv
 WmU8GGCFvHFSWBETjTe0e65vwlD2WXXccHjw9v4w/lTy3GeWGWUhJd6MWUkpXyzNt5T+
 OPZQFITlQSvIVfemXidmx30CglvSK5Lro2n3RO1OJJ/HUzk3Iwx0BdasvJutNeJwaljH
 uWPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754590502; x=1755195302;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yDmHIeR9vBGhvgS6PfsbuztwiDYgJcdK8fhBDdr6eZw=;
 b=JHjHFrV0SQGbExQ2ljOqR49xaQQN/2oeOhu8H7aqM9rEMPUGZHqUtW98O3TV6lXgH3
 wNpWN5gM57exOmezn2pEz3NcSALcAnkyMy/C6OdELlXjmpGwpIdRAOgIWl3QY/P6GhZn
 uhd8j+ko5xwj64g+Md/Y/hFyHW7bCnbBAgjAGE2sXi1QJtmeVd8uPnaFqpqS3tjIVSOR
 JmG7G9SNorBFJohkbRiY0fbjQQjycWPcJE/8H17Au0/36B1I3JPnLAtnz0Ekz9To/ZDW
 ba20Tqk7m4hIxI4sCLXmF9jPW+Q8+++2Z/Hc++qka1ur6hv/UFsXZbQnQjd5FT6D5ODN
 cjMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoTxYM6rBM//EkpomEGawUdiTirhwJs8ZvENqRsa0vK7Wr0ge/AbJaIcknSwZI6mqR4szd+3q/JW3WuFjykOs=@lists.samba.org
X-Gm-Message-State: AOJu0YzQJFTihMbHRkz6Xtv1jJ38AJbVGrSyKcUYEjORGb2sgdYFSP6N
 yu3MmkBefJjXK4j7CMSNeWV+LRSzkR4yy/baCos1F3kaCXuhrZ8qN1FwgOyoV+EkQ7Okie2z2aR
 eXgwRaYsaWpYBCcoh2cc4oKFcvmHB5Xo=
X-Gm-Gg: ASbGncuLGHem3oX5f9b3ZoXLP7Vj8gMS7gFLx0sbARCh1uQnwFmDk4AeKYhaOv8Eibo
 AOAPgwCAeqFKNEnBlG9LRT6vxzktuxW26LkUnv1zdD9QyuLnbqOb/hb1o5fR1YLVVMpblHi1ylE
 ERGETlMskO/1+m+Vc7n1YUQZtFtQ9mAJHFP1lV4mVpwhp+jj8MoFmyl9tVEfNkHhecAQg9elgyU
 OEJjf63g916Oa1i0VneEsfd6JsT+oQlFPTPbN4Y0z5ZfW62cUE=
X-Google-Smtp-Source: AGHT+IHuRqoGf10eSMHQgO8/pbBLy5yJPEpZjUzvY0FkzwE9WNzNYSn9efYG7+5b8k/Ge3IicylmGZfjhuvxbnK5BGw=
X-Received: by 2002:a05:6214:c29:b0:707:228e:40b9 with SMTP id
 6a1803df08f44-7099a332e82mr3844666d6.23.1754590501781; Thu, 07 Aug 2025
 11:15:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1754582143.git.metze@samba.org>
In-Reply-To: <cover.1754582143.git.metze@samba.org>
Date: Thu, 7 Aug 2025 13:14:50 -0500
X-Gm-Features: Ac12FXzDR4dJKVZm_6CRma5K5PBo63NXVlDieBSw8L-DYfAEnz1qxXjX7wrjOO0
Message-ID: <CAH2r5mvB2sLkZd5v0as4vrR=mmL6jDcq2xGOb+BZoZHLnGY_Gg@mail.gmail.com>
Subject: Re: [PATCH 0/9] smb: client/smbdirect: connect bug fixes/cleanups and
 smbdirect_socket.status_wait
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Tentatively merged into cifs-2.6.git  for-next pending additional review/te=
sting

I did fix up minor checkpatch warnings in patches 5 and 6 (unneeded {
and } in if ... else)

On Thu, Aug 7, 2025 at 11:12=E2=80=AFAM Stefan Metzmacher <metze@samba.org>=
 wrote:
>
> Hi,
>
> this is the next step towards a common smbdirect layer
> between cifs.ko and ksmbd.ko, with the aim to provide
> a socket layer for userspace usage at the end of the road.
>
> This patchset focuses on the client side today.
>
> The first one is a fix for very long timeouts against
> unreachable servers.
>
> The others prepare the use of a single wait_queue for state
> changes. This removes a lot of special handling during
> the connect and negotiate phases.
>
> The last two move the state_wait queue into the common
> smbdirect_socket.status_wait.
>
> For the server I have only a single patch that also
> uses smbdirect_socket.status_wait, but I'm skipping
> the server patches today.
>
> I plan a lot more progress on the server side tomorrow
> and hopefully finish the moving everything from
> struct smb_direct_transport into struct smbdirect_socket.
>
> I used the following xfstests as regression tests:
> cifs/001 generic/001 generic/002 generic/005 generic/006 generic/007 gene=
ric/010 generic/011
>
> Between cifs.ko against ksmbd.ko via siw.ko.
>
> This is on top of the patches for the client I posted yesterday...
>
> Stefan Metzmacher (9):
>   smb: client: return an error if rdma_connect does not return within 5
>     seconds
>   smb: client: improve logging in smbd_conn_upcall()
>   smb: client: don't call init_waitqueue_head(&info->conn_wait) twice in
>     _smbd_get_connection
>   smb: client: only use a single wait_queue to monitor smbdirect
>     connection status
>   smb: client/smbdirect: replace SMBDIRECT_SOCKET_CONNECTING with more
>     detailed states
>   smb: client: use status_wait and SMBDIRECT_SOCKET_NEGOTIATE_RUNNING
>     for completion
>   smb: client: use status_wait and
>     SMBDIRECT_SOCKET_RESOLVE_{ADDR,ROUTE}_RUNNING for completion
>   smb: smbdirect: introduce smbdirect_socket.status_wait
>   smb: client: make use of smbdirect_socket.status_wait
>
>  fs/smb/client/smbdirect.c                  | 137 ++++++++++++++-------
>  fs/smb/client/smbdirect.h                  |   8 --
>  fs/smb/common/smbdirect/smbdirect_socket.h |  15 ++-
>  3 files changed, 105 insertions(+), 55 deletions(-)
>
> --
> 2.43.0
>


--=20
Thanks,

Steve

