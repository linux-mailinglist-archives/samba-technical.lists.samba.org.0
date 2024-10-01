Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B33C098B2D5
	for <lists+samba-technical@lfdr.de>; Tue,  1 Oct 2024 05:50:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=hPulFSXmADW5ULAT1zLQ3qr98lMiJCsItt5Sr93LXTA=; b=dVgk3zsAsZ/LJs/3uJTUDqb8U4
	YYjgRXkMFxuNg7Al3P9bmmfBLWCsU0Llm7UVHckb2Rwj/CFGbOOh72eUcsXcjCIk0dxGO3IcIPfCS
	xAvU/YxNlpioPXX6quBnyKTYrKLkgzgGqOzoi4PoS8zYTV6JCkCt+0Z0K9J9xyil5vTgZEZ9JQxu/
	/zf2/uMn8/wHSz6Fl2oQlhOLXQzv8EAMTLJfJ/bz4hDFTC15iFhnqL8f5M2IdwgQYW4A3Y+Iazzcz
	KYwPX3M+lEm/pHY1fxCJGGVIC2yvwTDMrE/Xq9XN6+w3Rnl+5m+lS0YvXA1Zva6QJWxGxr8yGoOvL
	9cVMfViA==;
Received: from ip6-localhost ([::1]:51888 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1svTth-002krX-9F; Tue, 01 Oct 2024 03:50:01 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:43164) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1svTtZ-002krP-SL
 for samba-technical@lists.samba.org; Tue, 01 Oct 2024 03:49:57 +0000
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5398c1bd0b8so2483082e87.0
 for <samba-technical@lists.samba.org>; Mon, 30 Sep 2024 20:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727754592; x=1728359392; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hPulFSXmADW5ULAT1zLQ3qr98lMiJCsItt5Sr93LXTA=;
 b=O7T8Yhgrn3j2ypUCHNIHsWdNnvsSKrfLQ/dP8QyrljIsMP2ZWdp0jN4KwefPB60Bqc
 uPwLB/6f/TwneIVYbids1Elh7MRjfQa4fGpEfU+sa8M6QMS8pFCE0/ZHx9WjXVo3eazW
 cBvWKv+aqIokxioG9zeRPxkBqPgXyl4KGG617wIKZY0ODZwYZAv4Y1lOLTjvAyMBiXs1
 5vdgFJ8HMnEHarN0TImiRND/JLh0S2u4WiIaolA9xy96od7E3dCwD0Bwcv9mYgRqbfNo
 XxINtVNjrEhcU6hflk1lojaD/JPTW3MzK726tqHbsCqbOC9Uj+BxL4qMD64IvBpufh+Y
 ilig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727754592; x=1728359392;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hPulFSXmADW5ULAT1zLQ3qr98lMiJCsItt5Sr93LXTA=;
 b=vsK/7gkDbs9mGs/ITQXIq3s+xSGtJ3/ByHATiWzRd14MsIh4cwIZfNix8vWXKOQWqk
 ieG54k6Mq/RXgKbWOZ6muQntr9oADqWlBLk/VouO65RN+RkA0swaAcSr07bYxSfq1t2T
 qukp0V1HJoFnunXyu6G/I5bmK8RSgLF3JxshSZV5DwbI30t5KsZgAlIAxDNiZV93R5HH
 FWmnC7s719/BapPwz2ULA+sZ0zfzOqfofpL0E47+CTEX24YIgKABDfl3MIAVGWoiITTh
 6OwGqXXz7Pma1jJ6ayvFmDz6+buDCJHse6X7fhX2hOImOBBxSg2ksOZERXgmAG021VFM
 wy9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVO/kWmrGoExVvXGXnU6CWGKTCDQ9suXcOeCOx61DqkxvEF7tDKafUVBBl/ln9LO81ni1JO2CHbGVzWnWgpEkQ=@lists.samba.org
X-Gm-Message-State: AOJu0YyID/rZYa+QRCofoBVD6JKp/o9lk9a3WB4P482+XOvRcoLmqV0U
 1DLXJUHB5hTfenw6e2VUTHZfIpFpmQzH2hPfn2t7JlIS3h1vUxEbD4BS4OeARtrewCKmex+Dks1
 Sgih5RNNpcVDK47MhOPzUVrRyOUA=
X-Google-Smtp-Source: AGHT+IGW6fvknCHIoazqzMw8P3sUZ/d35bM61F5ri9sQ7/RYg8AxO3eb3oZoJ99dtmK8Qv/x3uPx6OPRQrnSMXkgNjs=
X-Received: by 2002:a05:6512:230c:b0:52f:413:7e89 with SMTP id
 2adb3069b0e04-5399a25672bmr520467e87.17.1727754591437; Mon, 30 Sep 2024
 20:49:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240925065543.7620-1-shenlichuan@vivo.com>
In-Reply-To: <20240925065543.7620-1-shenlichuan@vivo.com>
Date: Mon, 30 Sep 2024 22:49:40 -0500
Message-ID: <CAH2r5mv=7HV9+Q4=eO91FoFK9RzS3vPF0AEcUa1apc7tvBjp0Q@mail.gmail.com>
Subject: Re: [PATCH v1] smb: client: Correct typos in multiple comments across
 various files
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: pc@manguebit.com, tom@talpey.com, sprasad@microsoft.com,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, sfrench@samba.org, bharathsm@microsoft.com,
 opensource.kernel@vivo.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Wed, Sep 25, 2024 at 1:57=E2=80=AFAM Shen Lichuan <shenlichuan@vivo.com>=
 wrote:
>
> Fixed some confusing typos that were currently identified witch codespell=
,
> the details are as follows:
>
> -in the code comments:
> fs/smb/client/cifsacl.h:58: inheritence =3D=3D> inheritance
> fs/smb/client/cifsencrypt.c:242: origiginal =3D=3D> original
> fs/smb/client/cifsfs.c:164: referece =3D=3D> reference
> fs/smb/client/cifsfs.c:292: ned =3D=3D> need
> fs/smb/client/cifsglob.h:779: initital =3D=3D> initial
> fs/smb/client/cifspdu.h:784: altetnative =3D=3D> alternative
> fs/smb/client/cifspdu.h:2409: conrol =3D=3D> control
> fs/smb/client/cifssmb.c:1218: Expirement =3D=3D> Experiment
> fs/smb/client/cifssmb.c:3021: conver =3D=3D> convert
> fs/smb/client/cifssmb.c:3998: asterik =3D=3D> asterisk
> fs/smb/client/file.c:2505: useable =3D=3D> usable
> fs/smb/client/fs_context.h:263: timemout =3D=3D> timeout
> fs/smb/client/misc.c:257: responsbility =3D=3D> responsibility
> fs/smb/client/netmisc.c:1006: divisable =3D=3D> divisible
> fs/smb/client/readdir.c:556: endianess =3D=3D> endianness
> fs/smb/client/readdir.c:818: bu =3D=3D> by
> fs/smb/client/smb2ops.c:2180: snaphots =3D=3D> snapshots
> fs/smb/client/smb2ops.c:3586: otions =3D=3D> options
> fs/smb/client/smb2pdu.c:2979: timestaps =3D=3D> timestamps
> fs/smb/client/smb2pdu.c:4574: memmory =3D=3D> memory
> fs/smb/client/smb2transport.c:699: origiginal =3D=3D> original
> fs/smb/client/smbdirect.c:222: happenes =3D=3D> happens
> fs/smb/client/smbdirect.c:1347: registartions =3D=3D> registrations
> fs/smb/client/smbdirect.h:114: accoutning =3D=3D> accounting
>
> Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
> ---
>  fs/smb/client/cifsacl.h       | 2 +-
>  fs/smb/client/cifsencrypt.c   | 2 +-
>  fs/smb/client/cifsfs.c        | 4 ++--
>  fs/smb/client/cifsglob.h      | 2 +-
>  fs/smb/client/cifspdu.h       | 4 ++--
>  fs/smb/client/cifssmb.c       | 6 +++---
>  fs/smb/client/file.c          | 2 +-
>  fs/smb/client/fs_context.h    | 2 +-
>  fs/smb/client/misc.c          | 2 +-
>  fs/smb/client/netmisc.c       | 2 +-
>  fs/smb/client/readdir.c       | 4 ++--
>  fs/smb/client/smb2ops.c       | 4 ++--
>  fs/smb/client/smb2pdu.c       | 4 ++--
>  fs/smb/client/smb2transport.c | 2 +-
>  fs/smb/client/smbdirect.c     | 4 ++--
>  fs/smb/client/smbdirect.h     | 2 +-
>  16 files changed, 24 insertions(+), 24 deletions(-)
>
> diff --git a/fs/smb/client/cifsacl.h b/fs/smb/client/cifsacl.h
> index 6529478b7f48..31b51a8fc256 100644
> --- a/fs/smb/client/cifsacl.h
> +++ b/fs/smb/client/cifsacl.h
> @@ -55,7 +55,7 @@ struct smb3_sd {
>  #define ACL_CONTROL_SI 0x0800  /* SACL Auto-Inherited */
>  #define ACL_CONTROL_DI 0x0400  /* DACL Auto-Inherited */
>  #define ACL_CONTROL_SC 0x0200  /* SACL computed through inheritance */
> -#define ACL_CONTROL_DC 0x0100  /* DACL computed through inheritence */
> +#define ACL_CONTROL_DC 0x0100  /* DACL computed through inheritance */
>  #define ACL_CONTROL_SS 0x0080  /* Create server ACL */
>  #define ACL_CONTROL_DT 0x0040  /* DACL provided by trusted source */
>  #define ACL_CONTROL_SD 0x0020  /* SACL defaulted */
> diff --git a/fs/smb/client/cifsencrypt.c b/fs/smb/client/cifsencrypt.c
> index 7481b21a0489..ba4540bcd7ac 100644
> --- a/fs/smb/client/cifsencrypt.c
> +++ b/fs/smb/client/cifsencrypt.c
> @@ -239,7 +239,7 @@ int cifs_verify_signature(struct smb_rqst *rqst,
>                 cifs_dbg(FYI, "dummy signature received for smb command 0=
x%x\n",
>                          cifs_pdu->Command);
>
> -       /* save off the origiginal signature so we can modify the smb and=
 check
> +       /* save off the original signature so we can modify the smb and c=
heck
>                 its signature against what the server sent */
>         memcpy(server_response_sig, cifs_pdu->Signature.SecuritySignature=
, 8);
>
> diff --git a/fs/smb/client/cifsfs.c b/fs/smb/client/cifsfs.c
> index c91cf57f337c..6f76432b9159 100644
> --- a/fs/smb/client/cifsfs.c
> +++ b/fs/smb/client/cifsfs.c
> @@ -161,7 +161,7 @@ __u32 cifs_lock_secret;
>
>  /*
>   * Bumps refcount for cifs super block.
> - * Note that it should be only called if a referece to VFS super block i=
s
> + * Note that it should be only called if a reference to VFS super block =
is
>   * already held, e.g. in open-type syscalls context. Otherwise it can ra=
ce with
>   * atomic_dec_and_test in deactivate_locked_super.
>   */
> @@ -289,7 +289,7 @@ static void cifs_kill_sb(struct super_block *sb)
>         struct cifs_sb_info *cifs_sb =3D CIFS_SB(sb);
>
>         /*
> -        * We ned to release all dentries for the cached directories
> +        * We need to release all dentries for the cached directories
>          * before we kill the sb.
>          */
>         if (cifs_sb->root) {
> diff --git a/fs/smb/client/cifsglob.h b/fs/smb/client/cifsglob.h
> index 15571cf0ba63..6e4bee57baa3 100644
> --- a/fs/smb/client/cifsglob.h
> +++ b/fs/smb/client/cifsglob.h
> @@ -776,7 +776,7 @@ struct TCP_Server_Info {
>         } compression;
>         __u16   signing_algorithm;
>         __le16  cipher_type;
> -        /* save initital negprot hash */
> +        /* save initial negprot hash */
>         __u8    preauth_sha_hash[SMB2_PREAUTH_HASH_SIZE];
>         bool    signing_negotiated; /* true if valid signing context rcvd=
 from server */
>         bool    posix_ext_supported;
> diff --git a/fs/smb/client/cifspdu.h b/fs/smb/client/cifspdu.h
> index c3b6263060b0..ff694dca4248 100644
> --- a/fs/smb/client/cifspdu.h
> +++ b/fs/smb/client/cifspdu.h
> @@ -781,7 +781,7 @@ typedef struct smb_com_logoff_andx_rsp {
>         __u16 ByteCount;
>  } __attribute__((packed)) LOGOFF_ANDX_RSP;
>
> -typedef union smb_com_tree_disconnect {        /* as an altetnative can =
use flag on
> +typedef union smb_com_tree_disconnect {        /* as an alternative can =
use flag on
>                                         tree_connect PDU to effect discon=
nect */
>                                         /* tdis is probably simplest SMB =
PDU */
>         struct {
> @@ -2406,7 +2406,7 @@ struct cifs_posix_ace { /* access control entry (AC=
E) */
>         __le64 cifs_uid; /* or gid */
>  } __attribute__((packed));
>
> -struct cifs_posix_acl { /* access conrol list  (ACL) */
> +struct cifs_posix_acl { /* access control list  (ACL) */
>         __le16  version;
>         __le16  access_entry_count;  /* access ACL - count of entries */
>         __le16  default_entry_count; /* default ACL - count of entries */
> diff --git a/fs/smb/client/cifssmb.c b/fs/smb/client/cifssmb.c
> index 131f20b91c3e..c6f15dbe860a 100644
> --- a/fs/smb/client/cifssmb.c
> +++ b/fs/smb/client/cifssmb.c
> @@ -1215,7 +1215,7 @@ CIFS_open(const unsigned int xid, struct cifs_open_=
parms *oparms, int *oplock,
>         req->CreateDisposition =3D cpu_to_le32(disposition);
>         req->CreateOptions =3D cpu_to_le32(create_options & CREATE_OPTION=
S_MASK);
>
> -       /* BB Expirement with various impersonation levels and verify */
> +       /* BB Experiment with various impersonation levels and verify */
>         req->ImpersonationLevel =3D cpu_to_le32(SECURITY_IMPERSONATION);
>         req->SecurityFlags =3D SECURITY_CONTEXT_TRACKING|SECURITY_EFFECTI=
VE_ONLY;
>
> @@ -3018,7 +3018,7 @@ static void cifs_init_ace(struct cifs_posix_ace *ci=
fs_ace,
>
>  /**
>   * posix_acl_to_cifs - convert ACLs from POSIX ACL to cifs format
> - * @parm_data: ACLs in cifs format to conver to
> + * @parm_data: ACLs in cifs format to convert to
>   * @acl: ACLs in POSIX ACL format to convert from
>   * @acl_type: the type of POSIX ACLs stored in @acl
>   *
> @@ -3995,7 +3995,7 @@ CIFSFindFirst(const unsigned int xid, struct cifs_t=
con *tcon,
>                 name_len =3D
>                     cifsConvertToUTF16((__le16 *) pSMB->FileName, searchN=
ame,
>                                        PATH_MAX, nls_codepage, remap);
> -               /* We can not add the asterik earlier in case
> +               /* We can not add the asterisk earlier in case
>                 it got remapped to 0xF03A as if it were part of the
>                 directory name instead of a wildcard */
>                 name_len *=3D 2;
> diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
> index 78b59c4ef3ce..a58a3333ecc3 100644
> --- a/fs/smb/client/file.c
> +++ b/fs/smb/client/file.c
> @@ -2502,7 +2502,7 @@ cifs_get_writable_file(struct cifsInodeInfo *cifs_i=
node, int flags,
>                         }
>                 }
>         }
> -       /* couldn't find useable FH with same pid, try any available */
> +       /* couldn't find usable FH with same pid, try any available */
>         if (!any_available) {
>                 any_available =3D true;
>                 goto refind_writable;
> diff --git a/fs/smb/client/fs_context.h b/fs/smb/client/fs_context.h
> index 5135f7b2e8d3..6ea476cd8fd2 100644
> --- a/fs/smb/client/fs_context.h
> +++ b/fs/smb/client/fs_context.h
> @@ -260,7 +260,7 @@ struct smb3_fs_context {
>         unsigned int min_offload;
>         unsigned int retrans;
>         bool sockopt_tcp_nodelay:1;
> -       /* attribute cache timemout for files and directories in jiffies =
*/
> +       /* attribute cache timeout for files and directories in jiffies *=
/
>         unsigned long acregmax;
>         unsigned long acdirmax;
>         /* timeout for deferred close of files in jiffies */
> diff --git a/fs/smb/client/misc.c b/fs/smb/client/misc.c
> index 054f10ebf65a..4373dd64b66d 100644
> --- a/fs/smb/client/misc.c
> +++ b/fs/smb/client/misc.c
> @@ -254,7 +254,7 @@ free_rsp_buf(int resp_buftype, void *rsp)
>  }
>
>  /* NB: MID can not be set if treeCon not passed in, in that
> -   case it is responsbility of caller to set the mid */
> +   case it is responsibility of caller to set the mid */
>  void
>  header_assemble(struct smb_hdr *buffer, char smb_command /* command */ ,
>                 const struct cifs_tcon *treeCon, int word_count
> diff --git a/fs/smb/client/netmisc.c b/fs/smb/client/netmisc.c
> index 1b52e6ac431c..2a8d71221e5e 100644
> --- a/fs/smb/client/netmisc.c
> +++ b/fs/smb/client/netmisc.c
> @@ -1003,7 +1003,7 @@ struct timespec64 cnvrtDosUnixTm(__le16 le_date, __=
le16 le_time, int offset)
>          year is 2**7, the last year is 1980+127, which means we need onl=
y
>          consider 2 special case years, ie the years 2000 and 2100, and o=
nly
>          adjust for the lack of leap year for the year 2100, as 2000 was =
a
> -        leap year (divisable by 400) */
> +        leap year (divisible by 400) */
>         if (year >=3D 120)  /* the year 2100 */
>                 days =3D days - 1;  /* do not count leap year for the yea=
r 2100 */
>
> diff --git a/fs/smb/client/readdir.c b/fs/smb/client/readdir.c
> index ebe1cb30e18e..b3a8f9c6fcff 100644
> --- a/fs/smb/client/readdir.c
> +++ b/fs/smb/client/readdir.c
> @@ -553,7 +553,7 @@ static void cifs_fill_dirent_std(struct cifs_dirent *=
de,
>                 const FIND_FILE_STANDARD_INFO *info)
>  {
>         de->name =3D &info->FileName[0];
> -       /* one byte length, no endianess conversion */
> +       /* one byte length, no endianness conversion */
>         de->namelen =3D info->FileNameLength;
>         de->resume_key =3D info->ResumeKey;
>  }
> @@ -815,7 +815,7 @@ static bool emit_cached_dirents(struct cached_dirents=
 *cde,
>                  * However, this sequence of ->pos values may have holes
>                  * in it, for example dot-dirs returned from the server
>                  * are suppressed.
> -                * Handle this bu forcing ctx->pos to be the same as the
> +                * Handle this by forcing ctx->pos to be the same as the
>                  * ->pos of the current dirent we emit from the cache.
>                  * This means that when we emit these entries from the ca=
che
>                  * we now emit them with the same ->pos value as in the
> diff --git a/fs/smb/client/smb2ops.c b/fs/smb/client/smb2ops.c
> index 1ee2dd4a1cae..d319cd8839e7 100644
> --- a/fs/smb/client/smb2ops.c
> +++ b/fs/smb/client/smb2ops.c
> @@ -2177,7 +2177,7 @@ smb3_enum_snapshots(const unsigned int xid, struct =
cifs_tcon *tcon,
>                         NULL, 0 /* no input data */, max_response_size,
>                         (char **)&retbuf,
>                         &ret_data_len);
> -       cifs_dbg(FYI, "enum snaphots ioctl returned %d and ret buflen is =
%d\n",
> +       cifs_dbg(FYI, "enum snapshots ioctl returned %d and ret buflen is=
 %d\n",
>                         rc, ret_data_len);
>         if (rc)
>                 return rc;
> @@ -3583,7 +3583,7 @@ static long smb3_simple_falloc(struct file *file, s=
truct cifs_tcon *tcon,
>                 /*
>                  * At this point, we are trying to fallocate an internal
>                  * regions of a sparse file. Since smb2 does not have a
> -                * fallocate command we have two otions on how to emulate=
 this.
> +                * fallocate command we have two options on how to emulat=
e this.
>                  * We can either turn the entire file to become non-spars=
e
>                  * which we only do if the fallocate is for virtually
>                  * the whole file,  or we can overwrite the region with z=
eroes
> diff --git a/fs/smb/client/smb2pdu.c b/fs/smb/client/smb2pdu.c
> index a328b9dd145d..8814be932324 100644
> --- a/fs/smb/client/smb2pdu.c
> +++ b/fs/smb/client/smb2pdu.c
> @@ -2976,7 +2976,7 @@ int smb311_posix_mkdir(const unsigned int xid, stru=
ct inode *inode,
>
>         SMB2_close(xid, tcon, rsp->PersistentFileId, rsp->VolatileFileId)=
;
>
> -       /* Eventually save off posix specific response info and timestaps=
 */
> +       /* Eventually save off posix specific response info and timestamp=
s */
>
>  err_free_rsp_buf:
>         free_rsp_buf(resp_buftype, rsp);
> @@ -4571,7 +4571,7 @@ smb2_readv_callback(struct mid_q_entry *mid)
>         }
>  #ifdef CONFIG_CIFS_SMB_DIRECT
>         /*
> -        * If this rdata has a memmory registered, the MR can be freed
> +        * If this rdata has a memory registered, the MR can be freed
>          * MR needs to be freed as soon as I/O finishes to prevent deadlo=
ck
>          * because they have limited number and are used for future I/Os
>          */
> diff --git a/fs/smb/client/smb2transport.c b/fs/smb/client/smb2transport.=
c
> index c8bf0000f73b..b486b14bb330 100644
> --- a/fs/smb/client/smb2transport.c
> +++ b/fs/smb/client/smb2transport.c
> @@ -696,7 +696,7 @@ smb2_verify_signature(struct smb_rqst *rqst, struct T=
CP_Server_Info *server)
>                          shdr->Command);
>
>         /*
> -        * Save off the origiginal signature so we can modify the smb and=
 check
> +        * Save off the original signature so we can modify the smb and c=
heck
>          * our calculated signature against what the server sent.
>          */
>         memcpy(server_response_sig, shdr->Signature, SMB2_SIGNATURE_SIZE)=
;
> diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
> index 0c64b37e2660..b0b7254661e9 100644
> --- a/fs/smb/client/smbdirect.c
> +++ b/fs/smb/client/smbdirect.c
> @@ -219,7 +219,7 @@ static int smbd_conn_upcall(
>
>         case RDMA_CM_EVENT_DEVICE_REMOVAL:
>         case RDMA_CM_EVENT_DISCONNECTED:
> -               /* This happenes when we fail the negotiation */
> +               /* This happens when we fail the negotiation */
>                 if (info->transport_status =3D=3D SMBD_NEGOTIATE_FAILED) =
{
>                         info->transport_status =3D SMBD_DISCONNECTED;
>                         wake_up(&info->conn_wait);
> @@ -1344,7 +1344,7 @@ void smbd_destroy(struct TCP_Server_Info *server)
>          * are not locked by srv_mutex. It is possible some processes are
>          * blocked on transport srv_mutex while holding memory registrati=
on.
>          * Release the transport srv_mutex to allow them to hit the failu=
re
> -        * path when sending data, and then release memory registartions.
> +        * path when sending data, and then release memory registrations.
>          */
>         log_rdma_event(INFO, "freeing mr list\n");
>         wake_up_interruptible_all(&info->wait_mr);
> diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
> index 83f239f376f0..c08e3665150d 100644
> --- a/fs/smb/client/smbdirect.h
> +++ b/fs/smb/client/smbdirect.h
> @@ -111,7 +111,7 @@ struct smbd_connection {
>         /* Used by transport to wait until all MRs are returned */
>         wait_queue_head_t wait_for_mr_cleanup;
>
> -       /* Activity accoutning */
> +       /* Activity accounting */
>         atomic_t send_pending;
>         wait_queue_head_t wait_send_pending;
>         wait_queue_head_t wait_post_send;
> --
> 2.17.1
>
>


--=20
Thanks,

Steve

