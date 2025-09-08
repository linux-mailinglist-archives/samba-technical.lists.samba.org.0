Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C0446B49D9A
	for <lists+samba-technical@lfdr.de>; Tue,  9 Sep 2025 01:50:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=mTHhFjwx67T5cZggeXioncQ5Z5pNfVAaSNJfNKn+EjU=; b=03ItTAXxeAgwux9+yw9A/5M9jj
	WdDcKma1b4caLPtTwxy41pCHOohPkRLr4RzMhkly4GqE59htk2DyQu+foQ6yGF+dP0MIq1SLO1gm9
	qNTA8IMoIuU7S8OXEAN4BbCaSj9YYY4yjWBN4KOcFPS7KWXkULT9Sp6tOhOT192Be9bwi0GXtGJSY
	uFM4TQYUrGuLRilwgPMbG8syUrcJmZtwRlCrE0O9U/Whf9EXOxxoxbGwxL4d2u8eybTkg5uTnjcew
	WHxninVjY56hXYiUiZhA7XEwgiFTPhVd2cnOZV+RE1MYV4mXKSeAvjD/QEROX4UvH4dK7KqiCOD7q
	Aq1IA4OA==;
Received: from ip6-localhost ([::1]:34716 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uvlcd-003L1Q-8m; Mon, 08 Sep 2025 23:50:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25]:51676) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uvlcY-003L1G-ML
 for samba-technical@lists.samba.org; Mon, 08 Sep 2025 23:50:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 052DB60140
 for <samba-technical@lists.samba.org>; Mon,  8 Sep 2025 23:49:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2EA7C4CEF9
 for <samba-technical@lists.samba.org>; Mon,  8 Sep 2025 23:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757375397;
 bh=mTHhFjwx67T5cZggeXioncQ5Z5pNfVAaSNJfNKn+EjU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rNEDlFNZq+oSe7d12DDTIKSlFCntaekoWN/DoCna8Taumeuz17fSiJV/fJwAmVyaU
 1hNmeg4vGpmpZzbX3c4MPNgIIGgVrE/UUmTC5ej/OLQhfgp/RSGkjP/hex/YSQaID/
 lUjMOe8/ESIpCDqI2Gmc1bJF8AAlpEsnPRCW08ZhsoYh2If1Zn7BXC5UzIWe7ZNYGF
 WHOz3gRO5n+LYwp0w0TzviZwv4QggbXY6hg2IUyx6llKmiHFVygKhJCHk7E/QUwF7t
 h0lakoeQn+K8EDRLeIu8xm1CfgCQPWbIEc94Ney1e8+Ewj4Dv3mJjwTc9FOf8XXjfv
 JTeexEcitCcWQ==
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-62733e779bbso1757594a12.1
 for <samba-technical@lists.samba.org>; Mon, 08 Sep 2025 16:49:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUtCWI6g3Pi2RLN0+C4j+331MvgHEgkhFyvHQgPqScoG+ge9gHv2qeEvWqOqKUuFtfWbuUKU6rAVRV3ZrUbq3I=@lists.samba.org
X-Gm-Message-State: AOJu0Yxq8MTkhhAdMNDQi+rVmqAiGzVoPnSvDcQg7lH2kOH87RYCzInU
 rnejsy6oyif0T6+4EQCdR/o7sZnosncLUiR+PoHXTjY6KPAU7Qmu08nubPH7GQaHxRBqqjYfhQ2
 qWAr44wiVNb3/mlIoMWPOwaCf63oX/KY=
X-Google-Smtp-Source: AGHT+IF0vDLrKfIOYBdnMhc8vs1WK7t5IsPpYoj/HNM9PMAcfcDeg36yoUW0Kj8rAa9gNHHKNw5jkqfheCoV/5taOgw=
X-Received: by 2002:a05:6402:274d:b0:62b:4e83:e13 with SMTP id
 4fb4d7f45d1cf-62b4e925357mr2284585a12.26.1757375396258; Mon, 08 Sep 2025
 16:49:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250904181059.1594876-1-metze@samba.org>
In-Reply-To: <20250904181059.1594876-1-metze@samba.org>
Date: Tue, 9 Sep 2025 08:49:44 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-pm1zbf7cHiC5Z9EsDYpYYpP7XdPLwcrMEC=rmDHm90A@mail.gmail.com>
X-Gm-Features: AS18NWDWnPRi4SnE4bDJZ0suDXPkVol1xCIuN9zUkmkpwdDsqv80qp9Zu6zklMg
Message-ID: <CAKYAXd-pm1zbf7cHiC5Z9EsDYpYYpP7XdPLwcrMEC=rmDHm90A@mail.gmail.com>
Subject: Re: [PATCH] smb: server: let smb_direct_writev() respect
 SMB_DIRECT_MAX_SEND_SGES
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
 samba-technical@lists.samba.org, Hyunchul Lee <hyc.lee@gmail.com>,
 Tom Talpey <tom@talpey.com>, Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Sep 5, 2025 at 3:11=E2=80=AFAM Stefan Metzmacher <metze@samba.org> =
wrote:
>
> We should not use more sges for ib_post_send() than we told the rdma
> device in rdma_create_qp()!
>
> Otherwise ib_post_send() will return -EINVAL, so we disconnect the
> connection. Or with the current siw.ko we'll get 0 from ib_post_send(),
> but will never ever get a completion for the request. I've already sent a
> fix for siw.ko...
>
> So we need to make sure smb_direct_writev() limits the number of vectors
> we pass to individual smb_direct_post_send_data() calls, so that we
> don't go over the queue pair limits.
>
> Commit 621433b7e25d ("ksmbd: smbd: relax the count of sges required")
> was very strange and I guess only needed because
> SMB_DIRECT_MAX_SEND_SGES was 8 at that time. It basically removed the
> check that the rdma device is able to handle the number of sges we try
> to use.
>
> While the real problem was added by commit ddbdc861e37c ("ksmbd: smbd:
> introduce read/write credits for RDMA read/write") as it used the
> minumun of device->attrs.max_send_sge and device->attrs.max_sge_rd, with
> the problem that device->attrs.max_sge_rd is always 1 for iWarp. And
> that limitation should only apply to RDMA Read operations. For now we
> keep that limitation for RDMA Write operations too, fixing that is a
> task for another day as it's not really required a bug fix.
>
> Commit 2b4eeeaa9061 ("ksmbd: decrease the number of SMB3 smbdirect
> server SGEs") lowered SMB_DIRECT_MAX_SEND_SGES to 6, which is also used
> by our client code. And that client code enforces
> device->attrs.max_send_sge >=3D 6 since commit d2e81f92e5b7 ("Decrease th=
e
> number of SMB3 smbdirect client SGEs") and (briefly looking) only the
> i40w driver provides only 3, see I40IW_MAX_WQ_FRAGMENT_COUNT. But
> currently we'd require 4 anyway, so that would not work anyway, but now
> it fails early.
>
> Cc: Namjae Jeon <linkinjeon@kernel.org>
> Cc: Steve French <smfrench@gmail.com>
> Cc: Tom Talpey <tom@talpey.com>
> Cc: Hyunchul Lee <hyc.lee@gmail.com>
> Cc: linux-cifs@vger.kernel.org
> Cc: samba-technical@lists.samba.org
> Cc: linux-rdma@vger.kernel.org
> Fixes: 0626e6641f6b ("cifsd: add server handler for central processing an=
d tranport layers")
> Fixes: ddbdc861e37c ("ksmbd: smbd: introduce read/write credits for RDMA =
read/write")
> Fixes: 621433b7e25d ("ksmbd: smbd: relax the count of sges required")
> Fixes: 2b4eeeaa9061 ("ksmbd: decrease the number of SMB3 smbdirect server=
 SGEs")
> Signed-off-by: Stefan Metzmacher <metze@samba.org>
Applied it to #ksmbd-for-next-next.
Thanks!

