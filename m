Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A492946A6
	for <lists+samba-technical@lfdr.de>; Wed, 21 Oct 2020 04:43:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=RXLq9kJuOAHYa4thRHUhuycyrk61TxjyjL2QDv2oHII=; b=4CFrraNSDUUKyabjtqIUZ4LgBe
	2LcU/T2oXHEXPepamt80t9igzanmyS8/YPaknUxc3LZV4f+XhaQqcYK+iNn7X5q4OsPe9dDu2Ck3Z
	r/u155cFuNbJ6KSY1M27/+7t9gOgY1rUWAejDnIlnfJNBgAsevuDGwymydj/IFflTt+2i1gASGpp0
	ifiu5qEs67jG3tjX9BauNZwej1f2Rv79u+nEEFAisBiPw3D+vPsNhjEgVegqCinChTL3gZzD4B6jg
	jV/4WY/z4xeUEoYGhxFN/ZDUsi0fOdNzUUmYTsjakVSpiR9G8f2YhD5KwjQXD1G+2hIIyHIhMb8re
	toDP97dA==;
Received: from ip6-localhost ([::1]:49284 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kV45K-00D0NP-Rd; Wed, 21 Oct 2020 02:42:42 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:36771) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kV45D-00D0NI-Rp
 for samba-technical@lists.samba.org; Wed, 21 Oct 2020 02:42:38 +0000
Received: by mail-io1-xd42.google.com with SMTP id u19so1146340ion.3
 for <samba-technical@lists.samba.org>; Tue, 20 Oct 2020 19:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RXLq9kJuOAHYa4thRHUhuycyrk61TxjyjL2QDv2oHII=;
 b=UTcJM52TYiksHMb4tR7UYyZYRtYJj9Rl3fRAbpOud0jHvZ/3VYoySwdCrHS1NV7Mrg
 eIii8wHCIGNDlUABcFGsLV9eN11+kucsURzTEDjq80boVoIzrkesw6nOnm6CXc4yzeKx
 SBgej+txLLZJxS9bTgdXizykOzX8js0YIXYAt8REv8W9ob7ZLDjNtooBhA8IizKReQLx
 kRgbiHGOQ8mnJYQ4YUdOLGDNjUi3+c3BWdXeTuxpAIT/8WkL8MiYi6NdecIpMX7nZ8ND
 rccxuWD8xufA7U6LSQuwFb2LWcV8yP0yIAZAZ0SWSodAr4YFjDVnM2Xx/tzzSwDhYDV9
 e+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RXLq9kJuOAHYa4thRHUhuycyrk61TxjyjL2QDv2oHII=;
 b=HvjV2WvsUOJ7BAASflyx6ycLkvemmE2cLQRD2p4TMHuJPOn89YWOiDxO/nnq5AEKz/
 v8sQVyC3z+ZawvhjU9Sn8gRoFAp1RZJCIiR+wyQvWh5Wjt9IprljKFUZmSETiaDnqR2N
 9AZQLCuTmrBC5wDj7Qz++XAxazuagzP8yZ6FhCAoMMPPD6288gDZB1KGfzR6DVvGmgqT
 729cZe+uksHF6j66g5uos1QNS/a/XI96JVSuR7wN5XDYwqg1GVkEUCWAJ2N4pX1QZV/R
 NKFplK1opA+MCtdzlYh9bRkqHbeU0mQss5dPy1J6uJ7yM0JAJkeRhZwdJjseDcs0eIKG
 JSlQ==
X-Gm-Message-State: AOAM533P5raVI2aLrKEpM0zJYW8zKfCOoNe/fRz/b7uUT+WdaVV9p7Ep
 zi3i9n87kXjlD5MuaOUHNHDApm1V+mT7/Yui+sM=
X-Google-Smtp-Source: ABdhPJxTOGUQCbEy9MP6sEVrEkzBpUP0zkkD8OknB9275iUQFcWlLgEdwBHk2Aou8IMmv8OkwNWcLdT8c6D+EWG7gws=
X-Received: by 2002:a6b:4e0a:: with SMTP id c10mr973134iob.120.1603248153267; 
 Tue, 20 Oct 2020 19:42:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+X7mQPg0yGd19pRaXCPzDyr04YEsa=TDDnBj+Gmdt12VdhoQ@mail.gmail.com>
 <51724103.WUapsaruIv@magrathea>
In-Reply-To: <51724103.WUapsaruIv@magrathea>
Date: Wed, 21 Oct 2020 13:42:22 +1100
Message-ID: <CAJ+X7mTW49t3PKRerL4giKDqr1bbu40aokqJEHBbudDWDebgHA@mail.gmail.com>
Subject: Re: libndr: Avoid assigning duplicate versions to symbols
To: Andreas Schneider <asn@samba.org>
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
From: Amitay Isaacs via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amitay Isaacs <amitay@gmail.com>
Cc: Samba Technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Oct 20, 2020 at 7:08 PM Andreas Schneider <asn@samba.org> wrote:
>
> On Tuesday, 20 October 2020 08:49:18 CEST Amitay Isaacs via samba-technical
> wrote:
> > Hi,
> >
> > On freebsd 12, the linking of libndr.so fails with following error:
> >
> > [ 918/3912] Linking bin/default/librpc/libndr.so
> > ld: error: duplicate symbol '_ndr_pull_error' in version script
> > ld: error: duplicate symbol '_ndr_push_error' in version script
> > clang: error: linker command failed with exit code 1 (use -v to see
> > invocation)
> >
> > This happened because symbols _ndr_push_error and _ndr_pull_error were
> > added to abi_match in commit 42ac80fb46cfb485e8c4a26d455fa784fdd1daed.
> > It generates the following snippet in ndr.vscript.
> >
> > --------------------
> > NDR_1.0.0 {
> >         global:
> >                 _ndr_pull_error;
> >                 _ndr_push_error;
> >                 ndr_print_steal_switch_value;
> >                 ndr_push_steal_switch_value;
> > } NDR_0.2.1;
> >
> > NDR_1.0.1 {
> >         global:
> >                 ndr_*;
> >                 GUID_*;
> >                 _ndr_pull_error;
> >                 _ndr_push_error;
> >         local:
> >                 ndr_table_*;
> >                 _end;
> >                 __bss_start;
> >                 _edata;
> >                 *;
> > };
> > --------------------
> >
> > Symbols _ndr_push_error and _ndr_pull_error are added to both versions
> > NDR_1.0.0 and NDR_1.0.1. This does not seem to be a problem for linux
> > ld.  It seems to ignore the later version assignments to the same
> > symbol as seen from the objdump:
> >
> > $ objdump -T bin/default/librpc/libndr.so.1.0.1  | grep _ndr_pu.._error
> > 0000000000012afe g    DF .text    0000000000000162  NDR_1.0.0
> > _ndr_push_error 0000000000012973 g    DF .text    000000000000018b
> > NDR_1.0.0   _ndr_pull_error
> >
> > One solution is to avoid adding specific symbols to abi_match and only
> > use wildcards in abi_match.  This avoids the need to modify wafsamba
> > abi_write_vscript() function in samba_abi.py.  Patch is attached that
> > changes the symbols _ndr_push_error and _ndr_pull_error to wildcard
> > patterns as _ndr_push_error* and _ndr_pull_error*.
>
> This looks fine for me, but I think we need a bug for 4.13 for that?
>

https://bugzilla.samba.org/show_bug.cgi?id=14541

https://gitlab.com/samba-team/samba/-/merge_requests/1623

Amitay.

