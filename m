Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E0146F519
	for <lists+samba-technical@lfdr.de>; Thu,  9 Dec 2021 21:41:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=9lIAAelIf9k/jPyNHWNq9ukRqcdN+g6mRN0TWTeyJ28=; b=vxBsxY6A8aLfWCs9HIYw1ZvAy0
	Qej436kzPYJKF7bsmznbHk+4iK+DUVC7ixA1NTfy9AGud44yWZbEUX6E6fFp8flZ+QyjuKUxMSUGJ
	h9i73sItYdc51Ejbuq6AaZFB4jBV0Xyko/nhhPicooS9S//vEQkup1JToBx5reickJtyjPpFFPMsb
	FTfdnTE0HfUY71nHHJDW9gmyrmYnUdIv4khQWPR0oBLseqBpwztBTztbiY5zapevy3nedZal8iJ3y
	0DRgN7ueN52kSqGOMLiWSkLQ1CnkJxNdJBi9b2ULCl1jzkf4ot4vZRDPO9L9z17JIodrDL82idXeb
	0UF56hmg==;
Received: from ip6-localhost ([::1]:42912 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mvQDn-004igp-QI; Thu, 09 Dec 2021 20:40:55 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:35518) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mvQDg-004igg-Sl
 for samba-technical@lists.samba.org; Thu, 09 Dec 2021 20:40:52 +0000
Received: by mail-ed1-x535.google.com with SMTP id v1so23804873edx.2
 for <samba-technical@lists.samba.org>; Thu, 09 Dec 2021 12:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=igMxb0PjW9VLqhhwd1fxfnr15YpEMN4u6Q40A9doh9s=;
 b=eZAJEAxMx/e7wltb6//reF7BBQu/dupwB9E0MPuZB4J0HL9tTVlfvl4fMnKeqClJVn
 1C704kxlvId/8xjJbiCmAtrpsnElqd4Kl1TUccBY6YRTd2SwpHbo3niHpvnnmBoeh0Xp
 oGM5UuZyobnCbdrUiwsYvVfpexx3CbRgadE1Dhn3rtVEGpv/HGSRH69N4Ci3QcO237SJ
 L+5YhFBsVtybdPhhK87QbYrjGjyMWydxKCRguZ8idR/aHUl0813PW09Bx2NBU9Yz6qV3
 EGf8cR+xiTiV1dvqMB6x/eeDmVB7OcW27xSdNeNXEL7siDl4rox6pF1Y0KC7S83KGc/4
 FsGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=igMxb0PjW9VLqhhwd1fxfnr15YpEMN4u6Q40A9doh9s=;
 b=X7XbQPj9YVMw2y26NcAkxXzRsm9KNIZQrBgMto3DdX0xaBgJnSi8a1k4kZ/Fn+h0u8
 eOXY8K6JLLPHu9c6Qw33ZceAlJRU36RvWUvPSDvvhVYfNhWKoPLC+PjRW1TNYVUrmZMJ
 3ifvaXIjQdwKVUCIypdGAQWY6l+37diaE9pIuw8n5BQgiBJ+0ewr+ya4ziU2xm9GtijP
 N7mGXdqEotKE2/CzuM34qMrNt/gsoWm7kxZYGcFFaO0z5VFcl4elwawkM5uVOQQt+m5N
 W+uNrIJztyzW+Ytr3D1uViQOItqBnyYgmOUniTwot6BnaTRuSB2RHvSdByXqJ6Nw0UcA
 zELA==
X-Gm-Message-State: AOAM531JzugaSAkQRjMbrAi8nc9dyjyVZ8zrCg3AAGuL3Ku/1S5juY0i
 RyEx/dXimYKwAJD8ty0X/gacW+ZEx8d6KzDyDB1SVA==
X-Google-Smtp-Source: ABdhPJztV/uPYBoaEhCSje6Z2K0tb28X2ZNm1cgl71OjlrD0p5UMJS5yIE+MBhcZjo/knfi32FvN730KyuD+k3EJl1o=
X-Received: by 2002:a17:907:d22:: with SMTP id
 gn34mr18558685ejc.195.1639082447679; 
 Thu, 09 Dec 2021 12:40:47 -0800 (PST)
MIME-Version: 1.0
References: <CH2PR12MB4152F65AF85E23297EB5146D9F6E9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <d37f9e09-fdca-07c8-ac5c-b5e859930b9e@samba.org>
 <CH2PR12MB415202EB8137713529ECEF6E9F6F9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <1cd1e3f9-1773-2ba9-24f2-f7a0c4f49cbd@talpey.com>
 <5f6cc5cf-55ee-8422-b284-bd45b8faf448@samba.org>
 <84a566c0-4b04-eafd-89f4-d636ff655371@talpey.com>
 <93cc9a8b-8404-f5a1-3615-62919be31e69@samba.org>
 <fdbdbd51-92cf-d424-655f-fca636583e13@talpey.com>
In-Reply-To: <fdbdbd51-92cf-d424-655f-fca636583e13@talpey.com>
Date: Thu, 9 Dec 2021 15:40:36 -0500
Message-ID: <CAB5c7xqZcK9-Oa+o+w5Mva9Dr8_wWojx=krWiP+4zQ0X3ksH+Q@mail.gmail.com>
Subject: Re: Duplicate SMB file_ids leading to Windows client cache poisoning
To: Tom Talpey <tom@talpey.com>
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
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Steven Engelhardt <steven.engelhardt@relativity.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Dec 9, 2021 at 3:28 PM Tom Talpey via samba-technical <
samba-technical@lists.samba.org> wrote:

> On 12/9/2021 1:58 PM, Ralph Boehme wrote:
> > Hi Tom,
> >
> > On 12/9/21 19:48, Tom Talpey wrote:
> >> I really think you need a bulletproof mathematically correct
> >> uniqueid generator here.
> >
> > Patches welcome. :)))
> >
> > I guess all we can get is an approximation.
>
> But, the penalty for a collision is data corruption! It's unacceptable
> to wing it.
>
> Can't TDB help here? Stuff a number into the database and save it.
> Increment it by one for each new fileid needed.
>
> Carve out a hundred, or a thousand, so you don't have to do a
> transaction every new handle. Increment that by the carveout for
> the next call. 64 bits will last you forever, so you could even
> use it across server restart.
>
> Make it fancier, if monotonicity is too easily forged, or misused.
>
> Tom.
>
Tom,

I was glancing through MS-SMB and noticed that it states that file ids must
be unique, but may be re-used if the file is deleted.
https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-smb/44c3cf8d-0931-4923-8fdc-738537ba70ba

Is that not the case? Or maybe discouraged?

Out of curiosity, why can't we use device/inode?

Andrew
