Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A217617CFE9
	for <lists+samba-technical@lfdr.de>; Sat,  7 Mar 2020 21:05:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=/rR/M+LiYBCWNmfBPwlVH/wzXuH1CUAi97im8uVf3hE=; b=mZn+WD+46efvcwkFrJ5pAU5KW4
	3GUE6cRjj812wD9QX44ZZWzQjkP78D84p4hSHcd3FknX9EztuxPndT9Lx21so3pxEFJ+QPkJbfB++
	l7kN5bHQTJPgmCsONXGvvTELfIxwf3kuPvYsQCdwKltFPh2fBEN+hPWTIpcA34pY/TAVwmxaoTpQx
	l2oc3ZvEJN8YKGH6TbjUzjJugH2XCLpJob/J6FdpKwMSErJ/WX31Eq9eHQr6QG3ZvJbEhOZ2/LkSS
	ggk4fRfn16ApxVVh1hpyUzw1dpoq1seIIzZjSLPTDMNZz3JCdjNLHV4MjKIb+I6u9iFZo3dNWxKe2
	irCyNOlw==;
Received: from localhost ([::1]:59784 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jAfgZ-00FOMZ-Iy; Sat, 07 Mar 2020 20:04:35 +0000
Received: from mail-yw1-xc41.google.com ([2607:f8b0:4864:20::c41]:43546) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jAfgU-00FOMS-VL
 for samba-technical@lists.samba.org; Sat, 07 Mar 2020 20:04:33 +0000
Received: by mail-yw1-xc41.google.com with SMTP id p69so5841154ywh.10
 for <samba-technical@lists.samba.org>; Sat, 07 Mar 2020 12:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/rR/M+LiYBCWNmfBPwlVH/wzXuH1CUAi97im8uVf3hE=;
 b=IzCg+DgshWulZUq80/28tRdF0HPsUS1Hft+N9NAOtOIQfjvPpzSw6nk1B8nb5dcUwd
 SidMdfdrwiPQsseOyQWc/pzvrYdtxtGGv3ICelDqvYBOcy/K5AytXw9F4J6Js7EMDVfw
 rSnVOSA3MlLgvpIb81Zgg4hviSNaQhgSLgDF3B4O4TaZAs4udYbm+ZtwWfaQipLSEZ9l
 qhcRd/QlJ3DxGog5KejIctKwcYosnKv3/HOibeBi6+EKQWlSIL6wfGKnPPkO4gC1fQfl
 p3vozBbvreU2YiEfNiy1d79KuPrpu3ZQzvR1qQJ0HgvP12J0ZDfy1451P3lPQuC7TDQL
 NrTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/rR/M+LiYBCWNmfBPwlVH/wzXuH1CUAi97im8uVf3hE=;
 b=LWkejoSM8rWY26jjeJgytDRCj1esrWWCBbobS9PQ+U0Vqo6xI+4cqjofjhGOKDq/bO
 qR01gSQNFVZFCcXtn0CKQx8mp0VK9ZEjfpLrlj/QXBkCTHxtCKvZIr/m33MjZXpxhRKL
 rmp4sOKeyIWTg7knMnoF4H8gBnrjSq0CMGEx9nCx0mMVthrOAtaNkGOAO2+gHLk4MLZX
 m+Q+CmwKmpo+hyb+W+OUbaSYCw2kf8OKoQZlUX2HyGmSM7V7c0iV3WQhOoJuhY4IU/lx
 +K0AWInzygqMQ0eI6lBooe2pO6+7BTAfO/KataHi0+zVmhuR/DEuUaXolHjFiKLbgy/P
 OSPg==
X-Gm-Message-State: ANhLgQ1tCOb2VHQ9KP8+c4QZWwXUJkmaJ/mfIBRMPL6rC4511Zwv/TfH
 +lSKqfOimqAt5a3aDuFNnOpkyUUgLf7z2OpclGg=
X-Google-Smtp-Source: ADFU+vuBTktkE7VEjjPZrONxkb/cDFSxDE0LzO5UJB3I8x3It6D/F0K7wDZKzC7QuR0lnyvVKPUOepBbnLb0aP1rTS4=
X-Received: by 2002:a0d:f583:: with SMTP id
 e125mr10608364ywf.176.1583611467702; 
 Sat, 07 Mar 2020 12:04:27 -0800 (PST)
MIME-Version: 1.0
References: <20200306221740.GA31410@embeddedor>
In-Reply-To: <20200306221740.GA31410@embeddedor>
Date: Sat, 7 Mar 2020 14:04:17 -0600
Message-ID: <CAH2r5muV_W9T4s1HYK-Bv+XVAwz8tqgKORnzMHCpKi8VUW0EfQ@mail.gmail.com>
Subject: Re: [PATCH][next] cifs: cifspdu.h: Replace zero-length array with
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Fri, Mar 6, 2020 at 5:01 PM Gustavo A. R. Silva
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
>  fs/cifs/cifspdu.h | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/fs/cifs/cifspdu.h b/fs/cifs/cifspdu.h
> index 8e15887d1f1f..593d826820c3 100644
> --- a/fs/cifs/cifspdu.h
> +++ b/fs/cifs/cifspdu.h
> @@ -1021,7 +1021,7 @@ typedef struct smb_com_writex_req {
>         __le16 ByteCount;
>         __u8 Pad;               /* BB check for whether padded to DWORD
>                                    boundary and optimum performance here */
> -       char Data[0];
> +       char Data[];
>  } __attribute__((packed)) WRITEX_REQ;
>
>  typedef struct smb_com_write_req {
> @@ -1041,7 +1041,7 @@ typedef struct smb_com_write_req {
>         __le16 ByteCount;
>         __u8 Pad;               /* BB check for whether padded to DWORD
>                                    boundary and optimum performance here */
> -       char Data[0];
> +       char Data[];
>  } __attribute__((packed)) WRITE_REQ;
>
>  typedef struct smb_com_write_rsp {
> @@ -1306,7 +1306,7 @@ typedef struct smb_com_ntransact_req {
>         /* SetupCount words follow then */
>         __le16 ByteCount;
>         __u8 Pad[3];
> -       __u8 Parms[0];
> +       __u8 Parms[];
>  } __attribute__((packed)) NTRANSACT_REQ;
>
>  typedef struct smb_com_ntransact_rsp {
> @@ -1523,7 +1523,7 @@ struct file_notify_information {
>         __le32 NextEntryOffset;
>         __le32 Action;
>         __le32 FileNameLength;
> -       __u8  FileName[0];
> +       __u8  FileName[];
>  } __attribute__((packed));
>
>  /* For IO_REPARSE_TAG_SYMLINK */
> @@ -1536,7 +1536,7 @@ struct reparse_symlink_data {
>         __le16  PrintNameOffset;
>         __le16  PrintNameLength;
>         __le32  Flags;
> -       char    PathBuffer[0];
> +       char    PathBuffer[];
>  } __attribute__((packed));
>
>  /* Flag above */
> @@ -1553,7 +1553,7 @@ struct reparse_posix_data {
>         __le16  ReparseDataLength;
>         __u16   Reserved;
>         __le64  InodeType; /* LNK, FIFO, CHR etc. */
> -       char    PathBuffer[0];
> +       char    PathBuffer[];
>  } __attribute__((packed));
>
>  struct cifs_quota_data {
> @@ -1762,7 +1762,7 @@ struct set_file_rename {
>         __le32 overwrite;   /* 1 = overwrite dest */
>         __u32 root_fid;   /* zero */
>         __le32 target_name_len;
> -       char  target_name[0];  /* Must be unicode */
> +       char  target_name[];  /* Must be unicode */
>  } __attribute__((packed));
>
>  struct smb_com_transaction2_sfi_req {
> @@ -2451,7 +2451,7 @@ struct cifs_posix_acl { /* access conrol list  (ACL) */
>         __le16  version;
>         __le16  access_entry_count;  /* access ACL - count of entries */
>         __le16  default_entry_count; /* default ACL - count of entries */
> -       struct cifs_posix_ace ace_array[0];
> +       struct cifs_posix_ace ace_array[];
>         /* followed by
>         struct cifs_posix_ace default_ace_arraay[] */
>  } __attribute__((packed));  /* level 0x204 */
> @@ -2757,7 +2757,7 @@ typedef struct file_xattr_info {
>         /* BB do we need another field for flags? BB */
>         __u32 xattr_name_len;
>         __u32 xattr_value_len;
> -       char  xattr_name[0];
> +       char  xattr_name[];
>         /* followed by xattr_value[xattr_value_len], no pad */
>  } __attribute__((packed)) FILE_XATTR_INFO; /* extended attribute info
>                                               level 0x205 */
> --
> 2.25.0
>


-- 
Thanks,

Steve

