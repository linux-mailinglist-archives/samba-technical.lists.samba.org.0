Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7539C1EEB
	for <lists+samba-technical@lfdr.de>; Fri,  8 Nov 2024 15:12:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=o4n6YagE2bxbqlCK9QcH4lbce3E1YHZ1WGjfhNF4Yo4=; b=5Bimf44IO2WJaYfVOTcsXlwW1R
	xIRKYj8EEu8kLW/wfTRw2hMdCwu+N18J+Cj6FOVjKg1dYCI/nKsyTEQRc6mG7zzEsAsx+aRnLkOut
	yHgUZ7vz90lux+TK3jLHA1dZPBerU2mEYU4MPT5ZZfrhsSYni3/34vN0ND2Lqu6Qcz/VrFf9/ZFR7
	+52X9OQV0d8kzBhHGHlAZ0l+45HGUTr0fgcTAj3siAUtrj2gf0f/Fl+wxlsviXLNhlGjv13W+p+eT
	fWJj86+LPJtEHq5hhtARstvmBGS4JP+5pOHeRxSDpVGwRG2JmY+SDxfXyAI+94wS8/wkJO7PO1V8U
	AUTIjzEQ==;
Received: from ip6-localhost ([::1]:24468 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t9Pij-00882D-SZ; Fri, 08 Nov 2024 14:12:17 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:55577) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t9Pif-008826-CY
 for samba-technical@lists.samba.org; Fri, 08 Nov 2024 14:12:15 +0000
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a9eb68e0bd1so301356566b.3
 for <samba-technical@lists.samba.org>; Fri, 08 Nov 2024 06:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731075131; x=1731679931; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LQAEl80XcjSuXsza6CSJv/jma0VbKXkN2hqIDc+wSGg=;
 b=QIbGsCMrjiz3sgmkf7q4D7m0ezhlFvB9iI3g6Mr13wksSgy6uezIRLIJKgdhvK9Lop
 W8sPeY4q1skAE6Y+O3vjDFy8CKGqHRf+3u1JQzdOxXyvI2T2fb6vRtCXodkDvWHBk4Vh
 zDd1MiS/npOlVLCd4m/OOvqKn4C1lUW0RjcWhimkboqZmkb634hjoJD50/3kvv5ScjGt
 m0QC5//cYhfWwh+3Gey8mPMQ6xu8+ejiVSv7coy0POuCk0YtzULEg7W/Nj8KhR0k2H44
 x/qUE0cv0HlPDAmYirFKLEGQRRxemOW6d9ICC8j6JSgMijpDWldkDi1Yoa31wsiJCSvh
 BGwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731075131; x=1731679931;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LQAEl80XcjSuXsza6CSJv/jma0VbKXkN2hqIDc+wSGg=;
 b=ItXGwBnzmvBSl7ZYleWazJvk/I51YBdT1kTMpVbc7oj9sE8cAxZujoA43ohZbEa3/g
 eT+OgWYK1ozho9rrsRK0+8xr5crkucvE2WDIK5L+3i/qn7cqR1U5jB4w3eEyk/F3YP3O
 CC4n0gGfmpaf+D1S+jtqodigOVscXHMkjBW0et1cUWsotIaZovUx5CN1RXmVK1XfOCE2
 usC33NTxmF/pJwc4Fm5u/fA14m+g9M3valwFHEN3W1JC7T0DKNTtsFskBEpWVKQercC2
 81zSJKAnErNZEiLD3tjW/RyjXROOMiAMrqmNHg9aNgrgLn1d6WQ21AKOhTHie/EiIbwt
 5CMA==
X-Gm-Message-State: AOJu0YzOjJ22NlidEwhF7t9/U8pkQxTcNCsWCa5lGYT9Vn8+bNkBFOX5
 xooxDqlTb2kbA/GNjomvzsQXdammlUqX4HBYjYMeQquSsRpxR3/hcUttrJwfZGQk9J1AJqR96SL
 noZUsjg1vas/hL3DvHfDGxZsr5wlGGC28
X-Google-Smtp-Source: AGHT+IHIgBk5luj5oqFuaQrRINWMnXAz/12PN4h3XHTEYlWm726qfKek8iD3u5isJG6fKU2TYyAP5bZhkwdDbbEXxTc=
X-Received: by 2002:a17:907:1c10:b0:a9a:7f84:93e3 with SMTP id
 a640c23a62f3a-a9eefee9bd2mr246675166b.14.1731075131359; Fri, 08 Nov 2024
 06:12:11 -0800 (PST)
MIME-Version: 1.0
References: <CAP4uAdpmq+vUOGJfJEMWh2dpQUYqOrQj14f_qvMehoUCebT7sA@mail.gmail.com>
 <CAP4uAdr-QPDNKCfm1hxBtOciuosdVCV-GL4WZpPvd4UjCguo6A@mail.gmail.com>
In-Reply-To: <CAP4uAdr-QPDNKCfm1hxBtOciuosdVCV-GL4WZpPvd4UjCguo6A@mail.gmail.com>
Date: Fri, 8 Nov 2024 19:42:00 +0530
Message-ID: <CAP4uAdq8fH+gtopNo29r3ZZak7CrP7Z4ZtDSXqYj1fO8H0Nq=Q@mail.gmail.com>
Subject: Re: Latest samba4.21 configure cannot find ldap.h, lber.h files and
 libraries on freebsd
To: samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: sandeep nag via samba-technical <samba-technical@lists.samba.org>
Reply-To: sandeep nag <sandeepnagamalli@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I am able to resolve by adding  /usr/local/include

     conf.ADD_EXTRA_INCLUDES('#include/public #source4 #lib #source4/lib
#source4/include #include #lib/replace')
+    conf.ADD_EXTRA_INCLUDES('/usr/local/include')

On Fri, Nov 8, 2024 at 6:56=E2=80=AFPM sandeep nag <sandeepnagamalli@gmail.=
com>
wrote:

> Though I installed the openldap server and client and see that  ldap.h,
> lber.h are present  in /usr/local/includes on my machine.
>
> On Fri, Nov 8, 2024 at 6:53=E2=80=AFPM sandeep nag <sandeepnagamalli@gmai=
l.com>
> wrote:
>
>> Hi All,
>>
>> Seeing following error on freebsd with samba 4.21  ./configure
>>
>> > [1/1] Compiling
>> ^[[32mbin/.conf_check_cb0399a8760ccc5bafb05dce08fe487f/test.c^[[0m
>>
>> ['/usr/bin/clang', '-D_SAMBA_BUILD_=3D4', '-DHAVE_CONFIG_H=3D1', '-MMD',
>> '-D_GNU_SOURCE=3D1', '-D_XOPEN_SOURCE_EXTENDED=3D1', '../../test.c', '-c=
',
>> '-o/root/src/samba
>>
>> /bin/.conf_check_cb0399a8760ccc5bafb05dce08fe487f/testbuild/default/test=
.c.1.o']
>> err: ../../test.c:455:10: fatal error: 'ldap.h' file not found
>>   455 | #include <ldap.h>
>>       |          ^~~~~~~~
>> 1 error generated.
>>
>> I see the 3 patches mentioned here, are already in the code.
>> https://bugzilla.samba.org/show_bug.cgi?id=3D15623
>>
>>
>> Thanks,
>> Sandeep
>>
>>
