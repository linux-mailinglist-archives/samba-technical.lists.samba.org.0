Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 809A8B8785A
	for <lists+samba-technical@lfdr.de>; Fri, 19 Sep 2025 02:42:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=b3Koa84Sqg7Vzrvj1FW0/AYhqspEsBMTPOZnuTagtQw=; b=wi6BoFwgsaeVfjUKYKpi9Skulq
	VT0x84QcT/ou99TcBCioOUluGvA0FBnLnGXiGTrMH/6DcGiwhb8oL/fZOmuY44iWv0RJQZUiK2Q/Z
	pGTJoEhXdYSTx2gqZJErdPm7L2xGGCt+/aYk2tkc7/aWt31p9S/Aeo1MG+EACM47W+T0veJbDTiNT
	euiwBmVShuZMa03AtSeTtB5jU7pSyIdYpSxs3mBJGZecG62OFvozoo21+zW+llV7OFOZxv/bQ6qws
	Hd4O5E7fpE77ezo0PcmporidI4mEbzmygB+fcQby3TtdR/dmu2SainX5C8iVUlQdud1jZvvFAB6VB
	qqib+xSA==;
Received: from ip6-localhost ([::1]:54308 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uzPCR-004FIL-3c; Fri, 19 Sep 2025 00:42:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25]:41904) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uzPCM-004FID-Gf
 for samba-technical@lists.samba.org; Fri, 19 Sep 2025 00:42:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0C3B060220
 for <samba-technical@lists.samba.org>; Fri, 19 Sep 2025 00:41:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EE75C4AF0B
 for <samba-technical@lists.samba.org>; Fri, 19 Sep 2025 00:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758242509;
 bh=b3Koa84Sqg7Vzrvj1FW0/AYhqspEsBMTPOZnuTagtQw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WDR3x2QaaLzcSAYGLXd4vzPFmM3M9+2dfJ6fubtD5PQMrOnVM0MIqorcJ+9fpvaJ8
 hgZMbIxGf48l9eJAWwmJiAIb0xGclBg6Bj8qf+AJuUk0FPHoQArieey/vBrdhVwvgD
 iSgylbRIIFj1vaH4KtSvTmpv02MqfEztbZgi6C/QvyQimSCMe6UBrSi966IPDMs8Ke
 kvslH4DKk17PQ3OgnorzY8g/brKboWP2fLUciDU8ACp+c+zqoQKo1olmHmcKtvopf+
 ZDlG/1l079ru9DZ5AXNl/y4EramCVbb/q/FzSnkgftIn1Sx8uxGDuAuqEapesLCjcl
 naOrBP7MV0Prg==
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-62fc14af3fbso574013a12.3
 for <samba-technical@lists.samba.org>; Thu, 18 Sep 2025 17:41:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUhf0kQ98Wv6AG7+lwV44tQvynClI7rw75omkH+Z11pvx4UitvpIpBeE7PLKruvOSL7RU5KESIWfVpy75uGEOg=@lists.samba.org
X-Gm-Message-State: AOJu0YwsnD+nvuWw+3UGxMZ9GoIK8zytH64mF+K/AkBjWbpKkhtNuwAf
 aDK6afbl7l9FW4ywaujUWvTG6A1nbNqATUMslZH4DG1ZfTYdGp5g8tW2VWuhB/TtG9xIridWhO9
 K6Skm2ujSdzM8380vjD/ZCtBAF3ldvsg=
X-Google-Smtp-Source: AGHT+IGB6E2+3TfBy5R8J+GmoRVyU8wDVB8w+Gi0nRE0tAVlr/D6tOnqwSS+SWOtopx1szu2rQXgqwVPPQm2oVE3Q9w=
X-Received: by 2002:a05:6402:21da:b0:628:410f:4978 with SMTP id
 4fb4d7f45d1cf-62fc0ace301mr966836a12.31.1758242508181; Thu, 18 Sep 2025
 17:41:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250918152644.1245030-1-metze@samba.org>
In-Reply-To: <20250918152644.1245030-1-metze@samba.org>
Date: Fri, 19 Sep 2025 09:41:36 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8wojz_==YTumm=yS9=QsS2fBAifhv17LcXLyRuaE-bKQ@mail.gmail.com>
X-Gm-Features: AS18NWAv2YtXjDqYYnVSMZiCpl-KzafCkajoYmeeMLGMDr6ywius2NcmlteAs0E
Message-ID: <CAKYAXd8wojz_==YTumm=yS9=QsS2fBAifhv17LcXLyRuaE-bKQ@mail.gmail.com>
Subject: Re: [PATCH v3] smb: server: fix IRD/ORD negotiation with the client
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
Cc: linux-cifs@vger.kernel.org, linux-rdma@vger.kernel.org,
 samba-technical@lists.samba.org, Tom Talpey <tom@talpey.com>,
 Steve French <smfrench@gmail.com>, Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Sep 19, 2025 at 12:27=E2=80=AFAM Stefan Metzmacher <metze@samba.org=
> wrote:
>
> Already do real negotiation in smb_direct_handle_connect_request()
> where we see the requested initiator_depth and responder_resources
> from the client.
>
> We should should detect legacy iwarp clients using MPA v1
> with the custom IRD/ORD negotiation.
>
> We need to send the custom IRD/ORD in big endian,
> but we need to try to let clients with broken requests
> using little endian (older cifs.ko) to work.
>
> Note the reason why this uses u8 for
> initiator_depth and responder_resources is
> that the rdma layer also uses it.
>
> Cc: Namjae Jeon <linkinjeon@kernel.org>
> Cc: Steve French <smfrench@gmail.com>
> Cc: Tom Talpey <tom@talpey.com>
> Cc: linux-cifs@vger.kernel.org
> Cc: samba-technical@lists.samba.org
> Cc: linux-rdma@vger.kernel.org
> Fixes: 0626e6641f6b ("cifsd: add server handler for central processing an=
d tranport layers")
> Signed-off-by: Stefan Metzmacher <metze@samba.org>
> Signed-off-by: Steve French <stfrench@microsoft.com>
Applied it to #ksmbd-for-next-next.
Thanks!

