Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 869E9107EA5
	for <lists+samba-technical@lfdr.de>; Sat, 23 Nov 2019 14:31:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=Pb8+SLa/fHRmkFQQkXC/dFdUzY1Ig8ur+xtAgZNbdIg=; b=fkenoumMTlq+n2MG1ht4MpIrzN
	nHewC5TEc5nb7e5wbNV25jjs1biV4xy+IS2sISuWqcCdIdT0nTLQB6jkzuFv6Zwi6oDuM0wAUaC7p
	/qmhK2szPZaavyX9LqKBgD3N5hM2GPy+jjwd9F0nqQktL8/j0zTlwrcdKM2qIdg8Y+jz8nKT4BCjN
	FULrXURda3g9v2h7cJAPAO/gZLdy1fJhTVyUX4Q9qwOvqKr87ogOoTGYC5eSJTk/3I+VKPSsgx7Ql
	+79UbHFCxnXL5kNzmuBADvNVybzRteJvJiL3z06oFEw6QNv+ndej1c5Ls+XnRP3amdSwhk8DfJmmG
	fSBsUZPQ==;
Received: from localhost ([::1]:18644 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iYVUm-002CuY-VF; Sat, 23 Nov 2019 13:30:41 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:44169) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iYVUa-002CuR-TQ
 for samba-technical@lists.samba.org; Sat, 23 Nov 2019 13:30:36 +0000
Received: by mail-lf1-x12d.google.com with SMTP id v201so6565094lfa.11
 for <samba-technical@lists.samba.org>; Sat, 23 Nov 2019 05:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=Pb8+SLa/fHRmkFQQkXC/dFdUzY1Ig8ur+xtAgZNbdIg=;
 b=ruvrKx9skJ1/rPcbCJOVMgWS4WeDsCV3SmpaJ52laQvVJtlj8YLQa7Guk1x6hNsFI/
 OeeX3UjFbyYfmEHd760Z81gj+BkbUaOdlKXWY+LgOy9M6Tga5TMxY3jOr83HEBbEiUem
 FcUY09zd0mvWNahLUvejJg9ypICNu/hnHf7xEdw0VWHwjAd61BKqiUoKPtnza8Q4eEmU
 Z84RpkyYQWfGUcYgeCR9iaKwM2ttq2NdHNi3X/bzTo0X8VvUHCvJRIwhtaRwdsNuFLg3
 ZxCQgOHHjQ+/cgW3AjDHqFj/XFddbzsFbGSrgoO4kFq415Qk2pGXHf8tuk1uq657zUL9
 yEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Pb8+SLa/fHRmkFQQkXC/dFdUzY1Ig8ur+xtAgZNbdIg=;
 b=N8s+jC7lIaIwq4GziaKKXRvwDixmp4Cn+aMgEPzTRuKc3yO+hpxtWNV+GCvxEt5Q9S
 zvZqzGhjV1mZM3vLkwU7u+jn9I9inBUxB+5cbvesmEFRdKRoYmAST0gtrCxPduyKrec4
 fn0/uTmMb/zWseIa03zfNQW8v4TW4q6jWt+8COJdTfHBtqZQyazFuOrdi/y8XCt7ecg/
 j7k9Dq4gLsIUlqWNtmqINhND4TNaeKghj1NS3NxcD9C8zmrubg4I8mgLPNswHMYNFnuG
 BZQGijbJrfFO3oq4MhlC9sxjchj++NQeANtMIta0oNX8LdfDH6UgkFUOya0RBlA+3a7Q
 iyUQ==
X-Gm-Message-State: APjAAAVe8On1f1Onw2LEm4hT/7zNUwOCu/83rFiwsotA+sczjn8xI00X
 me4S70vH2MFGQHlQ9h69JpUNuxTNS567cIfvq+Rjeg==
X-Google-Smtp-Source: APXvYqyu/iN5v7xjm2047Ffm99W/KAThPV9VAUTxMXvDCnd4gh1koFXfxQ4lzNSD4vW7349uyvH1eiSEFW6UrctrdpE=
X-Received: by 2002:ac2:4c2b:: with SMTP id u11mr15153596lfq.46.1574515827024; 
 Sat, 23 Nov 2019 05:30:27 -0800 (PST)
MIME-Version: 1.0
References: <CAC-fF8T2bviHcpRgmjmVoiAvtpLEmFkr-5P9Q9dr=AoKCiEyMw@mail.gmail.com>
In-Reply-To: <CAC-fF8T2bviHcpRgmjmVoiAvtpLEmFkr-5P9Q9dr=AoKCiEyMw@mail.gmail.com>
Date: Sat, 23 Nov 2019 14:30:15 +0100
Message-ID: <CAC-fF8REXgwh+cdLcucsOA=5NAFWuAva1g_LOztbK8Eu+ojBuQ@mail.gmail.com>
Subject: Re: MR !854 | sess_crypt_blob() fails to decrypt its own cipher text
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Nov 21, 2019 at 6:52 PM Isaac Boukris <iboukris@gmail.com> wrote:
>
> While adding tests for sess_crypt_blob() I noticed it fails when the
> input is not aligned to block size of 8, and it looks like we always
> use it this way (see also comment above sess_encrypt_string()), see
> pipeline:
> https://gitlab.com/samba-team/devel/samba/commits/iboukris-dtest

I now realize this branch doesn't prove much, since callers don't
check the return value yet, but i also tested with abort().

