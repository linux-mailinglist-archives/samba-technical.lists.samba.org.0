Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E18EDAC93F2
	for <lists+samba-technical@lfdr.de>; Fri, 30 May 2025 18:52:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=aD91Az4ovD/Hq9SUuO38K5KgatmnklatOhykQqdmrQI=; b=UrBTF+uqHDupqIeN3DRZ1tjC1B
	GfqxiNQdOtG4Xs2yVi23uXNzoDb9a+D7gjmuwp84NCqwZYyZKNSYD+lHmJFWLO8FhjSLe+LWdFeHk
	CJPNiQWluZt/PJUog0E3TefTHrPZngp/ly7NtPEVjI3sdKFizaiIeEApCNTknwcqHFQbC0closzBM
	39mx0LOMSpbbGOjGfM/DVB3AJQqD1SZfK5JdBAjm4Gf7tebIJ8pyElDEuORR9GD8GlOdVD2UZLtMs
	+Wuf4UWghiVZDe/2r/CzSfJ6nMRL0RWNgQy4PIl2JeqfOWnc9gSaWicZS8wMx/gjEP4zyXylWolSf
	Ozo970NQ==;
Received: from ip6-localhost ([::1]:58306 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uL2xK-004U1w-5B; Fri, 30 May 2025 16:51:42 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:55670) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uL2xF-004U1p-Kc
 for samba-technical@lists.samba.org; Fri, 30 May 2025 16:51:40 +0000
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-30db1bd3bddso20602041fa.3
 for <samba-technical@lists.samba.org>; Fri, 30 May 2025 09:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748623896; x=1749228696; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aD91Az4ovD/Hq9SUuO38K5KgatmnklatOhykQqdmrQI=;
 b=VgYbd1cuyGLAZqE7dyexg99g+wN/CpX5WPyRq3KSg4AmdC7f+arpGlM4kqCAwY5oJQ
 jGPhZ92Rp7/IudGdMfrwL/pjPl7w0162X3HGrONeMaAbhEojDv4JDVGKW3vkFMYuUB/z
 JNLPrDjnX2TIqeVFtAt7nkwSYkC/jeeznB/CWbb2YWH0G7dW5UItpPQ267M/JXfktmx2
 sV/t4ZsrGJmwV81KB6zaO1RGBv8/nQm2tqOX9Rqg6Vb1AImaPcX8XnyIcKvVhp71kh7B
 9VQKwCfypF6UPGUmDQDTaxrcHq6a1vznFnSMvi4aSt6uCPxQE7Sew4sx10szcmyB6lbS
 iAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748623896; x=1749228696;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aD91Az4ovD/Hq9SUuO38K5KgatmnklatOhykQqdmrQI=;
 b=j3Ym89ADN6q2l+WO9FQ6iois06zd0bW2LnMr2Ack+z7Ue4F5MQpStQUe7AguEDJeat
 F8DXFMA3CGbiVBwiufDSM83F6okn3Tx/J2/lkEaXutPj0nGZzuGIxbveRBKxK+sGN5RU
 7iFqtr9In1Duho2tChVl2cnKny05v5aovXIOTdsLBss6i+5snCZK6FK3ztIJ1YlvgTQR
 NcW3KJwPgUbDYzc5DQDMsfrrBqMwzLpRik7UouGezJnhOLbFp5RtBp7u8EUlX73SFL8A
 ktNritkOVCQWa4gk1CMpZwOL+cKJB/alK7U/rpjGj/CNAbD4eGFBIqhe1jHcDK7ZX1Cy
 Nwxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5Ev4yEawYEPauPnIWd03P0IrfgRFS6yBB0C9KEEd/PRwLuDCq80q5HmogqOLrCsotVqmauTFXWISoXxAH1XI=@lists.samba.org
X-Gm-Message-State: AOJu0YwfTYlluLMWlw3syTOevzAd4BCvQYMG3+ECcwMA8ghd+/nhehW2
 Fhzp0z5w1OT4i8bett9EZ9GKoTXq/JSGX0mkHJCaeUVQ0VhJp7xxp5zsscsOEvGw35i5cK88WEC
 1vvqeH7ffSinyBDC2/hyCDdQG55PUVgI=
X-Gm-Gg: ASbGncsSc7N3UF+aFdKGF7y2lLnpKj6ngRTljLwaDyzaMd5de4vZMAnEgqT5s5TFzYb
 RxT79fnl3nX8MBT+G2lS6dJWCD3ToQYrpbD4nJ31AH0gDHg9/5yjiVleUNfSnAHDbfKOX97+QSm
 OZ7UFbRyYu8iIHfn1pmAPy76YjRr+9ZBBJHvg78wcO4Bo5yRyQ9vukpbqZxeVlZddgvQE=
X-Google-Smtp-Source: AGHT+IEmGp/73upRLBSPJDdH4fvclKv0UFFY2j1RZTdBMU5LzO1n2h8rQSJ3Ktq3gSJS2RlsSFPwPd24obrFzNUakL4=
X-Received: by 2002:a05:651c:30c6:b0:32a:8101:bc00 with SMTP id
 38308e7fff4ca-32a906cb2f0mr10530601fa.9.1748623895744; Fri, 30 May 2025
 09:51:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1748446473.git.metze@samba.org>
In-Reply-To: <cover.1748446473.git.metze@samba.org>
Date: Fri, 30 May 2025 11:51:23 -0500
X-Gm-Features: AX0GCFuub8-4Mm3_qDqd0azzM6HNDxaHfzR_MpygQ8Slq4FTtDpKPe2RmsVjCP8
Message-ID: <CAH2r5msi+4kUx37dkCCdz=YD8bGK64cTZqAujuh3nJh1+gj62A@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] smb:common: introduce and use common smbdirect
 headers/structures (step1)
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
Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, Hyunchul Lee <hyc.lee@gmail.com>,
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I have temporarily removed that patches which touch the server, ie
updated for-next with only the client and common patches, pending
answer to one of Namjae's questions about the ksmbd changes.

4e89b3b35e98 (HEAD -> for-next, origin/for-next) smb: client: make use
of common smbdirect_socket_parameters
34399d47fa28 smb: smbdirect: introduce smbdirect_socket_parameters
39bfc4a85f60 smb: client: make use of common smbdirect_socket
8ed057da2a21 smb: smbdirect: add smbdirect_socket.h
3173f315fa92 smb: client: make use of common smbdirect.h
c54ba448cb35 smb: smbdirect: add smbdirect.h with public structures
2119e7ed45d1 smb: client: make use of common smbdirect_pdu.h
0aad6cf27293 smb: smbdirect: add smbdirect_pdu.h with protocol definitions
bc01b00a6ca2 smb: client: use ParentLeaseKey in cifs_do_create
0e441841edfa smb: client: use ParentLeaseKey in open_cached_dir
5015217979ad smb: client: add ParentLeaseKey support
55423e9c534d smb: client: Remove an unused function and variable
0ff41df1cb26 (tag: v6.15) Linux 6.15

On Wed, May 28, 2025 at 11:01=E2=80=AFAM Stefan Metzmacher <metze@samba.org=
> wrote:
>
> Hi,
>
> in preparation of a having a common smb_direct layer I started
> to move things into common header files and added the first
> step in using shared structues like struct smbdirect_socket.
>
> Currently only simple things are shared and there is no
> intended behaviour change (even if I found some things
> I'd like to change, but I'll defer them in order to
> make the review easier).
>
> I'll work on this the next few months in order to
> unify the in kernel client and server layers
> and expose the result to userspace too.
> So that Samba can also use it.
>
> v2:
>   - change smb_direct into smbdirect
>   - make usage of header files just as needed
>   - also introduce struct smbdirect_socket[_parameters]
>     as shared structures
>
> Stefan Metzmacher (12):
>   smb: smbdirect: add smbdirect_pdu.h with protocol definitions
>   smb: client: make use of common smbdirect_pdu.h
>   smb: server: make use of common smbdirect_pdu.h
>   smb: smbdirect: add smbdirect.h with public structures
>   smb: client: make use of common smbdirect.h
>   smb: server: make use of common smbdirect.h
>   smb: smbdirect: add smbdirect_socket.h
>   smb: client: make use of common smbdirect_socket
>   smb: server: make use of common smbdirect_socket
>   smb: smbdirect: introduce smbdirect_socket_parameters
>   smb: client: make use of common smbdirect_socket_parameters
>   smb: server: make use of common smbdirect_socket_parameters
>
>  fs/smb/client/cifs_debug.c                 |  23 +-
>  fs/smb/client/smb2ops.c                    |  14 +-
>  fs/smb/client/smb2pdu.c                    |  17 +-
>  fs/smb/client/smbdirect.c                  | 389 +++++++++++----------
>  fs/smb/client/smbdirect.h                  |  71 +---
>  fs/smb/common/smbdirect/smbdirect.h        |  37 ++
>  fs/smb/common/smbdirect/smbdirect_pdu.h    |  55 +++
>  fs/smb/common/smbdirect/smbdirect_socket.h |  43 +++
>  fs/smb/server/connection.c                 |   4 +-
>  fs/smb/server/connection.h                 |  10 +-
>  fs/smb/server/smb2pdu.c                    |  11 +-
>  fs/smb/server/smb2pdu.h                    |   6 -
>  fs/smb/server/transport_rdma.c             | 385 +++++++++++---------
>  fs/smb/server/transport_rdma.h             |  41 ---
>  14 files changed, 613 insertions(+), 493 deletions(-)
>  create mode 100644 fs/smb/common/smbdirect/smbdirect.h
>  create mode 100644 fs/smb/common/smbdirect/smbdirect_pdu.h
>  create mode 100644 fs/smb/common/smbdirect/smbdirect_socket.h
>
> --
> 2.34.1
>


--=20
Thanks,

Steve

