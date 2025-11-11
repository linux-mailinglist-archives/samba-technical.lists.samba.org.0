Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5885FC4B910
	for <lists+samba-technical@lfdr.de>; Tue, 11 Nov 2025 06:47:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=88MA7FFfqsE2m/H01Z3+We2u+DvOXcJRGWjb+ba/aq0=; b=W2/QZEyC23MsDQJdN4sWZHdmIu
	XrVOek8dphq3e5rZGp37eR2ltqBi1H8iPLffyg3W8OkYBMWJnDZSzWDGFnKUm78pJt3vwoZr6XyWo
	Ea36hJr0cU3cmlRJ1dwk6p9aa0kSBCOqNOMi5bWNR/39EqPatI6fgLdvDTWPwAa78yxVFZjOCBGP+
	LwPMR7dewhPO3vH9haDHZltU8COSX+Be1zeyG8PGxYDHQfVzhZROROf8AJeBbUrkfXIxmmm2gn3oF
	z9bsiORruCOl9T5tMG5RYjmCEjpM0OqIevdEkr/a9J9V5tTICJPnyG4+2982UNMriizuGf9inXDcx
	WwrDgdgQ==;
Received: from ip6-localhost ([::1]:59194 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vIhDL-00ByPi-O5; Tue, 11 Nov 2025 05:46:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25]:34706) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vIhDH-00ByPb-Nm
 for samba-technical@lists.samba.org; Tue, 11 Nov 2025 05:46:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C1DB261908
 for <samba-technical@lists.samba.org>; Tue, 11 Nov 2025 05:46:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67225C19421
 for <samba-technical@lists.samba.org>; Tue, 11 Nov 2025 05:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762839999;
 bh=88MA7FFfqsE2m/H01Z3+We2u+DvOXcJRGWjb+ba/aq0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FZwufzs1svcGhCfpLuQNqjnWtHM4V8hOrHKApdHZ0xX9tdOlR3jljP+OJufenNL6h
 4OvKif3vLyl55Xnlk1LFXAnqWCILvNogQO8XFnESMWqvSFKY06fUHoPlHXMEVdCjQq
 qpBmvU/hBFjPuBLhiBRl9n7dkbG0fh6Mo1RvtRVlt5tagaVvgj0huDOcxajCZNvEh+
 PsT8XbB61VMrCnaL8DCvrk8nL4mEzQHz6h8dv9CzOuupzH0OWT0+j0SyTEyGWEJgDV
 zJeBYtDT1uUVeokS384gnyYNxmMZ87s8iPTaqNQWOptZqHVnun2L+JSKIME9xoq3ML
 XepzZOTL1wnxg==
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-640aaa89697so5593740a12.3
 for <samba-technical@lists.samba.org>; Mon, 10 Nov 2025 21:46:39 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUigTSx4hsub9cdcAD0vS3uZbmtwc39zH5ipQvpvxhUS2QTrw+LvEprKmRDhP2isEC0Y5p4D1W3KZXth2y1loc=@lists.samba.org
X-Gm-Message-State: AOJu0YwqyYgt1TjcCQJ4HNjoRRhWmpMfmwDOoalfF29Rvwbsb9uU38dP
 91/4WgidSZYQqD1hTSDn+h7MfbrZTqwnLfX9w+d8aObiNnpXFDYNagoTQJJ50ffyaDc/O4wbaot
 cD8j3Mjl6kwpmRj7N9WSfhYbeOU29IqI=
X-Google-Smtp-Source: AGHT+IGwEPdaSDYQbTScYkkptse9ATIhZO7TWXe/XoISjgO/uLNwm7phNBo2mRF7mkqD+QDGLEsI3q8e93DG9aSId+w=
X-Received: by 2002:a17:907:7f0d:b0:b40:cfe9:ed2c with SMTP id
 a640c23a62f3a-b72e05c9530mr979626366b.64.1762839997984; Mon, 10 Nov 2025
 21:46:37 -0800 (PST)
MIME-Version: 1.0
References: <20251110152420.2889233-1-metze@samba.org>
In-Reply-To: <20251110152420.2889233-1-metze@samba.org>
Date: Tue, 11 Nov 2025 14:46:26 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9CMKMfMZGSL05fm9uE0FcdiSHRhMUcqVdxVfFv1mJFHg@mail.gmail.com>
X-Gm-Features: AWmQ_bnWpKDAr3OvJboQXFJlGFZRaQQTIGqXGsox1QeN4YJHzwrvkRn6R9YCfn8
Message-ID: <CAKYAXd9CMKMfMZGSL05fm9uE0FcdiSHRhMUcqVdxVfFv1mJFHg@mail.gmail.com>
Subject: Re: [PATCH] smb: server: let smb_direct_disconnect_rdma_connection()
 turn CREATED into DISCONNECTED
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

On Tue, Nov 11, 2025 at 12:24=E2=80=AFAM Stefan Metzmacher <metze@samba.org=
> wrote:
>
> When smb_direct_disconnect_rdma_connection() turns SMBDIRECT_SOCKET_CREAT=
ED
> into SMBDIRECT_SOCKET_ERROR, we'll have the situation that
> smb_direct_disconnect_rdma_work() will set SMBDIRECT_SOCKET_DISCONNECTING
> and call rdma_disconnect(), which likely fails as we never reached
> the RDMA_CM_EVENT_ESTABLISHED. it means that
> wait_event(sc->status_wait, sc->status =3D=3D SMBDIRECT_SOCKET_DISCONNECT=
ED)
> in free_transport() will hang forever in SMBDIRECT_SOCKET_DISCONNECTING
> never reaching SMBDIRECT_SOCKET_DISCONNECTED.
>
> So we directly go from SMBDIRECT_SOCKET_CREATED to
> SMBDIRECT_SOCKET_DISCONNECTED.
>
> Fixes: b3fd52a0d85c ("smb: server: let smb_direct_disconnect_rdma_connect=
ion() set SMBDIRECT_SOCKET_ERROR...")
> Cc: Namjae Jeon <linkinjeon@kernel.org>
> Cc: Steve French <smfrench@gmail.com>
> Cc: Tom Talpey <tom@talpey.com>
> Cc: linux-cifs@vger.kernel.org
> Cc: samba-technical@lists.samba.org
> Signed-off-by: Stefan Metzmacher <metze@samba.org>
Applied it to #ksmbd-for-next-next.
Thanks!

