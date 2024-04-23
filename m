Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1419F8AF7D6
	for <lists+samba-technical@lfdr.de>; Tue, 23 Apr 2024 22:16:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=pGLZnDWFDCrusOH5UcKXNKUGAQq9CjXmcb6zRjXi6LY=; b=LYY5eZdO7oqv+fHWTFP1y6i+DK
	06ef0+uowSIARSuOYKdWGj++4e6XXZ6Tl03NcfcUb0Yohy3qWvccS6D71SGgHDoxIB3PLtFepxP0G
	mWhevXCZXCSWciXXeEmKATr2nj8EQRwlGdqLTRQBmukmSR8yE3ETdpXBVpOhLjqF2M8XCxqGI1g+J
	73Ii/J4GJLYo/TpU6nSWMt6WlxlrSKwY5ZnoxEngknx2SokuqHYpcAqBJnXnTO0z8qkRJHrHeE3Y1
	ojZLlpsLVHwoP7+HF4EEQo8mDhPOpQWU0sZjW8+vgFi5Z12CeiQMIl7Np3ZdMWYywPEpQxxjpdVzx
	mCSxuOkA==;
Received: from ip6-localhost ([::1]:18386 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rzMYK-005TNQ-Ne; Tue, 23 Apr 2024 20:15:44 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:54341) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rzMYF-005TNJ-5u
 for samba-technical@lists.samba.org; Tue, 23 Apr 2024 20:15:42 +0000
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5194cebd6caso7363340e87.0
 for <samba-technical@lists.samba.org>; Tue, 23 Apr 2024 13:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713903337; x=1714508137; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pGLZnDWFDCrusOH5UcKXNKUGAQq9CjXmcb6zRjXi6LY=;
 b=MGAztC68r6Vf1rQmwYnBL1jFk3dZKYu+Ks17tDPcHy9wbc0uZ0fLZmyoBVj0GEngSD
 eLroCt9u7gFIjPmkui+cgLeBabott7eQRpd65tDzon0PXaDbC5/pmp0ANdrpvCQCUQfq
 GHEO7QVSFsGGuJTRAa/wnzSV1xelhds17FlaAgbxmwJeCbaMMR0Wksmx+Vna7adBmgmz
 6JpJkJ42ZOgOvc6H51GNZg6/3V7lUvtxBA9H7VoGfouuo9N6uW78gcxz78AE/XWaKAVG
 kKEaT34YzTgD2wcsc0ychk4/r4RYlBUhauPEsu2TXfXP4OrbeabnzRIopFtDVzctT+BH
 6VCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713903337; x=1714508137;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pGLZnDWFDCrusOH5UcKXNKUGAQq9CjXmcb6zRjXi6LY=;
 b=CcqCamQngEGFFZCZ0N55moKC/rlMsGOf8VQyTlp1M6ZErMmiVWHr+Oe2C6kH6Zlbqx
 zxgNVUB+zptgUtJrBradV8AkkP0M7zmEkFCz/5W6eUrN9CgQtDNpPM2Noq6XvlN77sRk
 eLO3IvfiYfxSy9bHtGl6lx5ri19u+q1Ta8Jxnq92WCyqCbBFMrDCxDiAHVMyLNwsyfOC
 2XSCiGeeLEwkSgBa765TqWlHE+sdoC+7xpJajq6damqqauteTfauIgPMAvp2gg7fYRG/
 S+VchOCL0fjbv71EXsusml1RmL5D7wltRu9Is3LhR/Zbi1UPCQ1akC4z7w4dpXwwSH0M
 m2DA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+A/Qwe06RTpB2SOCra8I1iuLEslC6Cht1j7/pPLvCuD1wOrZyEwRH4lnYl7osET1kwHcPfFv0gorrIHenOIg+WDeIhrRy0bpHRJiLRrZD
X-Gm-Message-State: AOJu0Yx/SzTmttdSTqjCp8GulG1HuIsUUXlY50M3PpiisucTUJkVou4V
 4jT0enhiufPvMthXG1JoqL+jyf+V65YXmNpr634YljLbzTH8bSfQeg4oXYmZMyGdi3EqvF+j7Mu
 4/Wh98BmfxX+ysInCEfsjSFVmLh0=
X-Google-Smtp-Source: AGHT+IEyhJecIivbLUIDM3IUmHGP5A5wQhqjg/Q1m0UANUeHn8MZITQtt0La4viLjyuveSssLkaDXNbAtLAFKTYjmqU=
X-Received: by 2002:ac2:5105:0:b0:517:8594:2c00 with SMTP id
 q5-20020ac25105000000b0051785942c00mr367332lfb.22.1713903336634; Tue, 23 Apr
 2024 13:15:36 -0700 (PDT)
MIME-Version: 1.0
References: <ZhgDTj1nwLEtSd9h@neat>
 <1166494b-3e34-4919-9998-141540a948b3@embeddedor.com>
In-Reply-To: <1166494b-3e34-4919-9998-141540a948b3@embeddedor.com>
Date: Tue, 23 Apr 2024 15:15:24 -0500
Message-ID: <CAH2r5msZaV1kHqQw8Sb_3wQfGBj4aU+tSCR5E0YJ8fCH6ODB4Q@mail.gmail.com>
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

This looks reasonably safe (running the usual regression tests on it now).

Reminds me though that we have to be careful (e.g. the recent fix for
regression caused by cleanup).

Thoughts about whether should be sent in rc6 or wait till 6.10?  51
warnings does sound
distracting though so might be worth going in sooner rather than later.

commit 0268a7cc7fdc47d90b6c18859de7718d5059f6f1
Author: Namjae Jeon <linkinjeon@kernel.org>
Date:   Fri Apr 19 23:46:34 2024 +0900

    ksmbd: common: use struct_group_attr instead of struct_group for
network_open_info

    4byte padding cause the connection issue with the applications of MacOS=
.
    smb2_close response size increases by 4 bytes by padding, And the smb
    client of MacOS check it and stop the connection. This patch use
    struct_group_attr instead of struct_group for network_open_info to use
     __packed to avoid padding.


On Tue, Apr 23, 2024 at 1:58=E2=80=AFPM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
>
> Hi all,
>
> Friendly ping: who can take this, please?
>
> Thanks
> --
> Gustavo
>
> On 11/04/24 09:35, Gustavo A. R. Silva wrote:
> > -Wflex-array-member-not-at-end is coming in GCC-14, and we are getting
> > ready to enable it globally.
> >
> > So, in order to avoid ending up with a flexible-array member in the
> > middle of multiple other structs, we use the `__struct_group()` helper
> > to separate the flexible array from the rest of the members in the
> > flexible structure, and use the tagged `struct create_context_hdr`
> > instead of `struct create_context`.
> >
> > So, with these changes, fix 51 of the following warnings[1]:
> >
> > fs/smb/client/../common/smb2pdu.h:1225:31: warning: structure containin=
g a flexible array member is not at the end of another structure [-Wflex-ar=
ray-member-not-at-end]
> >
> > Link: https://gist.github.com/GustavoARSilva/772526a39be3dd4db39e71497f=
0a9893 [1]
> > Link: https://github.com/KSPP/linux/issues/202
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> > ---
> >   fs/smb/client/smb2pdu.h | 12 ++++++------
> >   fs/smb/common/smb2pdu.h | 33 ++++++++++++++++++---------------
> >   fs/smb/server/smb2pdu.h | 18 +++++++++---------
> >   3 files changed, 33 insertions(+), 30 deletions(-)
> >
> > diff --git a/fs/smb/client/smb2pdu.h b/fs/smb/client/smb2pdu.h
> > index c72a3b2886b7..1a02bd9e0c00 100644
> > --- a/fs/smb/client/smb2pdu.h
> > +++ b/fs/smb/client/smb2pdu.h
> > @@ -145,7 +145,7 @@ struct durable_context_v2 {
> >   } __packed;
> >
> >   struct create_durable_v2 {
> > -     struct create_context ccontext;
> > +     struct create_context_hdr ccontext;
> >       __u8   Name[8];
> >       struct durable_context_v2 dcontext;
> >   } __packed;
> > @@ -167,7 +167,7 @@ struct durable_reconnect_context_v2_rsp {
> >   } __packed;
> >
> >   struct create_durable_handle_reconnect_v2 {
> > -     struct create_context ccontext;
> > +     struct create_context_hdr ccontext;
> >       __u8   Name[8];
> >       struct durable_reconnect_context_v2 dcontext;
> >       __u8   Pad[4];
> > @@ -175,7 +175,7 @@ struct create_durable_handle_reconnect_v2 {
> >
> >   /* See MS-SMB2 2.2.13.2.5 */
> >   struct crt_twarp_ctxt {
> > -     struct create_context ccontext;
> > +     struct create_context_hdr ccontext;
> >       __u8    Name[8];
> >       __le64  Timestamp;
> >
> > @@ -183,12 +183,12 @@ struct crt_twarp_ctxt {
> >
> >   /* See MS-SMB2 2.2.13.2.9 */
> >   struct crt_query_id_ctxt {
> > -     struct create_context ccontext;
> > +     struct create_context_hdr ccontext;
> >       __u8    Name[8];
> >   } __packed;
> >
> >   struct crt_sd_ctxt {
> > -     struct create_context ccontext;
> > +     struct create_context_hdr ccontext;
> >       __u8    Name[8];
> >       struct smb3_sd sd;
> >   } __packed;
> > @@ -415,7 +415,7 @@ struct smb2_posix_info_parsed {
> >   };
> >
> >   struct smb2_create_ea_ctx {
> > -     struct create_context ctx;
> > +     struct create_context_hdr ctx;
> >       __u8 name[8];
> >       struct smb2_file_full_ea_info ea;
> >   } __packed;
> > diff --git a/fs/smb/common/smb2pdu.h b/fs/smb/common/smb2pdu.h
> > index 1b594307c9d5..eab9d49c63ba 100644
> > --- a/fs/smb/common/smb2pdu.h
> > +++ b/fs/smb/common/smb2pdu.h
> > @@ -1171,12 +1171,15 @@ struct smb2_server_client_notification {
> >   #define SMB2_CREATE_FLAG_REPARSEPOINT 0x01
> >
> >   struct create_context {
> > -     __le32 Next;
> > -     __le16 NameOffset;
> > -     __le16 NameLength;
> > -     __le16 Reserved;
> > -     __le16 DataOffset;
> > -     __le32 DataLength;
> > +     /* New members must be added within the struct_group() macro belo=
w. */
> > +     __struct_group(create_context_hdr, hdr, __packed,
> > +             __le32 Next;
> > +             __le16 NameOffset;
> > +             __le16 NameLength;
> > +             __le16 Reserved;
> > +             __le16 DataOffset;
> > +             __le32 DataLength;
> > +     );
> >       __u8 Buffer[];
> >   } __packed;
> >
> > @@ -1222,7 +1225,7 @@ struct smb2_create_rsp {
> >   } __packed;
> >
> >   struct create_posix {
> > -     struct create_context ccontext;
> > +     struct create_context_hdr ccontext;
> >       __u8    Name[16];
> >       __le32  Mode;
> >       __u32   Reserved;
> > @@ -1230,7 +1233,7 @@ struct create_posix {
> >
> >   /* See MS-SMB2 2.2.13.2.3 and MS-SMB2 2.2.13.2.4 */
> >   struct create_durable {
> > -     struct create_context ccontext;
> > +     struct create_context_hdr ccontext;
> >       __u8   Name[8];
> >       union {
> >               __u8  Reserved[16];
> > @@ -1243,14 +1246,14 @@ struct create_durable {
> >
> >   /* See MS-SMB2 2.2.13.2.5 */
> >   struct create_mxac_req {
> > -     struct create_context ccontext;
> > +     struct create_context_hdr ccontext;
> >       __u8   Name[8];
> >       __le64 Timestamp;
> >   } __packed;
> >
> >   /* See MS-SMB2 2.2.14.2.5 */
> >   struct create_mxac_rsp {
> > -     struct create_context ccontext;
> > +     struct create_context_hdr ccontext;
> >       __u8   Name[8];
> >       __le32 QueryStatus;
> >       __le32 MaximalAccess;
> > @@ -1286,13 +1289,13 @@ struct lease_context_v2 {
> >   } __packed;
> >
> >   struct create_lease {
> > -     struct create_context ccontext;
> > +     struct create_context_hdr ccontext;
> >       __u8   Name[8];
> >       struct lease_context lcontext;
> >   } __packed;
> >
> >   struct create_lease_v2 {
> > -     struct create_context ccontext;
> > +     struct create_context_hdr ccontext;
> >       __u8   Name[8];
> >       struct lease_context_v2 lcontext;
> >       __u8   Pad[4];
> > @@ -1300,7 +1303,7 @@ struct create_lease_v2 {
> >
> >   /* See MS-SMB2 2.2.14.2.9 */
> >   struct create_disk_id_rsp {
> > -     struct create_context ccontext;
> > +     struct create_context_hdr ccontext;
> >       __u8   Name[8];
> >       __le64 DiskFileId;
> >       __le64 VolumeId;
> > @@ -1309,7 +1312,7 @@ struct create_disk_id_rsp {
> >
> >   /* See MS-SMB2 2.2.13.2.13 */
> >   struct create_app_inst_id {
> > -     struct create_context ccontext;
> > +     struct create_context_hdr ccontext;
> >       __u8 Name[16];
> >       __le32 StructureSize; /* Must be 20 */
> >       __u16 Reserved;
> > @@ -1318,7 +1321,7 @@ struct create_app_inst_id {
> >
> >   /* See MS-SMB2 2.2.13.2.15 */
> >   struct create_app_inst_id_vers {
> > -     struct create_context ccontext;
> > +     struct create_context_hdr ccontext;
> >       __u8 Name[16];
> >       __le32 StructureSize; /* Must be 24 */
> >       __u16 Reserved;
> > diff --git a/fs/smb/server/smb2pdu.h b/fs/smb/server/smb2pdu.h
> > index bd1d2a0e9203..643f5e1cfe35 100644
> > --- a/fs/smb/server/smb2pdu.h
> > +++ b/fs/smb/server/smb2pdu.h
> > @@ -64,7 +64,7 @@ struct preauth_integrity_info {
> >   #define SMB2_SESSION_TIMEOUT                (10 * HZ)
> >
> >   struct create_durable_req_v2 {
> > -     struct create_context ccontext;
> > +     struct create_context_hdr ccontext;
> >       __u8   Name[8];
> >       __le32 Timeout;
> >       __le32 Flags;
> > @@ -73,7 +73,7 @@ struct create_durable_req_v2 {
> >   } __packed;
> >
> >   struct create_durable_reconn_req {
> > -     struct create_context ccontext;
> > +     struct create_context_hdr ccontext;
> >       __u8   Name[8];
> >       union {
> >               __u8  Reserved[16];
> > @@ -85,7 +85,7 @@ struct create_durable_reconn_req {
> >   } __packed;
> >
> >   struct create_durable_reconn_v2_req {
> > -     struct create_context ccontext;
> > +     struct create_context_hdr ccontext;
> >       __u8   Name[8];
> >       struct {
> >               __u64 PersistentFileId;
> > @@ -96,13 +96,13 @@ struct create_durable_reconn_v2_req {
> >   } __packed;
> >
> >   struct create_alloc_size_req {
> > -     struct create_context ccontext;
> > +     struct create_context_hdr ccontext;
> >       __u8   Name[8];
> >       __le64 AllocationSize;
> >   } __packed;
> >
> >   struct create_durable_rsp {
> > -     struct create_context ccontext;
> > +     struct create_context_hdr ccontext;
> >       __u8   Name[8];
> >       union {
> >               __u8  Reserved[8];
> > @@ -114,7 +114,7 @@ struct create_durable_rsp {
> >   /* Flags */
> >   #define SMB2_DHANDLE_FLAG_PERSISTENT        0x00000002
> >   struct create_durable_v2_rsp {
> > -     struct create_context ccontext;
> > +     struct create_context_hdr ccontext;
> >       __u8   Name[8];
> >       __le32 Timeout;
> >       __le32 Flags;
> > @@ -122,7 +122,7 @@ struct create_durable_v2_rsp {
> >
> >   /* equivalent of the contents of SMB3.1.1 POSIX open context response=
 */
> >   struct create_posix_rsp {
> > -     struct create_context ccontext;
> > +     struct create_context_hdr ccontext;
> >       __u8    Name[16];
> >       __le32 nlink;
> >       __le32 reparse_tag;
> > @@ -381,13 +381,13 @@ struct smb2_ea_info {
> >   } __packed; /* level 15 Query */
> >
> >   struct create_ea_buf_req {
> > -     struct create_context ccontext;
> > +     struct create_context_hdr ccontext;
> >       __u8   Name[8];
> >       struct smb2_ea_info ea;
> >   } __packed;
> >
> >   struct create_sd_buf_req {
> > -     struct create_context ccontext;
> > +     struct create_context_hdr ccontext;
> >       __u8   Name[8];
> >       struct smb_ntsd ntsd;
> >   } __packed;
>


--
Thanks,

Steve

