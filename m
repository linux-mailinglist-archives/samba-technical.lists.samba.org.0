Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A855EE5FF
	for <lists+samba-technical@lfdr.de>; Wed, 28 Sep 2022 21:46:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=aGt7RosET3B0c1xJiBIafnyctbSF178KtKaaC5DhxwI=; b=RAjhsfiJwNlCRafE0SPbrefVBB
	TjFVhhay4l5GPPbz3+DpD2iDUDR7WrXCHkJ0xo3ktbp1qN9pR8VLKc3btpVKb2woeeuH3j1Mkt/az
	zBxT6e7UHi8YhXk/s4zohjjKv0cvpee8C64xQWPCSN+fnDslqlcWriJrADTHMqjQ8tjS6QN4rFFNN
	xpPtbDISBuppHNOjIcHirYJ0HD1/W58uLkjItqqEWcwIEmjg9tHn5nIE/sc/RuAQJs9yk3Ok6ROli
	oFTlK1we2M4hD3tApmaKcKUrEk4UpY9hDAiFIkNRPiwNDB0Jf2UewPSU8WxxUm+6oMAXwdZHlTPz6
	fSVELHXA==;
Received: from ip6-localhost ([::1]:25518 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1odd0K-004hNM-RW; Wed, 28 Sep 2022 19:46:00 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:35411) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1odd0F-004hND-DD
 for samba-technical@lists.samba.org; Wed, 28 Sep 2022 19:45:57 +0000
Received: by mail-ej1-x62c.google.com with SMTP id sd10so29341997ejc.2
 for <samba-technical@lists.samba.org>; Wed, 28 Sep 2022 12:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=puzzle-itc.de; s=google;
 h=content-transfer-encoding:content-language:in-reply-to:subject
 :organization:from:references:cc:to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date;
 bh=aGt7RosET3B0c1xJiBIafnyctbSF178KtKaaC5DhxwI=;
 b=c0ghdmbna10lPDawNCqyuDSrzAQXzje5PS+Ri/yisYOyYiWsE+SC1OFY55cLx6y3O3
 1SAf9f8oNDgq1o6PzB2t8jASITlUPvDH59SJTzWthYFGPG+gvB4Q8Rq6sDHXqkuzCRDe
 wpE1jgQ5TWaqOuvrD2WyPEBAxrhrGpY/inSF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:content-language:in-reply-to:subject
 :organization:from:references:cc:to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=aGt7RosET3B0c1xJiBIafnyctbSF178KtKaaC5DhxwI=;
 b=NDZXaF6AHsXyefFDFfj3goPWzZpqAmbbd1Hd8qF4U4s8SrvFEAzkPs2LY0SM7VMSM+
 jUV/hs5FjSHUU7m/HbED9Yxwny9YnM2gsEAZ2RrI8g4fT70ssGTmPVjoJF/xDLUl6536
 iYW3BA2gIBXx7e7eiHlnoMmI3Q6eD+0F2P1yz5vT/0mZJpf7yQ3LO2U+cPHFUkcOZ8ib
 ISkTDYx/qlyXiQsKQMF9ng6ndQ3/aeRQ8AgsxVEWDS0oAvYRD2tP3sH45TKtFiB5bcHE
 3riDsXotR84LFlrBUMdNpKDI8RMAiZsg6HcJ9nAJ+CSdgk/Mp7elBUUHrtSGgBzoJmTX
 /XsQ==
X-Gm-Message-State: ACrzQf3DhXm0IVp2nyOxjEq3urAzKxR1XEMV44xrcj5xviXXwU63tXpY
 9ZBuPhW+fkQoTBvKc2mKnVzPqZxTui0vKwdq5QZay2FZHLh4t1Jtxejmn/Qexz4lfP/6syRJxOY
 lOlrk0A+fWt/PPVFYvStAjTbnydN9aQ==
X-Google-Smtp-Source: AMsMyM7TVCQtnFzLlbBcVIN+hWeR3Jp/JuN4ag8+wBivfREjvX+91EMXeFgLl1feIKz9GKBx0xqslw==
X-Received: by 2002:a17:906:5d0d:b0:783:10cb:2829 with SMTP id
 g13-20020a1709065d0d00b0078310cb2829mr19285115ejt.209.1664394354263; 
 Wed, 28 Sep 2022 12:45:54 -0700 (PDT)
Received: from ?IPV6:2a02:8070:8884:cd80:fd0b:5ddb:9362:c327?
 ([2a02:8070:8884:cd80:fd0b:5ddb:9362:c327])
 by smtp.gmail.com with ESMTPSA id
 sc28-20020a1709078a1c00b007801ce34311sm2896487ejc.19.2022.09.28.12.45.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 12:45:53 -0700 (PDT)
Message-ID: <70e9c734-9c7e-c70f-4465-efa1946313fc@puzzle-itc.de>
Date: Wed, 28 Sep 2022 21:45:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
To: samba-technical@lists.samba.org
References: <d9c11a44-538d-963e-46b5-37fa24bf5bb9@puzzle-itc.de>
 <d1cd76d317998a3dd4456e7877b3950901019c14.camel@samba.org>
 <YzNu47xX9+j0BLKH@jeremy-acer>
 <1074acc48316978ba1fc5af74c7cd486fbe2ce0c.camel@samba.org>
 <YzNyDJ43AIAkUSTX@jeremy-acer>
Organization: Puzzle ITC Deutschland GmbH
Subject: Re: [PATCH RFC] s3: smbd: Consistently map EAs to user namespace
In-Reply-To: <YzNyDJ43AIAkUSTX@jeremy-acer>
Content-Language: en-US
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
From: Daniel Kobras via samba-technical <samba-technical@lists.samba.org>
Reply-To: Daniel Kobras <kobras@puzzle-itc.de>
Cc: Michael Weiser <michael.weiser@atos.net>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi all!

Am 27.09.22 um 23:58 schrieb Jeremy Allison:
> On Wed, Sep 28, 2022 at 10:53:19AM +1300, Andrew Bartlett wrote:
(...)
>> We are in agreement.=C2=A0 What I'm saying is that it seems to be a mist=
ake,
>> which can be observed externally, to have mapped other namespaces by
>> simply stripping a prefix.
>=20
> Yes ! +1. Exposing other namespaces was the original
> bug. IMHO we should fix for 4.18.0 and announce now
> this change is coming.
>=20
> If someone *really* depends on this, we could have
> an option to keep the original behavior.
>=20
> But I really don't want to (add that option, that
> is :-).

The original behavior is erratic: initial read of Windows EA 'other.foo'
returns EA 'other.foo' from the filesystem; a write of Windows EA
'other.foo' is redirected to 'user.other.foo' in the filesystem;
subsequent reads of Windows EA 'other.foo' return either 'other.foo' or
'user.other.foo', depending on how the filesystem happens to order its
EAs.

Even if there were someone depending on this, pointing out the bug in
their setup and suggesting to fix it with a specific VFS module that can
perform the mapping in a reliable fashion, seems to be the proper course
of action to me.

Kind regards,

Daniel
--=20
Daniel Kobras
Principal Architect
Puzzle ITC Deutschland
+49 7071 14316 0
www.puzzle-itc.de

--=20
Puzzle ITC Deutschland GmbH
Sitz der Gesellschaft: Eisenbahnstra=C3=9Fe 1, 72072=20
T=C3=BCbingen

Eingetragen am Amtsgericht Stuttgart HRB 765802
Gesch=C3=A4ftsf=C3=BChrer:=20
Lukas Kallies, Daniel Kobras, Mark Pr=C3=B6hl


