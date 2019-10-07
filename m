Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 636DACDB2C
	for <lists+samba-technical@lfdr.de>; Mon,  7 Oct 2019 06:46:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=RxAa9AqPZ2lkgAbBgq6QUfGAbbgebpV8FkBTDfxvVyM=; b=K4c3mQjzAZzzWyC+y/uVYPJR/8
	vve8A3xhitEUCUSP7CmPHxATpwK0rLO5JxuaSQ0WJTD/XVHsUFeQDDfpHY5cjkL/3d14z3RPbkWPk
	+mWekmkqzzKi7rn+JzYmIAFUZ5fmURPDEo9iMm3ybji2W6NVy4mil7/44GUldiqnGneG3EYqCYzvH
	TTcMXKqJwhRj34tUClu8nKngmGVzKlDra4LIM4trWQS7Mm88gZPJh/74RJSBE9t86y4FHli0P92qg
	HkfmyUwwSe0WdihnqXuWn3iaZ7FDm5e4owq0KgrUSNrJaq9+d+kXcPHex2NnEmKrgUD2/naM8zARG
	na2c/eeg==;
Received: from localhost ([::1]:21710 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iHKtC-001iGF-Tj; Mon, 07 Oct 2019 04:44:55 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30]:40588) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iHKt8-001iG8-SB
 for samba-technical@lists.samba.org; Mon, 07 Oct 2019 04:44:53 +0000
Received: by mail-vs1-xe30.google.com with SMTP id v10so8024706vsc.7
 for <samba-technical@lists.samba.org>; Sun, 06 Oct 2019 21:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RxAa9AqPZ2lkgAbBgq6QUfGAbbgebpV8FkBTDfxvVyM=;
 b=oibA754pzGp7A/MqaCzPda8wLwBkjKxlY7n5ncE7/7pbIuMOgCuzuSjZeQNzAFpAWj
 FD/y8abkg+2SHXINZhvZQeaHruOJz/BiMpuHRfTJnSd7J60ARPQP6qfjVdjS53o4MCPw
 Og6Z1FegFzncvrbbHS1LzHZdfNFm8UAqVxWqWbkuGsEkYX33WuTUfIYiP+c9M1K7TRGs
 HWTys2spDu9hkZwZAPBOzOIc1pm0QUOZreeBIlYg9BxVSXUswpsVDTEYBUOYKf4SOp9z
 wK6ww7UPNigJtiolJlnKlQqz1aUlZHTy8SB4gt49pGUy10P0AGAuyuyjjENOFZFt7L5C
 g/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RxAa9AqPZ2lkgAbBgq6QUfGAbbgebpV8FkBTDfxvVyM=;
 b=CfZRKoOT6HNpyUp3KQ3i7eDUxq2oN1jH4Nd3X3O453+M6VjmUmBGiEOEV0WW8foqm4
 ggQwT4BZ8OdNDZjjW40XE+ovo8Av/LGEZYrNY4iPec4ZK9FmTAUjebOrvcLexPEiickP
 Eb7XRQlZM9c1BO5jGJ0Anfb7MnzhV8xlnSQWGB+0Gln0Xe+MQdUxsDI9VYn7e8Ekq2WQ
 6HTHkTfIrGReDhCL93tQLAw8Zkfj8g2vduyrF3kXT8xAtUWb4lMiH8kqqw/S0QgkrasN
 /uVZ3DycxLaEwfEVR8RBK7n1BiioVsN+UCw49V5CcB4j7wm5lKJsVh+LWLUhmo21kbkx
 DBJQ==
X-Gm-Message-State: APjAAAURNFMJ/vU/9VIck2J/m44apJXM4VUIy26fB3ubTilGmRiXQO4j
 mCndqYFn9piB69gFsCBoeBE8irNSqW5yi4YJXKSt5YWx
X-Google-Smtp-Source: APXvYqxp4NpdPgPjznONWd5Ut6bbEu4e/X0LQqYkghwk3r2ueD3sdwK8SvMZqcSqlJpq1CN7L7dTYoFW4ctsrpyqRkM=
X-Received: by 2002:a67:77ce:: with SMTP id
 s197mr13262760vsc.211.1570423486135; 
 Sun, 06 Oct 2019 21:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <dcc2c49e-08cd-e077-6506-53020b3ffc58@tranquil.it>
In-Reply-To: <dcc2c49e-08cd-e077-6506-53020b3ffc58@tranquil.it>
Date: Mon, 7 Oct 2019 00:44:34 -0400
Message-ID: <CAOCN9rw=dNTD2FqyXjVLzWTc+Ld7B-mky11e=7m7J_8OD3spLA@mail.gmail.com>
Subject: Re: samba 4.11 rpmbuild on CentOS7
To: Denis Cardon <dcardon@tranquil.it>
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
From: Nico Kadel-Garcia via samba-technical <samba-technical@lists.samba.org>
Reply-To: Nico Kadel-Garcia <nkadel@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, Oct 6, 2019 at 6:16 PM Denis Cardon via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Hi everyone,
>
> I have given a look tonight at building rpm of Samba 4.11 for
> CentOS7[1]. The need for gnutls >=3D 3.4.7 makes it quite challenging!
>
> Taking on the work of Sergiomb[2] and Nico Kadel Garcias[3], I compiled
> nettle and gnutls and then went on building the other stuff (which was
> more business as usual).

I've been doing some work on this as well, particularly for RHEL 8 and
CentOS 8. My workflow is mostly "grab the src.rpm for rawhide, apply
changes I know are needed from experience, and build"

Unfortunately, the configure tools are now written in waf, not in
autoconf, and they're getting a bit arcane for me. I particular, I'm
not sure how to get the configure tools to gracefully detect the
"compat-gnutls34" components anymore.


> I have a few question about packaging:
>
> * is it ok to use the latest gnutls 3.6.10? It seems the 3.4 serie is
> not maintained since late 2016. What would be the recommended version?
>
> * I had some library file conflict between stock CentOS7 and custom
> packages when compiling gnutls-dane, gnutls-guile and gnutls-c++. As
> there are no dependencies on them, I didn't build support for them ad I
> guess it was safe to side-step them as far as Samba is concerned.
>
> * EPEL lmdb version is 0.9.22 while upstream is 0.9.24. As I have had
> some issues with lmdb backend in the last year, I was wondering if
> testing was done against the latest 0.9.24 or 0.9.22 should be enough?
>
> * when doing some samba-tool command, the logger is configured to be
> very talkative, like "INFO 2019-10-06 23:46:09,446 pid:23294
> /usr/lib64/python3.6/site-packages/samba/netcmd/domain.py #453:
> Administrator password will be set randomly!", and looking at the
> get_logger() inherited methods or other eventual configuration, I have
> not found where the talkative pattern is set... (perhaps it is too late
> and I should go to sleep!).
>
> Cheers,
>
> Denis
>
> [1] https://samba.tranquil.it/centos7/samba-4.11.0/
> https://samba.tranquil.it/centos7/samba-4.11.0-srcrpm/
> [2] https://github.com/sergiomb2/SambaAD
> [3] https://github.com/nkadel/compat-gnutls34-3.x-srpm
>
>
> --
> Denis Cardon
> Tranquil IT
> 12 avenue Jules Verne (Bat. A)
> 44230 Saint S=C3=A9bastien sur Loire (FRANCE)
> tel : +33 (0) 240 975 755
> http://www.tranquil.it
>
> Tranquil IT recrute! https://www.tranquil.it/nous-rejoindre/
> Samba install wiki for Frenchies : https://dev.tranquil.it
> WAPT, software deployment made easy : https://wapt.fr
>

