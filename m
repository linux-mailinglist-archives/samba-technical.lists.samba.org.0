Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D7E6970EC
	for <lists+samba-technical@lfdr.de>; Tue, 14 Feb 2023 23:54:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=2ElUBpgdjNEXTlWylzsUOWV5/zbI2C2NN7Ib/5wR1fc=; b=KmojtDUQaubCOXya5SCdG7U9gA
	EE6dU1l5928zowx9nqq8wi1cRSHsco6rXjwkzw9JjSBGF5YhjRKim8bDp3wMGpx6nUd6UR7NGeXjv
	F3rtdiB0G2UwI8GHxSyZC6Pof/6zRRDap8PJhOLqfn86t8icY+5JoPUIWcCyrW4AnaBem/Z2UUyIC
	kGtQrCPRWV8womRLyh8DeOUKdJ2UZkQHKm7/N2zDmmfiVa7qaoxNRfg4Rlq7WOmWMWL4tOUxbs0sx
	bKjYynbooNqXggwRo6UlL6WLZssuaukaKMmvCkrjP5G8UU2+hjC6A0UO3my+nEyeQ+zefOKCb6V9i
	deg0xPbg==;
Received: from ip6-localhost ([::1]:38582 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pS4B0-00CCvZ-Q6; Tue, 14 Feb 2023 22:53:30 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:39538) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pS4At-00CCvQ-Os
 for samba-technical@lists.samba.org; Tue, 14 Feb 2023 22:53:27 +0000
Received: by mail-lf1-x129.google.com with SMTP id h24so25487069lfv.6
 for <samba-technical@lists.samba.org>; Tue, 14 Feb 2023 14:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2ElUBpgdjNEXTlWylzsUOWV5/zbI2C2NN7Ib/5wR1fc=;
 b=eNcsNgnu3zkyGvUWa8OfDzuc2C0VKEGAR+ZUhjRTEzfUF50zvmpAY0/mNbEhu9dbd7
 UASXrJJ/f4zOm54Ob+1jRwgF6c+BeYZTvoHQAhrKpsGVk8aahHgHIW/HiLhpxAVA9PxB
 ssmNBWKta/C1qwW6sWvdfsLpe3za4fVU0ZKvPmmPOzgX5eK1Iqa4b6dxS8o9tHGW+g2g
 q/ob7hhGxOEW/6bVlS5S5k/U+UvOlU10wIoiDqlhFI8119cqCu2d3lVLah+nK+jfhNfn
 7LxhXWmRF/enz4lRXC5AX/MI9n3PhH7t431FdXoKN63lodceNMv9/Vb1e0s4G5WUjEjz
 OhXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2ElUBpgdjNEXTlWylzsUOWV5/zbI2C2NN7Ib/5wR1fc=;
 b=2DKsX1acFmkgZYx6mlA1CrxK/zIXVECbr4265R8+hxj+aXmTX79sGkiaSnHWofQe/X
 nByd9LooSpbgn8pTKm+GXFBzyVYpDEFIBp3OtJO9JEUwQvzH3u0K/x/sHu9ezPqa9Lxk
 oDbsDqb01I+HKL2dRg/gvWIT7Hv8D9aXmhiK5q9tu0F1clHGblgP7QST01Hl75TOCQor
 QDbBgB1RDjfa9Ejdg0a9pBt9S5NLG1vibZ4nWJcd65iRR2Jv0HlR4B+eFq82uPN8rziH
 yyytbG621btBjXD1QbbGU9O0Ww01JxpQ1+/9KG6wClTioDcDF94bgDxKWFhbeC/CnrmG
 RPzg==
X-Gm-Message-State: AO0yUKU8gHaxWO7G6IE9Y9/NJRkox0fLEK3alF3YviAYa6o0HY88eDyx
 0LJl6cxGTq52dG41L9+H2fwm221F5NhRzHRTk7Q=
X-Google-Smtp-Source: AK7set8+Ew9B5bW8RKiZRPS6Mw81hmu+kCz2wmLHTqVyKao5ro3k4/nBlrDHYCmAPL8zGmjJh9rzaJI8Lp7PGsKelJo=
X-Received: by 2002:a05:6512:2f1:b0:4d5:ca42:e441 with SMTP id
 m17-20020a05651202f100b004d5ca42e441mr825565lfq.10.1676415202186; Tue, 14 Feb
 2023 14:53:22 -0800 (PST)
MIME-Version: 1.0
References: <20230214215446.never.567-kees@kernel.org>
In-Reply-To: <20230214215446.never.567-kees@kernel.org>
Date: Tue, 14 Feb 2023 16:53:10 -0600
Message-ID: <CAH2r5msOxm0PLoc1fAFjDnaonGVv+E1vyHxBGEh_rtAvJ_qNaQ@mail.gmail.com>
Subject: Re: [PATCH] smb3: Replace smb2pdu 1-element arrays with flex-arrays
To: Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Tom Talpey <tom@talpey.com>, Shyam Prasad N <sprasad@microsoft.com>,
 linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org,
 Paulo Alcantara <pc@cjr.nz>, samba-technical@lists.samba.org,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-hardening@vger.kernel.org,
 Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This seems to have a lot of conflicts with for-next (doesn't apply).
Any chance you could rebase it on linux-next

On Tue, Feb 14, 2023 at 3:57 PM Kees Cook <keescook@chromium.org> wrote:
>
> The kernel is globally removing the ambiguous 0-length and 1-element
> arrays in favor of flexible arrays, so that we can gain both compile-time
> and run-time array bounds checking[1].
>
> Replace the trailing 1-element array with a flexible array in the
> following structures:
>
>         struct smb2_err_rsp
>         struct smb2_tree_connect_req
>         struct smb2_negotiate_rsp
>         struct smb2_sess_setup_req
>         struct smb2_sess_setup_rsp
>         struct smb2_read_req
>         struct smb2_read_rsp
>         struct smb2_write_req
>         struct smb2_write_rsp
>         struct smb2_query_directory_req
>         struct smb2_query_directory_rsp
>         struct smb2_set_info_req
>         struct smb2_change_notify_rsp
>         struct smb2_create_rsp
>         struct smb2_query_info_req
>         struct smb2_query_info_rsp
>
> Replace the trailing 1-element array with a flexible array, but leave
> the existing structure padding:
>
>         struct smb2_file_all_info
>         struct smb2_lock_req
>
> Adjust all related size calculations to match the changes to sizeof().
>
> No machine code output differences are produced after these changes.
>
> [1] For lots of details, see both:
>     https://docs.kernel.org/process/deprecated.html#zero-length-and-one-element-arrays
>     https://people.kernel.org/kees/bounded-flexible-arrays-in-c
>
> Cc: Steve French <sfrench@samba.org>
> Cc: Paulo Alcantara <pc@cjr.nz>
> Cc: Ronnie Sahlberg <lsahlber@redhat.com>
> Cc: Shyam Prasad N <sprasad@microsoft.com>
> Cc: Tom Talpey <tom@talpey.com>
> Cc: Namjae Jeon <linkinjeon@kernel.org>
> Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
> Cc: Gustavo A. R. Silva <gustavoars@kernel.org>
> Cc: linux-cifs@vger.kernel.org
> Cc: samba-technical@lists.samba.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  fs/cifs/smb2file.c        |  2 +-
>  fs/cifs/smb2misc.c        |  2 +-
>  fs/cifs/smb2pdu.c         | 16 +++++++--------
>  fs/cifs/smb2pdu.h         |  2 +-
>  fs/ksmbd/smb2pdu.c        |  6 ++----
>  fs/smbfs_common/smb2pdu.h | 42 ++++++++++++++++++++++-----------------
>  6 files changed, 36 insertions(+), 34 deletions(-)
>
> diff --git a/fs/cifs/smb2file.c b/fs/cifs/smb2file.c
> index 9f1dd04b555a..e0ee96d69d49 100644
> --- a/fs/cifs/smb2file.c
> +++ b/fs/cifs/smb2file.c
> @@ -35,7 +35,7 @@ static struct smb2_symlink_err_rsp *symlink_data(const struct kvec *iov)
>                 len = (u32)err->ErrorContextCount * (offsetof(struct smb2_error_context_rsp,
>                                                               ErrorContextData) +
>                                                      sizeof(struct smb2_symlink_err_rsp));
> -               if (le32_to_cpu(err->ByteCount) < len || iov->iov_len < len + sizeof(*err))
> +               if (le32_to_cpu(err->ByteCount) < len || iov->iov_len < len + sizeof(*err) + 1)
>                         return ERR_PTR(-EINVAL);
>
>                 p = (struct smb2_error_context_rsp *)err->ErrorData;
> diff --git a/fs/cifs/smb2misc.c b/fs/cifs/smb2misc.c
> index 572293c18e16..3935a60db5c3 100644
> --- a/fs/cifs/smb2misc.c
> +++ b/fs/cifs/smb2misc.c
> @@ -113,7 +113,7 @@ static __u32 get_neg_ctxt_len(struct smb2_hdr *hdr, __u32 len,
>         } else if (nc_offset + 1 == non_ctxlen) {
>                 cifs_dbg(FYI, "no SPNEGO security blob in negprot rsp\n");
>                 size_of_pad_before_neg_ctxts = 0;
> -       } else if (non_ctxlen == SMB311_NEGPROT_BASE_SIZE)
> +       } else if (non_ctxlen == SMB311_NEGPROT_BASE_SIZE + 1)
>                 /* has padding, but no SPNEGO blob */
>                 size_of_pad_before_neg_ctxts = nc_offset - non_ctxlen + 1;
>         else
> diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
> index c5cb2639b3f1..22145e7e08f6 100644
> --- a/fs/cifs/smb2pdu.c
> +++ b/fs/cifs/smb2pdu.c
> @@ -1373,7 +1373,7 @@ SMB2_sess_sendreceive(struct SMB2_sess_data *sess_data)
>
>         /* Testing shows that buffer offset must be at location of Buffer[0] */
>         req->SecurityBufferOffset =
> -               cpu_to_le16(sizeof(struct smb2_sess_setup_req) - 1 /* pad */);
> +               cpu_to_le16(sizeof(struct smb2_sess_setup_req));
>         req->SecurityBufferLength = cpu_to_le16(sess_data->iov[1].iov_len);
>
>         memset(&rqst, 0, sizeof(struct smb_rqst));
> @@ -1892,8 +1892,7 @@ SMB2_tcon(const unsigned int xid, struct cifs_ses *ses, const char *tree,
>         iov[0].iov_len = total_len - 1;
>
>         /* Testing shows that buffer offset must be at location of Buffer[0] */
> -       req->PathOffset = cpu_to_le16(sizeof(struct smb2_tree_connect_req)
> -                       - 1 /* pad */);
> +       req->PathOffset = cpu_to_le16(sizeof(struct smb2_tree_connect_req));
>         req->PathLength = cpu_to_le16(unc_path_len - 2);
>         iov[1].iov_base = unc_path;
>         iov[1].iov_len = unc_path_len;
> @@ -3773,7 +3772,7 @@ SMB2_change_notify(const unsigned int xid, struct cifs_tcon *tcon,
>                         ses->Suid, (u8)watch_tree, completion_filter);
>                 /* validate that notify information is plausible */
>                 if ((rsp_iov.iov_base == NULL) ||
> -                   (rsp_iov.iov_len < sizeof(struct smb2_change_notify_rsp)))
> +                   (rsp_iov.iov_len < sizeof(struct smb2_change_notify_rsp) + 1))
>                         goto cnotify_exit;
>
>                 smb_rsp = (struct smb2_change_notify_rsp *)rsp_iov.iov_base;
> @@ -4966,7 +4965,7 @@ int SMB2_query_directory_init(const unsigned int xid,
>         memcpy(bufptr, &asteriks, len);
>
>         req->FileNameOffset =
> -               cpu_to_le16(sizeof(struct smb2_query_directory_req) - 1);
> +               cpu_to_le16(sizeof(struct smb2_query_directory_req));
>         req->FileNameLength = cpu_to_le16(len);
>         /*
>          * BB could be 30 bytes or so longer if we used SMB2 specific
> @@ -5162,8 +5161,7 @@ SMB2_set_info_init(struct cifs_tcon *tcon, struct TCP_Server_Info *server,
>         req->VolatileFileId = volatile_fid;
>         req->AdditionalInformation = cpu_to_le32(additional_info);
>
> -       req->BufferOffset =
> -                       cpu_to_le16(sizeof(struct smb2_set_info_req) - 1);
> +       req->BufferOffset = cpu_to_le16(sizeof(struct smb2_set_info_req));
>         req->BufferLength = cpu_to_le32(*size);
>
>         memcpy(req->Buffer, *data, *size);
> @@ -5397,9 +5395,9 @@ build_qfs_info_req(struct kvec *iov, struct cifs_tcon *tcon,
>         req->VolatileFileId = volatile_fid;
>         /* 1 for pad */
>         req->InputBufferOffset =
> -                       cpu_to_le16(sizeof(struct smb2_query_info_req) - 1);
> +                       cpu_to_le16(sizeof(struct smb2_query_info_req));
>         req->OutputBufferLength = cpu_to_le32(
> -               outbuf_len + sizeof(struct smb2_query_info_rsp) - 1);
> +               outbuf_len + sizeof(struct smb2_query_info_rsp));
>
>         iov->iov_base = (char *)req;
>         iov->iov_len = total_len;
> diff --git a/fs/cifs/smb2pdu.h b/fs/cifs/smb2pdu.h
> index 1237bb86e93a..a5773a06aba8 100644
> --- a/fs/cifs/smb2pdu.h
> +++ b/fs/cifs/smb2pdu.h
> @@ -57,7 +57,7 @@ struct smb2_rdma_crypto_transform {
>  #define COMPOUND_FID 0xFFFFFFFFFFFFFFFFULL
>
>  #define SMB2_SYMLINK_STRUCT_SIZE \
> -       (sizeof(struct smb2_err_rsp) - 1 + sizeof(struct smb2_symlink_err_rsp))
> +       (sizeof(struct smb2_err_rsp) + sizeof(struct smb2_symlink_err_rsp))
>
>  #define SYMLINK_ERROR_TAG 0x4c4d5953
>
> diff --git a/fs/ksmbd/smb2pdu.c b/fs/ksmbd/smb2pdu.c
> index 619857af0cc2..aef72077fc75 100644
> --- a/fs/ksmbd/smb2pdu.c
> +++ b/fs/ksmbd/smb2pdu.c
> @@ -274,8 +274,7 @@ int init_smb2_neg_rsp(struct ksmbd_work *work)
>                 le16_to_cpu(rsp->SecurityBufferOffset));
>         inc_rfc1001_len(work->response_buf,
>                         sizeof(struct smb2_negotiate_rsp) -
> -                       sizeof(struct smb2_hdr) - sizeof(rsp->Buffer) +
> -                       AUTH_GSS_LENGTH);
> +                       sizeof(struct smb2_hdr) + AUTH_GSS_LENGTH);
>         rsp->SecurityMode = SMB2_NEGOTIATE_SIGNING_ENABLED_LE;
>         if (server_conf.signing == KSMBD_CONFIG_OPT_MANDATORY)
>                 rsp->SecurityMode |= SMB2_NEGOTIATE_SIGNING_REQUIRED_LE;
> @@ -1205,8 +1204,7 @@ int smb2_handle_negotiate(struct ksmbd_work *work)
>         ksmbd_copy_gss_neg_header((char *)(&rsp->hdr) +
>                                   le16_to_cpu(rsp->SecurityBufferOffset));
>         inc_rfc1001_len(work->response_buf, sizeof(struct smb2_negotiate_rsp) -
> -                       sizeof(struct smb2_hdr) - sizeof(rsp->Buffer) +
> -                        AUTH_GSS_LENGTH);
> +                       sizeof(struct smb2_hdr) + AUTH_GSS_LENGTH);
>         rsp->SecurityMode = SMB2_NEGOTIATE_SIGNING_ENABLED_LE;
>         conn->use_spnego = true;
>
> diff --git a/fs/smbfs_common/smb2pdu.h b/fs/smbfs_common/smb2pdu.h
> index 7d605db3bb3b..ace133cf6072 100644
> --- a/fs/smbfs_common/smb2pdu.h
> +++ b/fs/smbfs_common/smb2pdu.h
> @@ -167,7 +167,7 @@ struct smb2_err_rsp {
>         __u8   ErrorContextCount;
>         __u8   Reserved;
>         __le32 ByteCount;  /* even if zero, at least one byte follows */
> -       __u8   ErrorData[1];  /* variable length */
> +       __u8   ErrorData[];  /* variable length */
>  } __packed;
>
>  #define SMB3_AES_CCM_NONCE 11
> @@ -308,7 +308,7 @@ struct smb2_tree_connect_req {
>         __le16 Flags;           /* Flags in SMB3.1.1 */
>         __le16 PathOffset;
>         __le16 PathLength;
> -       __u8   Buffer[1];       /* variable length */
> +       __u8   Buffer[];        /* variable length */
>  } __packed;
>
>  /* Possible ShareType values */
> @@ -595,7 +595,7 @@ struct smb2_negotiate_rsp {
>         __le16 SecurityBufferOffset;
>         __le16 SecurityBufferLength;
>         __le32 NegotiateContextOffset;  /* Pre:SMB3.1.1 was reserved/ignored */
> -       __u8   Buffer[1];       /* variable length GSS security buffer */
> +       __u8   Buffer[];        /* variable length GSS security buffer */
>  } __packed;
>
>
> @@ -616,7 +616,7 @@ struct smb2_sess_setup_req {
>         __le16 SecurityBufferOffset;
>         __le16 SecurityBufferLength;
>         __le64 PreviousSessionId;
> -       __u8   Buffer[1];       /* variable length GSS security buffer */
> +       __u8   Buffer[];        /* variable length GSS security buffer */
>  } __packed;
>
>  /* Currently defined SessionFlags */
> @@ -633,7 +633,7 @@ struct smb2_sess_setup_rsp {
>         __le16 SessionFlags;
>         __le16 SecurityBufferOffset;
>         __le16 SecurityBufferLength;
> -       __u8   Buffer[1];       /* variable length GSS security buffer */
> +       __u8   Buffer[];        /* variable length GSS security buffer */
>  } __packed;
>
>
> @@ -715,7 +715,7 @@ struct smb2_read_req {
>         __le32 RemainingBytes;
>         __le16 ReadChannelInfoOffset;
>         __le16 ReadChannelInfoLength;
> -       __u8   Buffer[1];
> +       __u8   Buffer[];
>  } __packed;
>
>  /* Read flags */
> @@ -730,7 +730,7 @@ struct smb2_read_rsp {
>         __le32 DataLength;
>         __le32 DataRemaining;
>         __le32 Flags;
> -       __u8   Buffer[1];
> +       __u8   Buffer[];
>  } __packed;
>
>
> @@ -754,7 +754,7 @@ struct smb2_write_req {
>         __le16 WriteChannelInfoOffset;
>         __le16 WriteChannelInfoLength;
>         __le32 Flags;
> -       __u8   Buffer[1];
> +       __u8   Buffer[];
>  } __packed;
>
>  struct smb2_write_rsp {
> @@ -765,7 +765,7 @@ struct smb2_write_rsp {
>         __le32 DataLength;
>         __le32 DataRemaining;
>         __u32  Reserved2;
> -       __u8   Buffer[1];
> +       __u8   Buffer[];
>  } __packed;
>
>
> @@ -812,7 +812,10 @@ struct smb2_lock_req {
>         __u64  PersistentFileId;
>         __u64  VolatileFileId;
>         /* Followed by at least one */
> -       struct smb2_lock_element locks[1];
> +       union {
> +               struct smb2_lock_element lock;
> +               DECLARE_FLEX_ARRAY(struct smb2_lock_element, locks);
> +       };
>  } __packed;
>
>  struct smb2_lock_rsp {
> @@ -866,7 +869,7 @@ struct smb2_query_directory_req {
>         __le16 FileNameOffset;
>         __le16 FileNameLength;
>         __le32 OutputBufferLength;
> -       __u8   Buffer[1];
> +       __u8   Buffer[];
>  } __packed;
>
>  struct smb2_query_directory_rsp {
> @@ -874,7 +877,7 @@ struct smb2_query_directory_rsp {
>         __le16 StructureSize; /* Must be 9 */
>         __le16 OutputBufferOffset;
>         __le32 OutputBufferLength;
> -       __u8   Buffer[1];
> +       __u8   Buffer[];
>  } __packed;
>
>  /*
> @@ -897,7 +900,7 @@ struct smb2_set_info_req {
>         __le32 AdditionalInformation;
>         __u64  PersistentFileId;
>         __u64  VolatileFileId;
> -       __u8   Buffer[1];
> +       __u8   Buffer[];
>  } __packed;
>
>  struct smb2_set_info_rsp {
> @@ -952,7 +955,7 @@ struct smb2_change_notify_rsp {
>         __le16  StructureSize;  /* Must be 9 */
>         __le16  OutputBufferOffset;
>         __le32  OutputBufferLength;
> -       __u8    Buffer[1]; /* array of file notify structs */
> +       __u8    Buffer[]; /* array of file notify structs */
>  } __packed;
>
>
> @@ -1158,7 +1161,7 @@ struct smb2_create_rsp {
>         __u64  VolatileFileId;
>         __le32 CreateContextsOffset;
>         __le32 CreateContextsLength;
> -       __u8   Buffer[1];
> +       __u8   Buffer[];
>  } __packed;
>
>  struct create_posix {
> @@ -1501,7 +1504,7 @@ struct smb2_query_info_req {
>         __le32 Flags;
>         __u64  PersistentFileId;
>         __u64  VolatileFileId;
> -       __u8   Buffer[1];
> +       __u8   Buffer[];
>  } __packed;
>
>  struct smb2_query_info_rsp {
> @@ -1509,7 +1512,7 @@ struct smb2_query_info_rsp {
>         __le16 StructureSize; /* Must be 9 */
>         __le16 OutputBufferOffset;
>         __le32 OutputBufferLength;
> -       __u8   Buffer[1];
> +       __u8   Buffer[];
>  } __packed;
>
>  /*
> @@ -1570,7 +1573,10 @@ struct smb2_file_all_info { /* data block encoding of response to level 18 */
>         __le32 Mode;
>         __le32 AlignmentRequirement;
>         __le32 FileNameLength;
> -       char   FileName[1];
> +       union {
> +               char __pad;     /* Legacy structure padding */
> +               DECLARE_FLEX_ARRAY(char, FileName);
> +       };
>  } __packed; /* level 18 Query */
>
>  struct smb2_file_eof_info { /* encoding of request for level 10 */
> --
> 2.34.1
>


-- 
Thanks,

Steve

