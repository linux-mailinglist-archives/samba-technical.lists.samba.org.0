Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7636B47067D
	for <lists+samba-technical@lfdr.de>; Fri, 10 Dec 2021 17:56:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=vF0QQjkWIbTrPtEvF/IyHmRzb92s9I+1C5OL/jOqLCA=; b=XZbPQqPqGvQ1dPnaYHBK67mKRD
	xtWUd+6qHSXLS8oXaKycCVhYDN6+MZGxYkLAw5Qw9PlkLzgEQX0krMCHU5oJS6dFeMPHbKRBvLprN
	Bgtm+M3071Yf1uYpZJGUQ637bVRKhtvOQsZXyMPlynp25PsnZsd1r9JRYA75PP4hYRG/yTWccIxNe
	RjWMIU/HwEaaIGAk6mRWUf5DMzvEavA/cN/xuXDvvnKTImvf46Gx3Lf26HVZZUhIl1byxlc+6jBrf
	OglxtjaL8Ws+f/hLYy4BeLoUmvYTfObRVGmMjYIKm1SqtlFRhM2r91E2mP0Dxbt7YMZ3hBPI1m9ly
	2IzvZo2A==;
Received: from ip6-localhost ([::1]:42620 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mvjCJ-0053Mf-JU; Fri, 10 Dec 2021 16:56:39 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:42524) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mvjCD-0053MV-Df
 for samba-technical@lists.samba.org; Fri, 10 Dec 2021 16:56:36 +0000
Received: by mail-ed1-x532.google.com with SMTP id r11so31277623edd.9
 for <samba-technical@lists.samba.org>; Fri, 10 Dec 2021 08:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OyAvxW87jBdtg4pn1uLDHurCVYLSCxXTJDBjIf06AGE=;
 b=Cd1qxP6d6/WeIMeKksnbxA4OIPPlkNg2OfINwh01OI86ExwFGwWMnhQHAXDara7DCW
 ONsuVT54YfpqGZhy1ddrpultpyspsibTuhER8WxyPIzB+/Jsil16NilxBso8mD3tQUR4
 zq0qAOlHrB8ySV0D5Q8YY2vOFmFDlHAfiIIeSQExQZ1RZKuXHtCnqTQXjrSH1FmLCvwl
 a98kC7rH2iKbhs+51xYMRgJH+5MnxNVp/2+fQnIZx1VDgeKRZlIRQbCYRLE5WbgPVMmH
 g5QgoC9kFiN/mc33qow+4PC7xUUgI3AjIaJpgoKupfHlfRs3x2nEvx13LlwvZG5kZzb9
 82jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OyAvxW87jBdtg4pn1uLDHurCVYLSCxXTJDBjIf06AGE=;
 b=zmsrhv8hySoJ8/4zQSyTSDJC7iuTv9KylESkQhxVAJUsSwbDbE+/no4PSfF/KHNz/q
 0D0He6xEturOi2TiQnZoslmf01hnoQhflbGG7H+xj9ARMbykr3E0vCNEdWlDs+z0KRVu
 AM/gHdtrR807Qz9TZaB07RwmvLVv/5Exi8YCLFod8nLmf6azh3Crfr3mEu0tRdhqVkhc
 vQ5vBs47iI4ICgurLeooUJKxDcqMipk+/TVAnGX4pwnIgYsvzM6I30NSTxPwTvMCs1C0
 rUuILplJajwtbpwyxOC0vT9THp+jq3naEBb2PMWFcPiKmxe+BEdseY5Jm3BLS1TksvjO
 WV4w==
X-Gm-Message-State: AOAM531g9/95+uBZQ1LYWh5H7q5gEOIXWd4gkwhic+1X6B6S9lh19Smk
 gSsVCJ6JSbSlksHvk5UPrgnVaA52vWLmkS4k7EdzHbKn6ZM=
X-Google-Smtp-Source: ABdhPJwMIxfPHvZOK7/u5oNmcK268F0AzDT1BC4uv4ira6sGZmSkKqpai6fHsU6B1by48g4DE1dnij0PACDqO+u4uqE=
X-Received: by 2002:a17:906:4488:: with SMTP id
 y8mr24925302ejo.175.1639155391835; 
 Fri, 10 Dec 2021 08:56:31 -0800 (PST)
MIME-Version: 1.0
References: <CH2PR12MB4152F65AF85E23297EB5146D9F6E9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <d37f9e09-fdca-07c8-ac5c-b5e859930b9e@samba.org>
 <CH2PR12MB415202EB8137713529ECEF6E9F6F9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <1cd1e3f9-1773-2ba9-24f2-f7a0c4f49cbd@talpey.com>
 <5f6cc5cf-55ee-8422-b284-bd45b8faf448@samba.org>
 <84a566c0-4b04-eafd-89f4-d636ff655371@talpey.com>
 <93cc9a8b-8404-f5a1-3615-62919be31e69@samba.org>
 <fdbdbd51-92cf-d424-655f-fca636583e13@talpey.com>
 <CAB5c7xqZcK9-Oa+o+w5Mva9Dr8_wWojx=krWiP+4zQ0X3ksH+Q@mail.gmail.com>
 <6c8aca36-8856-cf8a-2ea9-902106d0adc3@talpey.com>
 <a25972a3-3688-367b-fcab-fa748e590153@samba.org>
 <CAB5c7xp-zEwjcZSHfjL8YyWd_4y=K3HC3GSjAzvMoJR9aPOv6A@mail.gmail.com>
 <9bbb9a27-9100-9a61-50e3-bdc7ab0bab1a@samba.org>
 <CAB5c7xpys+Ch65-6v0qv6rtGonFcKkMKJRYEzOboiRfiOPLs4Q@mail.gmail.com>
 <a806f198-69d1-a836-b5d8-c1b7b37c4d87@samba.org>
In-Reply-To: <a806f198-69d1-a836-b5d8-c1b7b37c4d87@samba.org>
Date: Fri, 10 Dec 2021 11:56:20 -0500
Message-ID: <CAB5c7xpBqoumBu_dX9N7eVY_vYUhu57Y+PDeT-S7jOs325GcyA@mail.gmail.com>
Subject: Re: Duplicate SMB file_ids leading to Windows client cache poisoning
To: Ralph Boehme <slow@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Cc: Tom Talpey <tom@talpey.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Dec 10, 2021 at 11:39 AM Ralph Boehme <slow@samba.org> wrote:

> On 12/10/21 16:53, Andrew Walker wrote:
> > Do we know that there are still issues with MacOS when an inode is
> > reused during the lifetime of an SMB session? Do we have an easy way
> > to reproduce the MacOS issue? Perhaps if we can determine that the
> > issue only impacts legacy versions of MacOS we can go back to just
> > returning the inode and tell people with EOL MacOS to upgrade :)
>
> All I know is that "some applications" encompasses core stuff that uses
> the file-is a primary key to a key/value store that maps ids to
> filesystem objects. So reusing ids is (or was) a sure way to screw up
> Mac clients.
>

That's a good point, but if MacOS SMB client is faking up an inode number
based on a hash of the filename in the zero-id case, isn't it even more
likely to yield a collision at some point?
