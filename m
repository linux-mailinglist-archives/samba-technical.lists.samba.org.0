Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C6898600A
	for <lists+samba-technical@lfdr.de>; Wed, 25 Sep 2024 16:13:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=iG2/lTAfEgLjAaRpv4EoM4L/DWaXGYqjJGv5aw2l9SI=; b=Xk+ETaCb41c+2E2qNzvUO7ZS1k
	XacOAVHKLYm09vCdXqTR56wKJodqo4fzcji+hewnOZ9zoXHRKDN1MPxLWWQJpK0L7AgxB0xFo7Dg8
	UCYPEcgCIs9PhdBE2iarZdY8zA1/Z9N+UQLQ2rgivxWuFrb9xPkXKi++TAeC8CxyhBlu3CJi1/8jb
	PaceykMJs256oocxvZMy2uaRBtVfBf+NKCABY22mIlUNDar9PBOgDvI+It3dGUZ4ataIwnHF6lZx6
	GVYOyEwHkrG5FZzPktGdJGp3lKGMxu8DrVU3R8fG4dbd70VPVVZzU3PGIu8TcC233Yg3KFXig0BGh
	02bFHuVQ==;
Received: from ip6-localhost ([::1]:30232 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1stSkl-000fJa-Uy; Wed, 25 Sep 2024 14:12:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217]:52438) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1stSkh-000fJT-OM
 for samba-technical@lists.samba.org; Wed, 25 Sep 2024 14:12:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F19EC5C5D59
 for <samba-technical@lists.samba.org>; Wed, 25 Sep 2024 13:53:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D312C4CED0
 for <samba-technical@lists.samba.org>; Wed, 25 Sep 2024 13:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727272412;
 bh=iG2/lTAfEgLjAaRpv4EoM4L/DWaXGYqjJGv5aw2l9SI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pXD0LcCq772rNuTIJDDjOooo3H1qUN4uilnjWwub6U0A8jeKSseaQ9CcfgmmUcc1K
 wP6EMiX8i1AX4Orj565pmn558DHjbzcggKad97k6UtIAUsFQtw6MkTXgeJ6WEHnU7I
 eYsCKWaziqUZmv9O+KybuhfT3PzufyJYDdlSOeQLWvtGyf4XCqO8niDyKn+AhJHCcg
 keDwN6qOwdM/Df3SSbNVLVtCMql7o5IHRRRHo8jaalc76oB6BbbwnJadBsUplnwC68
 VxkSr0ACN0KfebDp7kPewgSN9VR8Uq+Ic0aBmaSU5U5MdXg3J9wwmE7ythhqwMO7jB
 wGZKqpZXw6B6g==
Received: by mail-oo1-f46.google.com with SMTP id
 006d021491bc7-5e1b72fc5f3so3565058eaf.2
 for <samba-technical@lists.samba.org>; Wed, 25 Sep 2024 06:53:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWlz+8X45VN6YkYgptgh7AgGt3/9WOoAJbRdUpf52WK0lBaWiIzzABixhZMe3PHzEZ8Y1EHOYjcuyRV+LZ/Kis=@lists.samba.org
X-Gm-Message-State: AOJu0Ywsm7+1H/esubkUmjTS3XUOynQzyXYkMd3B3hKF2KexzEWrlOSe
 iYiEFVpwd3KwcK6HDAUgpArSir0W6aRNmfle0AYDKaTksTIDSMxarzryNYXvqD8cXOzI6f0019g
 XLrlWC3lNjCbN9etdL9QwH43ZFO8=
X-Google-Smtp-Source: AGHT+IElzBEU3s+VBMa7k1g2Urn4DTRJjr0JWICjaq9tn8fBnjdxqevworOBb6UwozmZ8jWB2kDA2hGqzutJm+tOnRg=
X-Received: by 2002:a05:6871:1cd:b0:261:110b:84fd with SMTP id
 586e51a60fabf-286e13810eemr2152155fac.11.1727272411709; Wed, 25 Sep 2024
 06:53:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240925074323.9823-1-shenlichuan@vivo.com>
In-Reply-To: <20240925074323.9823-1-shenlichuan@vivo.com>
Date: Wed, 25 Sep 2024 22:53:19 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-O3zANLJaQpaDc7VsUJTODRG5k08L+HG7sjLAwv7MpGg@mail.gmail.com>
Message-ID: <CAKYAXd-O3zANLJaQpaDc7VsUJTODRG5k08L+HG7sjLAwv7MpGg@mail.gmail.com>
Subject: Re: [PATCH v1] smb: Correct typos in multiple comments across various
 files
To: Shen Lichuan <shenlichuan@vivo.com>
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
Cc: pc@manguebit.com, tom@talpey.com, sprasad@microsoft.com,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, sfrench@samba.org, senozhatsky@chromium.org,
 bharathsm@microsoft.com, opensource.kernel@vivo.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Sep 25, 2024 at 4:43=E2=80=AFPM Shen Lichuan <shenlichuan@vivo.com>=
 wrote:
>
> Fixed some confusing typos that were currently identified witch codespell=
,
> the details are as follows:
>
> -in the code comments:
> fs/smb/common/smb2pdu.h:9: specfication =3D=3D> specification
> fs/smb/common/smb2pdu.h:494: usally =3D=3D> usually
> fs/smb/common/smb2pdu.h:1064: Attrubutes =3D=3D> Attributes
> fs/smb/server/connection.c:28: cleand =3D=3D> cleaned
> fs/smb/server/ksmbd_netlink.h:216: struture =3D=3D> structure
> fs/smb/server/oplock.c:799: conains =3D=3D> contains
> fs/smb/server/oplock.c:1487: containted =3D=3D> contained
> fs/smb/server/server.c:282: proccessing =3D=3D> processing
> fs/smb/server/smb_common.c:491: comforms =3D=3D> conforms
> fs/smb/server/xattr.h:102: ATTRIBUITE =3D=3D> ATTRIBUTE
>
> Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
Applied it to #ksmbd-for-next-next.
Thanks!

