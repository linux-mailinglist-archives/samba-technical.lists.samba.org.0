Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA63AC767D
	for <lists+samba-technical@lfdr.de>; Thu, 29 May 2025 05:34:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=xkfXESif56vvqQqcslrIjI82IZMQiKHq9r0decJLSis=; b=EqfWKp2Px+ck0pQLl5m/zseL9g
	khD3pcgKoHtb6EJ6bhhn/bSGtHPoPQjcrV00Ov0uPbfjpho1lQpQBut1rqLCEvlLEXl3iZqjvOExQ
	45JRj3kWQXCOhVl0GcIBoqA2yY9+Dq8S0uzrpCjoUUg5fwCH6XFNVl77XOWxrgxXbZb9wikmHcsYs
	hBWkpoLg7rYDl+/lh+J26X8xCtXqFz1hcYnkdc7XSZUexvIvhvSzfSPNrszTXCMDVekaU8NTIziQW
	YqDxSiddGDSnlwcOPdMxhJGW46vMAmpgorc06pWDsSH09R5WefhbIplUOdQgNQ6au927XMoDb/SNf
	U/MrWfHw==;
Received: from ip6-localhost ([::1]:57444 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uKU24-004PTU-CY; Thu, 29 May 2025 03:34:16 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:45148) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uKU1z-004PTJ-EW
 for samba-technical@lists.samba.org; Thu, 29 May 2025 03:34:13 +0000
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-32a826ad3e0so4413821fa.2
 for <samba-technical@lists.samba.org>; Wed, 28 May 2025 20:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748489649; x=1749094449; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xkfXESif56vvqQqcslrIjI82IZMQiKHq9r0decJLSis=;
 b=fFYlzf/vV6oJ3h/mknvk+aq+I54uYAJxXRBN01DVUWEUiHqvE/wl1gnUOjk12B/QEK
 Lpud2434UjYFNqCAiJPKccaLfYietIZLWSz4Fa6BAW1jGW1sRf0j2Kh5J2h9VuTQJu/+
 4ioBtxMUDX71L5dyu2ZwrqBH689ooJ/G/8UHXMRa0oYd+wkofTD6/a9MX9+gT7ZJIbzU
 5Q8fO0FgbpGbdgtgZk6eitNazjG3B8R/1sHkwl8PAqBgpXzvDD2l02oiF+dqM2WLi2YK
 o1EZG3yzJejX/IE+OH47tC/VVJSJC8OLFijI78bIEn7n63MkHfp8QJJvTEjvSwcAfw0x
 DNtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748489649; x=1749094449;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xkfXESif56vvqQqcslrIjI82IZMQiKHq9r0decJLSis=;
 b=Zcvipb5HYUopip2/qDHi1v/E0Rbf0EMdcgjEYhD4cPpUO2ZI30dWP9KAShgFGoYwXj
 6sU7avyGL+T2l36R4zVrApIyf3Uvk+ExUPzBxld+e8eWBQBnsNgSc8HKsOVXQ/cpK3Ew
 wCkBxkR2L1g6KH/WrcF5oAkymiUqLcFWHnvYlqLmQE1qdM9ug8efy0M3NhyK3n2rBC2z
 S1bi2EKCkauSaFDKSnZgnobIHsdX7pcexGp/uLDthMAutd0Rd74CCc5/jB8vEQWbXyLd
 TTcyj/5YtlDDL5UZeEGO5TUB6vOwV/6/oc7FZl7WUN73DTblh5+xWg20wgpbDOL0qhvB
 LR4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfog3FZu6EkiH7XUPyuS4bgWJ7uIBTI+exVGyv0Ar5BLfXJ5jPb2pvlU6wxI3WRSOk/ISBkmORdG3h9HR/cDI=@lists.samba.org
X-Gm-Message-State: AOJu0Yy/hfMWtTF95NjEEu+nXTVQjDNZuZ94FP0MIgE+VOiVjxsuUXLy
 Ofp2RA9Mo8gH1cOZZ/3jMSyknAKlT2oG7XGzzsbXndPMnryteW3z08fT7ftLmjZMlr25E1zY7AT
 q5jxZcif2N2UBsrHg1CfSKmOmU3tS5rM=
X-Gm-Gg: ASbGncsftsqtxFFJh9GnxcT2ESNjRm7r71uGpQbys83Gn1+7ClSBtzQL0hY2kGyyARZ
 hxmyPUQ20BPvPbSgVkV72sS+nzHKk5P1z+auNvkBRno9ZNCf+P2QTSYTdIhGbgX2yArzHU+VAp+
 NfD9G8zIo8y40jwQFifFb1moDI4xDCWiTzQ7mZplAxZgcuXySRNKHju1UWMniQDuHO
X-Google-Smtp-Source: AGHT+IH+SWHYnNXb3f5p3Bicnn2gUrbUiW0eJ1b/HX1BoIKPTe4GgK5YkckqLNsitW592BxTGzFf5if5iZgseg7A3/M=
X-Received: by 2002:a2e:a98a:0:b0:30c:50fd:9afe with SMTP id
 38308e7fff4ca-32a79aa8d49mr15748641fa.9.1748489648913; Wed, 28 May 2025
 20:34:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1748446473.git.metze@samba.org>
In-Reply-To: <cover.1748446473.git.metze@samba.org>
Date: Wed, 28 May 2025 22:33:56 -0500
X-Gm-Features: AX0GCFuKQP-6XOoz-IabLf2aZDvsYk6ZUPTtm1sbwxMjioVbUKU6GJr-JcQaDUw
Message-ID: <CAH2r5muwNi1Negnt=wmRYkHZxAHDzP_Wxxhbjj6_T-P3ZTjciw@mail.gmail.com>
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

So far not seeing any issues testing (non-smbdirect tests) with this
patch series, but would love feedback on any smbdirect testing with
the series

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

