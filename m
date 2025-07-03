Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2A5AF7509
	for <lists+samba-technical@lfdr.de>; Thu,  3 Jul 2025 15:07:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=I9qvYNtJGcWBon1rWdz4FMytJziodb0+3w7ups6EUbo=; b=nYsASzHZk6OEFryPOR3EgGcdWr
	ieQYRE6TUpfD7IsOASN3KKIbrJTR4/zcszodzzYYCLuZMTzqWg9sO4qNL8b9IWPyikyWP/XDYSVhT
	wxDLUZQTbn6ZaTpInkAwkvBfWdppoDOwnpY0GppTryc/zEgWUNyMo2ePkwUu7aep3bzg5I6O62Djh
	BmJfuBaocsD6LlGgOtE/epa11aMzO24OmWW6O1PnYwts9gJQsiMQtnKO15rpmq6dAUtPC2i+F6CZ5
	pRv32oskBMDTkXv1JkBDv0rze41BcDZSCwp7CBjtz0q74GSWn9m5XJS1stjsEy9vJmpW8QyXmTplq
	Dsi2Bvhw==;
Received: from ip6-localhost ([::1]:34602 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uXJes-00ATz8-AN; Thu, 03 Jul 2025 13:07:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25]:54594) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uXJea-00ATyi-P0
 for samba-technical@lists.samba.org; Thu, 03 Jul 2025 13:07:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2E1846113B
 for <samba-technical@lists.samba.org>; Thu,  3 Jul 2025 13:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7570C4AF0B
 for <samba-technical@lists.samba.org>; Thu,  3 Jul 2025 13:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751548019;
 bh=Z4w5m5CpgHFF6Tkqd9q7I7U3lx/nZIgUpB3h4mvQxNU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=U2NuhnTDicer7wc5fwHHe2J+HiSWBwmyQ3nw95GM/LmRgIRPCkFq/VwXKH+5jqWZl
 6CveNIsQwUYQztslBy0OAuO3j7UIXA7Y6AsdT6WtkwI+/y9TzO3mfEiY3pyw8dWOGT
 zShu7zm5xg71UnW/t50id4cDqq3hhDTxBO4F80FhLe6DqWn4g4j/Y9rfGPNPOa7v65
 e1Ud9yiwUh7yY5g03lUd41iVlH6Yzx2/SUfFp9Sb2nJuuMIED1HC16o4228MWpKcbL
 VWUtqDhhPNX+vQW+9cNqFgnjLp2fKOmF/tWmH8IQ1FfAYyQEtDDn8hGFB+LGmt2SzM
 ii75oLhniSbAw==
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-6097b404f58so12909217a12.3
 for <samba-technical@lists.samba.org>; Thu, 03 Jul 2025 06:06:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVW19o7f1/CMclc3taeBm1TUbZlTT/LLOhba1x/RNxypivpdjTPRKnYLw09QxRZja5wePKC9dnktZfr14AyXR8=@lists.samba.org
X-Gm-Message-State: AOJu0YxY4FCHXnK3GiS+CAIBGBjMFAmWmTSWTsjj1mMoymQKG2HaJ5ib
 bh5Repl1u3VA4662bn7QkRRGYano+sh9UXu2ZyH8dglFYSm2UiMrEl11VXqtpZwniXxzIZTIvvW
 YPSGcq5885HZAxMpEuVUx5h8evzngGGU=
X-Google-Smtp-Source: AGHT+IE3D9KLkoCi8UAoCLGcElF1OMy8eyJvYPFsLyKB1+RZTcGKRRnlAb+qEZ8UReMSgYiAfduEIoS1QOjdQUZeSCc=
X-Received: by 2002:a05:6402:1e8c:b0:608:64ef:3807 with SMTP id
 4fb4d7f45d1cf-60e6ca8f86bmr3149298a12.0.1751548018392; Thu, 03 Jul 2025
 06:06:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250702071805.2540741-1-metze@samba.org>
In-Reply-To: <20250702071805.2540741-1-metze@samba.org>
Date: Thu, 3 Jul 2025 22:06:45 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_KjT5qd3amwKr3p6v0nC2wURdODqHSyS6AY=KXeaR93w@mail.gmail.com>
X-Gm-Features: Ac12FXyT9zgAz8TIEGHjE4HVyLzYvH2IZvEQO7uDNJ5bIZDJeOmBtbsn2WtIpYc
Message-ID: <CAKYAXd_KjT5qd3amwKr3p6v0nC2wURdODqHSyS6AY=KXeaR93w@mail.gmail.com>
Subject: Re: [PATCH] smb: server: make use of rdma_destroy_qp()
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
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 Hyunchul Lee <hyc.lee@gmail.com>, Tom Talpey <tom@talpey.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jul 2, 2025 at 4:18=E2=80=AFPM Stefan Metzmacher <metze@samba.org> =
wrote:
>
> The qp is created by rdma_create_qp() as t->cm_id->qp
> and t->qp is just a shortcut.
>
> rdma_destroy_qp() also calls ib_destroy_qp(cm_id->qp) internally,
> but it is protected by a mutex, clears the cm_id and also calls
> trace_cm_qp_destroy().
>
> This should make the tracing more useful as both
> rdma_create_qp() and rdma_destroy_qp() are traces and it makes
> the code look more sane as functions from the same layer are used
> for the specific qp object.
>
> trace-cmd stream -e rdma_cma:cm_qp_create -e rdma_cma:cm_qp_destroy
> shows this now while doing a mount and unmount from a client:
>
>   <...>-80   [002] 378.514182: cm_qp_create:  cm.id=3D1 src=3D172.31.9.16=
7:5445 dst=3D172.31.9.166:37113 tos=3D0 pd.id=3D0 qp_type=3DRC send_wr=3D86=
7 recv_wr=3D255 qp_num=3D1 rc=3D0
>   <...>-6283 [001] 381.686172: cm_qp_destroy: cm.id=3D1 src=3D172.31.9.16=
7:5445 dst=3D172.31.9.166:37113 tos=3D0 qp_num=3D1
>
> Before we only saw the first line.
>
> Cc: Namjae Jeon <linkinjeon@kernel.org>
> Cc: Steve French <stfrench@microsoft.com>
> Cc: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> Cc: Hyunchul Lee <hyc.lee@gmail.com>
> Cc: Tom Talpey <tom@talpey.com>
> Cc: linux-cifs@vger.kernel.org
> Fixes: 0626e6641f6b ("cifsd: add server handler for central processing an=
d tranport layers")
> Signed-off-by: Stefan Metzmacher <metze@samba.org>
Applied it to #ksmbd-for-next-next.
Thanks!

