Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 566B38B4ECC
	for <lists+samba-technical@lfdr.de>; Mon, 29 Apr 2024 01:28:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=luatNR4IuoNfgyneIqHxbPv2CQLL0KOZG1hhq1p9eMU=; b=1+m0Nfod9Y8sqC8mykz/VskbQ+
	5p0m1s1VwUaekBfkYZpDXKCo9hs57bZ162GCVuIaC+2aAvvXPZUY7l/fdigD0y4NF3PbQVewZgHLQ
	xI6m83tXv/l6y4j655KpyDV5/CLSdaMyr6mPcO3i5t9YrpsFkUqMsrbaMdRQF5GlBAtnBjfts8iOm
	U5lAfObkYy9U+pIZpBrUWzuZH5neTnlbLz5Nem1+lIl+n6OTJXPu0YyuKMkFBWKaAX583eoT0Itwo
	nhcWoHw/pSIEIGrvhBS/4dQVnoR3jqprbgnwFDmSdaY8m7yqYXuoCKLOD1v7zd8beq+mjlhrGSB9w
	UZugqKKA==;
Received: from ip6-localhost ([::1]:45976 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s1Dvu-005xFr-Mu; Sun, 28 Apr 2024 23:27:46 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:46158) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s1Dvm-005xFk-Jz
 for samba-technical@lists.samba.org; Sun, 28 Apr 2024 23:27:43 +0000
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5171a529224so4831813e87.0
 for <samba-technical@lists.samba.org>; Sun, 28 Apr 2024 16:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714346855; x=1714951655; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=luatNR4IuoNfgyneIqHxbPv2CQLL0KOZG1hhq1p9eMU=;
 b=mCfiHZw7LVTdHPDvErXXubWdhz4IlcPnhOeQgClYlNjKziAwxt/pN3UN4beuwSiuJu
 4rIIawmjxWI+r3ImPVFSPIVJ8FUcIP/dtUxVM2dFoMk4MDkxN3NA9jRRqHNGbBSLPdyP
 0XzA9uYAwRf7GKAA2BvO4UcDwTJkpFzIqzmDLLH83VjLEKcvxZqFvuoAXOK5plJ8JcfM
 OAfgH4znMiAYuS3GkTLsPlhQyT9NZb+fm9S+MLoXm7496zTQ9AEu3oP2wccb/WqIxCqN
 p+YWnaqiApMuiTkrZCz6cxfUZdV8FfqmHvOvyJmdpq+mea8wiwcEnEei9imqcF/yH4YY
 quyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714346855; x=1714951655;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=luatNR4IuoNfgyneIqHxbPv2CQLL0KOZG1hhq1p9eMU=;
 b=PYacgnhhaZ3y5O0e4ZEn2N7VJITgqCCQaxDFdeWXlYVv/qJGzTM748piL5o6oXTbhU
 dm2H4CgTVkAKuzcIBLUgZYgJoeDE7hOu2pN+Zkf5o5THBcLiu0wBhfp+AwOjyWTFlnHX
 mTbemTUJGPWANcRdQrDvipQHw/dVr3ITsbWt81r6DEMrvVzMBJjfeFARHm6QJUH3z9lj
 I0518rQcDJsKM9Xzt0CcsuqHMwyllhBM5t5cZBmaZOW9fWpXNFQUXGm7FQwB3Hfp/mCd
 +ByxaFDoLRmK3v7PCSsJynO7adzcJoDcsWnUdGjsYi+OnM2U7QS/tSPbu4N8fpNoG3K5
 QIkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHGhwEKwVSYG93l30UbhMvHNglAsmDQWwowgh3KtFkUNExvo0QuV8kckhaYoyI9yrICrRplUkcTvlF/XG/xrYlkjL5qrETzaJ4kYHvmBcu
X-Gm-Message-State: AOJu0Yw9DrumOg1zsa0h03vXVMVgxlCjlY+HRhYipVJ0EHlTXZA2oCyc
 7WkLKbZat4Ot1mvtk3n2f3O7+s1TQL0TKBLMrPIVG8YUcksc2sr6zbhRKtdcs9MfS9gaSU7iYMM
 3WNYorcTBtXviYE5k8jM2ZyncTLk2Bg==
X-Google-Smtp-Source: AGHT+IEUrE0dDgyDkIf65sRh4Kr85ga/ueRCM3qDBR4GF89S8UwABDnr5ervspot3qSE2KCkt35ltaXNdzjsChjl5Cc=
X-Received: by 2002:a05:6512:33c9:b0:51d:8882:cd69 with SMTP id
 d9-20020a05651233c900b0051d8882cd69mr1926831lfg.53.1714346855161; Sun, 28 Apr
 2024 16:27:35 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 28 Apr 2024 18:27:23 -0500
Message-ID: <CAH2r5msg91ad+K+eZmCjKCJeDgyb6xcUUhmpaXeeTFjqFZUeBA@mail.gmail.com>
Subject: query fs info level 0x100
To: =?UTF-8?B?UmFscGggQsO2aG1l?= <slow@samba.org>, 
 samba-technical <samba-technical@lists.samba.org>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 "Volker.Lendecke@sernet.de" <Volker.Lendecke@sernet.de>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Trying some xfstests to current Samba (master branch, Samba 4.21),
they fail because query fs info (level 0x100) is returning
STATUS_INVALID_INFO_CLASS) - this works to ksmbd and I thought it used
to work to Samba.   I do see the SMB3.1.1 opens with the POSIX open
context works - but the query fs info failing causes xfstests to fail.

Is that missing rom current mainline Samba?

-- 
Thanks,

Steve

