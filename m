Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7911DC2C161
	for <lists+samba-technical@lfdr.de>; Mon, 03 Nov 2025 14:30:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=a21JbFZrSRmyl+TIWUp5y75+miyXDqyFyLKW07xgMRE=; b=PlgmFPgeG2XTYGzxUPAtnfaROG
	u0xhw3Iwd/YkOMfZK/ExmbbXz+HDQmL4OykZkQCxyOteA6GwHbFsGRdF0ULmjXauigl6VRMb/PUn6
	wrOHDmmrCsxR8JmUWoibwp5bGQ4sIFJ3z+8N7ginuGv1wvtCtsu/EHeJpDXQjy46ChLpbZh1bAUww
	PGvDKbZhzZ4wAd0PUBbHX4WDhTi/Voocnh3lBlTvKS17o9oXwQYPDbyAQRNOnVO5YZKnmfOuCZlEl
	bFHGYCcAfJS4B6xyXZ+AelQ2zyAr6iaMfvT77S/QVOMk6F4Id3TpIyDdG3hfJA9rRnMtdTG9bW8Nt
	/B26h2uQ==;
Received: from ip6-localhost ([::1]:50178 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vFudC-00BLo8-7L; Mon, 03 Nov 2025 13:29:58 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:44543) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vFud7-00BLo1-Hy
 for samba-technical@lists.samba.org; Mon, 03 Nov 2025 13:29:55 +0000
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-64091c2e520so3302139a12.1
 for <samba-technical@lists.samba.org>; Mon, 03 Nov 2025 05:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762176593; x=1762781393; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a21JbFZrSRmyl+TIWUp5y75+miyXDqyFyLKW07xgMRE=;
 b=leAWB40Mmo04x75tSH29hHJHqdyjarsfExLNWnJ54Mv3UJSSgnq1IR8FYN7KyuB/Od
 cROzJJEgyps/L/W4otgZPjAzP/sHSkWsqSrRExkzbCJ2FRvrr7euZCcl8DZblS03qUrv
 49OeFR40de7F6d+KZ2nE0r3RIHzPuutSdwZK5965rDJqFpkZrTvYx3eqYtkj3l1NmpGl
 Jd/tXZqfU1Jw3kjuPjYGyOWs7PqxG0npWomenP1yPwg0Ou2K7npI0WQ5MwFoC/iBGut1
 ybf1Rv9wWe9wgb0kHCpI5Uh5pATQkTFWZE0a8Rzk+89E9noGJm+e1/45d3IU0soJ9VKe
 2zRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762176593; x=1762781393;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a21JbFZrSRmyl+TIWUp5y75+miyXDqyFyLKW07xgMRE=;
 b=XcLMDv2FigtG6+2JKTJ68VbmjxW/RXDc9DpUyj8gyiHs5Cse+Ev3D8TNHrtgLsPHWT
 SU8vBkgn5UByNIb8lF94TI7oFH3oReGgYzOJ0frTvvRIm7ar0vM69Uf6luxxJUOhbMaj
 Z1rva1CO/05a6IiVhuQcP9OguoHgX0KnsrAWJe2Cj1w2P1Fr30HJlpiPc/5IxVORYBtC
 WtleoM+3z232qlWZnpmi08WZ5rdweT5nikqVOnNWg17EVeKyFTBoYkFYK6dR4j+foqR2
 Hqqf2XQJc1HlipG3el0pd9XkgRrUbqxVkjlKw0Yb1wGXub9IP6mf9KGXEJSo96UtIDAt
 pbTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZhuAVDHIDGHHwDJN+rH3qTyttolFZardXEv410roVnBkrbTkIXMhIHfmIZa96IzrGMyvVgs/Lijt4Q1j9NGg=@lists.samba.org
X-Gm-Message-State: AOJu0YySzpL310+HiAxrWzNgUroGvmt78mJ+U+EDEscX5VOnp/j7p8JC
 7Tkr0mjd56l7Cysi+1Uz+zJS+rn5ezwB5Xxj62AbmrtRKVHBpjOldzeLtFlT/TOB3BAaMvKCfS0
 PpCpVmyQlb0gR7E8jZv5+t7u4C6xmzmg=
X-Gm-Gg: ASbGncsDTfgt0eeMmcDIWvY/b0qxQuCxy7Ba7EGnD5n599JK3Iom28B49l4/fUN45/G
 z1fpe3drfIfQooSbWgMYeT1xf0J9XtxR6Kxpjk39oFALk6+oV4Axwolhi1eT5M/a2G6V91qlPMO
 hTh108KNBQTw/Ldh2AsO6iftpaaq9+MOQRfQ/56qclbkarhvlA9YFp97vkpVOe/AZNEiQF48PNI
 4oRz3F9x+26jYteYZOoXr/g2gnWzKbEmZL2f3iFbfp+bWjpHNtpQdX3gwSMwrqOZXoJdPE0cjmb
 CdqSP8QVPzqb24rzJe04Ulat6ZUJrxz1xZLuCQIC
X-Google-Smtp-Source: AGHT+IGWyTZduHZ2AUQOMuHAUDSKDxSYh2Boylo//kHY7uALzcMyPCHh3aobLMS0sfZ3SBLE+RqIGbSBBaWJY8VJe/k=
X-Received: by 2002:a05:6402:5108:b0:640:aa67:2933 with SMTP id
 4fb4d7f45d1cf-640aa672a40mr5173930a12.21.1762176592344; Mon, 03 Nov 2025
 05:29:52 -0800 (PST)
MIME-Version: 1.0
References: <20251103-work-creds-guards-simple-v1-0-a3e156839e7f@kernel.org>
In-Reply-To: <20251103-work-creds-guards-simple-v1-0-a3e156839e7f@kernel.org>
Date: Mon, 3 Nov 2025 14:29:40 +0100
X-Gm-Features: AWmQ_bmz-aFyM_2e0ocdnrdFR9IUaRm9-CuMDUtbkHwY8CVjQjk6nDFhXg5Zzks
Message-ID: <CAOQ4uxgr33rf1tzjqdJex_tzNYDqj45=qLzi3BkMUaezgbJqoQ@mail.gmail.com>
Subject: Re: [PATCH 00/16] credentials guards: the easy cases
To: Christian Brauner <brauner@kernel.org>
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
From: Amir Goldstein via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amir Goldstein <amir73il@gmail.com>
Cc: linux-aio@kvack.org, linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-unionfs@vger.kernel.org, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org,
 linux-erofs@lists.ozlabs.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Nov 3, 2025 at 12:28=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> This converts all users of override_creds() to rely on credentials
> guards. Leave all those that do the prepare_creds() + modify creds +
> override_creds() dance alone for now. Some of them qualify for their own
> variant.

Nice!

What about with_ovl_creator_cred()/scoped_with_ovl_creator_cred()?
Is there any reason not to do it as well?

I can try to clear some time for this cleanup.

For this series, feel free to add:

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

Thanks,
Amir.

>
> Signed-off-by: Christian Brauner <brauner@kernel.org>
> ---
> Christian Brauner (16):
>       cred: add {scoped_}with_creds() guards
>       aio: use credential guards
>       backing-file: use credential guards for reads
>       backing-file: use credential guards for writes
>       backing-file: use credential guards for splice read
>       backing-file: use credential guards for splice write
>       backing-file: use credential guards for mmap
>       binfmt_misc: use credential guards
>       erofs: use credential guards
>       nfs: use credential guards in nfs_local_call_read()
>       nfs: use credential guards in nfs_local_call_write()
>       nfs: use credential guards in nfs_idmap_get_key()
>       smb: use credential guards in cifs_get_spnego_key()
>       act: use credential guards in acct_write_process()
>       cgroup: use credential guards in cgroup_attach_permissions()
>       net/dns_resolver: use credential guards in dns_query()
>
>  fs/aio.c                     |   6 +-
>  fs/backing-file.c            | 147 ++++++++++++++++++++++---------------=
------
>  fs/binfmt_misc.c             |   7 +--
>  fs/erofs/fileio.c            |   6 +-
>  fs/nfs/localio.c             |  59 +++++++++--------
>  fs/nfs/nfs4idmap.c           |   7 +--
>  fs/smb/client/cifs_spnego.c  |   6 +-
>  include/linux/cred.h         |  12 ++--
>  kernel/acct.c                |   6 +-
>  kernel/cgroup/cgroup.c       |  10 ++-
>  net/dns_resolver/dns_query.c |   6 +-
>  11 files changed, 133 insertions(+), 139 deletions(-)
> ---
> base-commit: fea79c89ff947a69a55fed5ce86a70840e6d719c
> change-id: 20251103-work-creds-guards-simple-619ef2200d22
>
>

