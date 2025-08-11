Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 751C5B1FD43
	for <lists+samba-technical@lfdr.de>; Mon, 11 Aug 2025 02:24:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Gzgc7DqDapYpEyfiZUzkArU07bCibsi6wSxdlaAA6xE=; b=Q+C8AxXe1eBBS/JC7WrTBbttOD
	UTsBTJaWuie7co5IZrNNmZKwNyGUUN2qjCU8esY19pMk7BnoX5QC/3UCVMGpts1+ePRyVKYXL6esa
	G5cwCVys9vAML+OEy1QEcSN/32eD20t3JrqLF422UVc7DcSoN8JyyVdMv2uexvU2Im0oyvVAgjEL/
	nZSIRmUfn6vXWfJzM7JLLRCZYTnVyVJ4Dg3Fv3lqDjK3RNdpQMO4ia5StxQ1k7veeVraSWoH6upaG
	3IyFAFvCzygu9o3N9DrubUir4qBbJiFB1e2ne+gpB3IrPuB3mhrahzcQkazwWoBLLS7XevWsOCul8
	jX0XabFg==;
Received: from ip6-localhost ([::1]:55396 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ulGKj-00Epnu-Ar; Mon, 11 Aug 2025 00:24:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3]:40220) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ulGKd-00Epnn-9H
 for samba-technical@lists.samba.org; Mon, 11 Aug 2025 00:24:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 10CA9A569A8
 for <samba-technical@lists.samba.org>; Mon, 11 Aug 2025 00:06:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6922C4CEF8
 for <samba-technical@lists.samba.org>; Mon, 11 Aug 2025 00:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754870811;
 bh=nPB5zoVvK40cjsWU9LJykUfhIO4fsAqjAOUt1KqqH2M=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=casjGMxd50wGYa3b0Cli9gdX7i3rh882xJcRRg344KLC7/CefWO8S2N+gABlmMte7
 KRiOh/h0ohqrEhKYS0gpQAkgJqLuhlMTLZG9vFG0CNfmSo2B/Aq4DzQhYVeUgqENqF
 phgPRZDtBWi1RUVuoFpet3aTUv+TmaHW78rIbk5U6KrFTGLbCJ9tkqN+czWu4rzQTT
 4LKDGznol6vcEk7N3dJd04got38BldlF6GhxAtsaUiGEvbMFiFBNv0vJDK7GQewjEZ
 bFqFexWjhmlAJCFJeVZjH3K+a0KQu60EPNkk9ViylxJzr318u0VmYqYYw8NGR5Jqeb
 y07S2rifgH4zA==
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-af66f444488so541203766b.0
 for <samba-technical@lists.samba.org>; Sun, 10 Aug 2025 17:06:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUz7tNIpowgr03okICigmsuNi8H58mNPAG0o+lZhm+nFwIKnVdQYQI3QbJgr0Dz7NYXmD3rZ7qnd2JB3aTW+2w=@lists.samba.org
X-Gm-Message-State: AOJu0YzZ57Rgcd8MiOe1ejQNCQd8X5QuQU2gqWR/cpmjgpfpYgY6og5k
 LdkPpHD1DxwO8DBcNFM6Trkn/KHu8NuVFjk1qOKUJkdvXkku6Gr5nKisfcgKaozPvBYjfGn9Dm3
 ioT0KGP7eP6xqSdu5fMv+rp+6a3k8JPE=
X-Google-Smtp-Source: AGHT+IGPZDmnJpCWDvKjuIfa5VvIshe4edNgsJ2MzHYxfc53NGYbswXpNtd/jBroCefzygcJGQEAYPL4XuSS8ITFq58=
X-Received: by 2002:a17:907:96a9:b0:ae3:7c8c:351d with SMTP id
 a640c23a62f3a-af9c6542d3amr864656366b.56.1754870810285; Sun, 10 Aug 2025
 17:06:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1754501401.git.metze@samba.org>
In-Reply-To: <cover.1754501401.git.metze@samba.org>
Date: Mon, 11 Aug 2025 09:06:38 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8s_fLFc1i2oNcGZV2guwCAiC1-+b_5s7r-HCOOC7eH1g@mail.gmail.com>
X-Gm-Features: Ac12FXzJQRqid5vA2XfXKteoYQl6jOWJUNyId3bmyy1qGFbXw5eqG_xj1XvY0RA
Message-ID: <CAKYAXd8s_fLFc1i2oNcGZV2guwCAiC1-+b_5s7r-HCOOC7eH1g@mail.gmail.com>
Subject: Re: [PATCH 00/18] smb: smbdirect: more use of common structures e.g.
 smbdirect_send_io
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

On Thu, Aug 7, 2025 at 2:36=E2=80=AFAM Stefan Metzmacher <metze@samba.org> =
wrote:
>
> Hi,
>
> this is the next step towards a common smbdirect layer
> between cifs.ko and ksmbd.ko, with the aim to provide
> a socket layer for userspace usage at the end of the road.
>
> This patchset focuses on the usage of a common
> smbdirect_send_io and related structures in smbdirect_socket.send_io.
>
> Note only patches 01-08 are intended to be merged soon,
> while the ksmbd patches 09-18 are only posted for
> completeness (as discussed with Namjae) to get early feedback.
>
> I used the following xfstests as regression tests:
> cifs/001 generic/001 generic/002 generic/005 generic/006 generic/007 gene=
ric/010 generic/011
>
> Between cifs.ko against ksmbd.ko via siw.ko in all combinations
> with and without the patchset on each side.
>
> Stefan Metzmacher (18):
>   smb: client: remove unused enum smbd_connection_status
>   smb: smbdirect: add SMBDIRECT_RECV_IO_MAX_SGE
>   smb: client: make use of SMBDIRECT_RECV_IO_MAX_SGE
>   smb: smbdirect: introduce struct smbdirect_send_io
>   smb: client: make use of struct smbdirect_send_io
>   smb: smbdirect: add smbdirect_socket.{send,recv}_io.mem.{cache,pool}
>   smb: client: make use of
>     smbdirect_socket.{send,recv}_io.mem.{cache,pool}
>   smb: server: make use of common smbdirect_pdu.h
>   smb: server: make use of common smbdirect.h
>   smb: server: make use of common smbdirect_socket
>   smb: server: make use of common smbdirect_socket_parameters
>   smb: server: make use of smbdirect_socket->recv_io.expected
>   smb: server: make use of struct smbdirect_recv_io
>   smb: server: make use of smbdirect_socket.recv_io.free.{list,lock}
>   smb: server: make use of smbdirect_socket.recv_io.reassembly.*
>   smb: server: make use of SMBDIRECT_RECV_IO_MAX_SGE
>   smb: server: make use of struct smbdirect_send_io
>   smb: server: make use of
>     smbdirect_socket.{send,recv}_io.mem.{cache,pool}
Applied ksmbd's patches to #ksmbd-for-next-next.
Thanks!
>
>  fs/smb/client/smbdirect.c                  | 112 ++--
>  fs/smb/client/smbdirect.h                  |  38 --
>  fs/smb/common/smbdirect/smbdirect_socket.h |  54 ++
>  fs/smb/server/connection.c                 |   4 +-
>  fs/smb/server/connection.h                 |  10 +-
>  fs/smb/server/smb2pdu.c                    |  11 +-
>  fs/smb/server/smb2pdu.h                    |   6 -
>  fs/smb/server/transport_rdma.c             | 742 +++++++++++----------
>  fs/smb/server/transport_rdma.h             |  41 --
>  9 files changed, 500 insertions(+), 518 deletions(-)
>
> --
> 2.43.0
>

