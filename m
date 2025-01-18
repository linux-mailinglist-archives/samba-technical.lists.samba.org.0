Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BB845A15E9A
	for <lists+samba-technical@lfdr.de>; Sat, 18 Jan 2025 20:34:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=W7Oyn69SMQEPAtr/12a6Ym0htpFikla3Rih6I5+rYZ0=; b=Ol4kTDqo/pM2spmOmXLftZkWWg
	Lvhl57rvu63RLyB6991mKsFhUpI3tpy91ZZRsPy/x9TaAPXO85d4U61mTGcUh8vQuhBfqgEQrLdny
	locjhLgpSHB8Fbt/b5PsxwvrEwneBUHvqpPpsNfTZf/FXRiottxNqBAK6hf/KmDciVdRoW3Djsjqp
	gfVhkUZqSq297bu+Wm/sFKGgzMezo/XUltk52OdcAgU+HiAe7b9tT8nPpSdL7YahgcwywJ/GC+E8E
	SKHh66tntVTy5HTKZKEnaXwvWBfEwNQ+9AyGl+g6YMihBuoW9pjpv0uUoAysFqXOY6Wskeg1Ut46r
	oJDc6HfA==;
Received: from ip6-localhost ([::1]:44016 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tZEZS-008Z2X-VF; Sat, 18 Jan 2025 19:33:27 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:46250) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tZEZN-008Z2Q-U8
 for samba-technical@lists.samba.org; Sat, 18 Jan 2025 19:33:25 +0000
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-54021daa6cbso3461070e87.0
 for <samba-technical@lists.samba.org>; Sat, 18 Jan 2025 11:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737228800; x=1737833600; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W7Oyn69SMQEPAtr/12a6Ym0htpFikla3Rih6I5+rYZ0=;
 b=MUqoKN0a0zG5sZ/8OzvZ/Dlh+dEKxdwGWW9Z4Ak9udDqcLOvOVv5PwPyXfZeBs+FYP
 T2Kedqra5s+UYxjzorP+cnSve/vfJaF0BIKk26SIv/CVHxOgZRZGfG3nh9RWhptuZDsr
 djmk9Z4fiDyKTjld+vTXGfoT/X7m/dCBwO3i6Blktt9AK7kjN5kJ8y6ToCeodIpBFtMl
 T3iMoCoGUkSBJ/xQ86EVaMVc3K1lhIFrRR/GyWeDzIP9ar2VY5NDLbBNJ2LI1ulE/Abw
 gIvMKrTXn+xdUhRFqzeavgM2O7Fu0NbC6SpLnKEaidmqb/He8oS93GuEm2IWqVJRE4Z5
 XvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737228800; x=1737833600;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W7Oyn69SMQEPAtr/12a6Ym0htpFikla3Rih6I5+rYZ0=;
 b=EZo9uyj0RBjw8nvF8IFkscqJlk1IFus9otU7pewwidYndcrSuwh1EbSwQPY5Bszlv4
 OvvssT9tDah1aNHTHJB5B1S2Vtb/4Xg5igMfUU0Xjn5N1cdCJ3KE2WwEFxPS7RSbMjky
 WLwDLDkTdaLijGk8tjnOBh1bbiko4l3dESnoL7ijLbwWJ/Yi9Lnb7fu67VRGlGy0oQ9k
 QJqJUXyESvDGJhA/0J+LnVIqXylJNWmk7c3rUQhk+gLVYHl48Q37okEP3HgEyYFOCnP/
 jghQ8VMlWBa9nLVf2IUJKXn4xw5KJ2KfzdDDE6UBfEFNth2d+tqxjh6eDzj1CXA2mSV3
 MukQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4OIbe+dL8CCitPPhITmtqXFlkZv2zterA3AZZ1i/Vpdj2gT6MpqZW8gswXL/ge5jIgWobWVjzvfZHL7UjteM=@lists.samba.org
X-Gm-Message-State: AOJu0YzbWWuseBvc5RA13cxEUN86GsLEqgZU/Yv5FYTHD08d8J6EoWTu
 rWvQOnBVWQ6Orbszm0r72UGdBBHjihOA3ZYqqcw5qlr22czxpDVshhxA08nVP/jvhbtGM29fAQm
 49CTirXeRnvfkwr8Dp1jQh+jSbG4=
X-Gm-Gg: ASbGncsiVuZaSeMZnGQd48adaUkASD5gHDXXhu6ZPYGDBYf5Zw9enClKWKMB1cD6Oqj
 +STdmaJeyqgg+kkOKHB2se2fsf0WNcjwN4Uz3NtkYCNsQ81NMYdWqELB3AkVC2bFwoidsB+LGC3
 rmFSU2SVpPjQ==
X-Google-Smtp-Source: AGHT+IHJ6JyE2OP7a6OtC0Dftnxkf2oOPfTsXgGG6YaJAXL6ZXgHC9MMSBipkVIRmXQRU5RSL+9XvXY/4Rj+DU85MBI=
X-Received: by 2002:a05:6512:b94:b0:542:7217:361a with SMTP id
 2adb3069b0e04-5439c22c3bemr2154552e87.10.1737228799599; Sat, 18 Jan 2025
 11:33:19 -0800 (PST)
MIME-Version: 1.0
References: <20250118123528.3342182-1-buaajxlj@163.com>
In-Reply-To: <20250118123528.3342182-1-buaajxlj@163.com>
Date: Sat, 18 Jan 2025 13:33:07 -0600
X-Gm-Features: AbW1kvYHBHgsZWI7BzBH9WuuK9Af-17TbFKMiC9niwz7OStv8ibFhtcy--ryEUQ
Message-ID: <CAH2r5muQG67z3MEh2gp_Ww=yv1AAZxHORydR9x0ABCeufUjfWQ@mail.gmail.com>
Subject: Re: [PATCH v2] smb: client: correctly handle ErrorContextData as a
 flexible array
To: Liang Jie <buaajxlj@163.com>
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
 linux-cifs@vger.kernel.org, Liang Jie <liangjie@lixiang.com>,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 fanggeng@lixiang.com, sfrench@samba.org, bharathsm@microsoft.com,
 yangchen11@lixiang.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

updated patch in for-next now


On Sat, Jan 18, 2025 at 6:37=E2=80=AFAM Liang Jie <buaajxlj@163.com> wrote:
>
> From: Liang Jie <liangjie@lixiang.com>
>
> The `smb2_symlink_err_rsp` structure was previously defined with
> `ErrorContextData` as a single `__u8` byte. However, the `ErrorContextDat=
a`
> field is intended to be a variable-length array based on `ErrorDataLength=
`.
> This mismatch leads to incorrect pointer arithmetic and potential memory
> access issues when processing error contexts.
>
> Updates the `ErrorContextData` field to be a flexible array
> (`__u8 ErrorContextData[]`). Additionally, it modifies the corresponding
> casts in the `symlink_data()` function to properly handle the flexible
> array, ensuring correct memory calculations and data handling.
>
> These changes improve the robustness of SMB2 symlink error processing.
>
> Signed-off-by: Liang Jie <liangjie@lixiang.com>
> Suggested-by: Tom Talpey <tom@talpey.com>
> ---
>
> Changes in v2:
> - Add the __counted_by_le attribute to reference the ErrorDataLength prot=
ocol field.
> - Link to v1: https://lore.kernel.org/all/20250116072948.682402-1-buaajxl=
j@163.com/
>
>  fs/smb/client/smb2file.c | 4 ++--
>  fs/smb/client/smb2pdu.h  | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/fs/smb/client/smb2file.c b/fs/smb/client/smb2file.c
> index e836bc2193dd..9ec44eab8dbc 100644
> --- a/fs/smb/client/smb2file.c
> +++ b/fs/smb/client/smb2file.c
> @@ -42,14 +42,14 @@ static struct smb2_symlink_err_rsp *symlink_data(cons=
t struct kvec *iov)
>                 end =3D (struct smb2_error_context_rsp *)((u8 *)err + iov=
->iov_len);
>                 do {
>                         if (le32_to_cpu(p->ErrorId) =3D=3D SMB2_ERROR_ID_=
DEFAULT) {
> -                               sym =3D (struct smb2_symlink_err_rsp *)&p=
->ErrorContextData;
> +                               sym =3D (struct smb2_symlink_err_rsp *)p-=
>ErrorContextData;
>                                 break;
>                         }
>                         cifs_dbg(FYI, "%s: skipping unhandled error conte=
xt: 0x%x\n",
>                                  __func__, le32_to_cpu(p->ErrorId));
>
>                         len =3D ALIGN(le32_to_cpu(p->ErrorDataLength), 8)=
;
> -                       p =3D (struct smb2_error_context_rsp *)((u8 *)&p-=
>ErrorContextData + len);
> +                       p =3D (struct smb2_error_context_rsp *)(p->ErrorC=
ontextData + len);
>                 } while (p < end);
>         } else if (le32_to_cpu(err->ByteCount) >=3D sizeof(*sym) &&
>                    iov->iov_len >=3D SMB2_SYMLINK_STRUCT_SIZE) {
> diff --git a/fs/smb/client/smb2pdu.h b/fs/smb/client/smb2pdu.h
> index 076d9e83e1a0..3c09a58dfd07 100644
> --- a/fs/smb/client/smb2pdu.h
> +++ b/fs/smb/client/smb2pdu.h
> @@ -79,7 +79,7 @@ struct smb2_symlink_err_rsp {
>  struct smb2_error_context_rsp {
>         __le32 ErrorDataLength;
>         __le32 ErrorId;
> -       __u8  ErrorContextData; /* ErrorDataLength long array */
> +       __u8  ErrorContextData[] __counted_by_le(ErrorDataLength);
>  } __packed;
>
>  /* ErrorId values */
> --
> 2.25.1
>
>


--
Thanks,

Steve

