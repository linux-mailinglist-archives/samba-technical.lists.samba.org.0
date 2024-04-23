Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DDC8AF8C3
	for <lists+samba-technical@lfdr.de>; Tue, 23 Apr 2024 23:10:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Z00xUgDb7chJiSdcTQzc2Jdww5uooukkIxk0IVOAZpE=; b=2QVh6Js8ArYFQby0fiJNpGrbeh
	iTFS5YNf6dboM9JYE6WW/c55Rgmx1SuSVQ5DuqfugTDZNhdf6AyWNntzzJJOL3LZ7tJ0BdcM+m1pO
	TqMX8EJT0RxeJ1gwv1rUZggCJtRaM6ZhJet5PsEzufcBCA6CZhMdmWE5ozGgf51AWfQb8WguOvB8m
	I2uruTELNZVni6AqXEkgUbSTioZlsfpXSIimolNGDTeKKtgAzUv1lSnzuELjryQ+TXK11op7DjfsU
	LhTok/9vinAjc7nR5mEznE6C6501c5BNKLAs3aNvbiQzN/kaArRsdqxLJjHC0Nj5+866BQJeX5ffg
	8+amq11A==;
Received: from ip6-localhost ([::1]:19720 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rzNOg-005TX6-NO; Tue, 23 Apr 2024 21:09:50 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:47438) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rzNOa-005TWz-QE
 for samba-technical@lists.samba.org; Tue, 23 Apr 2024 21:09:48 +0000
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-516ef30b16eso7595284e87.3
 for <samba-technical@lists.samba.org>; Tue, 23 Apr 2024 14:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713906584; x=1714511384; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z00xUgDb7chJiSdcTQzc2Jdww5uooukkIxk0IVOAZpE=;
 b=CvpsnakOOyWpXhqFZ0Y30Zmuc3gjMD34ww1/FJ02uiIx9EJhOUSrzV/pqNQ1ALmmKq
 cE83OMrLJo/UXHaw47wGKEV0O/NxU9+Me6py4b9aV0w1iN7QO2PGOUlum+uCaKqLAcGr
 afmU9O1y5S4eWWzJBZX1JJGk1ySlTEIqwYcWKKDzcsnNc2cyQOhHNWuZH9dPH9sL4EtB
 s8ou+28D1gXuUEo8900K1XEYu9PBcQ+gLBVwvAqkj9KifnnIlS6nEj+P6rACNGASwcXM
 nazxiCB2w4oIRCgQt3lzaSvaP1t0bXgMNRaui9bcY+r6ASgpWkoyOTh6u4L9I9ivI3Y9
 4a3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713906584; x=1714511384;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z00xUgDb7chJiSdcTQzc2Jdww5uooukkIxk0IVOAZpE=;
 b=XbJ2jaHvLmCeM597AYRyZox9wQHYPIE0SNcxDbPcVBLjf0SR0Gvn1TN9htE7yXTnzG
 IaO72eSFDv4ZtYMt3WcvfrSS4f+ig43suZaUDcz+9/0K747wWgXsy36e4lho7XTwq9hM
 xmgWGpH3JlGiUDxAtqp9W9CXMmbchYeKIFent9P9yp8Nk3++uoWA95HJMK0vm3bwx5Rx
 5nzB5GtZ3EW2AAXvWiY69bfJF63oZnQHv8VgXUqB+9oEtMvi2erRv5R9gB2gcGChSAZx
 +geovU4LYYKXlbP4Sgq2yq209IgI9a+9o8HgcsQ/pP0D67I89OiuPU9kqVp9Gz5Rx6q7
 q3Iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+ljXt0bPPZGIwvdcd6cCoAVfiuQftYad9CkTC23z/3MSyH00nCUTl6KLLHV9hMcQa/N4OGynDZGk954IohcfHo45LJl5xH4KKIX1ThVvF
X-Gm-Message-State: AOJu0YxgNVumEpwimg+R4mkxFOVpYTRqg1oG7ltBu+idec41NUtWjW26
 ZdE4dHcbOctybdWmBdbfmyS0u2LcPcFKDEWdZSwb4+lSrTr0xRp18eBkpaZ5jQW/KOhe2PoWml+
 bVQPheoHnSyGszsb9vKEr+eLi9s4=
X-Google-Smtp-Source: AGHT+IGlJ8JGtkqwp0zGdANEDF7fFC0jTyWBeb4YVmcV0DWc0EGiRhw+7DSM8rqxmpo7JXL54TpqRRY19ENMrOMLnFs=
X-Received: by 2002:ac2:48b0:0:b0:515:d135:68f2 with SMTP id
 u16-20020ac248b0000000b00515d13568f2mr438335lfg.53.1713906583391; Tue, 23 Apr
 2024 14:09:43 -0700 (PDT)
MIME-Version: 1.0
References: <ZhgDTj1nwLEtSd9h@neat>
 <1166494b-3e34-4919-9998-141540a948b3@embeddedor.com>
 <CAH2r5msZaV1kHqQw8Sb_3wQfGBj4aU+tSCR5E0YJ8fCH6ODB4Q@mail.gmail.com>
 <7789881d-a709-48f4-8c14-259acbce813a@embeddedor.com>
In-Reply-To: <7789881d-a709-48f4-8c14-259acbce813a@embeddedor.com>
Date: Tue, 23 Apr 2024 16:09:32 -0500
Message-ID: <CAH2r5mu=HYqSnT3j=mdLA7XPyha5A27tBqzJcEZfMAU-yLunbA@mail.gmail.com>
Subject: Re: [PATCH][next] smb: smb2pdu.h: Avoid -Wflex-array-member-not-at-end
 warnings
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
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
Cc: Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>,
 Shyam Prasad N <sprasad@microsoft.com>, Kees Cook <keescook@chromium.org>,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org,
 Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Bharath SM <bharathsm@microsoft.com>, linux-hardening@vger.kernel.org,
 Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Apr 23, 2024 at 3:48=E2=80=AFPM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
>
>
>
> On 23/04/24 14:15, Steve French wrote:
> > This looks reasonably safe (running the usual regression tests on it no=
w).
> >
> > Reminds me though that we have to be careful (e.g. the recent fix for
> > regression caused by cleanup).
>
> mmh... it seems that the offending commit was never CC'd to the linux-har=
dening
> list, hence it wasn't reviewed by us.
>
> After reviewing both, the offending commit and the fix, both seem to be w=
rong.
>
> for __packed structs, you should use __struct_group():
>
> __struct_group(network_open_info, group_name, __packed, struct_members);
>
> The _packed in the commit 0268a7cc7fdc is not an attribute, it's the name
> for the group. So, it's not actually doing what the submitter thinks it d=
oes.

Do you want to submit a followup fix to fix this?  Or let Namjae fix it?





> > Thoughts about whether should be sent in rc6 or wait till 6.10?  51
> > warnings does sound
> > distracting though so might be worth going in sooner rather than later.
>
> There is actually no hurry. :)
>
> Thanks
> --
> Gustavo
>
> >
> > commit 0268a7cc7fdc47d90b6c18859de7718d5059f6f1
> > Author: Namjae Jeon <linkinjeon@kernel.org>
> > Date:   Fri Apr 19 23:46:34 2024 +0900
> >
> >      ksmbd: common: use struct_group_attr instead of struct_group for
> > network_open_info
> >
> >      4byte padding cause the connection issue with the applications of =
MacOS.
> >      smb2_close response size increases by 4 bytes by padding, And the =
smb
> >      client of MacOS check it and stop the connection. This patch use
> >      struct_group_attr instead of struct_group for network_open_info to=
 use
> >       __packed to avoid padding.
> >
> >
> > On Tue, Apr 23, 2024 at 1:58=E2=80=AFPM Gustavo A. R. Silva
> > <gustavo@embeddedor.com> wrote:
> >>
> >> Hi all,
> >>
> >> Friendly ping: who can take this, please?
> >>
> >> Thanks
> >> --
> >> Gustavo
> >>
> >> On 11/04/24 09:35, Gustavo A. R. Silva wrote:
> >>> -Wflex-array-member-not-at-end is coming in GCC-14, and we are gettin=
g
> >>> ready to enable it globally.
> >>>
> >>> So, in order to avoid ending up with a flexible-array member in the
> >>> middle of multiple other structs, we use the `__struct_group()` helpe=
r
> >>> to separate the flexible array from the rest of the members in the
> >>> flexible structure, and use the tagged `struct create_context_hdr`
> >>> instead of `struct create_context`.
> >>>
> >>> So, with these changes, fix 51 of the following warnings[1]:
> >>>
> >>> fs/smb/client/../common/smb2pdu.h:1225:31: warning: structure contain=
ing a flexible array member is not at the end of another structure [-Wflex-=
array-member-not-at-end]
> >>>
> >>> Link: https://gist.github.com/GustavoARSilva/772526a39be3dd4db39e7149=
7f0a9893 [1]
> >>> Link: https://github.com/KSPP/linux/issues/202
> >>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> >>> ---
> >>>    fs/smb/client/smb2pdu.h | 12 ++++++------
> >>>    fs/smb/common/smb2pdu.h | 33 ++++++++++++++++++---------------
> >>>    fs/smb/server/smb2pdu.h | 18 +++++++++---------
> >>>    3 files changed, 33 insertions(+), 30 deletions(-)
> >>>
> >>> diff --git a/fs/smb/client/smb2pdu.h b/fs/smb/client/smb2pdu.h
> >>> index c72a3b2886b7..1a02bd9e0c00 100644
> >>> --- a/fs/smb/client/smb2pdu.h
> >>> +++ b/fs/smb/client/smb2pdu.h
> >>> @@ -145,7 +145,7 @@ struct durable_context_v2 {
> >>>    } __packed;
> >>>
> >>>    struct create_durable_v2 {
> >>> -     struct create_context ccontext;
> >>> +     struct create_context_hdr ccontext;
> >>>        __u8   Name[8];
> >>>        struct durable_context_v2 dcontext;
> >>>    } __packed;
> >>> @@ -167,7 +167,7 @@ struct durable_reconnect_context_v2_rsp {
> >>>    } __packed;
> >>>
> >>>    struct create_durable_handle_reconnect_v2 {
> >>> -     struct create_context ccontext;
> >>> +     struct create_context_hdr ccontext;
> >>>        __u8   Name[8];
> >>>        struct durable_reconnect_context_v2 dcontext;
> >>>        __u8   Pad[4];
> >>> @@ -175,7 +175,7 @@ struct create_durable_handle_reconnect_v2 {
> >>>
> >>>    /* See MS-SMB2 2.2.13.2.5 */
> >>>    struct crt_twarp_ctxt {
> >>> -     struct create_context ccontext;
> >>> +     struct create_context_hdr ccontext;
> >>>        __u8    Name[8];
> >>>        __le64  Timestamp;
> >>>
> >>> @@ -183,12 +183,12 @@ struct crt_twarp_ctxt {
> >>>
> >>>    /* See MS-SMB2 2.2.13.2.9 */
> >>>    struct crt_query_id_ctxt {
> >>> -     struct create_context ccontext;
> >>> +     struct create_context_hdr ccontext;
> >>>        __u8    Name[8];
> >>>    } __packed;
> >>>
> >>>    struct crt_sd_ctxt {
> >>> -     struct create_context ccontext;
> >>> +     struct create_context_hdr ccontext;
> >>>        __u8    Name[8];
> >>>        struct smb3_sd sd;
> >>>    } __packed;
> >>> @@ -415,7 +415,7 @@ struct smb2_posix_info_parsed {
> >>>    };
> >>>
> >>>    struct smb2_create_ea_ctx {
> >>> -     struct create_context ctx;
> >>> +     struct create_context_hdr ctx;
> >>>        __u8 name[8];
> >>>        struct smb2_file_full_ea_info ea;
> >>>    } __packed;
> >>> diff --git a/fs/smb/common/smb2pdu.h b/fs/smb/common/smb2pdu.h
> >>> index 1b594307c9d5..eab9d49c63ba 100644
> >>> --- a/fs/smb/common/smb2pdu.h
> >>> +++ b/fs/smb/common/smb2pdu.h
> >>> @@ -1171,12 +1171,15 @@ struct smb2_server_client_notification {
> >>>    #define SMB2_CREATE_FLAG_REPARSEPOINT 0x01
> >>>
> >>>    struct create_context {
> >>> -     __le32 Next;
> >>> -     __le16 NameOffset;
> >>> -     __le16 NameLength;
> >>> -     __le16 Reserved;
> >>> -     __le16 DataOffset;
> >>> -     __le32 DataLength;
> >>> +     /* New members must be added within the struct_group() macro be=
low. */
> >>> +     __struct_group(create_context_hdr, hdr, __packed,
> >>> +             __le32 Next;
> >>> +             __le16 NameOffset;
> >>> +             __le16 NameLength;
> >>> +             __le16 Reserved;
> >>> +             __le16 DataOffset;
> >>> +             __le32 DataLength;
> >>> +     );
> >>>        __u8 Buffer[];
> >>>    } __packed;
> >>>
> >>> @@ -1222,7 +1225,7 @@ struct smb2_create_rsp {
> >>>    } __packed;
> >>>
> >>>    struct create_posix {
> >>> -     struct create_context ccontext;
> >>> +     struct create_context_hdr ccontext;
> >>>        __u8    Name[16];
> >>>        __le32  Mode;
> >>>        __u32   Reserved;
> >>> @@ -1230,7 +1233,7 @@ struct create_posix {
> >>>
> >>>    /* See MS-SMB2 2.2.13.2.3 and MS-SMB2 2.2.13.2.4 */
> >>>    struct create_durable {
> >>> -     struct create_context ccontext;
> >>> +     struct create_context_hdr ccontext;
> >>>        __u8   Name[8];
> >>>        union {
> >>>                __u8  Reserved[16];
> >>> @@ -1243,14 +1246,14 @@ struct create_durable {
> >>>
> >>>    /* See MS-SMB2 2.2.13.2.5 */
> >>>    struct create_mxac_req {
> >>> -     struct create_context ccontext;
> >>> +     struct create_context_hdr ccontext;
> >>>        __u8   Name[8];
> >>>        __le64 Timestamp;
> >>>    } __packed;
> >>>
> >>>    /* See MS-SMB2 2.2.14.2.5 */
> >>>    struct create_mxac_rsp {
> >>> -     struct create_context ccontext;
> >>> +     struct create_context_hdr ccontext;
> >>>        __u8   Name[8];
> >>>        __le32 QueryStatus;
> >>>        __le32 MaximalAccess;
> >>> @@ -1286,13 +1289,13 @@ struct lease_context_v2 {
> >>>    } __packed;
> >>>
> >>>    struct create_lease {
> >>> -     struct create_context ccontext;
> >>> +     struct create_context_hdr ccontext;
> >>>        __u8   Name[8];
> >>>        struct lease_context lcontext;
> >>>    } __packed;
> >>>
> >>>    struct create_lease_v2 {
> >>> -     struct create_context ccontext;
> >>> +     struct create_context_hdr ccontext;
> >>>        __u8   Name[8];
> >>>        struct lease_context_v2 lcontext;
> >>>        __u8   Pad[4];
> >>> @@ -1300,7 +1303,7 @@ struct create_lease_v2 {
> >>>
> >>>    /* See MS-SMB2 2.2.14.2.9 */
> >>>    struct create_disk_id_rsp {
> >>> -     struct create_context ccontext;
> >>> +     struct create_context_hdr ccontext;
> >>>        __u8   Name[8];
> >>>        __le64 DiskFileId;
> >>>        __le64 VolumeId;
> >>> @@ -1309,7 +1312,7 @@ struct create_disk_id_rsp {
> >>>
> >>>    /* See MS-SMB2 2.2.13.2.13 */
> >>>    struct create_app_inst_id {
> >>> -     struct create_context ccontext;
> >>> +     struct create_context_hdr ccontext;
> >>>        __u8 Name[16];
> >>>        __le32 StructureSize; /* Must be 20 */
> >>>        __u16 Reserved;
> >>> @@ -1318,7 +1321,7 @@ struct create_app_inst_id {
> >>>
> >>>    /* See MS-SMB2 2.2.13.2.15 */
> >>>    struct create_app_inst_id_vers {
> >>> -     struct create_context ccontext;
> >>> +     struct create_context_hdr ccontext;
> >>>        __u8 Name[16];
> >>>        __le32 StructureSize; /* Must be 24 */
> >>>        __u16 Reserved;
> >>> diff --git a/fs/smb/server/smb2pdu.h b/fs/smb/server/smb2pdu.h
> >>> index bd1d2a0e9203..643f5e1cfe35 100644
> >>> --- a/fs/smb/server/smb2pdu.h
> >>> +++ b/fs/smb/server/smb2pdu.h
> >>> @@ -64,7 +64,7 @@ struct preauth_integrity_info {
> >>>    #define SMB2_SESSION_TIMEOUT                (10 * HZ)
> >>>
> >>>    struct create_durable_req_v2 {
> >>> -     struct create_context ccontext;
> >>> +     struct create_context_hdr ccontext;
> >>>        __u8   Name[8];
> >>>        __le32 Timeout;
> >>>        __le32 Flags;
> >>> @@ -73,7 +73,7 @@ struct create_durable_req_v2 {
> >>>    } __packed;
> >>>
> >>>    struct create_durable_reconn_req {
> >>> -     struct create_context ccontext;
> >>> +     struct create_context_hdr ccontext;
> >>>        __u8   Name[8];
> >>>        union {
> >>>                __u8  Reserved[16];
> >>> @@ -85,7 +85,7 @@ struct create_durable_reconn_req {
> >>>    } __packed;
> >>>
> >>>    struct create_durable_reconn_v2_req {
> >>> -     struct create_context ccontext;
> >>> +     struct create_context_hdr ccontext;
> >>>        __u8   Name[8];
> >>>        struct {
> >>>                __u64 PersistentFileId;
> >>> @@ -96,13 +96,13 @@ struct create_durable_reconn_v2_req {
> >>>    } __packed;
> >>>
> >>>    struct create_alloc_size_req {
> >>> -     struct create_context ccontext;
> >>> +     struct create_context_hdr ccontext;
> >>>        __u8   Name[8];
> >>>        __le64 AllocationSize;
> >>>    } __packed;
> >>>
> >>>    struct create_durable_rsp {
> >>> -     struct create_context ccontext;
> >>> +     struct create_context_hdr ccontext;
> >>>        __u8   Name[8];
> >>>        union {
> >>>                __u8  Reserved[8];
> >>> @@ -114,7 +114,7 @@ struct create_durable_rsp {
> >>>    /* Flags */
> >>>    #define SMB2_DHANDLE_FLAG_PERSISTENT        0x00000002
> >>>    struct create_durable_v2_rsp {
> >>> -     struct create_context ccontext;
> >>> +     struct create_context_hdr ccontext;
> >>>        __u8   Name[8];
> >>>        __le32 Timeout;
> >>>        __le32 Flags;
> >>> @@ -122,7 +122,7 @@ struct create_durable_v2_rsp {
> >>>
> >>>    /* equivalent of the contents of SMB3.1.1 POSIX open context respo=
nse */
> >>>    struct create_posix_rsp {
> >>> -     struct create_context ccontext;
> >>> +     struct create_context_hdr ccontext;
> >>>        __u8    Name[16];
> >>>        __le32 nlink;
> >>>        __le32 reparse_tag;
> >>> @@ -381,13 +381,13 @@ struct smb2_ea_info {
> >>>    } __packed; /* level 15 Query */
> >>>
> >>>    struct create_ea_buf_req {
> >>> -     struct create_context ccontext;
> >>> +     struct create_context_hdr ccontext;
> >>>        __u8   Name[8];
> >>>        struct smb2_ea_info ea;
> >>>    } __packed;
> >>>
> >>>    struct create_sd_buf_req {
> >>> -     struct create_context ccontext;
> >>> +     struct create_context_hdr ccontext;
> >>>        __u8   Name[8];
> >>>        struct smb_ntsd ntsd;
> >>>    } __packed;
> >>
> >
> >
> > --
> > Thanks,
> >
> > Steve



--=20
Thanks,

Steve

