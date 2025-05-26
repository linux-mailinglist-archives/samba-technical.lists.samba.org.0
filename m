Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 944C7AC385B
	for <lists+samba-technical@lfdr.de>; Mon, 26 May 2025 05:58:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=zFYKaF5MdOzMoUJdYK+pJqy+h1cRWqDSmXlmSKPedVg=; b=jDLeGeS+OXO50MxRHYtEgxGZgT
	qR/Nq7UjIWvzZu4gOC3ramAezmyb716iEFQ+axlGLOWOO2A8nkpVnLG0LOnsMuG6mSQjVeWk1KA7l
	rNTT1phwOKvm99j722aTrU6L/Qoqh0kp+norq8qbS590XdWsmUJvOtcaZQhxtozduGeqM6T+HEM9W
	GbYF45ImXK+jHMmYV4TG3fWwNP9k5gx/Yb0xu43uNVSaxCFAWDu8qfOMeDqcMBnt86qQ7U2SUtcTU
	4aZ/ISmToBmdQz+nIDa9iZGZvM4qgAFSMTwzMWP5FNZkSQ2+BpZ/+QDxWNi0e5aSrCNofsrY7f+Cl
	vFj2LAZQ==;
Received: from ip6-localhost ([::1]:25672 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uJOxs-004DLs-T3; Mon, 26 May 2025 03:57:28 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:46375) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uJOxm-004DLl-2M
 for samba-technical@lists.samba.org; Mon, 26 May 2025 03:57:25 +0000
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-32909637624so22215581fa.1
 for <samba-technical@lists.samba.org>; Sun, 25 May 2025 20:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748231840; x=1748836640; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zFYKaF5MdOzMoUJdYK+pJqy+h1cRWqDSmXlmSKPedVg=;
 b=eruXOcOj6hcLNFmbYNMVHNWkF3zLVxstsiEWcn3i7sTak9ohjNOL4SiJo83v6/YoxR
 6aJp508jyGq7doCc55nUaxaRyQ60tjIpZoJVFBfyfcz2Q0HLpfpiNgwcBUKwmnFcoPNB
 iSY9OeLCdlMviiEW/axW7p5oROsSv4FUbeqi2ygF1Zc3omQUnsTtSnwwSK+RvHjVgFaa
 RtTblgton+VpWggAsycgMuLSbwA620MjYZ+4Agl7a1pqv3xy+eoWvNI3lqBw1ph7RK8I
 AyF0rbR1A1hS+G9fR6vBn33SgYGqXYqhD6LdKqKjJSrM4CRoKaWBQ/6ek0JGdEGdZWCn
 89jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748231840; x=1748836640;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zFYKaF5MdOzMoUJdYK+pJqy+h1cRWqDSmXlmSKPedVg=;
 b=Lp/5jefx2nS5GzWN645mbweYWeyafyDZITEEyNO+2rmlObAGhkAwK3XG6t1WvKxBPA
 rR1+SG1NLA8JPysdLUKKx1NqTX0j5/yMT/rvlroExWDKGVHmjdnV/U/4niESmQ0FWWFP
 XC6EaGVPE5pWB2Lq5KGOJj/pQOd79zE9xcdCHaLq1GzpCQawleTaioQ0XLmVggCRtipg
 Exr5I1g3q8MWo5Zy7WfFOHQgpB/GXEQwVvD4ReVoWHhdcKkzGbUU7VY2aHheOvr6KNxf
 ackJ2ohCOCugK4qULS/xWm/DdzKR7YE/zdeS1QhsNeUl2vgfNwvqIGdY4wj/CY0W1HRg
 nUiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2UuKUzGejE2+p6yKcq8OsZ1L8Pf5Ovcz9JTwbKsNwCSe5uXt7d5YfIhD0efL9Qelyn9RftEQNgCjWlO4CRyY=@lists.samba.org
X-Gm-Message-State: AOJu0YxA53ub8vw9tYy3jMoaDQOQb820rUF2UUX6+g0NgcpT5LJdLPxw
 A4HmpLQkEw5gJHBxXUABalIc/UvjeZG3sHJsWa1jzoHfGM9v6Vrx1wnOjG2FTk3CrPxooOOA5Ft
 5KQu5j1sZ7kdJN2ADHtvWyRmSmqaC3R4=
X-Gm-Gg: ASbGncvWCc+MSbK2oXVXE6JyDSzFCc7QpvmpFl0dIooagm2woRybwvGWhtISNwC1oW9
 i7W636efcBO9aldxsmgZJYZY2Du5VWkXatggcrGP+11m+bT0ruQH31/ZFcruvzln6Koi99xiNnU
 D0/C6oh6nSXw2yIT/dtAfLAiz+19EF5mieWR01TZNHPC/U0aDxfxZbErBp5wE6pVzctTc=
X-Google-Smtp-Source: AGHT+IFglGOFvc94hDJJ+iVTcL3H6Lguo5HUhsNTeHxD1snKYkGJepa0VX6LderHITQpczdb+2Xp4I0HIVJ8Ctj4OUQ=
X-Received: by 2002:a05:651c:b25:b0:30b:cb10:3a20 with SMTP id
 38308e7fff4ca-3295ba791e0mr21311351fa.32.1748231840130; Sun, 25 May 2025
 20:57:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250503234030.130605-1-linux@treblig.org>
In-Reply-To: <20250503234030.130605-1-linux@treblig.org>
Date: Sun, 25 May 2025 22:57:08 -0500
X-Gm-Features: AX0GCFvPd0Adolnn1ZM7I39tciaAPW3DaBAHk6K8jPSv5S55usBDLzH4A01Y66g
Message-ID: <CAH2r5mvG_y6-z618TyHnNVf9ueS3hrWP8NPP_HJOTCxAnBvYKQ@mail.gmail.com>
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

merged into cifs-2.6.git for-next

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

