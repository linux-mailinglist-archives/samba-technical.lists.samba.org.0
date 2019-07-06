Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DAE61232
	for <lists+samba-technical@lfdr.de>; Sat,  6 Jul 2019 18:35:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=2L/BKOCUH/BxqAaoUdyV9miypLog77NEuRxz7kNY9J4=; b=GwL9pzrt4u374SOgoatK/mVzdr
	dmYp3vWo5fjm2fleKUl0GfpSaRLCGYa/S6IdEqgfAHpNGQUqUVGNab6SfFnQJyDcZCX9CbLP1cGVH
	TL64xNP1+KnzeryQGde89gFk3+IjzDBpHJxl24dT63SA5xVa4tIMgHYp+zZ80ixZhr5VFwpTROb39
	QBwEzt19hxGDCQTqP2FDkibPbS+O432+kGGz2Hhrh92KddtxFZTL9SGcoxYJUVjJYnguKot1AHRT2
	L/eDfPIvtR0CN8/68sLnY5gxDv4Cd5RKOhLERk9m7CKLB/0wyhKdDuK7hVIGfKU6df1+pe00AryS7
	/KCQroOg==;
Received: from localhost ([::1]:53618 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hjneM-005dbR-Vj; Sat, 06 Jul 2019 16:34:59 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:42141) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hjneJ-005dbK-7k
 for samba-technical@lists.samba.org; Sat, 06 Jul 2019 16:34:57 +0000
Received: by mail-lf1-x143.google.com with SMTP id s19so7436865lfb.9
 for <samba-technical@lists.samba.org>; Sat, 06 Jul 2019 09:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2L/BKOCUH/BxqAaoUdyV9miypLog77NEuRxz7kNY9J4=;
 b=d/etvwM42DZagf9atRqu2kMlmy/nxd5tb4dq63AYuugdNax9g0UAeRGsZNcTvFyEdF
 qOtLrlWcKGsb/m6skS+MXLznuWbcJc6PisTfdLCeRAYa+dLZlW6N/56VmISocZ1vB33k
 syMxpQ0QgWzK/l40x/gacBXxfJdgARXvWfnBxxMozNurzDSJO3kxQ/MZGEG0jGfj1bib
 OzOmt3u9APiDQgteskGngcGrB0sRFrzykJX/JanjDrUiBkIdaF6vL1xNzrn2GV28tcWn
 Rd5F4Kh7W1qoakHvCmnA0sgaN0aembgka12xsaY1vLpXLhSfbrIFWrxC6b4qtAqyqOUv
 06Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2L/BKOCUH/BxqAaoUdyV9miypLog77NEuRxz7kNY9J4=;
 b=jgd7CUj4zK9UPHM4/QQ0cqd569STuuonPfJTa2QmPymiI2eC5PiPYDkll+QnP7hRSz
 Cu5ynBKBvN6/IDWaG7qSMi40cupumTeW4xtjEc4GIZijw6o+4ZjE9n+WsL1Cvx2wu5GI
 UaF1b87x2husPU8hYK5ex08ltPGD0UUWjZKrAngdFIkGn7qnjq5Un/dxeXdYD/27IPdR
 PIk3un9z++PRNcGfISQvEaC38Ffcse4o4kecVW1fQPUwwNcteHxS/bT3/nwIwheAFwpP
 qw106dS1hsRzExkxrOuhaMnYO29YIZSxCPRBH981NiGsRjR6ouZgjKz6DsSPaLGOdjGE
 u8pw==
X-Gm-Message-State: APjAAAX1LMGFT+ezM4gqqZPlfDCBeP6Bs2b6bnPEd+mHGS+NGKVgt2pW
 MMra8zZo7i3NhJqUdKjt3AfZz4n9EszX302jZoz/uq0=
X-Google-Smtp-Source: APXvYqwDYi74oX2SkPWZnLY3z8JWBYDcDFLRIZFHI0JBXLG5+Z7+1X4YhP/+DxqyS3p6KkxVxpxA3YAGReQ8vO2wxMA=
X-Received: by 2002:a19:5f46:: with SMTP id a6mr4711827lfj.142.1562430893089; 
 Sat, 06 Jul 2019 09:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mtb_g1Hx4UPB+5XpSY3Ew_fn=bdjLnpRD=ZQymJxrUw0g@mail.gmail.com>
In-Reply-To: <CAH2r5mtb_g1Hx4UPB+5XpSY3Ew_fn=bdjLnpRD=ZQymJxrUw0g@mail.gmail.com>
Date: Sat, 6 Jul 2019 09:34:41 -0700
Message-ID: <CAKywueQu8idf6120LybjsNwHqy7MOnXMcm=e8ug=UtiU4u0zWA@mail.gmail.com>
Subject: Re: [PATCH] Improve performance of POSIX open - request query disk id
 open context
To: Steve French <smfrench@gmail.com>
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
From: Pavel Shilovsky via samba-technical <samba-technical@lists.samba.org>
Reply-To: Pavel Shilovsky <pavel.shilovsky@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Good idea! See some comments below.

When adding new context, the following defines need to be changed:

689 /*
690  * Maximum size of a SMB2_CREATE response is 64 (smb2 header) +
691  * 88 (fixed part of create response) + 520 (path) + 150 (contexts) +
692  * 2 bytes of padding.
693  */
694 #define MAX_SMB2_CREATE_RESPONSE_SIZE 824

and

657 /*
658  * Maximum number of iovs we need for an open/create request.
659  * [0] : struct smb2_create_req
660  * [1] : path
661  * [2] : lease context
662  * [3] : durable context
663  * [4] : posix context
664  * [5] : time warp context
665  * [6] : compound padding
666  */
667 #define SMB2_CREATE_IOV_SIZE 7

+       if (n_iov > 2) {
+               struct create_context *ccontext =3D
+                       (struct create_context *)iov[n_iov-1].iov_base;
+               ccontext->Next =3D cpu_to_le32(iov[n_iov-1].iov_len);
+       }
+       add_query_id_context(iov, &n_iov);

I think we should add a check if iov has enough capacity to keep all
the contexts. Right now it will oops if it wasn't allocated right in
the upper layer.

In general, I think having a complete patch that adds the whole
functionality is better for future git bisect and looks more logical
instead of breaking such small features into parts.

Best regards,
Pavel Shilovskiy

=D0=BF=D1=82, 5 =D0=B8=D1=8E=D0=BB. 2019 =D0=B3. =D0=B2 23:14, Steve French=
 via samba-technical
<samba-technical@lists.samba.org>:
>
> We can cut the number of roundtrips on open (may also
> help some rename cases as well) by returning the inode
> number in the SMB2 open request itself instead of
> querying it afterwards via a query FILE_INTERNAL_INFO.
> This should significantly improve the performance of
> posix open.
>
> Add SMB2_CREATE_QUERY_ON_DISK_ID create context request
> on open calls so that when server supports this we
> can save a roundtrip for QUERY_INFO on every open.
>
> Follow on patch will add the response processing for
> SMB2_CREATE_QUERY_ON_DISK_ID context and optimize
> smb2_open_file to avoid the extra network roundtrip
> on every posix open. This patch adds the context on
> SMB2/SMB3 open requests.
>
> --
> Thanks,
>
> Steve

