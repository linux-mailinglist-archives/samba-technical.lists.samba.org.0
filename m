Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 62238A82F24
	for <lists+samba-technical@lfdr.de>; Wed,  9 Apr 2025 20:44:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=KI+q2kvMmfaLgOCyijeyDo0KbIaH3kgvfEiUwxaYxrA=; b=x35K/UN27bLuLwOMY+A/SGVzbE
	UXr4t5xtQ7OvT/2eQREJ6+X0GUds55RE72LsnIVEZcZT7HUeKdiLJoEtaLqHW5L1NR71T4TUBDmDZ
	R4gpKYl+heIAx5xrQmCCigZ+apv5o/A4ujnz8KPM1NgtaQU8tR4At592KHo1PZu5GnHSm1UM8iVTq
	V99T00SUoeizR9gydXkKRLf86djKiyxwVhYOM1a+80B6P95BSw8d8FBgEDIXLeHli4rfea3CmF6Tp
	tw5g44mssTUbguhMOq41DyTrrLNBq9NrTmWcvCUh8eUsAWcSPSkeObKQIJhje2b/eyHRADSQDjwG/
	elhGwFOQ==;
Received: from ip6-localhost ([::1]:41906 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1u2aOv-0024MR-MP; Wed, 09 Apr 2025 18:43:53 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:45267) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u2aOp-0024MJ-4m
 for samba-technical@lists.samba.org; Wed, 09 Apr 2025 18:43:49 +0000
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-54993c68ba0so2463e87.2
 for <samba-technical@lists.samba.org>; Wed, 09 Apr 2025 11:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744224214; x=1744829014; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KI+q2kvMmfaLgOCyijeyDo0KbIaH3kgvfEiUwxaYxrA=;
 b=Dmbgu0cN3YKjq1BoBB9qqqaEnc47FVR5L/swDsKqG/UHz10Yugjzqb7PrrylGVpB+F
 7rM+pf0nxOoFbUYiGwGadVjXgGEcr7IqOCWANkyqOzB291fsvcnD/rNOf67nK8sjrNe/
 QNP0GN7vkxi0taMkjFf0lYgm+ftUoL3ZYVM717AiSfpr5zkmTNz7AC80VLCxka4L9wYu
 UXgLQKF0u6rB6Xmwd0BP/Hzp9kIzdnoQ9gdMUG5M0EZ2PugqDfdjZaFd0SdzKBipoPB/
 871RZrgLNigyNpq58pXFEDtwe/zrt0jmb3+3ycLBhUfaDzWb1u04lW9Xet3RrFRDXw/c
 DQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744224214; x=1744829014;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KI+q2kvMmfaLgOCyijeyDo0KbIaH3kgvfEiUwxaYxrA=;
 b=mEUuiUOhMBNRpXH+OcSmL5+UpJDJSh4IhORUvBODua9qaxIbWoAlAN58cRjgC3j/sL
 46bIz75DMWO9TMtABil12Zs/RXkmnAZEir7TN5IfBqIPmDBl6bm+bFnw+giOQZf1ZnCM
 vfvf84y74iidNQwcB7gnOAoKnGDW1miue0fwfGhHVVODK0TYeHknsUpUvnVPtuwUjBgR
 N/T8/2oAUjBMROfgJtNKzwbvqkHyTyQzSyRzjj724ki9xGL+Mzk6SVnZF/YhCDwL6GfS
 DGvQzDzwzUVg6OGi5WEVRoBn1U1TYKIHzAAFhneAepINN7qkxtRkHnxDpN4syreokz7C
 kRag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDxk02hq9FQu5ZnRgwBl3knFuin8li66fOavx39KFRyH4K8psK/97PFVQjSYzLguy7b+yYtz7mUJ9pQMSMbj4=@lists.samba.org
X-Gm-Message-State: AOJu0Yw1IDcGRSn5lteH8rdO++DmuqQ7FitVEmGALlOiACaTrfzeOAvv
 IoZXU73siZyf5ZvOr2bMah8+u47zpGbk+TulSXzG91Ly9WS4skbzBU7EDrGCAhyuldwh99R7Ypj
 L6XmCO1QJr2EVhbPBf6OE6TQXQoY=
X-Gm-Gg: ASbGnctWxpIMLS275zQcX9Y10Ht08JrUfZcsEpfHkdw4HBA2OeHIEh7ZOLxRObAklCz
 sYUAZvF1Qn1WtcRoL3jsByLKPrWMO6ikIrc+GzOrt8tHELbn4EtzO+7vQFmq3hH7MGi5hNeKUqO
 hE2ZQrWx89/NeegR6Y6q8AZavIExhOSfAhLheKOEHirXJ1FBJ6nP/6XbzXtdywz/VkJA==
X-Google-Smtp-Source: AGHT+IGqEJc93XgSpk++HFKE3x1gUUjAWlTToA2x2cjL5syEO8ILQlQlP2og+SZ5/qTrupg/ejPZ+tkj93vq8CHqHlA=
X-Received: by 2002:a05:6512:1152:b0:545:225d:6463 with SMTP id
 2adb3069b0e04-54cb6880beamr5549e87.42.1744224213432; Wed, 09 Apr 2025
 11:43:33 -0700 (PDT)
MIME-Version: 1.0
References: <32f7a0c2-32cd-4ccd-b471-7cba98cc30f3@samba.org>
In-Reply-To: <32f7a0c2-32cd-4ccd-b471-7cba98cc30f3@samba.org>
Date: Wed, 9 Apr 2025 13:43:21 -0500
X-Gm-Features: ATxdqUHQJ71Tiq8r-QtDsPvmolxGJ91VK8m1pKT8yIzFPiSR8xgdg4iI8eYHj0A
Message-ID: <CAH2r5mt2032HC_yLrqGoAY-J6JZfP_2zjOjoKiY92YUrxBiqnA@mail.gmail.com>
Subject: Re: SMB3 POSIX and deleting files with FILE_ATTRIBUTE_READONLY
To: Ralph Boehme <slow@samba.org>
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
Cc: CIFS <linux-cifs@vger.kernel.org>, Stefan Metzmacher <metze@samba.org>,
 Steven French <Steven.French@microsoft.com>,
 samba-technical <samba-technical@lists.samba.org>, Tom Talpey <tom@talpey.com>,
 "vl@samba.org" <vl@samba.org>, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Apr 9, 2025 at 1:18=E2=80=AFPM Ralph Boehme <slow@samba.org> wrote:
>
> Hi folks,
>
> what should be the behavior with SMB3 POSIX when a POSIX client tries to
> delete a file that has FILE_ATTRIBUTE_READONLY set?
>
> The major question that we must answer is, if this we would want to
> allow for POSIX clients to ignore this in some way: either completely
> ignore it on POSIX handles or first check if the handle has requested
> and been granted WRITE_ATTRIBUTES access.

I agree that to delete a file with READ_ONLY set should by default require
WRITE_ATTRIBUTES (and delete) permission (better to be safe
in restricting a potential dangerous operation).

But this is a good question ...

> Checking WRITE_ATTRIBUTES first means we would correctly honor
> permissions and the client could have removed FILE_ATTRIBUTE_READONLY
> anyway to then remove the file.
>
> Windows has some new bits FILE_DISPOSITION_IGNORE_READONLY_ATTRIBUTE to
> handle this locally (!) and it seems to be doing it without checking
> WRITE_ATTRIBUTES on the server.
>
> <https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-fscc/2e=
860264-018a-47b3-8555-565a13b35a45>
>
> Thoughts?




--=20
Thanks,

Steve

