Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 708CE6997B8
	for <lists+samba-technical@lfdr.de>; Thu, 16 Feb 2023 15:43:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=XszOToe9Y36AY/B62CQ/e+lxgXzY+Ou9ed3kyrqxsx4=; b=0fQjffaBpdjXY1alrKky+vy5Aj
	Tm91f3DItHyM3kuJ9DneUF9kVktePmW8OtI0ZR48bT1m/Sbks+uMsL7sqIvQHw/5dbqe/gNI5pn11
	w2fURHxccQBc7Lkwz5l+cXtHcFkrUbl9BcHSEi8u71APDKhBxV1yRjGS26U9YkC1Gpv4HxSPXeVlE
	aFblmKEIcRes5LL7e9P32eyXG+j7m4NjUeCSZdvB1uaD900SAPJTT6VEUsuoVRMWsuH8OqkEWHlAI
	eoatXvzy0tDUyBXXzAcYCUQzz8E6IpodxHe9dGAxcJOcEx5y8F4LvP1ah3LkeTzTILQZUowPNus2f
	IfLGkdPA==;
Received: from ip6-localhost ([::1]:55638 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pSfSo-00Chiz-TF; Thu, 16 Feb 2023 14:42:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:59258) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1pSfSk-00Chiq-I5
 for samba-technical@lists.samba.org; Thu, 16 Feb 2023 14:42:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D4346614DB
 for <samba-technical@lists.samba.org>; Thu, 16 Feb 2023 14:25:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44B5DC4339C
 for <samba-technical@lists.samba.org>; Thu, 16 Feb 2023 14:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676557503;
 bh=DlaFGPI8/PtG0jbRs8yDMyRigvxWoADQdFPsFBEUvVM=;
 h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
 b=jtPb9BXfoJ4ZIuteko19xvEHrh0zX9vL+hj21bb6i9YloP5XD4j0AzdYnrNw/r1cV
 irTY1qdNbSU6KHCtRGYajBsFTXo5RihWxDt6qmzyEG/tlAiIKA4VZCyuxIb8zXfcK+
 7b2C8p1C/NXEgYNStB11TWeq4NWj4fYRYDI2TSJyarB99J32scKwyTeeNvGxYb5tbJ
 pwB/9qiPeh4iOe9T+t+ydQDl2em2wxZhNTyvrNXc3PoOlvZDWYsdN0QPZ6bXDtrNe4
 TsGw1SfbYUDD4aVR7dyDpsy2RIfLhXPdkbuVMKOZMUtNPy6n0WsQ0DpNVHD+Zyj8XL
 EEuI/zj4uTO9w==
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-16cc1e43244so2639400fac.12
 for <samba-technical@lists.samba.org>; Thu, 16 Feb 2023 06:25:03 -0800 (PST)
X-Gm-Message-State: AO0yUKVUPt6E+hoqN7dxzKXyiqc1dCr+Oz9e48jJyqp9Pl/21nhucoeY
 FIPaIs0AmXiSGwfilkKyxr/JCWQO4nWCDo2Cmj0=
X-Google-Smtp-Source: AK7set/YDnoRsXFW4kmp4obtqoSrpLbMekh5OLqyPQitghf4s397JCGpwBcy4mlMZ5KbG30FMsXw3/Lnue0SZ0ll3J0=
X-Received: by 2002:a05:6870:b52c:b0:16a:b198:74e9 with SMTP id
 v44-20020a056870b52c00b0016ab19874e9mr194278oap.215.1676557502403; Thu, 16
 Feb 2023 06:25:02 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a8a:355:0:b0:4a5:1048:434b with HTTP; Thu, 16 Feb 2023
 06:25:01 -0800 (PST)
In-Reply-To: <20230214232928.gonna.714-kees@kernel.org>
References: <20230214232928.gonna.714-kees@kernel.org>
Date: Thu, 16 Feb 2023 23:25:01 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-fcukmXfdwiAxOxe+5c+Y6vvaoQ3ff-5sK+Zis0HgC5A@mail.gmail.com>
Message-ID: <CAKYAXd-fcukmXfdwiAxOxe+5c+Y6vvaoQ3ff-5sK+Zis0HgC5A@mail.gmail.com>
Subject: Re: [PATCH v2] smb3: Replace smb2pdu 1-element arrays with flex-arrays
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
From: Namjae Jeon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Tom Talpey <tom@talpey.com>, Shyam Prasad N <sprasad@microsoft.com>,
 linux-cifs@vger.kernel.org, Paulo Alcantara <pc@cjr.nz>,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-hardening@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Kees,

>  /* Read flags */
> @@ -730,7 +730,7 @@ struct smb2_read_rsp {
>  	__le32 DataLength;
>  	__le32 DataRemaining;
>  	__le32 Flags;
> -	__u8   Buffer[1];
> +	__u8   Buffer[];
>  } __packed;
>

You seem to have missed -1 removal in the code below.

./fs/cifs/smb2ops.c:5632:       .read_rsp_size = sizeof(struct
smb2_read_rsp) - 1,
./fs/cifs/smb2ops.c:5654:       .read_rsp_size = sizeof(struct
smb2_read_rsp) - 1,
./fs/cifs/smb2ops.c:5675:       .read_rsp_size = sizeof(struct
smb2_read_rsp) - 1,
./fs/cifs/smb2ops.c:5696:       .read_rsp_size = sizeof(struct
smb2_read_rsp) - 1,
./fs/cifs/smb2ops.c:5717:       .read_rsp_size = sizeof(struct
smb2_read_rsp) - 1,
./fs/cifs/smb2ops.c:5738:       .read_rsp_size = sizeof(struct
smb2_read_rsp) - 1,
./fs/cifs/smb2ops.c:5759:       .read_rsp_size = sizeof(struct
smb2_read_rsp) - 1,

./fs/ksmbd/smb2ops.c:29:        .read_rsp_size = sizeof(struct
smb2_read_rsp) - 1,
./fs/ksmbd/smb2ops.c:55:        .read_rsp_size = sizeof(struct
smb2_read_rsp) - 1,
./fs/ksmbd/smb2ops.c:82:        .read_rsp_size = sizeof(struct
smb2_read_rsp) - 1,
./fs/ksmbd/smb2ops.c:109:       .read_rsp_size = sizeof(struct
smb2_read_rsp) - 1,

thanks.

