Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB3DAC5A82
	for <lists+samba-technical@lfdr.de>; Tue, 27 May 2025 21:15:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=bGuuzxrf+ZMkXU/8TmT3e+//hn7WZvDG3I8PrXK61Jw=; b=VrcjZLfHPBh7MiV0PEO8Gs7ogD
	a1jLVScjCZBYd1K4DDhjMM17OpC1G08GVj9V0C9QgN8WH2uZr1HFdrrJI7KhJoZH8zIhSznkvwnTx
	QkRXU+xAvUlLGqS1jfHRkG0INHszd91RJCoef7801FgNc667K+3mXmzMOjBe1WfC0Dfgb7LxaPZmD
	KD+ogJ7nZ1flPhX5ASMWm7AcigjOgOc4N2f2PrWNPhghEzErLmUXz/zA4KKMFToXmrCQQ6lJYWMSR
	94IALkORDFpDQcpPXyWw7Fd7/LDhUJh+V68te5LMLGTLbhRa665JgOq3dXpVjm1wzyIc8TFhOUyRE
	OX4SUb3w==;
Received: from ip6-localhost ([::1]:28594 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uJzlX-004IaS-R6; Tue, 27 May 2025 19:15:11 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:48276) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uJzlQ-004IaK-Vk
 for samba-technical@lists.samba.org; Tue, 27 May 2025 19:15:07 +0000
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-32925727810so36746921fa.0
 for <samba-technical@lists.samba.org>; Tue, 27 May 2025 12:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748373303; x=1748978103; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bGuuzxrf+ZMkXU/8TmT3e+//hn7WZvDG3I8PrXK61Jw=;
 b=IFFJK7JjHv5USr7TyL0CCwqqOG2oPunMI7boyRgtRj6mFPMI/nTeSqgj/dlfKzuhbT
 jgYPC++ovXsh54WVA+kvcrN3Tq9r6a4pG9BxnEngipx1HTsaIJkctLFlEN+CA8M9nSD3
 d0qBlMqEXzRhbjG9T6NHki6Dd1ETf6J5w7lCrza7vb5EdtCdOsE2/VR874e4mxkI8uLF
 rSIPEmsKs6vEGx3j+LItOvN7r6/AyoF+261oxj727beKPwICneUWpdWqGQZrXsYAneBD
 mwIUB/hMMs7YNmjxsWC+PpfvctaK1IACZ8Wlm2JsTBdlT1isKqCEcdpW05LqP67/xflv
 Libw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748373303; x=1748978103;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bGuuzxrf+ZMkXU/8TmT3e+//hn7WZvDG3I8PrXK61Jw=;
 b=jKN1ipB44Tm1i0EcJPsKq48ynOozAIvYBpB8ti49ukC4mRFuhCVREMT0i8EZ1jjkhw
 ax99Nwr+PNjgHxR1VQdRmSb0vxf+UMIn7Mv/My63q6/eYhsSFvVNTKd5J6upRi0uTqdv
 GtnFyeU0rOHVJIoOE+gHbeQCQ7QYV+vLArAboKMtLEAIzEaP+XHoyXS1bVzNuyXJbNg3
 obNgIJE221aEnvNLdFN5s5bdzD5FrzAe52Dl7Vpd0KpjLcdqAZZtpoFjNS0J1p5eTDNX
 OaLOzzHg//3E4/+U2/1N9KpzLYMCC3d7Rvekp173vqwWaC7enI+pJNG3YWqeFEyVjJka
 E1rQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXh7sFP1YOrsY1aBaiRGK9Khr84bC6AmDvavRwshCCXOypTEdZm/Xmofh8AtqY8A1dp74QOCqJ69lkOczeDJ2U=@lists.samba.org
X-Gm-Message-State: AOJu0YyGgs7EIcwM8JNkxAbo4LBw3yioN5ZfNWSlRaVLklOIJKABqv3t
 be+QYJ+gNLHgA/nprIGfg5toOENmwCgs0rBbzGnaggmm2w+KcXSAjSPRnWx0RaXl7x0XPOBqczm
 1Cr9WWSmh18aHVf+55Swgtf8IiriJ5jA=
X-Gm-Gg: ASbGncv/wABAhi6VPN24G5B6FN69m2d0+esdT8+GJSz571kII2zSp1k4UUe9BHfG5ZL
 S6UqiZanrYNrNFTIBOgOg5F+Uwj1kagMLJgTvzIPdCekeBJz5MbaRzJ2Qf0zSj7X99XmsEpR8YF
 ATi4gGT0flc8zHhdwPDEHWknpaItM3N3FugoUzF2dvvIZuJzFGVDBGot0eXcy3IUHwG/Jlzn1td
 JR6
X-Google-Smtp-Source: AGHT+IF0rY0GJw4SzVaN9SFABRZodR+4SgkYw+tPSSz6q9aDlqqVJ25bv/A8Erb4SrkQ2kSwL2yeXlqUAxellXgvbfk=
X-Received: by 2002:a05:651c:304e:b0:32a:7386:c9f0 with SMTP id
 38308e7fff4ca-32a7386cb59mr5560821fa.29.1748373303077; Tue, 27 May 2025
 12:15:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1748362221.git.metze@samba.org>
 <31f6e853d60ec99136f3855acb3447d36fa0fc82.1748362221.git.metze@samba.org>
 <ace9b692-3a0d-4a47-b74b-c350a72efdf1@talpey.com>
In-Reply-To: <ace9b692-3a0d-4a47-b74b-c350a72efdf1@talpey.com>
Date: Tue, 27 May 2025 14:14:51 -0500
X-Gm-Features: AX0GCFvxy2FH648vMWhsC-OSmUuRGWrqy_hAITLGNlCv5SDdz7S3Mi0eTgSKks8
Message-ID: <CAH2r5mscnhMOvF=5HNnmzdYZZyds19tkr7T-HSyHQtFVB9rBfA@mail.gmail.com>
Subject: Re: [PATCH 1/5] smb: common: split out smb_direct related header files
To: Tom Talpey <tom@talpey.com>
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
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 Hyunchul Lee <hyc.lee@gmail.com>, Stefan Metzmacher <metze@samba.org>,
 Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, May 27, 2025 at 1:50=E2=80=AFPM Tom Talpey <tom@talpey.com> wrote:
>
> I love the idea. Couple of questions on the pathnames...
>
> On 5/27/2025 12:12 PM, Stefan Metzmacher wrote:
> > This is just a start moving into a common smb_direct layer.
> >
> > Cc: Steve French <smfrench@gmail.com>
> > Cc: Tom Talpey <tom@talpey.com>
> > Cc: Long Li <longli@microsoft.com>
> > Cc: Namjae Jeon <linkinjeon@kernel.org>
> > Cc: Hyunchul Lee <hyc.lee@gmail.com>
> > Cc: linux-cifs@vger.kernel.org
> > Cc: samba-technical@lists.samba.org
> > Signed-off-by: Stefan Metzmacher <metze@samba.org>
> > ---
> >   fs/smb/common/smb_direct/smb_direct.h     | 11 +++++
> >   fs/smb/common/smb_direct/smb_direct_pdu.h | 51 ++++++++++++++++++++++=
+
>
> Why the underscore in "smb_direct", in both components? The protocol
> doesn't use this, and it seems awkward and search-unfriendly.

I agree that it would be less confusing if smbdirect instead of
smb_direct in the file/directory names

