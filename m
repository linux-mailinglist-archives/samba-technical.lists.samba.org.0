Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C53BD14F6
	for <lists+samba-technical@lfdr.de>; Mon, 13 Oct 2025 05:06:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=qHAqGhh/ixHW+v9mccbsdYXuyyKdgiAAP3DIPnvHpvs=; b=k1vCEY/PRMKmHeYKIo8FQgdWPO
	TXmbz5IwAv8+zeoJ/h/XjzmFrUPAQida6C5d5teXZ2EA19T2ZO6lm+Y00aq7qORbZU20M0SJeQyKp
	ZBXUVfkOfFIRsTqQuvfdgcJW1kHS/rEUPGfKrGy28I3fcZjJ19QpZcY82bfwPNwIrvBS0Z57XEs4y
	LeSZXWYZD3cBpInH2xGA0PYmzMXIiPFVbxGlW1zdAJXSefq1IcJNnv+FGT+ZFTHNBxu+nXw76GvRp
	idPdeN0ikD/MGSDJaIEmBDnG52sP/+eg5izPXhuCtp9FRZh3Uu5QqqRskXbqy30yccRaXZjWUGIXn
	nM2cDrkw==;
Received: from ip6-localhost ([::1]:26138 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v88sL-007e0p-If; Mon, 13 Oct 2025 03:05:29 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32]:51476) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v88sH-007e0h-2p
 for samba-technical@lists.samba.org; Mon, 13 Oct 2025 03:05:27 +0000
Received: by mail-qv1-xf32.google.com with SMTP id
 6a1803df08f44-791fd6bffbaso59084456d6.3
 for <samba-technical@lists.samba.org>; Sun, 12 Oct 2025 20:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760324723; x=1760929523; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qHAqGhh/ixHW+v9mccbsdYXuyyKdgiAAP3DIPnvHpvs=;
 b=aF0ggupmmHQthOvmXUfjW/jC3CPok9kYyZdxeLFRmpLTaDqr4MY/nVFwiay4iNt8Uw
 NFW0wGglcTKFCZ6zshWH6ucbv4RlbIKCN0K0OPBy8hCRFsB7YDEyc4+E02jIsRVrYw7E
 jzD7gmSvc7kigCvAVDJXbyngUQMlGQHSdwqYVJ5QxqvAX9/vCmlbMW+H2et+AYcomHrU
 5fHnldnVmfpFBLeqn4miNSN6NSyP3X8H/tm13yZh4LVpYyKiK4//SmPGLvCn+Ta9rf+R
 nhXtpkOXU9Z4rMS29p8g06d4jx01ExI4kBD+c1PqTX8GkbYo5RR1lC00Bsb3dT0G3nv3
 /ChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760324723; x=1760929523;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qHAqGhh/ixHW+v9mccbsdYXuyyKdgiAAP3DIPnvHpvs=;
 b=RMuYbDZDbDL+MEIf375mysHwz9jVXL3Wk4dlgfYUja6mxOCOjs+k5wVFUH8tqTgLN+
 IVDK1DLh12iZUPcAvXiOAfc8ch4COeA4uxwidDT4k7V0QblQwruAVsTucRSLxJMZWWkw
 j2T7VHdP8F/DZ12hqZv40oFWlj48Zy1hh0C5qWipQSTvneucBIDFz3ympR+ZRjAehj68
 1Kb1gzRpIHroAyYRvyJrjfQCIW2BwisIG6NAiNV4yY5kpk3y9d9Sd2Rud/lyahz8syDU
 AMG/o2gTbZI3TpnqprXUZiaEQU9e0rvsOaqAzPwDqm6umidJSndUQJ89EA9JLdr4XDgz
 xfCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3wRlr4279f2K8+OfqdydR5zTOA9kijFc7vr0sx2TdQChiPt+/NTYuhX1buZqzz+xQ5bMHrwekOSP7+/M0pjg=@lists.samba.org
X-Gm-Message-State: AOJu0Yw6Iwdh7vOLpBsf/HFAgwqrBlxnlzU4tsYZOrlU562q6FOFJWlo
 NJpkyCJAGEhKJ55Jrf1RwOEvsdTrAwQeDqy4k6Vk8WLreh0t55YNeAeP2WB0Kq3GHUruMNx1gMN
 8Ig6cngSPBPSF2UnA7iiohDuc11KIsPo=
X-Gm-Gg: ASbGncuZLMJvaAIYoDHfayHpLRnlVE/q0e2R64POROdTZJ1G7lGccbQG6QkfEs+d8MW
 TYuAJck2TY6eAsKvYuw5UdZ0HhGkyh/RhJ5A7GiGgD2kqez289HTCPmtBn/+wEtG9Zaw3yDfbRv
 A+0vD9yvD/9B/VDJQDKXvGiC1JooGApar/I3ofOow0HjgD5uSqbTm7H/vQG9N8U8bFS5gxzukeT
 htEIJSlKGgBonIF2mMfUf1e5dpCbc1c2xnbZMMfCtd2K4VtXWx9EHf3g/r3GfgorEaw679PQQsA
 MVP1E/a+sb/GEiub1RMl+eNFCOiMFtpLgunvJRTnorMEOGMX1E6UVwV6/UKNBggOzMxoXh2EUum
 kXidCGz0i0vbsycNQWEIXtnvGrSNRwntRCAPstDi9
X-Google-Smtp-Source: AGHT+IGDwTSeSw8sMShsBfmLNXRL+l5FjSlGRN765Q6/KfQ0u9Esino45KVYsQZMHmm3/nGdQnVEF8SEli+vXx+F6YM=
X-Received: by 2002:ad4:5c8b:0:b0:782:f478:8ef6 with SMTP id
 6a1803df08f44-87b2ef3fd05mr271912316d6.53.1760324722984; Sun, 12 Oct 2025
 20:05:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1760295528.git.metze@samba.org>
In-Reply-To: <cover.1760295528.git.metze@samba.org>
Date: Sun, 12 Oct 2025 22:05:11 -0500
X-Gm-Features: AS18NWBXSKZ22IKuewh1gVJmA-cWkMqgUW3PAEIT_pZFb0XSxNvkXaBGJYNOaDg
Message-ID: <CAH2r5mt=6mwgy=d6kmB--V0f8GbxWooBH4pD56bDUouMOaDXrQ@mail.gmail.com>
Subject: Re: [PATCH 00/10] improve smbdirect_mr_io lifetime
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
Cc: Tom Talpey <tom@talpey.com>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next pending more testing

On Sun, Oct 12, 2025 at 2:10=E2=80=AFPM Stefan Metzmacher <metze@samba.org>=
 wrote:
>
> Hi,
>
> these patches improve and simplify our handling of
> smbdirect_mr_io structures and their lifetime.
>
> smbd_register_mr() returns a pointer to struct smbdirect_mr_io
> and smbd_deregister_mr() gives the pointer back.
>
> But currently the memory itself is managed by the connection
> (struct smbdirect_socket) and smbd_destroy() has a strange
> wait loop in order to wait for smbd_deregister_mr() being
> called. It means code in smbd_destroy() is aware of
> the server mutex in the generic smb client handling above
> the transport layer.
>
> These patches do some cleanups and fixes before changing
> the logic to use a kref and a mutex in order to allow
> smbd_deregister_mr() being called after smbd_destroy()
> as the memory of smbdirect_mr_io will stay in memory
> but will be detached from the connection.
>
> This makes the code independent of cifs_server_[un]lock()
> and will allow us to move more smbdirect code into common
> functions (shared between client and server).
>
> I think these should go into 6.18.
>
> Stefan Metzmacher (10):
>   smb: smbdirect: introduce smbdirect_mr_io.{kref,mutex} and
>     SMBDIRECT_MR_DISABLED
>   smb: client: change smbd_deregister_mr() to return void
>   smb: client: let destroy_mr_list() call list_del(&mr->list)
>   smb: client: let destroy_mr_list() remove locked from the list
>   smb: client: improve logic in allocate_mr_list()
>   smb: client: improve logic in smbd_register_mr()
>   smb: client: improve logic in smbd_deregister_mr()
>   smb: client: call ib_dma_unmap_sg if mr->sgt.nents is not 0
>   smb: client: let destroy_mr_list() call ib_dereg_mr() before
>     ib_dma_unmap_sg()
>   smb: client: let destroy_mr_list() keep smbdirect_mr_io memory if
>     registered
>
>  fs/smb/client/smbdirect.c                  | 312 ++++++++++++++-------
>  fs/smb/client/smbdirect.h                  |   2 +-
>  fs/smb/common/smbdirect/smbdirect_socket.h |  11 +-
>  3 files changed, 224 insertions(+), 101 deletions(-)
>
> --
> 2.43.0
>


--=20
Thanks,

Steve

