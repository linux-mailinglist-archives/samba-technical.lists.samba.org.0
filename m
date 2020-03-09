Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A6917EB65
	for <lists+samba-technical@lfdr.de>; Mon,  9 Mar 2020 22:43:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=G2zpwWsDL0R2ZtEs8ElyKdMax9QQFFWKQw9uTXmNUQc=; b=MpWlHpA7YOAQ2va5nSUjAGmuqU
	uw5DcpUkaifgOL2ktX870qm/645Hz6DkVkEq2kvv73nHNLtplL8ofKBuxa47DQpyNPyYuVEvh98AA
	LJG4M412ipmEBEknJJwLu6hErVvBUNGe8JePlcYoyMp/q77XbZlNTaE3L5X0uc+o9cnNyopKuYj+Q
	ifKMZxgD9gOXzKSNXWypZaoTUyR2d0q9F0PUNeYUJ0swXTWEyBlUq8Y/CjNLLJeVBUZbqsgK+KF83
	vJn4V1mfviHzd/8zFV9Yxn1THLIW1Wq97i+b7CLPeR7HDdOXxRbx9amjsdhHBd4kPz2vyLNZQFYFx
	uDBWWiFw==;
Received: from ip6-localhost ([::1]:18814 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jBQA1-00FZBx-Q2; Mon, 09 Mar 2020 21:42:05 +0000
Received: from mail-yw1-xc2d.google.com ([2607:f8b0:4864:20::c2d]:33241) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jBQ9v-00FZBp-7n
 for samba-technical@lists.samba.org; Mon, 09 Mar 2020 21:42:02 +0000
Received: by mail-yw1-xc2d.google.com with SMTP id j186so11755361ywe.0
 for <samba-technical@lists.samba.org>; Mon, 09 Mar 2020 14:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G2zpwWsDL0R2ZtEs8ElyKdMax9QQFFWKQw9uTXmNUQc=;
 b=ZE1Cm41QgRzQnP/T1EaEvjr/uVHaOA7IyQKc2V0TjfgQ3tMIyjnTZGdAdIU04Ugsv+
 SGYrlkqGWazTPvajPaMN6JKLBzNuQk6TLx1fhgml8cea85kIpGOGMl0vA6X4nbgrqzZF
 V3v6Z+xlCsKIyFrS9qG0rBMH/9HbbwJDNY0XkLjc3yCK9xLXU1PmT4H0UxspbTuyXLTI
 dbYMYXg/KJZiLa5P7Q1Q3mJG3X9pTd7e9X7Dl/fZko3mJ+A2O4IEWPnmJ962JDBd6CeZ
 UmsoZ8SB8Lv9iWEssO9wHOjND9fjXb8RrshJ3u3GnopXIeKRnlZ7iC6cHZ6XLQSKmTZe
 jiFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G2zpwWsDL0R2ZtEs8ElyKdMax9QQFFWKQw9uTXmNUQc=;
 b=XAHcOHSlWAA0JDd70w6MEyBYDBBHX5iTe4zPFBOfOapoaCI8VmYyyZoe8oziwp8ZMv
 gu/HTdMGh2fyUKyC5JdzMv7AJq3HlGXOqmNjrJoUtBRgd9AOBQ904qf/4/i09LT2NfwX
 6W22WwLGR4H57mwMeimfuQ0vYn1ltKT1K45a/vo/vOxMNnQTuGHlLrhMP3aULCWlhiTk
 MrtKRaanulNjZprOR5L8Th6WH+pwGXXO/YB4tIeGnyOTiLh9blo3OUKXjtMIaPWFKK1U
 RoKEhsPW8PcmvBfx8EZFeVuSkf3n6vMji5YKW/lfZgm7e6oHCj8IRxMP58C0MhRNp6to
 6gmA==
X-Gm-Message-State: ANhLgQ1tswUE5bPx9hCVWKLFH8HzNk2bkIa4F8FXVZlJo/1NPY+0BQEp
 7aiKxi1V8+lqXxVZndI5H3s7TjV2+h5jicvaBtE=
X-Google-Smtp-Source: ADFU+vuxrn472hyxr2191ZqElzVgk8uBrtMonf6EUZFAfQFSNZ1MGtvFHCzZTgbjPL7O2yohmDUTVcIM/ylRsZvB0OQ=
X-Received: by 2002:a0d:e297:: with SMTP id
 l145mr19809246ywe.132.1583790114464; 
 Mon, 09 Mar 2020 14:41:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200309154451.GA31357@embeddedor>
In-Reply-To: <20200309154451.GA31357@embeddedor>
Date: Mon, 9 Mar 2020 16:41:43 -0500
Message-ID: <CAH2r5muo01BKhUuvCAKe3m2hEKO9S-V_gJBbnprDQ9eh7n2M2Q@mail.gmail.com>
Subject: Re: [PATCH][next] cifs: smb2pdu.h: Replace zero-length array with
 flexible-array member
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
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
Cc: Steve French <sfrench@samba.org>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Mon, Mar 9, 2020 at 11:04 AM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
>
> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:
>
> struct foo {
>         int stuff;
>         struct boo array[];
> };
>
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertently introduced[3] to the codebase from now on.
>
> Also, notice that, dynamic memory allocations won't be affected by
> this change:
>
> "Flexible array members have incomplete type, and so the sizeof operator
> may not be applied. As a quirk of the original implementation of
> zero-length arrays, sizeof evaluates to zero."[1]
>
> This issue was found with the help of Coccinelle.
>
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
>
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  fs/cifs/smb2pdu.h | 38 +++++++++++++++++++-------------------
>  1 file changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/fs/cifs/smb2pdu.h b/fs/cifs/smb2pdu.h
> index ad14b8505b4d..817bc0531536 100644
> --- a/fs/cifs/smb2pdu.h
> +++ b/fs/cifs/smb2pdu.h
> @@ -182,7 +182,7 @@ struct smb2_symlink_err_rsp {
>         __le16 PrintNameOffset;
>         __le16 PrintNameLength;
>         __le32 Flags;
> -       __u8  PathBuffer[0];
> +       __u8  PathBuffer[];
>  } __packed;
>
>  /* SMB 3.1.1 and later dialects. See MS-SMB2 section 2.2.2.1 */
> @@ -210,7 +210,7 @@ struct share_redirect_error_context_rsp {
>         __le16 Flags;
>         __le16 TargetType;
>         __le32 IPAddrCount;
> -       struct move_dst_ipaddr IpAddrMoveList[0];
> +       struct move_dst_ipaddr IpAddrMoveList[];
>         /* __u8 ResourceName[] */ /* Name of share as counted Unicode string */
>  } __packed;
>
> @@ -326,7 +326,7 @@ struct smb2_netname_neg_context {
>         __le16  ContextType; /* 0x100 */
>         __le16  DataLength;
>         __le32  Reserved;
> -       __le16  NetName[0]; /* hostname of target converted to UCS-2 */
> +       __le16  NetName[]; /* hostname of target converted to UCS-2 */
>  } __packed;
>
>  #define POSIX_CTXT_DATA_LEN    16
> @@ -421,13 +421,13 @@ struct tree_connect_contexts {
>         __le16 ContextType;
>         __le16 DataLength;
>         __le32 Reserved;
> -       __u8   Data[0];
> +       __u8   Data[];
>  } __packed;
>
>  /* Remoted identity tree connect context structures - see MS-SMB2 2.2.9.2.1 */
>  struct smb3_blob_data {
>         __le16 BlobSize;
> -       __u8   BlobData[0];
> +       __u8   BlobData[];
>  } __packed;
>
>  /* Valid values for Attr */
> @@ -477,14 +477,14 @@ struct remoted_identity_tcon_context {
>         __le16 DeviceGroups; /* offset to SID_ARRAY_DATA struct */
>         __le16 UserClaims; /* offset to BLOB_DATA struct */
>         __le16 DeviceClaims; /* offset to BLOB_DATA struct */
> -       __u8   TicketInfo[0]; /* variable length buf - remoted identity data */
> +       __u8   TicketInfo[]; /* variable length buf - remoted identity data */
>  } __packed;
>
>  struct smb2_tree_connect_req_extension {
>         __le32 TreeConnectContextOffset;
>         __le16 TreeConnectContextCount;
>         __u8  Reserved[10];
> -       __u8  PathName[0]; /* variable sized array */
> +       __u8  PathName[]; /* variable sized array */
>         /* followed by array of TreeConnectContexts */
>  } __packed;
>
> @@ -689,7 +689,7 @@ struct smb2_create_req {
>         __le16 NameLength;
>         __le32 CreateContextsOffset;
>         __le32 CreateContextsLength;
> -       __u8   Buffer[0];
> +       __u8   Buffer[];
>  } __packed;
>
>  /*
> @@ -727,7 +727,7 @@ struct create_context {
>         __le16 Reserved;
>         __le16 DataOffset;
>         __le32 DataLength;
> -       __u8 Buffer[0];
> +       __u8 Buffer[];
>  } __packed;
>
>  #define SMB2_LEASE_READ_CACHING_HE     0x01
> @@ -869,7 +869,7 @@ struct crt_sd_ctxt {
>  struct resume_key_req {
>         char ResumeKey[COPY_CHUNK_RES_KEY_SIZE];
>         __le32  ContextLength;  /* MBZ */
> -       char    Context[0];     /* ignored, Windows sets to 4 bytes of zero */
> +       char    Context[];      /* ignored, Windows sets to 4 bytes of zero */
>  } __packed;
>
>  /* this goes in the ioctl buffer when doing a copychunk request */
> @@ -931,7 +931,7 @@ struct reparse_data_buffer {
>         __le32  ReparseTag;
>         __le16  ReparseDataLength;
>         __u16   Reserved;
> -       __u8    DataBuffer[0]; /* Variable Length */
> +       __u8    DataBuffer[]; /* Variable Length */
>  } __packed;
>
>  struct reparse_guid_data_buffer {
> @@ -939,7 +939,7 @@ struct reparse_guid_data_buffer {
>         __le16  ReparseDataLength;
>         __u16   Reserved;
>         __u8    ReparseGuid[16];
> -       __u8    DataBuffer[0]; /* Variable Length */
> +       __u8    DataBuffer[]; /* Variable Length */
>  } __packed;
>
>  struct reparse_mount_point_data_buffer {
> @@ -950,7 +950,7 @@ struct reparse_mount_point_data_buffer {
>         __le16  SubstituteNameLength;
>         __le16  PrintNameOffset;
>         __le16  PrintNameLength;
> -       __u8    PathBuffer[0]; /* Variable Length */
> +       __u8    PathBuffer[]; /* Variable Length */
>  } __packed;
>
>  #define SYMLINK_FLAG_RELATIVE 0x00000001
> @@ -964,7 +964,7 @@ struct reparse_symlink_data_buffer {
>         __le16  PrintNameOffset;
>         __le16  PrintNameLength;
>         __le32  Flags;
> -       __u8    PathBuffer[0]; /* Variable Length */
> +       __u8    PathBuffer[]; /* Variable Length */
>  } __packed;
>
>  /* See MS-FSCC 2.1.2.6 and cifspdu.h for struct reparse_posix_data */
> @@ -1066,7 +1066,7 @@ struct smb2_ioctl_req {
>         __le32 MaxOutputResponse;
>         __le32 Flags;
>         __u32  Reserved2;
> -       __u8   Buffer[0];
> +       __u8   Buffer[];
>  } __packed;
>
>  struct smb2_ioctl_rsp {
> @@ -1469,7 +1469,7 @@ struct smb3_fs_vol_info {
>         __le32  VolumeLabelLength; /* includes trailing null */
>         __u8    SupportsObjects; /* True if eg like NTFS, supports objects */
>         __u8    Reserved;
> -       __u8    VolumeLabel[0]; /* variable len */
> +       __u8    VolumeLabel[]; /* variable len */
>  } __packed;
>
>  /* partial list of QUERY INFO levels */
> @@ -1531,7 +1531,7 @@ struct smb2_file_rename_info { /* encoding of request for level 10 */
>         __u8   Reserved[7];
>         __u64  RootDirectory;  /* MBZ for network operations (why says spec?) */
>         __le32 FileNameLength;
> -       char   FileName[0];     /* New name to be assigned */
> +       char   FileName[];     /* New name to be assigned */
>  } __packed; /* level 10 Set */
>
>  struct smb2_file_link_info { /* encoding of request for level 11 */
> @@ -1540,7 +1540,7 @@ struct smb2_file_link_info { /* encoding of request for level 11 */
>         __u8   Reserved[7];
>         __u64  RootDirectory;  /* MBZ for network operations (why says spec?) */
>         __le32 FileNameLength;
> -       char   FileName[0];     /* Name to be assigned to new link */
> +       char   FileName[];     /* Name to be assigned to new link */
>  } __packed; /* level 11 Set */
>
>  struct smb2_file_full_ea_info { /* encoding of response for level 15 */
> @@ -1548,7 +1548,7 @@ struct smb2_file_full_ea_info { /* encoding of response for level 15 */
>         __u8   flags;
>         __u8   ea_name_length;
>         __le16 ea_value_length;
> -       char   ea_data[0]; /* \0 terminated name plus value */
> +       char   ea_data[]; /* \0 terminated name plus value */
>  } __packed; /* level 15 Set */
>
>  /*
> --
> 2.25.0
>


-- 
Thanks,

Steve

