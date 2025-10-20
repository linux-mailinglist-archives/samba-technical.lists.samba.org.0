Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9615ABEEFD3
	for <lists+samba-technical@lfdr.de>; Mon, 20 Oct 2025 03:19:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=XV6atz4EwtITnFq29ESZy9zjh32cqDrsW6hrdVttNmc=; b=0tpA31Qq7PtGeV8Lzx12n7z1U8
	rAu7BreBblCGGZBSNt5YFq+rP/pRKreso0y7fmBG5WuqoHYlbg03WSccKO+oib0bLY4KuNIJZK5sr
	45W8Vfg4G6W0LlweMqhqD6nbo/kB8na0XCneLeVY77VlxvHNuYgVYrybQSeucxVgEIkcLFrduEFfs
	6Hrk8SpCXODlCu4hgDM9kLf/Ip+fC6MaIsqpMYUW9sRsJsI+me94SXVHmIpyAUU8lbYUG9n5rgzhn
	xF+GTEw9Jdplbullynh8O41N0utxV1iJDtyFZIyQrK/1ieUWnmBM7MVTXU5Lsbx+vyee9Q4/a468l
	m6mSH9dw==;
Received: from ip6-localhost ([::1]:61458 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vAeY7-008JnD-90; Mon, 20 Oct 2025 01:18:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31]:59048) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vAeY1-008Jn6-Uv
 for samba-technical@lists.samba.org; Mon, 20 Oct 2025 01:18:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 39D5244F60
 for <samba-technical@lists.samba.org>; Mon, 20 Oct 2025 01:18:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19818C116C6
 for <samba-technical@lists.samba.org>; Mon, 20 Oct 2025 01:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760923120;
 bh=XV6atz4EwtITnFq29ESZy9zjh32cqDrsW6hrdVttNmc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dDz8E82M5ZdAN8+UqRAH3ly6pJBHGavuRXFqq4aa9zq9MKR/3y3gQA5JgRBLrVxGo
 Fg/rlFMtAqoFRSVBn/kiTFsaW+tM0S1t0sruko054oTgxLXpiIm76G0osRodk3STEc
 Y3MiwuMmQrtY8J2nDE8nXFUUiZDLgHt+6C+/txMDMTiwEJqIvZaPXojth5BKO5pU8I
 BtoyTy5lbHTVgYZs1GjJl6C9R4JXccC7AcsgSSt604vGGhNZHjYgCjSULfHcnTmKYS
 v0DaZ053eUkWmdyzwkhU0KRNAwAprPFZCFWTCh61ajO4Q8ORTP4imBSk1Ez/IfzR8H
 UBAGqlGVkiG2g==
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-63c4b5a1b70so3478773a12.1
 for <samba-technical@lists.samba.org>; Sun, 19 Oct 2025 18:18:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUrc8ulq086NVs4vA1cwh2+nssTDK+vqU4Wuf+oYJIQpi15BptoTdaisqrJLyNQc0+oxLJst5yJUxqgWmcyUxI=@lists.samba.org
X-Gm-Message-State: AOJu0Yz35BiNohR6U4b8h/H/VLeeLzUaun0PvCV0U8nlJrhamiaaaHgN
 VWjPvOx4HuBrCNyWiD8IXiAfRadytz6JknfyfSlL1BzXecOxkZ2JQfEbvxRZiNpkjxEr3KAbtco
 SkfbP76M5F98WdqLr5kv5i1Un1utKH/k=
X-Google-Smtp-Source: AGHT+IE14oQqrNgjb6tAHMizeorwjtvCCmzGmbogDqECZTljTXIGFRJ1Vg7eiiyckQ1JZFTfxoObbt9lzLUSfn4r4tg=
X-Received: by 2002:a05:6402:40c5:b0:63c:1e95:dd4c with SMTP id
 4fb4d7f45d1cf-63c1f6cea34mr11370754a12.27.1760923118682; Sun, 19 Oct 2025
 18:18:38 -0700 (PDT)
MIME-Version: 1.0
References: <20251017095502.1532414-1-metze@samba.org>
In-Reply-To: <20251017095502.1532414-1-metze@samba.org>
Date: Mon, 20 Oct 2025 10:18:25 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-v+LX4jED3taHgB=TkiBckipiHfcOysifgbJBCG3QEVg@mail.gmail.com>
X-Gm-Features: AS18NWDHzk0KiQsmnXt-b4jlkcbxi1i1B2tWYfFtpWdHWaVziSa5ajLJ9kz9S4U
Message-ID: <CAKYAXd-v+LX4jED3taHgB=TkiBckipiHfcOysifgbJBCG3QEVg@mail.gmail.com>
Subject: Re: [PATCH v5] smb: server: allocate enough space for RW WRs and
 ib_drain_qp()
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
 samba-technical@lists.samba.org, Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Oct 17, 2025 at 6:55=E2=80=AFPM Stefan Metzmacher <metze@samba.org>=
 wrote:
>
> Make use of rdma_rw_mr_factor() to calculate the number of rw
> credits and the number of pages per RDMA RW operation.
>
> We get the same numbers for iWarp connections, tested
> with siw.ko and irdma.ko (in iWarp mode).
>
> siw:
>
> CIFS: max_qp_rd_atom=3D128, max_fast_reg_page_list_len =3D 256
> CIFS: max_sgl_rd=3D0, max_sge_rd=3D1
> CIFS: responder_resources=3D32 max_frmr_depth=3D256 mr_io.type=3D0
> CIFS: max_send_wr 384, device reporting max_cqe 3276800 max_qp_wr 32768
> ksmbd: max_fast_reg_page_list_len =3D 256, max_sgl_rd=3D0, max_sge_rd=3D1
> ksmbd: device reporting max_cqe 3276800 max_qp_wr 32768
> ksmbd: Old sc->rw_io.credits: max =3D 9, num_pages =3D 256
> ksmbd: New sc->rw_io.credits: max =3D 9, num_pages =3D 256, maxpages=3D20=
48
> ksmbd: Info: rdma_send_wr 27 + max_send_wr 256 =3D 283
>
> irdma (in iWarp mode):
>
> CIFS: max_qp_rd_atom=3D127, max_fast_reg_page_list_len =3D 262144
> CIFS: max_sgl_rd=3D0, max_sge_rd=3D13
> CIFS: responder_resources=3D32 max_frmr_depth=3D2048 mr_io.type=3D0
> CIFS: max_send_wr 384, device reporting max_cqe 1048574 max_qp_wr 4063
> ksmbd: max_fast_reg_page_list_len =3D 262144, max_sgl_rd=3D0, max_sge_rd=
=3D13
> ksmbd: device reporting max_cqe 1048574 max_qp_wr 4063
> ksmbd: Old sc->rw_io.credits: max =3D 9, num_pages =3D 256
> ksmbd: New sc->rw_io.credits: max =3D 9, num_pages =3D 256, maxpages=3D20=
48
> ksmbd: rdma_send_wr 27 + max_send_wr 256 =3D 283
>
> This means that we get the different correct numbers for ROCE,
> tested with rdma_rxe.ko and irdma.ko (in RoCEv2 mode).
>
> rxe:
>
> CIFS: max_qp_rd_atom=3D128, max_fast_reg_page_list_len =3D 512
> CIFS: max_sgl_rd=3D0, max_sge_rd=3D32
> CIFS: responder_resources=3D32 max_frmr_depth=3D512 mr_io.type=3D0
> CIFS: max_send_wr 384, device reporting max_cqe 32767 max_qp_wr 1048576
> ksmbd: max_fast_reg_page_list_len =3D 512, max_sgl_rd=3D0, max_sge_rd=3D3=
2
> ksmbd: device reporting max_cqe 32767 max_qp_wr 1048576
> ksmbd: Old sc->rw_io.credits: max =3D 9, num_pages =3D 256
> ksmbd: New sc->rw_io.credits: max =3D 65, num_pages =3D 32, maxpages=3D20=
48
> ksmbd: rdma_send_wr 65 + max_send_wr 256 =3D 321
>
> irdma (in RoCEv2 mode):
>
> CIFS: max_qp_rd_atom=3D127, max_fast_reg_page_list_len =3D 262144,
> CIFS: max_sgl_rd=3D0, max_sge_rd=3D13
> CIFS: responder_resources=3D32 max_frmr_depth=3D2048 mr_io.type=3D0
> CIFS: max_send_wr 384, device reporting max_cqe 1048574 max_qp_wr 4063
> ksmbd: max_fast_reg_page_list_len =3D 262144, max_sgl_rd=3D0, max_sge_rd=
=3D13
> ksmbd: device reporting max_cqe 1048574 max_qp_wr 4063
> ksmbd: Old sc->rw_io.credits: max =3D 9, num_pages =3D 256,
> ksmbd: New sc->rw_io.credits: max =3D 159, num_pages =3D 13, maxpages=3D2=
048
> ksmbd: rdma_send_wr 159 + max_send_wr 256 =3D 415
>
> And rely on rdma_rw_init_qp() to setup ib_mr_pool_init() for
> RW MRs. ib_mr_pool_destroy() will be called by rdma_rw_cleanup_mrs().
>
> It seems the code was implemented before the rdma_rw_* layer
> was fully established in the kernel.
>
> While there also add additional space for ib_drain_qp().
>
> This should make sure ib_post_send() will never fail
> because the submission queue is full.
>
> Fixes: ddbdc861e37c ("ksmbd: smbd: introduce read/write credits for RDMA =
read/write")
> Fixes: 4c564f03e23b ("smb: server: make use of common smbdirect_socket")
> Fixes: 177368b99243 ("smb: server: make use of common smbdirect_socket_pa=
rameters")
> Fixes: 95475d8886bd ("smb: server: make use smbdirect_socket.rw_io.credit=
s")
> Cc: Namjae Jeon <linkinjeon@kernel.org>
> Cc: Steve French <smfrench@gmail.com>
> Cc: Tom Talpey <tom@talpey.com>
> Cc: linux-cifs@vger.kernel.org
> Cc: samba-technical@lists.samba.org
> Signed-off-by: Stefan Metzmacher <metze@samba.org>
Applied it to #ksmbd-for-next-next.
Thanks!

