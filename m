Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E309397AA
	for <lists+samba-technical@lfdr.de>; Fri,  7 Jun 2019 23:24:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=VDnA7G6oEfycCISMp+y58zaY4Y2dGvtqHh5KDSqa5A4=; b=URMNsTQymrascrt0Z+m/HfCxhT
	aDTd+nj4noQ8xK/4yrGSHYHlmiYlXG9GIwbOIRAyH12WzsA00EyoPlCXCMY4mSZ2XZ5pA4pdhvORT
	M8dmxnZkTORUzYxQ0Zqrel11uXjPwBgNmSqCNasPXr9uIsFlw+nz2VxWQn8RsW1C9gpds22wmyxh9
	shzR0Tsk6mUBdIlvsWDQp4Wf19EVMmDRalJhMweOfVsrYf8h+j0r8FEH4RRsVHuj/nXtiilzktoJd
	ozXZTQr2yl+z3iSs6EuPxIhHodp0sSvzJusOuAWH2AEp/DWKINZ2UTXICAE9JHnT9nOLPCaNms/cn
	K8PKHIxg==;
Received: from localhost ([::1]:60978 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hZMLS-000RxW-Tw; Fri, 07 Jun 2019 21:24:18 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:44458) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hZMLO-000RxP-Id
 for samba-technical@lists.samba.org; Fri, 07 Jun 2019 21:24:16 +0000
Received: by mail-io1-xd35.google.com with SMTP id s7so2503338iob.11
 for <samba-technical@lists.samba.org>; Fri, 07 Jun 2019 14:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VDnA7G6oEfycCISMp+y58zaY4Y2dGvtqHh5KDSqa5A4=;
 b=EVK8M02ZV1vR7lHfj/Z7ku3d1GD30vGAZeAbk42Hiv7j8RJMlzdV5rj3EFi+OR6uwy
 /o4To+6eTjBqJl9MvcFtkPfzcvUSlM/uCSGeHs4Cstb9PRSK8QNnHbkOjx34smOMfzAW
 EQfRvgnWvf4sMbAz/f7mF5+crhQjiUE3MvD1aP1hy27EQidLbvh+TTSIR2OpqZ0yZpiF
 KAoKykp8TPzMFzo1cFpkJBde0Bpoutpv/6kRx+5NfGEjQ2FGyIxMSvCGvQuePN2ppXEA
 V5gOXiMCJYlrOio8YyENyvW6A1RnT8unOp4p5XCGUHpV+fq5ZbqzBO9ud3/+xGECgOMO
 Zxeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VDnA7G6oEfycCISMp+y58zaY4Y2dGvtqHh5KDSqa5A4=;
 b=EBrH2RZyxUZfBpkFlLVmD/yGSRY4kjX4f0ZU300RjV87y1aDbUcSg08dcnZbEZOeK/
 7F3fQ1gX2lpVcFUKRhmjz+AUyaVx62rMy+5iCm6i+vkZpzeIMp/RRFaZ6T6T1UKEV1a3
 KzUBT0Ie/lX7ExAwzdPczO/7ay/GYaCGGnz/vayLxAZtlNdHp+KKIkIeX48H1qPV5sDL
 RGHzABL7b4dm8dGouW+k5IPNQHZuiVMqf/QLQUOx+DAnNrVq3fV+g1XCeZ24LM2UPHvG
 Bfm74ZQgv/AyVKP/J9SlQeUjJSueBNwHGt85Y+8SApUhMyZylpGC4VCiQbglrWbMBI9E
 Ef/A==
X-Gm-Message-State: APjAAAXiDnh8eJwifWW+oGgmkLNsI3LnqYPl/arEbmQIM9W2RDldYDqL
 gHf3P9MdBmiiamd4HH+E/jN+MLKMyPm9fkNKezw=
X-Google-Smtp-Source: APXvYqyh3SBLLyE4XRupeW0yPO1XrHgOpW2cKgu2XEQB9/f5/d1ZIFgt2VXu3N1AiFfwEaCNuy2KrKkTRny2WKyWmbY=
X-Received: by 2002:a6b:4f14:: with SMTP id d20mr19168204iob.219.1559942652611; 
 Fri, 07 Jun 2019 14:24:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mvA3t2Nm4F=LuBwHkN+E19pHuiLaSv0JV9SMNYvZrxAiQ@mail.gmail.com>
In-Reply-To: <CAH2r5mvA3t2Nm4F=LuBwHkN+E19pHuiLaSv0JV9SMNYvZrxAiQ@mail.gmail.com>
Date: Sat, 8 Jun 2019 07:24:01 +1000
Message-ID: <CAN05THT93RGGqECaQjpBJzo7cQWyxfsSNh-3nX+WqagjeZN8wQ@mail.gmail.com>
Subject: Re: [SMB3.1.1] Faster crypto (GCM) for Linux kernel SMB3.1.1 mounts
To: Steve French <smfrench@gmail.com>
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

First patch, fix the comment :
+ pneg_ctxt->DataLength = cpu_to_le16(6); /* Cipher Count + le16 cipher */
to
+ pneg_ctxt->DataLength = cpu_to_le16(6); /* Cipher Count + 2 * le16 cipher */

You can add a Reviewed-by me.
Very nice!

On Sat, Jun 8, 2019 at 6:24 AM Steve French via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> I am seeing more than double the performance of copy to Samba on
> encrypted mount with this two patch set, and 80%+ faster on copy from
> Samba server (when running Ralph's GCM capable experimental branch of
> Samba)
>
> Patches to update the kernel client (cifs.ko) attached:
>
> --
> Thanks,
>
> Steve

