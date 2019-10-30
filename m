Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 35623EA1A3
	for <lists+samba-technical@lfdr.de>; Wed, 30 Oct 2019 17:20:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=t8syRjaVWsuHoYMKdz3bRhjAcn80sFuCzkk5n9XCRzQ=; b=RTqqUuNf9xsHa8uJmPmeeqqNo6
	G+uqH70xOsvLzn69LGLBCjGkrRfaEHzY2q3tAbKyE1F3/EB+nxIzyCGo7UxSRGMPSTmesTqqnYePc
	4QtIiLc3KihbrWXsWtkxMz84NUOhAo1DLj9qegSq/fhX3ylQOsCK/RJs9kxA+Q8e8n8cqcsK1lNv9
	NcoAwZdywSPwJbgk5zH37tPRgtZg4VkJchd9O6Cru41bb8aqZs4EujNxqdPUQlAE2wXE1LI25MT+f
	8V6AZllyXfvJXm/2E4nIN7dxGm3+G3/l4dgVftdpxAYoCRA+q86H1HbjvjThasJzi6/Y5PlhrAJ65
	gPblBU3A==;
Received: from localhost ([::1]:36480 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iPqgx-003gmu-SO; Wed, 30 Oct 2019 16:19:27 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:36668) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iPqgr-003gmn-S6
 for samba-technical@lists.samba.org; Wed, 30 Oct 2019 16:19:25 +0000
Received: by mail-il1-x136.google.com with SMTP id s75so2667736ilc.3
 for <samba-technical@lists.samba.org>; Wed, 30 Oct 2019 09:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=t8syRjaVWsuHoYMKdz3bRhjAcn80sFuCzkk5n9XCRzQ=;
 b=fTyFI9YVsrnD1ANE1s2ncOgh0jcpUa3cTT5hghqwUGV8x6AeyRkgJcChsEsIjI0JKy
 KxRakY+xZyed0xEBdZlyGrZN4ywck7HPCIwuo6FSC/Y+x2VdiqKe73KQbpoVyxUnHDRC
 KXWnyJaP2AthhmYn7+95zX131wdLZP6LXb2Xx6b71v0KB9/252kOpiOIGdAqwVA52/CR
 OntR7n+qakjH0JDj12FAFoXQDEegymveH0GbWEsz/ks0R9yYgF8VnhwhG5lkAcO0OBJr
 ok5XMFPdD1jPzy4O49PaWAMcj35BOMTPspQEC/tb1OvQkYBmmUdy+1144sp6LYCJvZtw
 BHUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=t8syRjaVWsuHoYMKdz3bRhjAcn80sFuCzkk5n9XCRzQ=;
 b=YDuSzXNBN+vUOh7k/U6u4Iegdweo1kNzm+9/lw1I78zkpkQPyQO6uSM0MdJCqSGey/
 QKpQrPRgL5yp1crB8+j8GfhAgG/aUHtYRocO/KdE37cNKNOIs/Fi+7QAAM2DT67mFE2e
 gHRWVGVnsfjnavl26iWp/N8/hgBfGdfWvLvCvIgewieFeBLcBJ2V7r7pxa2eXojimU9M
 Y8ah79ZvmPD/q6Tp2J3EpW5oZIYE7f8GKKTLiiBk/cAdHIYw1ylLDeHKDJx550ClB3nB
 xBnJ6b/raVxihF3rhwBhNMHcLFvGCiFfdg8AeRdw3jBkJW6+nmSCxtL5mz61kazDUzHM
 RY9Q==
X-Gm-Message-State: APjAAAWnUPEn/1/hXWIFhazg9JR6FsLRt1iSLosLkO2viMhpSLlJj2jl
 0ttUDtwElN+Vz9xUFfJXX/uNX9IIvzrzf2YjpqqBXfhOcAI=
X-Google-Smtp-Source: APXvYqxal++iI1xfgWGLNaSqGJkJ9aFSNmFIHNG0RhKxIqiWw8OjM4T2vo+py4oWvIx157l+52kVPZKf7fIrybJbgBU=
X-Received: by 2002:a92:5d8f:: with SMTP id e15mr1046362ilg.173.1572452357043; 
 Wed, 30 Oct 2019 09:19:17 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 30 Oct 2019 11:19:06 -0500
Message-ID: <CAH2r5msEjOuWumbKQce6ucn6pM2K1CW7iyEwuzj_611E5R7C5w@mail.gmail.com>
Subject: Samba build error on Fedora 31 can't find 'nsl'
To: samba-technical <samba-technical@lists.samba.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Doing a clean build of Samba on Fedora 31 (master from jra's branch of
a few months ago) I get this error (worked on Ubuntu) not finding
'nsl' but the package is installed

./configure --without-ad-dc --with-system-mitkrb5 ; make

[144/144] Creating bin/default/lib/krb5_wrap/krb5samba.vscript
[145/147] Compiling lib/replace/cwrap.c
[146/147] Compiling lib/replace/replace.c
[147/147] Linking bin/default/lib/replace/libreplace-samba4.so
/usr/bin/ld: cannot find -lnsl
collect2: error: ld returned 1 exit status


# yum whatprovides '*nsl'
Last metadata expiration check: 0:46:54 ago on Wed 30 Oct 2019 10:30:46 AM CDT.
libnsl-2.30-5.fc31.i686 : Legacy support library for NIS
Repo        : fedora
Matched from:
Provide    : libnsl = 2.30-5.fc31

Package libnsl-2.30-5.fc31.x86_64 is already installed.

-- 
Thanks,

Steve

