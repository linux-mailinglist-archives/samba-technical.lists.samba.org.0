Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F25C4CA27BE
	for <lists+samba-technical@lfdr.de>; Thu, 04 Dec 2025 07:15:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=2iJ9aAEUqPfyb9xNgOSo2GwKBxBeJAG7JTACF98eF0w=; b=XBAy6JtXKXPeJ02HSZz8nS0PvO
	PPYJDpIPoqPBbBtTWY8lg2yMz40LarqO1s5BCF33bzdhN8pt8J5Py9ejxZSdFWlt3HEFwcgIjBn3j
	ryrsxa0FyogB9rJFsgm7v2/PDE3aXSoOQYdtyIbbbxOWl6JuQapghpbk9A3018Yv0qG52W+XDGPb6
	ozz9/6xSRgH/P+HZ4DdPTXmQB+ckifZW0s8ktrXHWhHU80LQBWNFgZXlUnF9vB/BKWuh86VlAKttI
	hAMpzAHooL9FEV41eETLDGZIsY/LOHr3D6pBu4ds7K6NxClK9eJIovE8ZI1a0ho1J/Fdg6HQwovJZ
	dPCD7NDw==;
Received: from ip6-localhost ([::1]:46324 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vR2cf-00Fg1N-Pe; Thu, 04 Dec 2025 06:15:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31]:50138) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vR2cZ-00Fg1F-3c
 for samba-technical@lists.samba.org; Thu, 04 Dec 2025 06:15:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2DB5D44371
 for <samba-technical@lists.samba.org>; Thu,  4 Dec 2025 06:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DF98C116B1
 for <samba-technical@lists.samba.org>; Thu,  4 Dec 2025 06:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764828914;
 bh=2iJ9aAEUqPfyb9xNgOSo2GwKBxBeJAG7JTACF98eF0w=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fL04aeQT9WGOHnljjdn0PEeeH6msSeG80wKJdWRXR1UE4EaJJWxebqTa356+w5mRt
 1jYID9ITGxcCuh/OEuCQ3Uc50GSYhRBUjn+P4tborgxI0+vGB51PlJcwfhSgyF6s50
 wd1omWjtUk9rwGw7FjqWRSO/hFLSUTf9YNZe36mE9LYrITsDTVzvuNi/4GwDrqJ90g
 83j+pqG3tXuvHoSFsX4UOPVWc5esenB5XgY8RNrr4l6wADpECXHu4PJZNSWfWiJrws
 CY3n7k1FHAuUCr512zA+WVqER8xJK8ktkmsJtg8yirCgqFQdbhwKfsaDBSpu2HylK0
 wf1EfMHavmJ/A==
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-64180bd67b7so694637a12.0
 for <samba-technical@lists.samba.org>; Wed, 03 Dec 2025 22:15:13 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVWWhgklU/EpvjyfrsWL/Td11GPQWsiWZwdiH8J7oN9xyT4DkB/D5KbrLuvwMehKHLiywMPyUPot3vpayU2EOw=@lists.samba.org
X-Gm-Message-State: AOJu0Yzc4IcfITIGnH7UJEUD9S6h4gU9K6Nz5xs0w4NXZgDcrmSxvr7u
 HrGBprwE1yjnlA+kvvk0FPK91Njpi1SYDWCwcyFOmIBDLGONm3+GgXIC882cZEpGbWjrznLVRDb
 V1O/sBFrHqBftvpEPWLABIiczVqEEjJE=
X-Google-Smtp-Source: AGHT+IFxtDGpV6cSoBjid7NXl2nNNlvUO22CPgShgaWv2gAPA+BSMjTzEAceAhHyjGEcY2KykD0gNZz0BELIzyBWCSE=
X-Received: by 2002:a05:6402:51c8:b0:640:b06f:87c5 with SMTP id
 4fb4d7f45d1cf-6479c3ed957mr4197603a12.1.1764828912627; Wed, 03 Dec 2025
 22:15:12 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764709225.git.metze@samba.org>
In-Reply-To: <cover.1764709225.git.metze@samba.org>
Date: Thu, 4 Dec 2025 15:15:00 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8Bj0u+eSXBi1Y1GDZyXC_umupM7BK_i++61YtoGtkuAA@mail.gmail.com>
X-Gm-Features: AWmQ_bm0HucYiko1C4C4j8Wn5MpQTju3luFj6zaAqhwTiWK2Ni49drh40mPUyYs
Message-ID: <CAKYAXd8Bj0u+eSXBi1Y1GDZyXC_umupM7BK_i++61YtoGtkuAA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] smb:smbdirect/server: introduce
 smb_direct_negotiate_recv_work
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

On Wed, Dec 3, 2025 at 6:15=E2=80=AFAM Stefan Metzmacher <metze@samba.org> =
wrote:
>
> Hi,
>
> here's a patchset that implements a better solution
> to the problem that the initial recv completion might
> arrive before the RDMA_CM_EVENT_ESTABLISHED event.
>
> The last patch is not intended to be applied, but
> it helps to see the event flow it generated,
> see the commit message.
>
> This is based on the 4 smbirect patches within
> v6.19-rc-smb-fixes:
>
> dc10cf1368af8cb816dcaa2502ba7d44fff20612
> smb: client: relax WARN_ON_ONCE(SMBDIRECT_SOCKET_*) checks in recv_done()=
 and smbd_conn_upcall()
> 425c32750b48956a6e156b6a4609d281ee471359
> smb: server: relax WARN_ON_ONCE(SMBDIRECT_SOCKET_*) checks in recv_done()=
 and smb_direct_cm_handler()
> 1adb2dab9727c5beaaf253f67bf4fc2c54ae70e7
> smb: smbdirect: introduce SMBDIRECT_CHECK_STATUS_{WARN,DISCONNECT}()
> 1f3fd108c5c5a9885c6c276a2489c49b60a6b90d
> smb: smbdirect: introduce SMBDIRECT_DEBUG_ERR_PTR() helper
>
> I've tested them on top of v6.18 (without the other patches
> in v6.19-rc-smb-fixes).
>
> Sadly there are still problems with Mellanox setups
> as well as irdma (in iwarp mode). I'm trying to
> prepare patches to debug this next.
I have tested with Mellanox NICs.
Acked-by: Namjae Jeon <linkinjeon@kernel.org>
Thanks!

