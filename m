Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 247A0470057
	for <lists+samba-technical@lfdr.de>; Fri, 10 Dec 2021 12:50:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=hZ7Zcac3VIYPCBzWo1c3owb0heJHvqMmX35vtJc11AA=; b=LOMOyLQCzwAqxb/808EU+9kJSE
	o9/EwVHmDB9fwNq43UOB16zM0WIKx0VZvTK9kCW5RZz7KmPRc9SIP8wIUIJFPEUQJs/Q7W1Rs5QLH
	Lw3/VF9YP8uClec3wQpo5d4u0bk/411HuIcGJilJo0KJHVcibZjw5r1/pjWoR+nbjj+akKef6159q
	pvwR7l8aIT5ZSa2UJaYotI+G72iDp7OYWg1x4YpJ4UHNU1Gd+kRhBuZmXvhFcFUw8/Y0ifjdByZOr
	88UNvDuNXZr+vnBMfvO+T/8C/Fono70r1s8VujUn/D+Nl0fTb3LP144KDhNFcOxzLR+cqs6Bj3X6g
	PtPWSSRQ==;
Received: from ip6-localhost ([::1]:56218 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mvePR-004p9B-73; Fri, 10 Dec 2021 11:49:53 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:35458) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mvePJ-004p92-Ms
 for samba-technical@lists.samba.org; Fri, 10 Dec 2021 11:49:49 +0000
Received: by mail-ed1-x536.google.com with SMTP id v1so29438766edx.2
 for <samba-technical@lists.samba.org>; Fri, 10 Dec 2021 03:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+TyuPcrZVZgs4Rt0tstzo8eWStNMy72uPCixM145R7w=;
 b=HiOac4pu4KxsbSNbU+kK8v5cSrWE2+Jhu9Z2d9SIm/W+pmxo5cHZVXosNx+Yb35NZf
 yv/Drjj2JNKQ+v2eASX8CLoZJSsocXFJd+R+Z+Rg0orE+clxYfxYGrgkh3bAIaUyyjYV
 Kkp33KWwKij54qnLLjETnLaKFpy0K+4RpxH/ig/pkksPvjkkoCMdMv9pF9PatGnGF2cf
 ojiIFhx2xHzedSeNWpyweL95R59dbQvK1032NXtD5DPfDmBoAmns+EAKhpns1WlPYOke
 vEs0oyXBr2x0v1qnu02t0mH7G5lcdVt7qh6+cebBruc4Xtc4NlhuADN6l6q0GMlplwlK
 YFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+TyuPcrZVZgs4Rt0tstzo8eWStNMy72uPCixM145R7w=;
 b=nzaaVKIVLN3ShmQzIjuqhHLrxgb6K/+g3woEuBHcn4NQN+ZJ2Ls6TYxfEWX0nwg/2U
 Fywbc0KtnDrmmibA2sf9AVgibOEKC0wr4+9r5b4cfc8YvIiRpPyHQuG2caZguNjaTbx9
 luboKCkPCFlIMZxuJ9ds+uU5WDqj+KZ1aRpywSI9Zz34UlC7kiN/joY+jNCTYwc5BBq+
 u3MBs3GVPuwNLfAm7uxdhK6MLgrTZCh5W7cXNORHnnDT9th9oPBbbpHbZwjOmmYFo/3f
 +Gn9Ncu/EK7FSMyJjWt4MHTk5U2tTRykQ4NiE12N10/t4BWUhHZKmVkMDL4tUNU504fs
 VFng==
X-Gm-Message-State: AOAM532n9a102KGpTqd/JbiIXJYjF7TtHBEpQk6WuTQMBqzi6f/YPHPZ
 8Y9mbeNY88iE+iGDh6vb8++RiETUDZyocJytyyw2NQ==
X-Google-Smtp-Source: ABdhPJzs9NbTqFThUuDS9jd5S9KGZmXgjSvI/9DzqczOpN3R9u8nTPJYs8uh/9v5NVHPbNUesSRYkq+7xQvo4Awmj5Y=
X-Received: by 2002:a17:907:d22:: with SMTP id
 gn34mr23447525ejc.195.1639136984901; 
 Fri, 10 Dec 2021 03:49:44 -0800 (PST)
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
In-Reply-To: <a25972a3-3688-367b-fcab-fa748e590153@samba.org>
Date: Fri, 10 Dec 2021 06:49:33 -0500
Message-ID: <CAB5c7xp-zEwjcZSHfjL8YyWd_4y=K3HC3GSjAzvMoJR9aPOv6A@mail.gmail.com>
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
 Steven Engelhardt <steven.engelhardt@relativity.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Dec 9, 2021 at 11:44 PM Ralph Boehme <slow@samba.org> wrote:

> On 12/9/21 22:14, Tom Talpey wrote:
> > The SMB2_FILEID is a 2-part structure, 64 bits for each handle (id):
> >
> https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-smb2/f1d9b40d-e335-45fc-9d0b-199a31ede4c3
>
> oh, we're not discussing that one. This one:
>
> MS-FSCC 2.1.9 64-bit file ID
>
> -slow
>
> --
> Ralph Boehme, Samba Team                 https://samba.org/
> SerNet Samba Team Lead      https://sernet.de/en/team-samba


Ah, right sorry for my part in adding to the confusion. Just for reference
for those of us not 100% familiar with the details:

The change in how file ids were instantiated is based on this discussion:
https://lists.samba.org/archive/samba-technical/2019-June/133825.html

And these two MacOS-related bugs:
https://bugzilla.samba.org/show_bug.cgi?id=13999
https://bugzilla.samba.org/show_bug.cgi?id=12715

Correct?
