Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C0E87894C
	for <lists+samba-technical@lfdr.de>; Mon, 11 Mar 2024 21:09:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=DolZCnO1rkeIhTnsUyR5xnbRO8Vn4PDRwuM4uJdwaeY=; b=st37SVv1NDua5fZBSBbQYPcEGi
	tJ5QydhbFFz57lMqQcm6QZYuz+e4jRSw8yp95QawG8SXDUupyaUW1GK3Z9TybwK6BVefUUSVDrYxp
	g3O8p6/4vg/+kzVN+/f53+P22fPWuvXPekNBpbhN3r2oTF29E3ObV4QKaKQc5MEF4Lcx176gNuSMe
	WJMKrDtYhdsQCM8/j32JsWqGDV8Mc/cpAYcijqE0EVSVdo/49lMSsvM+KiAoCxfiL5cCslY4SaYSa
	OSEu+SnrhC6ETci7RdOy9X4831xMn3zUcYLr6jHE4O7v/X8FcBva4cZeT2m8LbT1JxmON6KEawFg2
	l4d7eG6A==;
Received: from ip6-localhost ([::1]:30266 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rjlwi-000BnP-VO; Mon, 11 Mar 2024 20:08:30 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:57765) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rjlwe-000BnI-4P
 for samba-technical@lists.samba.org; Mon, 11 Mar 2024 20:08:27 +0000
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-513b16bb739so890518e87.3
 for <samba-technical@lists.samba.org>; Mon, 11 Mar 2024 13:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710187703; x=1710792503; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DolZCnO1rkeIhTnsUyR5xnbRO8Vn4PDRwuM4uJdwaeY=;
 b=XuIroEghmDWGGRhosulG6Ff+nI814iCTvZ6mYIHxo9BRW5B0FvGp3eyn/HuicFQfn3
 ilSqXMMRwAXmSwaXG0ZYGd5uCocNn1dfPzY7M+MjODx6aCw6pIy56L5dRwM2KFzCn8/G
 AGWXFUIxFOerUUTufcPwPSLMaoot6OqsIdaGBAe54YX0t1RGT7lOWi8ZW5BrmD+YRTfQ
 tZ6ym7goU0DfN3ebUg1lcWm3InxyDbJTPbSA13PM1JpSP/hF+uZ5rop8Huwp5Hl3hFzG
 vymxsh1yJOr1S9EO1g5Jg2YrM/LiMbADyggRweoA0R7yjnVef4W+mQrYW0yppNJnmZdk
 b/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710187703; x=1710792503;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DolZCnO1rkeIhTnsUyR5xnbRO8Vn4PDRwuM4uJdwaeY=;
 b=j/a8NtaHgvojdoQDk/moHuzy7FZMCKFusmonSjClYZhdzJc3MMs9R8aftjmfjG571u
 eQG/JE9Cg2MDTqddBDrNEVei4RCtQyL4C9yHRKGjMwT7+OdhRiNpat36bX5eEudcHYov
 9sfbGvKLE/ZV1OMQyRgHRwgSe3wopsAV1etZ0vU1xp9l1PCDrLqDhVknUodY64rRXowj
 rJ0hBcq8QwBEtwSkaxAitAXbJfqqKJ1SkzcqJHs2wK316Z9ZaTCdYQBE96Q4twheds+0
 K5B6pBfOhRJJg0Xet4gR+UHSnxTDywjuIsLwD2nrxBQSOSRrbiMb9CMxoxtl0an0S67s
 597g==
X-Gm-Message-State: AOJu0Yzo756aF15/s2QgNOs+wLTwUP1MmXTyAVTLupK+GFL0NJkiP0m7
 bfN3mDWgmvSDnKi4FDOUX5bY2Kanc/0UfD1wcw6Fz8ikePsDRl8v/7BXogzDOrnpdnwt9RCqYVg
 MTM9QgW30g1B2BPbezNfK0QfP4OCy+86Ti2M=
X-Google-Smtp-Source: AGHT+IHc/tYouUj8AwfqpT2DSFoOwpWdiFNogFxnrIc+kM5Oqbzdhb6n4ckD2xk+oFv+k6bAd0IBAG4zLjXaytYPGTc=
X-Received: by 2002:ac2:5e64:0:b0:513:3dd3:f132 with SMTP id
 a4-20020ac25e64000000b005133dd3f132mr4724283lfr.58.1710187703212; Mon, 11 Mar
 2024 13:08:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1710173427.git.lucien.xin@gmail.com>
 <CADvbK_d1yEDebPFM-fSeu2i30upruA+fPMN0sZ6Ngg7EGNd1BQ@mail.gmail.com>
In-Reply-To: <CADvbK_d1yEDebPFM-fSeu2i30upruA+fPMN0sZ6Ngg7EGNd1BQ@mail.gmail.com>
Date: Mon, 11 Mar 2024 15:08:11 -0500
Message-ID: <CAH2r5muqwk0Va6RG31M1ev6CWAdNQkRSoMdPTvPxoz5sZ5C_QQ@mail.gmail.com>
Subject: Fwd: [RFC PATCH net-next 0/5] net: In-kernel QUIC implementation with
 Userspace handshake
To: samba-technical <samba-technical@lists.samba.org>
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
Cc: Xin Long <lucien.xin@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

FYI.  Interesting and potentially important patchset since SMB3.1.1
protocol supports QUIC

Patchset Link:
https://lore.kernel.org/netdev/cover.1710173427.git.lucien.xin@gmail.com/

Thanks.
---------- Forwarded message ---------
From: Xin Long <lucien.xin@gmail.com>
Date: Mon, Mar 11, 2024 at 12:19=E2=80=AFPM
Subject: [RFC PATCH net-next 0/5] net: In-kernel QUIC implementation
with Userspace handshake
To: network dev <netdev@vger.kernel.org>
Cc: <davem@davemloft.net>, <kuba@kernel.org>, Eric Dumazet
<edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Steve French
<smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>, Chuck Lever
III <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>,
Sabrina Dubroca <sd@queasysnail.net>, Tyler Fanelli
<tfanelli@redhat.com>, Pengtao He <hepengtao@xiaomi.com>


Introduction
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This is an implementation of the QUIC protocol as defined in RFC9000. QUIC
is an UDP-Based Multiplexed and Secure Transport protocol, and it provides
applications with flow-controlled streams for structured communication,
low-latency connection establishment, and network path migration. QUIC
includes security measures that ensure confidentiality, integrity, and
availability in a range of deployment circumstances.

This implementation of QUIC in the kernel space enables users to utilize
the QUIC protocol through common socket APIs in user space. Additionally,
kernel subsystems like SMB and NFS can seamlessly operate over the QUIC
protocol after handshake using net/handshake APIs.

Note that In-Kernel QUIC implementation does NOT target Crypto Offload
support for existing Userland QUICs, and Crypto Offload intended for
Userland QUICs can NOT be utilized for Kernel consumers, such as SMB.
Therefore, there is no conflict between In-Kernel QUIC and Crypto
Offload for Userland QUICs.

This implementation offers fundamental support for the following RFCs:

- RFC9000 - QUIC: A UDP-Based Multiplexed and Secure Transport
- RFC9001 - Using TLS to Secure QUIC
- RFC9002 - QUIC Loss Detection and Congestion Control
- RFC9221 - An Unreliable Datagram Extension to QUIC
- RFC9287 - Greasing the QUIC Bit
- RFC9368 - Compatible Version Negotiation for QUIC
- RFC9369 - QUIC Version 2
- Handshake APIs for tlshd Use - SMB/NFS over QUIC

Implementation
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The central idea is to implement QUIC within the kernel, incorporating an
userspace handshake approach.

Only the processing and creation of raw TLS Handshake Messages, facilitated
by a tls library like gnutls, take place in userspace. These messages are
exchanged through sendmsg/recvmsg() mechanisms, with cryptographic details
carried in the control message (cmsg).

The entirety of QUIC protocol, excluding TLS Handshake Messages processing
and creation, resides in the kernel. Instead of utilizing a User Level
Protocol (ULP) layer, it establishes a socket of IPPROTO_QUIC type (similar
to IPPROTO_MPTCP) operating over UDP tunnels.

Kernel consumers can initiate a handshake request from kernel to userspace
via the existing net/handshake netlink. The userspace component, tlshd from
ktls-utils, manages the QUIC handshake request processing.

- Handshake Architecture:

      +------+  +------+
      | APP1 |  | APP2 | ...
      +------+  +------+
      +-------------------------------------------------+
      |                libquic (ktls-utils)             |<--------------+
      |      {quic_handshake_server/client/param()}     |               |
      +-------------------------------------------------+
+---------------------+
        {send/recvmsg()}         {set/getsockopt()}            | tlshd
(ktls-utils)  |
        [CMSG handshake_info]    [SOCKOPT_CRYPTO_SECRET]
+---------------------+
                                 [SOCKOPT_TRANSPORT_PARAM_EXT]
              | ^                            | ^                        | ^
  Userspace   | |                            | |                        | |
  ------------|-|----------------------------|-|------------------------|-|=
--------------
  Kernel      | |                            | |                        | |
              v |                            v |                        v |
      +--------------------------------------------------+
+-------------+
      |  socket (IPPRTOTO_QUIC)  |       protocol        |<----+   |
handshake   |
      +--------------------------------------------------+     |   |
netlink APIs|
      | inqueue | outqueue | cong | path | connection_id |     |
+-------------+
      +--------------------------------------------------+     |      |    =
  |
      |   packet   |   frame   |   crypto   |   pnmap    |     |
+-----+ +-----+
      +--------------------------------------------------+     |   |
  | |     |
      |         input           |       output           |     |---|
SMB | | NFS | ...
      +--------------------------------------------------+     |   |
  | |     |
      |                   UDP tunnels                    |     |
+-----+ +--+--+
      +--------------------------------------------------+     +-----------=
---|

- Post Handshake Architecture:

      +------+  +------+
      | APP1 |  | APP2 | ...
      +------+  +------+
        {send/recvmsg()}         {set/getsockopt()}
        [CMSG stream_info]       [SOCKOPT_KEY_UPDATE]
                                 [SOCKOPT_CONNECTION_MIGRATION]
                                 [SOCKOPT_STREAM_OPEN/RESET/STOP_SENDING]
                                 [...]
              | ^                            | ^
  Userspace   | |                            | |
  ------------|-|----------------------------|-|----------------
  Kernel      | |                            | |
              v |                            v |
      +--------------------------------------------------+
      |  socket (IPPRTOTO_QUIC)  |       protocol        |<----+
{kernel_send/recvmsg()}
      +--------------------------------------------------+     |
{kernel_set/getsockopt()}
      | inqueue | outqueue | cong | path | connection_id |     |
      +--------------------------------------------------+     |
      |   packet   |   frame   |   crypto   |   pnmap    |     |
+-----+ +-----+
      +--------------------------------------------------+     |   |
  | |     |
      |         input           |       output           |     |---|
SMB | | NFS | ...
      +--------------------------------------------------+     |   |
  | |     |
      |                   UDP tunnels                    |     |
+-----+ +--+--+
      +--------------------------------------------------+     +-----------=
---|

Usage
=3D=3D=3D=3D=3D

This implementation supports a mapping of QUIC into sockets APIs. Similar
to TCP and SCTP, a typical Server and Client use the following system call
sequence to communicate:

       Client                    Server
    ------------------------------------------------------------------
    sockfd =3D socket(IPPROTO_QUIC)      listenfd =3D socket(IPPROTO_QUIC)
    bind(sockfd)                       bind(listenfd)
                                       listen(listenfd)
    connect(sockfd)
    quic_client_handshake(sockfd)
                                       sockfd =3D accecpt(listenfd)
                                       quic_server_handshake(sockfd, cert)

    sendmsg(sockfd)                    recvmsg(sockfd)
    close(sockfd)                      close(sockfd)
                                       close(listenfd)

Please note that quic_client_handshake() and quic_server_handshake() functi=
ons
are currently sourced from libquic in the github lxin/quic repository, and =
might
be integrated into ktls-utils in the future. These functions are responsibl=
e for
receiving and processing the raw TLS handshake messages until the completio=
n of
the handshake process.

For utilization by kernel consumers, it is essential to have the tlshd serv=
ice
(from ktls-utils) installed and running in userspace. This service receives
and manages kernel handshake requests for kernel sockets. In kernel, the AP=
Is
closely resemble those used in userspace:

       Client                    Server
    -----------------------------------------------------------------------=
-
    __sock_create(IPPROTO_QUIC, &sock)  __sock_create(IPPROTO_QUIC, &sock)
    kernel_bind(sock)                   kernel_bind(sock)
                                        kernel_listen(sock)
    kernel_connect(sock)
    tls_client_hello_x509(args:{sock})
                                        kernel_accept(sock, &newsock)
                                        tls_server_hello_x509(args:{newsock=
})

    kernel_sendmsg(sock)                kernel_recvmsg(newsock)
    sock_release(sock)                  sock_release(newsock)
                                        sock_release(sock)

Please be aware that tls_client_hello_x509() and tls_server_hello_x509() ar=
e
APIs from net/handshake/. They are employed to dispatch the handshake reque=
st
to the userspace tlshd service and subsequently block until the handshake
process is completed.

For advanced usage,
see man doc: https://github.com/lxin/quic/wiki/man
and examples: https://github.com/lxin/quic/tree/main/tests

The QUIC module is currently labeled as "EXPERIMENTAL".

Xin Long (5):
  net: define IPPROTO_QUIC and SOL_QUIC constants for QUIC protocol
  net: include quic.h in include/uapi/linux for QUIC protocol
  net: implement QUIC protocol code in net/quic directory
  net: integrate QUIC build configuration into Kconfig and Makefile
  Documentation: introduce quic.rst to provide description of QUIC
    protocol

 Documentation/networking/quic.rst |  160 +++
 include/linux/socket.h            |    1 +
 include/uapi/linux/in.h           |    2 +
 include/uapi/linux/quic.h         |  189 +++
 net/Kconfig                       |    1 +
 net/Makefile                      |    1 +
 net/quic/Kconfig                  |   34 +
 net/quic/Makefile                 |   20 +
 net/quic/cong.c                   |  229 ++++
 net/quic/cong.h                   |   84 ++
 net/quic/connection.c             |  172 +++
 net/quic/connection.h             |  117 ++
 net/quic/crypto.c                 |  979 ++++++++++++++++
 net/quic/crypto.h                 |  140 +++
 net/quic/frame.c                  | 1803 ++++++++++++++++++++++++++++
 net/quic/frame.h                  |  162 +++
 net/quic/hashtable.h              |  125 ++
 net/quic/input.c                  |  693 +++++++++++
 net/quic/input.h                  |  169 +++
 net/quic/number.h                 |  174 +++
 net/quic/output.c                 |  638 ++++++++++
 net/quic/output.h                 |  194 +++
 net/quic/packet.c                 | 1179 +++++++++++++++++++
 net/quic/packet.h                 |   99 ++
 net/quic/path.c                   |  434 +++++++
 net/quic/path.h                   |  131 +++
 net/quic/pnmap.c                  |  217 ++++
 net/quic/pnmap.h                  |  134 +++
 net/quic/protocol.c               |  711 +++++++++++
 net/quic/protocol.h               |   56 +
 net/quic/sample_test.c            |  339 ++++++
 net/quic/socket.c                 | 1823 +++++++++++++++++++++++++++++
 net/quic/socket.h                 |  293 +++++
 net/quic/stream.c                 |  248 ++++
 net/quic/stream.h                 |  147 +++
 net/quic/timer.c                  |  241 ++++
 net/quic/timer.h                  |   29 +
 net/quic/unit_test.c              | 1024 ++++++++++++++++
 38 files changed, 13192 insertions(+)
 create mode 100644 Documentation/networking/quic.rst
 create mode 100644 include/uapi/linux/quic.h
 create mode 100644 net/quic/Kconfig
 create mode 100644 net/quic/Makefile
 create mode 100644 net/quic/cong.c
 create mode 100644 net/quic/cong.h
 create mode 100644 net/quic/connection.c
 create mode 100644 net/quic/connection.h
 create mode 100644 net/quic/crypto.c
 create mode 100644 net/quic/crypto.h
 create mode 100644 net/quic/frame.c
 create mode 100644 net/quic/frame.h
 create mode 100644 net/quic/hashtable.h
 create mode 100644 net/quic/input.c
 create mode 100644 net/quic/input.h
 create mode 100644 net/quic/number.h
 create mode 100644 net/quic/output.c
 create mode 100644 net/quic/output.h
 create mode 100644 net/quic/packet.c
 create mode 100644 net/quic/packet.h
 create mode 100644 net/quic/path.c
 create mode 100644 net/quic/path.h
 create mode 100644 net/quic/pnmap.c
 create mode 100644 net/quic/pnmap.h
 create mode 100644 net/quic/protocol.c
 create mode 100644 net/quic/protocol.h
 create mode 100644 net/quic/sample_test.c
 create mode 100644 net/quic/socket.c
 create mode 100644 net/quic/socket.h
 create mode 100644 net/quic/stream.c
 create mode 100644 net/quic/stream.h
 create mode 100644 net/quic/timer.c
 create mode 100644 net/quic/timer.h
 create mode 100644 net/quic/unit_test.c

--
2.43.0



--=20
Thanks,

Steve

