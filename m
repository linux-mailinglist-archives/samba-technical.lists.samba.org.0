Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C5919363F
	for <lists+samba-technical@lfdr.de>; Thu, 26 Mar 2020 04:04:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=tu2R46PxBzgRGxhsri+C0lPx39X7cI6ESo8Mli3RodM=; b=foHjr2nv/U7+GLEQxNhqQJTYkt
	Xh6QWUyAlNIpzxfd0tcnha8RmEsXRSD+nGlshEHpQeB+CsXYp1+4+ubHHfoq7xVmt7N17pW9rebVI
	YebJBASX99vlTXFcR4OS90ZOSHjxEfIpABcSCideaHzvcAnwxr7ArINB2ihze5rR19KgWE5IVg5zg
	WX+doadMi0rh5kFUg7ogRSIIa6rc1BcM8zJqkxTwEkw45O7MVZFstOeIMEPFwO1fbJzvlZVBBhG9h
	8dQLZ/VEesRaIkM5jFthm3wGDa0/PZw57rMZ0BylqLYuAwXUCVoHBdnHNsm0Twz30kIQUqD9+3ScN
	N38MVnkg==;
Received: from localhost ([::1]:59134 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jHIoQ-000kIa-1N; Thu, 26 Mar 2020 03:04:06 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:46740) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jHIoF-000kIT-He
 for samba-technical@lists.samba.org; Thu, 26 Mar 2020 03:04:03 +0000
Received: by mail-il1-x144.google.com with SMTP id e8so3988499ilc.13
 for <samba-technical@lists.samba.org>; Wed, 25 Mar 2020 20:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tu2R46PxBzgRGxhsri+C0lPx39X7cI6ESo8Mli3RodM=;
 b=bJFLyfbe5GvZVUVVIX0Ds29XJVyy6nN92PR9haCVSFju5N+XMN6IR+ijsloIRm6Ad2
 mdcar1uPfByJZydcbBv3Y9QBclr889Yty16kVAcQBHStDkIa/JssdaTGYXirWPGPk4M2
 QyoeOU4FOLQxcgJUBIxd9P8UWGqRq+PphJXym5wvxsiN5a20Ub05uBrYQ5MZwsuZ96Ns
 /kvitpooj5XTIyHOFPQ5J41bOtFUOchoBw1Tn16t/n9TYR1TSZHU+vRIg1/jWqTW6/JT
 C2BWBq9uVcc24Gi6RuH3R2rNtCqz0MzwPG/Qa7RsY7UEEYnYTfxaSN4Hf6gbsmtTchQd
 jFmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tu2R46PxBzgRGxhsri+C0lPx39X7cI6ESo8Mli3RodM=;
 b=n7ru2nCGRtCZVo5NXtgOKaFxFH6L1cZ0kfZulnRbE45H7TD2Kb/BMYTgzC/yJ0iFqB
 hlr9RgnR6yI4BFqhvRyrM81FloLFqjHpSU9pjygzAg8OdIarW8SHAg+CbbJ+x1FnYROf
 wl/LRew7ytwTgTzLj537eckigl03E2etFBs6bf9PyqVbmGIw6fZy1U30PQdExMGJ0TeJ
 hnr08p08QOax4jc4ToI4Q2bWb+RyrWWF7sOvD3+7v4OEy6+EaQwmI1n1UWWQhh9zd0Dc
 7s1GIqbTHF5+jsNX8PnUPRfmXTIGfqRcjQzBPmxlyDWzExPegZNLMgfDU8cdUUgM7tM/
 ZeYg==
X-Gm-Message-State: ANhLgQ2mRZKM1jYNaB2zR1zUFU3f/u1nAjY7He9U1aUj5jINVZMbrBCN
 ePOyLVOgFrSqoFA+O+zx6cMbJ9y4gPrlHQD+XN4=
X-Google-Smtp-Source: ADFU+vvCeS7j5ovQehJFwG+BECHWKOyWfIFTQ9ycqd1cTTezVdaudaSfNhhff3AXgYvTrYV/j7KcHseoKgKeAWrtEeo=
X-Received: by 2002:a92:1d59:: with SMTP id d86mr6855855ild.49.1585191831365; 
 Wed, 25 Mar 2020 20:03:51 -0700 (PDT)
MIME-Version: 1.0
References: <1585164614-123696-1-git-send-email-longli@linuxonhyperv.com>
 <CAN05THTH8-pK9uw77COWSUQ_knztT1o1Ms0b=2PPvmBJd=ovUw@mail.gmail.com>
 <BN8PR21MB1155CECE3C53742CC389E5F9CECF0@BN8PR21MB1155.namprd21.prod.outlook.com>
In-Reply-To: <BN8PR21MB1155CECE3C53742CC389E5F9CECF0@BN8PR21MB1155.namprd21.prod.outlook.com>
Date: Thu, 26 Mar 2020 13:03:40 +1000
Message-ID: <CAN05THRvway64Kp1BtNkEBHCrLLx45uooN0DPu3JGPZHq28m9g@mail.gmail.com>
Subject: Re: [PATCH] cifs: smbd: Calculate the correct maximum packet size for
 segmented SMBDirect send/receive
To: Long Li <longli@microsoft.com>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: Steve French <sfrench@samba.org>, linux-cifs <linux-cifs@vger.kernel.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "longli@linuxonhyperv.com" <longli@linuxonhyperv.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Mar 26, 2020 at 12:43 PM Long Li <longli@microsoft.com> wrote:
>
> >Subject: Re: [PATCH] cifs: smbd: Calculate the correct maximum packet size
> >for segmented SMBDirect send/receive
> >
> >Long Li,
> >
> >Mostly looks good  but the magic constant 49 I think is wrong.
> >49 is the structure size of the read/write request header but for these sizes, if
> >they are odd it just means that the header contain a variable sized blob.
> >I.e. the size is 48 bytes (for the fixed part of the header) + a variable part
> >which in this case are the ChannelInfo blobs.
>
> Agreed. Using a magic number is not a good idea.
>
> I was looking at request size definitions in
> "fs/cifs/smb2pdu.c",  they are defined at
> static const int smb2_req_struct_sizes[NUMBER_OF_SMB2_COMMANDS]
>
> for read and write, the sizes are:
>         /* SMB2_READ */ 49,
>         /* SMB2_WRITE */ 49,
>
> They are used to calculate command header sizes, and fill in the request headers. Maybe I should use this variable to get the size?

Nah, those values only specify what values must be set as the
structure size in the actual packet headers.
But they do not represent the actual sizes.
All command headers start with a 2 byte StructureSize field where
everything except the least significant bit indicates the fixed
portion of the response header
and if the least significant bit is set, then it indicates that the
header contains an additional
variable sized part of header,  (the size of which can be determined
by looking at the individual fields in the fixed portion of the
header).

So 49 does not indicate that the header is 49 bytes in size. It means
the header contains a 48 byte fixed part that is present in every such
command headers but it also contains 0 or more bytes of additional header.

So see these numbers as "these are the values we must put in the
StructureSize for the header"  but they do not represent the actual
size of the header. (well, except if the value is even, then it does
represent the header size.)


So for SMB2_READ and SMB2_WRITE commands, If we do not use RDMA, then
Channel will be set to 0
and we will not have any ReadWriteChannelInfo data.
In this case the READ/WRITE header size is always 48  (==49 & 0xfffe)

If we are using RDMA, then we still have the 48 byte normal header but
we also have 1 or more SMB_DIRECT_BUFFER_DESCRIPTOR_V1 structures
there.
So for that case the maximum header size would be 48  + <max number of
structures> * sizeof(SMB_DIRECT_BUFFER_DESCRIPTOR_V1)


regards
ronnie sahlberg



>
> >
> >So we should probably add to smb2pdu.h a #define
> >MAX_SMB2_READWRITE_RESPONSE_SIZE 48 and use this in the calculations.
> >Then we need to add the maximum size we will use for ChannelInfo.
> >
> >Maybe we should have a define also for the
> >MAX_SMB2_CHANNEL_INFO_SIZE
> >
> >regards
> >ronnie sahlberg
> >
> >On Thu, Mar 26, 2020 at 5:31 AM longli--- via samba-technical <samba-
> >technical@lists.samba.org> wrote:
> >>
> >> From: Long Li <longli@microsoft.com>
> >>
> >> The packet size needs to take account of SMB2 header size and possible
> >> encryption header size. This is only done when signing is used and it
> >> is for RDMA send/receive, not read/write.
> >>
> >> Also remove the dead SMBD code in smb2_negotiate_r(w)size.
> >>
> >> Signed-off-by: Long Li <longli@microsoft.com>
> >> ---
> >>  fs/cifs/smb2ops.c   | 38 ++++++++++++++++----------------------
> >>  fs/cifs/smbdirect.c |  3 +--
> >>  2 files changed, 17 insertions(+), 24 deletions(-)
> >>
> >> diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c index
> >> 4c0922596467..9043d34eef43 100644
> >> --- a/fs/cifs/smb2ops.c
> >> +++ b/fs/cifs/smb2ops.c
> >> @@ -332,16 +332,6 @@ smb2_negotiate_wsize(struct cifs_tcon *tcon,
> >struct smb_vol *volume_info)
> >>         /* start with specified wsize, or default */
> >>         wsize = volume_info->wsize ? volume_info->wsize :
> >CIFS_DEFAULT_IOSIZE;
> >>         wsize = min_t(unsigned int, wsize, server->max_write); -#ifdef
> >> CONFIG_CIFS_SMB_DIRECT
> >> -       if (server->rdma) {
> >> -               if (server->sign)
> >> -                       wsize = min_t(unsigned int,
> >> -                               wsize, server->smbd_conn->max_fragmented_send_size);
> >> -               else
> >> -                       wsize = min_t(unsigned int,
> >> -                               wsize, server->smbd_conn->max_readwrite_size);
> >> -       }
> >> -#endif
> >>         if (!(server->capabilities & SMB2_GLOBAL_CAP_LARGE_MTU))
> >>                 wsize = min_t(unsigned int, wsize,
> >> SMB2_MAX_BUFFER_SIZE);
> >>
> >> @@ -360,8 +350,15 @@ smb3_negotiate_wsize(struct cifs_tcon *tcon,
> >> struct smb_vol *volume_info)  #ifdef CONFIG_CIFS_SMB_DIRECT
> >>         if (server->rdma) {
> >>                 if (server->sign)
> >> +                       /*
> >> +                        * Account for SMB2 data transfer packet header
> >> +                        * SMB2_READ/SMB2_WRITE (49) and possible encryption
> >> +                        * headers
> >> +                        */
> >>                         wsize = min_t(unsigned int,
> >> -                               wsize, server->smbd_conn->max_fragmented_send_size);
> >> +                               wsize,
> >> +                               server->smbd_conn->max_fragmented_send_size -
> >> +                                       49 - sizeof(struct
> >> + smb2_transform_hdr));
> >>                 else
> >>                         wsize = min_t(unsigned int,
> >>                                 wsize,
> >> server->smbd_conn->max_readwrite_size);
> >> @@ -382,16 +379,6 @@ smb2_negotiate_rsize(struct cifs_tcon *tcon, struct
> >smb_vol *volume_info)
> >>         /* start with specified rsize, or default */
> >>         rsize = volume_info->rsize ? volume_info->rsize : CIFS_DEFAULT_IOSIZE;
> >>         rsize = min_t(unsigned int, rsize, server->max_read); -#ifdef
> >> CONFIG_CIFS_SMB_DIRECT
> >> -       if (server->rdma) {
> >> -               if (server->sign)
> >> -                       rsize = min_t(unsigned int,
> >> -                               rsize, server->smbd_conn->max_fragmented_recv_size);
> >> -               else
> >> -                       rsize = min_t(unsigned int,
> >> -                               rsize, server->smbd_conn->max_readwrite_size);
> >> -       }
> >> -#endif
> >>
> >>         if (!(server->capabilities & SMB2_GLOBAL_CAP_LARGE_MTU))
> >>                 rsize = min_t(unsigned int, rsize,
> >> SMB2_MAX_BUFFER_SIZE); @@ -411,8 +398,15 @@
> >> smb3_negotiate_rsize(struct cifs_tcon *tcon, struct smb_vol *volume_info)
> >#ifdef CONFIG_CIFS_SMB_DIRECT
> >>         if (server->rdma) {
> >>                 if (server->sign)
> >> +                       /*
> >> +                        * Account for SMB2 data transfer packet header
> >> +                        * SMB2_READ/SMB2_WRITE (49) and possible encryption
> >> +                        * headers
> >> +                        */
> >>                         rsize = min_t(unsigned int,
> >> -                               rsize, server->smbd_conn->max_fragmented_recv_size);
> >> +                               rsize,
> >> +                               server->smbd_conn->max_fragmented_recv_size -
> >> +                                       49 - sizeof(struct
> >> + smb2_transform_hdr));
> >>                 else
> >>                         rsize = min_t(unsigned int,
> >>                                 rsize,
> >> server->smbd_conn->max_readwrite_size);
> >> diff --git a/fs/cifs/smbdirect.c b/fs/cifs/smbdirect.c index
> >> eb1e40af9f3a..0327b575ab87 100644
> >> --- a/fs/cifs/smbdirect.c
> >> +++ b/fs/cifs/smbdirect.c
> >> @@ -2097,8 +2097,7 @@ int smbd_send(struct TCP_Server_Info *server,
> >>         for (i = 0; i < num_rqst; i++)
> >>                 remaining_data_length += smb_rqst_len(server,
> >> &rqst_array[i]);
> >>
> >> -       if (remaining_data_length + sizeof(struct smbd_data_transfer) >
> >> -               info->max_fragmented_send_size) {
> >> +       if (remaining_data_length > info->max_fragmented_send_size) {
> >>                 log_write(ERR, "payload size %d > max size %d\n",
> >>                         remaining_data_length, info->max_fragmented_send_size);
> >>                 rc = -EINVAL;
> >> --
> >> 2.17.1
> >>
> >>

