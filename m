Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 27398AA8389
	for <lists+samba-technical@lfdr.de>; Sun,  4 May 2025 03:46:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=B7lnzCOHIwkizy9wWqNhagK46sAvR2JhHgjOg7AFEkU=; b=BmhOf5ZABXZcdrSmsdI6WTf1rM
	ZC5aXHQtLj4Vy2fmpK16orf714tiMxdxKHi2lTXq/xBkKc5ZPcFhJld0gy7t8STDiZiSP1jXpxOow
	tflUOVwF4uVERBbPHkcmlJlaaF9j6VL5arI+oVYc/21QFHftyHn6aDTG/6lzqMxmbyvxCJysF4GKr
	oijIN/Vpv4tpdlMW5yy8PJ9k3ItmXG6z+YQHT2ZgHporR1B+kqFGhPjxZt6Mj4riCxtDt5Vo0i0mN
	s2wEQf2pfNFevOMjS0bG09D2+bHEb0EUXcdOHjvMwdR37F6CwMKNeo04W5JFtmGP4gQSdVxNdF79N
	kEFuYEpw==;
Received: from ip6-localhost ([::1]:46578 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uBOQc-0034nT-CG; Sun, 04 May 2025 01:46:02 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:57646) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uBOQX-0034mv-Ao
 for samba-technical@lists.samba.org; Sun, 04 May 2025 01:46:00 +0000
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-30bfe0d2b6dso30431161fa.3
 for <samba-technical@lists.samba.org>; Sat, 03 May 2025 18:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746323155; x=1746927955; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B7lnzCOHIwkizy9wWqNhagK46sAvR2JhHgjOg7AFEkU=;
 b=eSCuV6VbApU9BhTtwHMgjlhZuIw+kbTC1Bo9f8EyBRRreu1jOke5l+lCfHheWj30Xi
 Lc2JkUvHApWdMLi9VdaFBljS1pd6IokrAIa0KzLjAuCwSvyLfT5pfr1TFPqrXSKvgu0N
 NGliX3ZzxsFkfMccCr4hT0aEwH5RqZgJIM7yhdRdConlRe2ueMyAh5hcZYlbAHfXBBDX
 zwR7lM7XsSZ3RhkfVNJ9OEhmUyyrlGJd3ioq46uodxFUefdC5A428XX5XoANcBINdC+t
 xdAxp4jZ7Ek3bWWxRj560RgnvZ+kL7jC0P1AhO6xsQFS+yeAn92xNyTDXPBGyZpIF9rV
 Nh3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746323155; x=1746927955;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B7lnzCOHIwkizy9wWqNhagK46sAvR2JhHgjOg7AFEkU=;
 b=vp4B6c4DwrRCRkENBfr6gCMWZN4ymF5mPwri8bQg3FOUJwWOH24QWNKfqyzb3Ens9o
 njT3nCnwTXwGtFawaHNrjPIgd/hMdsUK0sxeFGoVRi7EBd2hm8JjevsmZZx3kc/akwW8
 RXjXxUoZL4kWUDLfKpazeLSoSRbqAD4k97Y557Y8+uWg4+z3UvezAU2eKX6EI6AkNfqt
 e/Q46g4N4Ax/SorklEYDNdClYRdyFodSm14d+S33dT8627Ay0MEyj6XIsiI2R63kRt6L
 D7ySCqOQl7OfmAHFldb8+VTHOLZv9qRBZxFtxg9x20hZnbY9jRBAe04kWU9Uuv1C+IpH
 CuFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHzRLuhhyFKgU0mfxN+veKDmJuUmwaXnpo8F6QDiATQz0cBFPetvY4UVjkDvwkHDstx9A9RF7dru/IGX7VlKU=@lists.samba.org
X-Gm-Message-State: AOJu0YxFkWGFb5c/HdztTo3MmAu79XsDD7MsCj3mcjbAu/Akqlnp1v0U
 26q96ZHJcRsoEivd/Og+tGdXpmYhNbZ5npzAGBHLGH2KxsFHSJeL+guU+xPoXXLHre6Bv0/ZuhB
 NSbmfyN/wHEJfnkUHZd3ou3s9z4A=
X-Gm-Gg: ASbGncu8DLW07IZGpRWmDoO823+2ay0DEuh3Yv91u+/+BvU2lBx4f7f5U42JmHDsntV
 l+Jo0E3/Tsc7Uh9K7LPu0+gUKczySRTZHpk5PHghDFeXWumsUWcMzZ5hq9PI3qqPBwbUAAsu4Sq
 7cBbeEPUt87BQB8oxxwHifATs=
X-Google-Smtp-Source: AGHT+IG4qF3iVI5uWcYBZcuo9Y/YT1JDNmGSRnwvpFqRu8CNxzzYJpMUSlIaKXPHHmx3mvmbXuVDMwt5Pq6PShRcZVQ=
X-Received: by 2002:a2e:be0d:0:b0:30d:e104:b67c with SMTP id
 38308e7fff4ca-32352607341mr6769451fa.39.1746323155173; Sat, 03 May 2025
 18:45:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250503234030.130605-1-linux@treblig.org>
In-Reply-To: <20250503234030.130605-1-linux@treblig.org>
Date: Sat, 3 May 2025 20:45:43 -0500
X-Gm-Features: ATxdqUEAZB9i7S5uPsM1MexTMN1OssUOvRay6NTBCvtlxfTs81yFYFIHOqDPCAE
Message-ID: <CAH2r5mtCa3W1t_RBwPQDoHKb14JHydmP3CdmjoF5BNfkTn5ing@mail.gmail.com>
Subject: Re: [PATCH] smb: client: Remove an unused function and variable
To: linux@treblig.org
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
Cc: pc@manguebit.com, tom@talpey.com, sprasad@microsoft.com,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, sfrench@samba.org, bharathsm@microsoft.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This looks fine as something for 6.16-rc next month.

On Sat, May 3, 2025 at 6:40=E2=80=AFPM <linux@treblig.org> wrote:
>
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> SMB2_QFS_info() has been unused since 2018's
> commit 730928c8f4be ("cifs: update smb2_queryfs() to use compounding")
>
> sign_CIFS_PDUs has been unused since 2009's
> commit 2edd6c5b0517 ("[CIFS] NTLMSSP support moving into new file, old de=
ad
> code removed")
>
> Remove them.
>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  fs/smb/client/cifsfs.c    |  1 -
>  fs/smb/client/smb2pdu.c   | 65 ---------------------------------------
>  fs/smb/client/smb2proto.h |  3 --
>  3 files changed, 69 deletions(-)
>
> diff --git a/fs/smb/client/cifsfs.c b/fs/smb/client/cifsfs.c
> index a08c42363ffc..d192a19bd761 100644
> --- a/fs/smb/client/cifsfs.c
> +++ b/fs/smb/client/cifsfs.c
> @@ -70,7 +70,6 @@ bool require_gcm_256; /* false by default */
>  bool enable_negotiate_signing; /* false by default */
>  unsigned int global_secflags =3D CIFSSEC_DEF;
>  /* unsigned int ntlmv2_support =3D 0; */
> -unsigned int sign_CIFS_PDUs =3D 1;
>
>  /*
>   * Global transaction id (XID) information
> diff --git a/fs/smb/client/smb2pdu.c b/fs/smb/client/smb2pdu.c
> index c4d52bebd37d..eef971509589 100644
> --- a/fs/smb/client/smb2pdu.c
> +++ b/fs/smb/client/smb2pdu.c
> @@ -5919,71 +5919,6 @@ SMB311_posix_qfs_info(const unsigned int xid, stru=
ct cifs_tcon *tcon,
>         return rc;
>  }
>
> -int
> -SMB2_QFS_info(const unsigned int xid, struct cifs_tcon *tcon,
> -             u64 persistent_fid, u64 volatile_fid, struct kstatfs *fsdat=
a)
> -{
> -       struct smb_rqst rqst;
> -       struct smb2_query_info_rsp *rsp =3D NULL;
> -       struct kvec iov;
> -       struct kvec rsp_iov;
> -       int rc =3D 0;
> -       int resp_buftype;
> -       struct cifs_ses *ses =3D tcon->ses;
> -       struct TCP_Server_Info *server;
> -       struct smb2_fs_full_size_info *info =3D NULL;
> -       int flags =3D 0;
> -       int retries =3D 0, cur_sleep =3D 1;
> -
> -replay_again:
> -       /* reinitialize for possible replay */
> -       flags =3D 0;
> -       server =3D cifs_pick_channel(ses);
> -
> -       rc =3D build_qfs_info_req(&iov, tcon, server,
> -                               FS_FULL_SIZE_INFORMATION,
> -                               sizeof(struct smb2_fs_full_size_info),
> -                               persistent_fid, volatile_fid);
> -       if (rc)
> -               return rc;
> -
> -       if (smb3_encryption_required(tcon))
> -               flags |=3D CIFS_TRANSFORM_REQ;
> -
> -       memset(&rqst, 0, sizeof(struct smb_rqst));
> -       rqst.rq_iov =3D &iov;
> -       rqst.rq_nvec =3D 1;
> -
> -       if (retries)
> -               smb2_set_replay(server, &rqst);
> -
> -       rc =3D cifs_send_recv(xid, ses, server,
> -                           &rqst, &resp_buftype, flags, &rsp_iov);
> -       free_qfs_info_req(&iov);
> -       if (rc) {
> -               cifs_stats_fail_inc(tcon, SMB2_QUERY_INFO_HE);
> -               goto qfsinf_exit;
> -       }
> -       rsp =3D (struct smb2_query_info_rsp *)rsp_iov.iov_base;
> -
> -       info =3D (struct smb2_fs_full_size_info *)(
> -               le16_to_cpu(rsp->OutputBufferOffset) + (char *)rsp);
> -       rc =3D smb2_validate_iov(le16_to_cpu(rsp->OutputBufferOffset),
> -                              le32_to_cpu(rsp->OutputBufferLength), &rsp=
_iov,
> -                              sizeof(struct smb2_fs_full_size_info));
> -       if (!rc)
> -               smb2_copy_fs_info_to_kstatfs(info, fsdata);
> -
> -qfsinf_exit:
> -       free_rsp_buf(resp_buftype, rsp_iov.iov_base);
> -
> -       if (is_replayable_error(rc) &&
> -           smb2_should_replay(tcon, &retries, &cur_sleep))
> -               goto replay_again;
> -
> -       return rc;
> -}
> -
>  int
>  SMB2_QFS_attr(const unsigned int xid, struct cifs_tcon *tcon,
>               u64 persistent_fid, u64 volatile_fid, int level)
> diff --git a/fs/smb/client/smb2proto.h b/fs/smb/client/smb2proto.h
> index 4662c7e2d259..035aa1624053 100644
> --- a/fs/smb/client/smb2proto.h
> +++ b/fs/smb/client/smb2proto.h
> @@ -259,9 +259,6 @@ extern int smb2_handle_cancelled_close(struct cifs_tc=
on *tcon,
>                                        __u64 volatile_fid);
>  extern int smb2_handle_cancelled_mid(struct mid_q_entry *mid, struct TCP=
_Server_Info *server);
>  void smb2_cancelled_close_fid(struct work_struct *work);
> -extern int SMB2_QFS_info(const unsigned int xid, struct cifs_tcon *tcon,
> -                        u64 persistent_file_id, u64 volatile_file_id,
> -                        struct kstatfs *FSData);
>  extern int SMB311_posix_qfs_info(const unsigned int xid, struct cifs_tco=
n *tcon,
>                          u64 persistent_file_id, u64 volatile_file_id,
>                          struct kstatfs *FSData);
> --
> 2.49.0
>
>


--=20
Thanks,

Steve

