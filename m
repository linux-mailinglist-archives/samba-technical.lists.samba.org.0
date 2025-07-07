Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E04BAAFBE81
	for <lists+samba-technical@lfdr.de>; Tue,  8 Jul 2025 01:09:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=dXVbgNizpNSGYv7kTYaETc4B6Nre0sX1C1bWdly+H14=; b=dpguXZF8PofeiukvMmeoxO3sbx
	BTQLop4ktQF/9J8qtF8cBRhfV1hsAGtqLJmotQJu2fxjannBKK/x+E+eGbqVhN+deJnk1IbCli+VD
	u3kWAkDxgKvvw7avB5FT8I0Sek/YHStnvoU3+cIj6TuPlYmgiZE+sOc0T4mS2D5hdWsmZt4pOEFz/
	/wsWDa8QfywVPl0fGCGCFOCyA6Zdh/zAliu0I/qeIL/BC/obv1CniuEwTEy5Iw6d99YyV9SJAHKDs
	48mCDQVJ5FHz6BNuglcKJEdlqPjafA5DYm2PErUd6bX1Woort6l18uSQ0JEmXLyiE3fgoHH0gLzOn
	6KVRB7cw==;
Received: from ip6-localhost ([::1]:43650 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uYuwm-00AnGn-Qz; Mon, 07 Jul 2025 23:08:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31]:49950) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uYuwh-00AnGg-JX
 for samba-technical@lists.samba.org; Mon, 07 Jul 2025 23:08:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F2FE94462F
 for <samba-technical@lists.samba.org>; Mon,  7 Jul 2025 22:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D49A9C4CEF1
 for <samba-technical@lists.samba.org>; Mon,  7 Jul 2025 22:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751928707;
 bh=U5bTWCbakcVF83IumN8o0uiE9sZYfwr9aPaej40PLh8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=goxPYjmHrGcUh2vOx5LVeCuAmjoaIGvidBzoXhd9dpYJRgBVs8soU2GMcp1QRMCoV
 7thQqPJpAuJUkNi994pwxTPZRpQl0sJzldRzjiIg5JUlL450m8MJVrnj8YmEeE8afB
 KBXgeYSPg/skHA+NMnO+1d+Ut8jsM+lCqWhMD7mS4xer/58Age+Wf0jYkdCjwAYETD
 GxDnIAVIQr2ioMjeNr+GDXBO6FgmOQQHmqxCUIIjHA8Nhb1tlOF+r+yXu4vniupANU
 zAm78pEdAn9+bt897GdSaLW3ImxxYrPeglVrRTHHtxnvR19ehh2/gZVSbAsKljPCvC
 T+DeDTPR3sMfg==
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-ae361e8ec32so750125466b.3
 for <samba-technical@lists.samba.org>; Mon, 07 Jul 2025 15:51:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUbM9lgvYxMSLJcYyha2UWowmIpTd7GTzjp1pRSLwshK2ICNwV73PSGLHO85unQmaKk1klwQ4ZTnqIG7+2Gnk0=@lists.samba.org
X-Gm-Message-State: AOJu0YwDLeH6WGfDD+9XZE6kl+No5iECcUaBk1n1GgXkgQ7bXMG5k3mG
 kioD8d+R/lAizCN5+wqODwXag8jbztlhm7mvrYYBgjy/j8VMxk5JYsqWLpMOlsUWhvzcAZlfGCX
 kNeI5gqa9CmsyhRfuKJV86/70YCo1ctM=
X-Google-Smtp-Source: AGHT+IHwOb1WLnlcpTnYdhBN+BS3RRLvNiM/gLCpSNeRpZSSmPGtDRIEPzEyTexxvVZ80B1xeOKk/z4FbEOuqpTUs1k=
X-Received: by 2002:a17:907:7e88:b0:ada:6adb:cca with SMTP id
 a640c23a62f3a-ae6b0b1f788mr77945866b.6.1751928706460; Mon, 07 Jul 2025
 15:51:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250702071805.2540741-1-metze@samba.org>
 <CAKYAXd_KjT5qd3amwKr3p6v0nC2wURdODqHSyS6AY=KXeaR93w@mail.gmail.com>
 <f5c5155c-e53b-465d-a1e5-659ce513d87b@talpey.com>
In-Reply-To: <f5c5155c-e53b-465d-a1e5-659ce513d87b@talpey.com>
Date: Tue, 8 Jul 2025 07:51:35 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8XnbiqutNfzmbbvGOu9dmn+kAmrHqH3ppCMZ0DuHeo4w@mail.gmail.com>
X-Gm-Features: Ac12FXyVozb40tmTv_-dCqohg-YF6MPPVJQoB9FuHEg-XLMIc3ytGh8NpCDZsZk
Message-ID: <CAKYAXd8XnbiqutNfzmbbvGOu9dmn+kAmrHqH3ppCMZ0DuHeo4w@mail.gmail.com>
Subject: Re: [PATCH] smb: server: make use of rdma_destroy_qp()
To: Tom Talpey <tom@talpey.com>
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
 Hyunchul Lee <hyc.lee@gmail.com>, Stefan Metzmacher <metze@samba.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jul 8, 2025 at 12:03=E2=80=AFAM Tom Talpey <tom@talpey.com> wrote:
>
> Definitely better and safer.
>
> Reviewed-by: Tom Talpey <tom@talpey.com>
Added reviewed-by tag now.
Thanks!
>
> On 7/3/2025 9:06 AM, Namjae Jeon wrote:
> > On Wed, Jul 2, 2025 at 4:18=E2=80=AFPM Stefan Metzmacher <metze@samba.o=
rg> wrote:
> >>
> >> The qp is created by rdma_create_qp() as t->cm_id->qp
> >> and t->qp is just a shortcut.
> >>
> >> rdma_destroy_qp() also calls ib_destroy_qp(cm_id->qp) internally,
> >> but it is protected by a mutex, clears the cm_id and also calls
> >> trace_cm_qp_destroy().
> >>
> >> This should make the tracing more useful as both
> >> rdma_create_qp() and rdma_destroy_qp() are traces and it makes
> >> the code look more sane as functions from the same layer are used
> >> for the specific qp object.
> >>
> >> trace-cmd stream -e rdma_cma:cm_qp_create -e rdma_cma:cm_qp_destroy
> >> shows this now while doing a mount and unmount from a client:
> >>
> >>    <...>-80   [002] 378.514182: cm_qp_create:  cm.id=3D1 src=3D172.31.=
9.167:5445 dst=3D172.31.9.166:37113 tos=3D0 pd.id=3D0 qp_type=3DRC send_wr=
=3D867 recv_wr=3D255 qp_num=3D1 rc=3D0
> >>    <...>-6283 [001] 381.686172: cm_qp_destroy: cm.id=3D1 src=3D172.31.=
9.167:5445 dst=3D172.31.9.166:37113 tos=3D0 qp_num=3D1
> >>
> >> Before we only saw the first line.
> >>
> >> Cc: Namjae Jeon <linkinjeon@kernel.org>
> >> Cc: Steve French <stfrench@microsoft.com>
> >> Cc: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> >> Cc: Hyunchul Lee <hyc.lee@gmail.com>
> >> Cc: Tom Talpey <tom@talpey.com>
> >> Cc: linux-cifs@vger.kernel.org
> >> Fixes: 0626e6641f6b ("cifsd: add server handler for central processing=
 and tranport layers")
> >> Signed-off-by: Stefan Metzmacher <metze@samba.org>
> > Applied it to #ksmbd-for-next-next.
> > Thanks!
> >
>

