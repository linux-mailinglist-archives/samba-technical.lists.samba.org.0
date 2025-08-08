Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B6636B1DFF9
	for <lists+samba-technical@lfdr.de>; Fri,  8 Aug 2025 02:38:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=RJDgDorY+f3HWAh5hDNz4Ijn5KpvdZnrdF75euCEjPs=; b=s9ksRON4eKmVFZejjSc016qRD0
	i+v4K/GGCvr+adguwsvQb8V9gw8UrhtW90H6E19A3ci1x6xx1Ax32euSJZkyrOnxDCTTOrRXMt5ym
	pa0KvjQLviWnORFM8GcVu5j2BCFR0X/+F8WIZanjM6XECvm6NZY9U2UAhl9gHiZLUNv8dwgO4JUp3
	nH8YlZK6YHu6ysL1Ao/zc90mprXwfhOGNZVgWxHdhR7wERwZlEtAoaIa136CT3sBq00l2g0WATc+P
	QWBBtO0RSdX95NJ22I8xBgdrG/d0o0RLCz+ZCm5m2uyVZO0SpW92DWNxvqXnmIcwG6rWsQ85MOupZ
	Un10jvMQ==;
Received: from ip6-localhost ([::1]:18656 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ukB7q-00EdIB-Tt; Fri, 08 Aug 2025 00:38:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217]:57552) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ukB7m-00EdI4-8d
 for samba-technical@lists.samba.org; Fri, 08 Aug 2025 00:38:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D377E5C478E
 for <samba-technical@lists.samba.org>; Fri,  8 Aug 2025 00:22:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8088CC4CEF7
 for <samba-technical@lists.samba.org>; Fri,  8 Aug 2025 00:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754612542;
 bh=BddAEfpMqVRjODJh9kz3/wRh+yYQGdJyzfFRT9EvL0k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=szlbWZAoIube+2GP0r9hRmCBWruF9hC8QOGWEpBdhdE0UG6/Wl2CrMSiT6bhLRDjS
 X9BMe4HX/BkAIiUwKUAS+aYpdxxAHPDHqXTd/eZGolsdet8aIi3Jd0Lb/bghWSppeW
 boKocTAqC+diTOcoBmLTa7GMnz2lquscpKRKXW9ijxp3vw+3GRk6rgHCfOhPak63bY
 MM5TatJp1QyhQRr0ahUQmli6i3WamOZmDzY9uLyCZpqprdOstSuuZwjH7O8RQLWo7m
 XzUlA9IZ0uHCn3CmWJP/lIcGI/vpkga0L04XW4P7hm+tG3pvuLi6PwyD3ZvQxcYxGN
 rdmZlY8TP6dLw==
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-af94e75445dso290719166b.0
 for <samba-technical@lists.samba.org>; Thu, 07 Aug 2025 17:22:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV9sFLDY/omrIkBRD292dRSYoLsMivWQG4F+/2VX7MKXWd0FaxwUn0mf+VCfkX8y4iwap6TXbDGduv1UNLUigA=@lists.samba.org
X-Gm-Message-State: AOJu0Yyp1XB2ISSE1BO/4GYGuBlqh9ctqVJsd4bgRNqYP7N0oQ76HEo3
 6lCopg7c0NQUTH9RZauTmB6gTIr/h3DBVCoGRhq+v7pjnWhkGmuUGot+F2gDJEXE62XXH56BSub
 Q545QlQwZqm/0MP2nlBUFh6wFg5pqa0o=
X-Google-Smtp-Source: AGHT+IHTzayJ7fA2MjXw+lfefek/RqugrB758ByWpIhU+M49BKb7UnnJNPni1VqvZLQDRX7dccI+nBficss3p7PpKD4=
X-Received: by 2002:a17:906:eecd:b0:ae6:f564:18b5 with SMTP id
 a640c23a62f3a-af9c64525famr83850266b.19.1754612541124; Thu, 07 Aug 2025
 17:22:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1754501401.git.metze@samba.org>
In-Reply-To: <cover.1754501401.git.metze@samba.org>
Date: Fri, 8 Aug 2025 09:22:09 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8AGwTcRO=cJmeTHpaktuqRs+RhLQg_Jy8BPMaVqZq4Gg@mail.gmail.com>
X-Gm-Features: Ac12FXwFNW0E55EbTxMQqSqtAe4ECiM8KOI2fQGT2gxBJ_-AZZQ8nseCJnad-zw
Message-ID: <CAKYAXd8AGwTcRO=cJmeTHpaktuqRs+RhLQg_Jy8BPMaVqZq4Gg@mail.gmail.com>
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
Acked-by: Namjae Jeon <linkinjeon@kernel.org>

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

